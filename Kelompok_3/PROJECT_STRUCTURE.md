# Project Structure - Kelompok 3

## 📁 Folder Organization

### **Scenes/**
Berisi semua scene files (.tscn) yang terorganisir berdasarkan kategori:

- **`components/`** - Scene komponen reusable
  - `enemy_config.tscn` - Konfigurasi enemy
  - `gameplay.tscn` - Scene gameplay utama
  - `key.tscn` - Item kunci
  - `player_controller.tscn` - Controller player
  - `ui_manager.tscn` - Manager UI

- **`levels/`** - Scene level permainan
  - `level1.tscn` - Level pertama
  - `level2.tscn` - Level kedua
  - `level3.tscn` - Level ketiga

- **`managers/`** - Script managers global
  - `GameManager.gd` - Manager game state dan level transitions

- **`ui/`** - Scene UI/Menu
  - `StartMenu.tscn` - Menu utama
  - `OptionsMenu.tscn` - Menu pengaturan

---

### **Scripts/**
Berisi semua script files (.gd) yang terorganisir berdasarkan fungsi:

- **`components/`** - Script untuk komponen game
  - `Door.gd` - Logika pintu
  - `ground_ray_cast.gd` - Deteksi ground untuk enemy
  - `wall_ray_cast.gd` - Deteksi wall untuk enemy

- **`enemies/`** - Script untuk enemy/musuh
  - `Enemy_Ground.gd` - AI dan behavior enemy ground

- **`managers/`** - Script manager sistem
  - `AudioManager.gd` - Manager audio/sound

- **`ui_scripts/`** - Script untuk UI/Menu
  - `start_menu.gd` - Logika start menu
  - `options_menu.gd` - Logika options menu

- **Root level scripts:**
  - `global.gd` - Global variables dan functions (Autoload)
  - `player_controller.gd` - Controller untuk player

---

## 🔧 Autoload Singletons

Configured dalam `project.godot`:
- **`Global`** → `res://Scripts/global.gd`
- **`GameManager`** → `res://Scenes/managers/GameManager.gd`

---

## 📝 Naming Conventions

- **Scene files**: `snake_case.tscn`
- **Script files**: `snake_case.gd` atau `PascalCase.gd` (untuk classes)
- **Folders**: `snake_case/`

---

## ✅ Clean Structure Benefits

1. **Mudah dicari** - File terorganisir berdasarkan fungsi
2. **Scalable** - Mudah menambah file baru
3. **Collaborative** - Tim mudah navigate project
4. **Maintainable** - Clear separation of concerns
