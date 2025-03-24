package com.example

import com.example.ProtoLogic

class ProtoLogicSpec extends munit.FunSuite {
  test("say hello to test") {
    assertEquals(ProtoLogic.person.id, 23)
  }
}
