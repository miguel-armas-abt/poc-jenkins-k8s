package com.demo.poc.commons.properties.configuration;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class K8s {

  private Credentials credentials;
  private Cloud cloud;
}
