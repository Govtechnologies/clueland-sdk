import sys
import argparse
import os

import shutil

def main():
    parser = argparse.ArgumentParser(description="Clueland SDK CLI Tool")
    subparsers = parser.add_subparsers(dest="command")

    # Create command
    create_parser = subparsers.add_parser("create", help="Create a new mod from a template")
    create_parser.add_argument("name", help="Name of the mod")
    create_parser.add_argument("--template", default="basic_mod", help="Template to use")

    # Build command
    build_parser = subparsers.add_parser("build", help="Build and package a mod")
    build_parser.add_argument("path", help="Path to the mod directory")

    args = parser.parse_args()

    # Determine paths
    sdk_root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    templates_dir = os.path.join(sdk_root, "templates")

    if args.command == "create":
        template_path = os.path.join(templates_dir, args.template)
        target_path = os.path.abspath(args.name)

        if not os.path.exists(template_path):
            print(f"Error: Template '{args.template}' not found at {template_path}")
            return

        if os.path.exists(target_path):
            print(f"Error: Directory '{args.name}' already exists.")
            return

        print(f"Creating mod '{args.name}' from template '{args.template}'...")
        shutil.copytree(template_path, target_path)
        
        # Update mod.json with the new name
        mod_json_path = os.path.join(target_path, "mod.json")
        if os.path.exists(mod_json_path):
            with open(mod_json_path, 'r') as f:
                import json
                data = json.load(f)
            data['id'] = args.name.lower().replace(" ", "_")
            data['name'] = args.name
            with open(mod_json_path, 'w') as f:
                json.dump(data, f, indent=2)

        print(f"Success! Mod created at {target_path}")
    elif args.command == "build":
        mod_path = os.path.abspath(args.path)
        if not os.path.exists(mod_path):
            print(f"Error: Mod path '{args.path}' does not exist.")
            return

        print(f"--- Building Mod: {os.path.basename(mod_path)} ---")
        
        # 1. Validate
        if not validate_mod(mod_path, sdk_root):
            print("Build failed: Validation errors found.")
            return
        
        # 2. Package
        package_mod(mod_path)
        print("--- Build Success! ---")
    else:
        parser.print_help()

def validate_mod(mod_path, sdk_root):
    import json
    valid = True
    
    # Check mod.json
    manifest_path = os.path.join(mod_path, "mod.json")
    if not os.path.exists(manifest_path):
        print("[Error] Missing mod.json manifest.")
        return False
    
    try:
        with open(manifest_path, 'r') as f:
            manifest = json.load(f)
        print(f"[Info] Manifest valid: {manifest.get('name', 'Unknown')}")
    except Exception as e:
        print(f"[Error] Failed to parse mod.json: {e}")
        return False

    # Validate data/blocks/*.json
    blocks_dir = os.path.join(mod_path, "data", "blocks")
    if os.path.exists(blocks_dir):
        for filename in os.listdir(blocks_dir):
            if filename.endswith(".json"):
                path = os.path.join(blocks_dir, filename)
                try:
                    with open(path, 'r') as f:
                        json.load(f)
                    print(f"[Info] Block validated: {filename}")
                except Exception as e:
                    print(f"[Error] Invalid JSON in {filename}: {e}")
                    valid = False
                    
    return valid

def package_mod(mod_path):
    import zipfile
    mod_name = os.path.basename(mod_path)
    output_filename = f"{mod_name}.modpak"
    
    print(f"[Action] Packaging into {output_filename}...")
    
    with zipfile.ZipFile(output_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, dirs, files in os.walk(mod_path):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, mod_path)
                zipf.write(file_path, arcname)
    
    print(f"[Info] Created {output_filename} ({os.path.getsize(output_filename)} bytes)")

if __name__ == "__main__":
    main()
