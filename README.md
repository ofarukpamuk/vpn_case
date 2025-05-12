# vpn_case


Bu proje, **Flutter** kullanılarak geliştirilmiş bir mobil uygulamadır. Uygulama, **MVVM** mimarisi, **BLoC**  state management, **Easy Localization** dil desteği ve **Clean Architecture** prensiplerine göre inşa edilmeye çalışılmıştır.

## Kullanılan Teknolojiler

- **Easy Localization**: Dil desteği sağlamak için kullanılan paket.
- **BLoC**: State management için kullanılan popüler bir mimari.
- **Clean Architecture**: Uygulamanın bağımsız, modüler ve sürdürülebilir olmasını sağlamak için kullanılan mimari.

## Proje Özellikleri

### 1. **Dil Desteği (Easy Localization)**

Uygulama, **Easy Localization** paketini kullanarak birden fazla dili desteklemektedir. Şu anda:

- **Türkçe**: Varsayılan dil.
- **İngilizce**: Diğer dil seçeneği.


Dil desteği tasarıma tamamen entegre edilmemiştir; ancak dil değişimi başarılı bir şekilde çalışmaktadır. Bazı metinler ve etiketler henüz dil desteğiyle güncellenmemiştir.

### 2. **Tema Desteği**

Uygulama, **dinamik tema desteği** sunmaktadır. Şu anda tema altyapısı kurulmuştur. Ancak, tema desteği tüm UI bileşenlerinde tam olarak entegre edilmemiştir.

### 3. **BLoC Yönetimi (Business Logic Component)**

Uygulama, **BLoC (Business Logic Component)** yapısını kullanmaktadır. Bu mimari, iş mantığı ve UI arasındaki bağımlılığı ortadan kaldırarak, uygulamanın daha sürdürülebilir ve test edilebilir olmasını sağlar. 

Örnek olarak, `LocationBloc` sınıfı, lokasyon verilerini yüklemek için kullanılır. Veriler, **`LocationRepository`** sınıfından alınır ve **`LocationState`** içinde yönetilir. UI, **`BlocBuilder`** kullanılarak verileri dinler ve güncellenir.

### 5. **Clean Architecture**

Uygulama, **Clean Architecture** prensiplerine göre tasarlanmıştır. Bu mimari, uygulamanın modüler olmasını sağlar ve katmanlar arasında bağımlılıkların en aza indirilmesini sağlar. Aşağıdaki katmanlar kullanılmıştır:

- **Presentation Layer**: UI bileşenleri ve kullanıcı etkileşimleri burada yer alır.
- **Domain Layer**: İş mantığı ve uygulamanın temel işlevsellikleri burada bulunur. Bu katman, uygulamanın en önemli kısmıdır ve dışa bağımlılıklardan bağımsızdır.
- **Data Layer**: Veritabanı ve ağ bağlantıları gibi dış bağımlılıkların yönetildiği katmandır. Verilerin çekilmesi ve yönetilmesi burada yapılır.

Clean Architecture sayesinde, her bir katman bağımsız olarak test edilebilir ve geliştirilebilir.

### 6. **Bottom Navigation Bar**

Uygulamaya **Bottom Navigation Bar** eklenmiştir.

### 7. **Tasarım**

Tasarım, **Material Design** ve **Responsive Design** prensiplerine dayalı olarak oluşturulmuştur. Farklı ekran boyutlarına uyum sağlayabilen bileşenler kullanılmıştır.


### 8. **Diğer Özellikler**
- **constant** ve **enum**  kullanılarak kod yönetilebilir hale getirilmeye çalışılmıştır.
- **klasörleme** işleminin düzenli ve anlaşılabilir olması sağlanmıştır.
- **Mock Data**: Geliştirme sürecinde mock veriler kullanılmıştır. Veriler, mock repository'lerden alınmakta ve UI'da gösterilmektedir.
- **Data Fetching**: Veriler, **BLoC** aracılığıyla asenkron olarak çekilmekte ve UI'yı güncellemektedir.
- **Error Handling**: Hata yönetimi düzgün şekilde yapılmıştır. Hata mesajları kullanıcıya bildirilir.

---

## Kullanım
Proje, **Flutter SDK** ve **Dart** ile çalışmaktadır. Projeyi çalıştırmak için aşağıdaki adımları izleyebilirsiniz
### 1. Gerekli Paketlerin Kurulumu

Projeyi çalıştırmak için gerekli tüm bağımlılıkları yüklemek için terminalde şu komutu çalıştırın:

flutter pub get

