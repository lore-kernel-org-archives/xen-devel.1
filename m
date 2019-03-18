From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH RFC 23/55] x86_64/mm: drop l4e_to_l3e
 invocation from paging_init
Date: Mon, 18 Mar 2019 21:14:34 +0000
Message-ID: <1552943674.6788.102.camel@amazon.de>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-24-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tBy=RV=amazon.de=prvs=97326004b=snu@srs-us1.protection.inumbo.net>)
 id 1h5zaw-00089l-7k
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 21:14:54 +0000
In-Reply-To: <20190207164456.9260-24-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <0420B849AE30F64994B71209005AA6A6@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjQ0ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPg0KDQpBbnkgcmVhc29uIHdo
eSB0aGlzIGlzbid0IHNxdWFzaGVkIHdpdGggdGhlIHByZXZpb3VzIHBhdGNoPw0KDQotIFN0ZWZh
bg0KDQo+IC0tLQ0KPiDCoHhlbi9hcmNoL3g4Ni94ODZfNjQvbW0uYyB8IDcgKysrKystLQ0KPiDC
oDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L3g4Nl82NC9tbS5jIGIveGVuL2FyY2gveDg2L3g4Nl82
NC9tbS5jDQo+IGluZGV4IDAyOTE5NDgxZTQuLjA5NGM2MDljOGMgMTAwNjQ0DQo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni94ODZfNjQvbW0uYw0KPiArKysgYi94ZW4vYXJjaC94ODYveDg2XzY0L21tLmMN
Cj4gQEAgLTY0OCw4ICs2NDgsMTAgQEAgdm9pZCBfX2luaXQgcGFnaW5nX2luaXQodm9pZCkNCj4g
wqDCoMKgwqDCoC8qIENyZWF0ZSB1c2VyLWFjY2Vzc2libGUgTDIgZGlyZWN0b3J5IHRvIG1hcCB0
aGUgTVBUIGZvciBjb21wYXQNCj4gZ3Vlc3RzLiAqLw0KPiDCoMKgwqDCoMKgQlVJTERfQlVHX09O
KGw0X3RhYmxlX29mZnNldChSRFdSX01QVF9WSVJUX1NUQVJUKSAhPQ0KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBsNF90YWJsZV9vZmZzZXQoSElST19DT01QQVRfTVBUX1ZJ
UlRfU1RBUlQpKTsNCj4gLcKgwqDCoMKgbDNfcm9fbXB0ID0gbDRlX3RvX2wzZShpZGxlX3BnX3Rh
YmxlW2w0X3RhYmxlX29mZnNldCgNCj4gLcKgwqDCoMKgwqDCoMKgwqBISVJPX0NPTVBBVF9NUFRf
VklSVF9TVEFSVCldKTsNCj4gKw0KPiArwqDCoMKgwqBsM19yb19tcHRfbWZuID0gbDRlX2dldF9t
Zm4oaWRsZV9wZ190YWJsZVtsNF90YWJsZV9vZmZzZXQoDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoEhJUk9fQ09NUEFUX01QVF9WSVJUX1NUQVJUKV0NCj4gKTsNCj4gK8KgwqDCoMKgbDNfcm9f
bXB0ID0gbWFwX3hlbl9wYWdldGFibGVfbmV3KGwzX3JvX21wdF9tZm4pOw0KPiDCoA0KPiDCoMKg
wqDCoMKgbDJfcm9fbXB0X21mbiA9IGFsbG9jX3hlbl9wYWdldGFibGVfbmV3KCk7DQo+IMKgwqDC
oMKgwqBpZiAoIG1mbl9lcShsMl9yb19tcHRfbWZuLCBJTlZBTElEX01GTikgKQ0KPiBAQCAtNzAx
LDYgKzcwMyw3IEBAIHZvaWQgX19pbml0IHBhZ2luZ19pbml0KHZvaWQpDQo+IMKgI3VuZGVmIE1G
Tg0KPiDCoA0KPiDCoMKgwqDCoMKgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDJfcm9fbXB0KTsN
Cj4gK8KgwqDCoMKgVU5NQVBfWEVOX1BBR0VUQUJMRV9ORVcobDNfcm9fbXB0KTsNCj4gwqANCj4g
wqDCoMKgwqDCoG1hY2hpbmVfdG9fcGh5c19tYXBwaW5nX3ZhbGlkID0gMTsNCj4gwqAKCgoKQW1h
em9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcg
QmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJy
aWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hh
cmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
