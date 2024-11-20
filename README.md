---

# **ThreadingProject**

ThreadingProject, iOS uygulamalarında threading konseptini öğrenmek ve uygulamak için geliştirilmiş bir projedir. Uygulama, bir görseli internetten indirip göstermek için çoklu iş parçacığı kullanımını ve bir tablo görünümünü ele alır.

## **Özellikler**
- Görsellerin asenkron olarak internetten indirilmesi ve görüntülenmesi
- `UITableView` kullanarak basit bir liste gösterimi
- Kullanıcı dostu ve temel threading uygulamaları
- Modern UIKit bileşenleriyle tasarım

## **Kullanılan Teknolojiler**
- Swift
- UIKit
- Asenkron veri işleme (`DispatchQueue`)
- URL'den veri indirme (`URLSession` ve `Data(contentsOf:)`)

## **Kullanılan Mimari**
ThreadingProject, temel bir MVVM mimari yaklaşımıyla geliştirilmiştir.

- **Model**: Veri kaynaklarını temsil eder.
- **View**: Kullanıcı arayüzünü temsil eder ve kullanıcı etkileşimlerini işler.
- **ViewModel**: Verilerin işlenmesi ve View ile Model arasında köprü görevi görür.

## **Threading Kullanımı**
Uygulamada threading, asenkron veri işlemlerinde UI blokajını önlemek için kullanılmıştır. Görsel indirildiğinde UI güncellemeleri ana iş parçacığında yapılır:

```swift
DispatchQueue.global().async {
    self.data = try! Data(contentsOf: URL(string: self.imageArray[self.tracker])!)
    DispatchQueue.main.async {
        self.imageView.image = UIImage(data: self.data)
    }
}
```

## **Kurulum**
Bu projeyi kurmak için aşağıdaki adımları izleyin:

1. Bu depoyu klonlayın:
   ```bash
   git clone https://github.com/yourusername/ThreadingProject.git
   ```
2. Proje dizinine gidin:
   ```bash
   cd ThreadingProject
   ```
3. Projeyi Xcode ile açın:
   ```bash
   open ThreadingProject.xcodeproj
   ```
4. Uygulamayı çalıştırın.
---
