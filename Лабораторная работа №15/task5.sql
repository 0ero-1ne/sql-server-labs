use UNIVER;
go

if not exists (select * from sys.xml_schema_collections where name = 'Student')
create xml schema collection Student as
N'<?xml version="1.0" encoding="utf-16" ?>
  <xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
	<xs:element name="INFO">
		<xs:complexType>
			<xs:sequence>
				<xs:element name="PASSPORT" maxOccurs="1" minOccurs="1">
					<xs:complexType>
						<xs:attribute name="TYPE" type="xs:string" use="required" />
						<xs:attribute name="NUMBER" type="xs:unsignedInt" use="required"/>
						<xs:attribute name="DATE" use="required">
						<xs:simpleType>
							<xs:restriction base ="xs:string">
								<xs:pattern value="[0-9]{2}.[0-9]{2}.[0-9]{4}"/>
							</xs:restriction>
						</xs:simpleType>
						</xs:attribute>
					</xs:complexType>
				</xs:element>
				<xs:element maxOccurs="3" name="PHONE" type="xs:string"/>
				<xs:element name="ADDRESS">
					<xs:complexType>
						<xs:sequence>
							<xs:element name="COUNTRY" type="xs:string" />
							<xs:element name="CITY" type="xs:string" />
							<xs:element name="STREET" type="xs:string" />
							<xs:element name="HOME" type="xs:string" />
						</xs:sequence>
					</xs:complexType>
				</xs:element>
			</xs:sequence>
		</xs:complexType>
	</xs:element>
  </xs:schema>
';
go

if object_id(N'STUDENTXML', N'U') is null
create table STUDENTXML 
(    
	IDSTUDENT integer identity(1000,1) primary key,
    IDGROUP integer foreign key references GROUPS(IDGROUP),        
    NAME nvarchar(100),
    BDAY date,
    STAMP timestamp,
    INFO xml(Student),
    FOTO varbinary
);
go

delete from STUDENTXML;
go

insert into STUDENTXML(IDGROUP, NAME, BDAY, INFO)
values (24, 'Воликов Дмитрий Анатольевич', '2004-02-17',
'
<INFO>
	<PASSPORT TYPE="AB" NUMBER="2345678" DATE="23.10.2013"/>
	<PHONE>375291234567</PHONE>
	<ADDRESS>
		<COUNTRY>РБ</COUNTRY>
		<CITY>Иваново</CITY>
		<STREET>Просёлочная</STREET>
		<HOME>31</HOME>
	</ADDRESS>
</INFO>
'
);
go

insert into STUDENTXML(IDGROUP, NAME, BDAY, INFO)
values (24, 'Воликов Дмитрий Анатольевич', '2004-02-17',
'
<INFO>
	<PASSPORT TYPE="AB" NUMBE="2345678" DATE="23.10.2013"/>
	<PHONE>375291234567</PHONE>
	<ADDRESS>
		<COUNTRY>РБ</COUNTRY>
		<CITY>Иваново</CITY>
		<STREET>Просёлочная</STREET>
		<HOME>31</HOME>
	</ADDRESS>
</INFO>
'
);
go