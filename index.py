import json

with open("distmap_00.6.0.2.json", "r", encoding="utf-8") as f:
    data = json.load(f)

hanoi = {
    "type": "FeatureCollection",
    "features": [
        f for f in data["features"]
        if f["properties"].get("NAME_1") == "HàNội"
    ]
}

with open("hanoi_districts.json", "w", encoding="utf-8") as f:
    json.dump(hanoi, f, ensure_ascii=False)

print(f"Xong! {len(hanoi['features'])} quận/huyện")