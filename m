From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] x86/hvm/viridian: set shutdown_code in
 response to CrashNotify
Date: Fri, 10 Aug 2018 15:59:34 +0000
Message-ID: <1af7af3a96b94f5f893f7f1ca91e8972@AMSPEX02CL03.citrite.net>
References: <20180810154342.3296-1-paul.durrant@citrix.com>
 <afa181cd-d5c7-97ec-b980-1d88ecb266ab@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3eyy=kz=citrix.com=prvs=753083691=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1fo9pA-0004Fp-Go
 for xen-devel@lists.xenproject.org; Fri, 10 Aug 2018 15:59:36 +0000
In-Reply-To: <afa181cd-d5c7-97ec-b980-1d88ecb266ab@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyDQo+IFNl
bnQ6IDEwIEF1Z3VzdCAyMDE4IDE2OjU3DQo+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFu
dEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIHg4Ni9o
dm0vdmlyaWRpYW46IHNldCBzaHV0ZG93bl9jb2RlIGluIHJlc3BvbnNlIHRvDQo+IENyYXNoTm90
aWZ5DQo+IA0KPiBPbiAxMC8wOC8xOCAxNjo0MywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFdo
ZW4gV2luZG93cyB3cml0ZXMgdGhlIENyYXNoTm90aWZ5IGJpdCBpbiB0aGUgQ1JBU0hfQ1RMIE1T
UiB0aGVuIHdlDQo+IGtub3cNCj4gPiBpdCBpcyBjcmFzaGluZywgc28gc2V0IHRoZSBkb21haW4g
c2h1dGRvd24gY29kZSBhcHByb3ByaWF0ZWx5Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1
bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiA+IC0tLQ0KPiA+ICB4ZW4vYXJjaC94ODYvaHZtL3Zp
cmlkaWFuLmMgfCA0ICsrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9odm0vdmlyaWRpYW4uYyBiL3hlbi9h
cmNoL3g4Ni9odm0vdmlyaWRpYW4uYw0KPiA+IGluZGV4IDQ4NjA2NTE4MmMuLjI5NGNmNDg2Y2Mg
MTAwNjQ0DQo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi5jDQo+ID4gKysrIGIv
eGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi5jDQo+ID4gQEAgLTY0NSw2ICs2NDUsMTAgQEAgaW50
IHdybXNyX3ZpcmlkaWFuX3JlZ3ModWludDMyX3QgaWR4LCB1aW50NjRfdCB2YWwpDQo+ID4gICAg
ICAgICAgaWYgKCAhY3RsLnUuQ3Jhc2hOb3RpZnkgKQ0KPiA+ICAgICAgICAgICAgICBicmVhazsN
Cj4gPg0KPiA+ICsgICAgICAgIHNwaW5fbG9jaygmZC0+c2h1dGRvd25fbG9jayk7DQo+ID4gKyAg
ICAgICAgZC0+c2h1dGRvd25fY29kZSA9IFNIVVRET1dOX2NyYXNoOw0KPiA+ICsgICAgICAgIHNw
aW5fdW5sb2NrKCZkLT5zaHV0ZG93bl9sb2NrKTsNCj4gDQo+IEhvdyBkb2VzIHRoZSBkb21haW4g
ZXZlbnR1YWxseSBzaHV0IGRvd24/DQoNCkkgYXNzdW1lIGl0IHNodXRzIGRvd24gd2hlbiB0aGUg
Z3Vlc3Qgd3JpdGVzIHRvIHRoZSBQSUlYLg0KDQo+wqAgSXQgZmVlbHMgc2xpZ2h0bHkgb2RkIHRv
IGhhdmUNCj4gYSBzaHV0ZG93biBjb2RlIGJlZm9yZSB0aGUgZG9tYWluIGhhcyBmaW5pc2hlZCBl
eGVjdXRpbmcgY29kZS4NCj4gDQoNClRoYXQncyB0aGUgbm9ybS4gVGhlIFBWIGRyaXZlcnMgKGlm
IHRoZXkgYXJlIGluc3RhbGxlZCkgc2V0IGl0IHZpYSBhIHNjaGVkb3AuIFRoaXMganVzdCBtYWtl
cyBzdXJlIGl0IGlzIHNldCBldmVuIGlmIHRoZSBQViBkcml2ZXJzIGFyZW4ndCB0aGVyZS4NCg0K
ICBQYXVsDQoNCj4gfkFuZHJldw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
