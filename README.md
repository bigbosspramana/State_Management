# State Management

Repositori ini berisi contoh implementasi state management di Flutter menggunakan dua pendekatan berbeda:

## 1. Ephemeral State (Local State)

Folder `ephemeral_state_codelab` menunjukkan penggunaan state management sederhana menggunakan StatefulWidget. Fitur-fitur:

- Menggunakan StatefulWidget untuk mengelola state lokal
- Counter sederhana dengan tombol increment
- State hanya dikelola dalam satu widget
- Cocok untuk state yang sederhana dan terisolasi
- Implementasi menggunakan setState() untuk update UI

### Komponen Utama:
- CounterWidget: Widget utama yang mengelola state counter
- AnotherWidget: Widget terpisah yang menerima nilai counter melalui parameter

## 2. App State dengan Scoped Model 

Folder `app_state_collab` mendemonstrasikan penggunaan Scoped Model untuk state management. Fitur-fitur:

- Menggunakan package scoped_model untuk state management
- State dapat diakses dari berbagai widget
- Implementasi pattern Model-View 
- Pemisahan logic state dari UI
- Mendukung multiple listeners

### Komponen Utama:
- CounterModel: Class model yang mengelola state counter
- CounterDisplay: Widget untuk menampilkan nilai counter
- CounterControls: Widget untuk kontrol increment/decrement
- AnotherWidget: Widget terpisah yang mengakses state melalui ScopedModel

## Perbedaan Utama

1. **Kompleksitas**
   - Ephemeral State: Sederhana, mudah diimplementasi
   - Scoped Model: Lebih kompleks, tetapi lebih terstruktur

2. **Aksesibilitas State**
   - Ephemeral State: Terbatas pada widget tertentu
   - Scoped Model: Dapat diakses dari berbagai widget

3. **Maintenance**
   - Ephemeral State: Mudah untuk aplikasi kecil
   - Scoped Model: Lebih mudah di-maintain untuk aplikasi besar

## Kapan Menggunakan?

- Gunakan **Ephemeral State** ketika:
  - State hanya dibutuhkan oleh satu widget
  - Tidak perlu berbagi state dengan widget lain
  - Logic state sederhana

- Gunakan **Scoped Model** ketika:
  - State perlu diakses oleh banyak widget
  - Membutuhkan arsitektur yang lebih terstruktur
  - Aplikasi memiliki kompleksitas tinggi

## Contoh Kasus
### Autentinkasi Pengguna
State management diperlukan untuk menangani status autentikasi pengguna, misalnya untuk menampilkan tampilan login atau dashboard pengguna berdasarkan status login. Jika menggunakan Ephemeral State, cukup mengelola status login dalam widget yang memerlukan akses ke informasi ini, seperti widget login dan dashboard. Namun, jika aplikasi lebih kompleks, Scoped Model memungkinkan status autentikasi diakses dari banyak widget tanpa memerlukan banyak passing parameter.

### Keranjang Belanja 
State yang mengelola produk yang ditambahkan ke dalam keranjang belanja adalah contoh lain di mana Scoped Model lebih berguna. Produk dalam keranjang harus dapat diakses oleh beberapa widget: misalnya, untuk menampilkan daftar produk di halaman checkout dan juga untuk menampilkan jumlah total di bagian lain aplikasi. Scoped Model memungkinkan kita mengelola dan membagikan state ini di seluruh aplikasi.

### Kebutuhan status aplikasi lainnya
Dalam kasus aplikasi yang menampilkan daftar panti asuhan, di mana daftar ini harus diambil dari sumber data dan bisa berubah, kita perlu menggunakan Scoped Model atau solusi state management lain yang lebih kompleks. Berikut adalah langkah-langkah implementasinya:

1. **State Model**: Buat model untuk mengelola daftar panti asuhan. Model ini akan mengelola data dari API atau database dan memberitahukan widget lain ketika data berubah.

2. **Widgets**:
- PantiAsuhanModel: Model yang mengelola daftar panti asuhan dan status loading/error.
- PantiAsuhanList: Widget yang menampilkan daftar panti asuhan dari model.
- PantiAsuhanItem: Widget untuk menampilkan detail dari satu panti asuhan.

3. **API Call**: Panggil API atau ambil data dari database untuk mendapatkan daftar panti asuhan.

4. **State Management**: Gunakan Scoped Model untuk membuat data dapat diakses oleh semua widget yang membutuhkannya, termasuk menampilkan status loading saat data sedang diambil.
