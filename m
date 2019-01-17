From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: [PATCH v2] x86/mm: Clean up p2m_finish_type_change
 return value
Date: Thu, 17 Jan 2019 09:06:47 +0000
Message-ID: <20190117090635.23731-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=yMY+=PZ=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1gk3dT-0002hh-UV
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 09:06:52 +0000
Content-Language: en-US
Content-ID: <4A7369672742E54FB2FF1FA74D5B08B7@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, Alexandru Stefan ISAILA <aisaila@bitdefender.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q2hhbmdlZCB0aGUgcmV0dXJuIHZhbHVlIG9mIDEgdG8gMCBzbyBub3cgcDJtX2ZpbmlzaF90eXBl
X2NoYW5nZSByZXR1cm5zDQowIGZvciBzdWNjZXNzIG9yIDwwIGZvciBlcnJvci4NClRoZSDigJxy
b2904oCdIGNhbGxlciBvZiBwMm1fZmluaXNoX3R5cGVfY2hhbmdlKCkgaXMNClhFTl9ETU9QX21h
cF9tZW1fdHlwZV90b19pb3JlcV9zZXJ2ZXIgYW5kIHRoaXMgZG9lcyBub3RoaW5nIHVzZWZ1bCB3
aXRoDQpwb3NpdGl2ZSB2YWx1ZXMuDQoNClN1Z2dlc3RlZC1ieTogR2VvcmdlIER1bmxhcCA8Z2Vv
cmdlLmR1bmxhcEBldS5jaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWls
YSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+DQoNCi0tLQ0KQ2hhbmdlcyBzaW5jZSBWMToNCgkt
IFVwZGF0ZSBjb21taXQgbWVzc2FnZQ0KCS0gTW92ZSByYyA9IDAgYmVmb3JlIG91dCB0YWcuDQot
LS0NCiB4ZW4vYXJjaC94ODYvbW0vcDJtLmMgfCAxMSArKystLS0tLS0tLQ0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCmluZGV4IGQxNGNlNTdk
ZDUuLmE5YzM2NmJiNWUgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCisrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KQEAgLTExODgsMjIgKzExODgsMTcgQEAgaW50IHAybV9m
aW5pc2hfdHlwZV9jaGFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwNCiAgICAgICAgICAgICBpZiAoIGQt
PmFyY2guYWx0cDJtX2VwdHBbaV0gIT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCiAgICAgICAgICAg
ICB7DQogICAgICAgICAgICAgICAgIHN0cnVjdCBwMm1fZG9tYWluICphbHRwMm0gPSBkLT5hcmNo
LmFsdHAybV9wMm1baV07DQotICAgICAgICAgICAgICAgIGludCByYzE7DQogDQogICAgICAgICAg
ICAgICAgIHAybV9sb2NrKGFsdHAybSk7DQotICAgICAgICAgICAgICAgIHJjMSA9IGZpbmlzaF90
eXBlX2NoYW5nZShhbHRwMm0sIGZpcnN0X2dmbiwgbWF4X25yKTsNCisgICAgICAgICAgICAgICAg
cmMgPSBmaW5pc2hfdHlwZV9jaGFuZ2UoYWx0cDJtLCBmaXJzdF9nZm4sIG1heF9ucik7DQogICAg
ICAgICAgICAgICAgIHAybV91bmxvY2soYWx0cDJtKTsNCiANCi0gICAgICAgICAgICAgICAgaWYg
KCByYzEgPCAwICkNCi0gICAgICAgICAgICAgICAgew0KLSAgICAgICAgICAgICAgICAgICAgcmMg
PSByYzE7DQorICAgICAgICAgICAgICAgIGlmICggcmMgPCAwICkNCiAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Ow0KLSAgICAgICAgICAgICAgICB9DQotDQotICAgICAgICAgICAgICAgIHJj
IHw9IHJjMTsNCiAgICAgICAgICAgICB9DQogICAgIH0NCiAjZW5kaWYNCisgICAgcmMgPSAwOw0K
IA0KICBvdXQ6DQogICAgIHAybV91bmxvY2soaG9zdHAybSk7DQotLSANCjIuMTcuMQ0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
