package com.example

import com.example.addressbook.{AddressBook, Person}

object ProtoLogic {
  
  val person = Person(
    id = 23,
    name = "hello world",
    email = Some("hello@example.com"),
    phones = Seq(
      Person.PhoneNumber(
        number = "1234",
        `type` = Some(Person.PhoneType.MOBILE)
      )
    )
  )

  def logic(p: Person) = {
    AddressBook(
      people = Seq(p)
    )
  }

  def protobuf_logic(input: Array[Byte]) = {
    val obj = for {
      parsed <- scala.util.Try(
        Person.parseFrom(input)
      ).toOption
    } yield {
      logic(parsed)
    }
    obj.map(_.toByteArray)
  }

  def run_example() = {
    // show basic example of logic with protobuf datatypes
    logic(person)
  }

  def run_protobuf_example() = { 
    // show example with binary edges
    for {
      bytes <- protobuf_logic(
        person.toByteArray
      )
    } yield {
      AddressBook.parseFrom(bytes)
    }
  }

}
