class AdvertisementModels {
  final String? description, name, job, image;
  const AdvertisementModels(
      {this.description, this.name, this.job, this.image});
}

List<AdvertisementModels> advertisements = [
  const AdvertisementModels(
      name: "name",
      job: "job-title",
      description:
          '1Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png'),
  const AdvertisementModels(
      name: "Name",
      job: "job-title",
      description:
          '2Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png'),
  const AdvertisementModels(
      name: "Name",
      job: "job-title",
      description:
          '3Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png'),
  const AdvertisementModels(
      name: "Name",
      job: "job-title",
      description:
          '4Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
      image: 'assets/image.png')
];
