enum Page { home, about, services, portfolio, contact, mobile, other }

class Menus {
  String title;
  Page page;
  bool isHover;
  bool isActived;

  Menus(
      {required this.title,
      required this.page,
      required this.isHover,
      required this.isActived});

  static List<Menus> list() {
    return [
      Menus(title: "Home", page: Page.home, isHover: false, isActived: true),
      Menus(title: "About", page: Page.about, isHover: false, isActived: false),
      Menus(
          title: "Services",
          page: Page.services,
          isHover: false,
          isActived: false),
      Menus(
          title: "Portfolio",
          page: Page.portfolio,
          isHover: false,
          isActived: false),
      Menus(
          title: "Contact",
          page: Page.contact,
          isHover: false,
          isActived: false),
    ];
  }

  static List<Menus> tabs() {
    return [
      Menus(
          title: "Mobile Project",
          page: Page.mobile,
          isHover: false,
          isActived: true),
      Menus(
          title: "Other Project",
          page: Page.other,
          isHover: false,
          isActived: false),
    ];
  }
}

class AboutItem {
  String title;
  String icon;

  AboutItem({required this.title, required this.icon});

  static List<AboutItem> list() {
    return [
      AboutItem(title: "+62 822 7260 5775", icon: "assets/icons/phone.png"),
      AboutItem(title: "Indonesia", icon: "assets/icons/location.png"),
      AboutItem(title: "radhsyn83@gmail.com", icon: "assets/icons/message.png"),
      AboutItem(
          title: "Bachelor of Computer Science (B.C.S)",
          icon: "assets/icons/study.png"),
    ];
  }
}

class SkillItem {
  String title;
  String icon;
  String desc;

  SkillItem({required this.title, required this.icon, required this.desc});

  static List<SkillItem> list() {
    return [
      SkillItem(
          title: "Firebase",
          icon: "assets/icons/firebase.png",
          desc:
              "Firebase is a service from Google to provide convenience and even make it easier for application developers to develop their applications"),
      SkillItem(
          title: "Flutter",
          icon: "assets/icons/flutter.png",
          desc:
              "Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase."),
      SkillItem(
          title: "Git Version Control",
          icon: "assets/icons/git.png",
          desc:
              "Git distributed version control system designed to handle everything from small to very large projects with speed and efficiency."),
      SkillItem(
          title: "Kotlin",
          icon: "assets/icons/kotlin.png",
          desc:
              "Kotlin is an open-source programming language created by JetBrains that has become popular because it can be used to program Android")
    ];
  }
}

class SkillItemOther {
  String title;
  List<String> items;

  SkillItemOther({required this.title, required this.items});

  static List<SkillItemOther> list() {
    return [
      SkillItemOther(
        title: "Website Developer",
        items: ["HTML", "CSS / SASS", "JavaScript", "Bootstrap"],
      ),
      SkillItemOther(
        title: "Backend Developer",
        items: ["Node JS", "MYSQL", "PHP", "Golang"],
      ),
      SkillItemOther(
        title: "Version Control",
        items: ["Github", "Gitlab", "Bitbucket"],
      ),
    ];
  }
}

class ProjectItem {
  String title;
  String mockup;
  List<String> items;
  bool isHover = false;

  ProjectItem({required this.title, required this.mockup, required this.items});

  static List<ProjectItem> mobile() {
    return [
      ProjectItem(
          title: "3second Online",
          mockup: "assets/mockup/3second/3second.png",
          items: []),
      ProjectItem(
          title: "Riseloka",
          mockup: "assets/mockup/riseloka/riseloka.png",
          items: []),
      ProjectItem(
          title: "Qyupee Manager",
          mockup: "assets/mockup/qyupee/qyupee.png",
          items: []),
      ProjectItem(
          title: "Data KUMKM (Kemenkop)",
          mockup: "assets/mockup/kumkm/kumkm.png",
          items: []),
      ProjectItem(
          title: "Bandros Dropshipper",
          mockup: "assets/mockup/bandros/bandros.png",
          items: []),
    ];
  }
}

extension MenusExt on List<Menus> {
  void activeAt(int index) {
    var menus = this;
    for (var element in menus) {
      element.isActived = false;
    }
    menus[index].isActived = true;
  }

  int get seletedTab {
    var menus = this;
    return menus.indexWhere((element) => element.isActived);
  }
}
