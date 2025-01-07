import argparse
import json
import hashlib
from datetime import datetime
import os

def calculate_uf2_hash(file_path):
    with open(file_path, 'rb') as f:
        return hashlib.sha256(f.read()).hexdigest()

def generate_build_code():
    now = datetime.now()
    return (now.year - 2000) << 12 | now.month << 8 | now.day << 3 | (now.hour * 60 + now.minute) // 15

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True, help='Input UF2 file')
    parser.add_argument('--output', required=True, help='Output JSON file')
    args = parser.parse_args()

    manifest = {
        'hash': calculate_uf2_hash(args.input),
        'build_code': generate_build_code(),
        'timestamp': datetime.now().isoformat()
    }

    with open(args.output, 'w') as f:
        json.dump(manifest, f, indent=2)

if __name__ == '__main__':
    main()