package common;

public class Person {
	
	private String name;
	private int age;
	
//	생성자 constractor : 기본default 생략가능
	public Person() {}
	
//	생성자 : 기본2 constractor : 매개변수를 가지는
	public Person(String name, int age) {
		super();
		// this == 나
		this.name = name;
		this.age = age;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	
}
