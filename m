From: "Nuernberger, Stefan" <snu@amazon.de>
Subject: Re: [PATCH RFC 31/55] efi: add emacs block to boot.c
Date: Mon, 18 Mar 2019 21:14:41 +0000
Message-ID: <1552943681.6788.105.camel@amazon.de>
References: <20190207164456.9260-1-wei.liu2@citrix.com>
 <20190207164456.9260-32-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tBy=RV=amazon.de=prvs=97326004b=snu@srs-us1.protection.inumbo.net>)
 id 1h5zap-00082J-6a
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 21:14:47 +0000
In-Reply-To: <20190207164456.9260-32-wei.liu2@citrix.com>
Content-Language: en-US
Content-ID: <9900EC76A0F5304EBFAC4FE50A3AEECF@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>
Cc: "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAyMDE5LTAyLTA3IGF0IDE2OjQ0ICswMDAwLCBXZWkgTGl1IHdyb3RlOg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPg0KPiAtLS0NCj4gwqB4ZW4v
Y29tbW9uL2VmaS9ib290LmMgfCAxMCArKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL2VmaS9ib290LmMg
Yi94ZW4vY29tbW9uL2VmaS9ib290LmMNCj4gaW5kZXggMWQxNDIwZjAyYy4uMzg2ODI5M2QwNiAx
MDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9lZmkvYm9vdC5jDQo+ICsrKyBiL3hlbi9jb21tb24v
ZWZpL2Jvb3QuYw0KPiBAQCAtMTcwNSwzICsxNzA1LDEzIEBAIHZvaWQgX19pbml0IGVmaV9pbml0
X21lbW9yeSh2b2lkKQ0KPiDCoCNlbmRpZg0KPiDCoH0NCj4gwqAjZW5kaWYNCj4gKw0KPiArLyoN
Cj4gKyAqIExvY2FsIHZhcmlhYmxlczoNCj4gKyAqIG1vZGU6IEMNCj4gKyAqIGMtZmlsZS1zdHls
ZTogIkJTRCINCj4gKyAqIGMtYmFzaWMtb2Zmc2V0OiA0DQo+ICsgKiB0YWItd2lkdGg6IDQNCj4g
KyAqIGluZGVudC10YWJzLW1vZGU6IG5pbA0KPiArICogRW5kOg0KPiArICovDQoNCk5vdCByZWxl
dmFudCB0byB0aGUgcGF0Y2ggc2VyaWVzLiBXaGF0J3MgdGhlIHVwc3RyZWFtIHBvc2l0aW9uIG9u
IHRoZXNlDQpjaGFuZ2VzPyBTaG91bGQgdGhleSBiZSBpbnRyb2R1Y2VkIGluIHNlcGFyYXRlICdj
bGVhbnVwJyBzZXJpZXMgb3IgaXMNCml0IGNvbW1vbiB0byBpbmNsdWRlIHRoYXQgYXMgcGFydCBv
ZiB1bnJlbGF0ZWQgZnVuY3Rpb25hbCBjaGFuZ2UNCnNlcmllcz8gSSBwZXJzb25hbGx5IGRvbid0
IG1pbmQgZWl0aGVyIHdheS4gKEFuZCBzYW1lIGFwcGxpZXMgdG8gdGhlDQpvdGhlciBlbWFjcyBi
bG9jayBjb21taXQgaW4gdGhlIHNlcmllcywgb2YgY291cnNlLikNCg0KLSBTdGVmYW4NCg0KCgoK
QW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAx
MTcgQmVybGluCkdlc2NoYWVmdHNmdWVocmVyOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhl
cmJyaWNoClVzdC1JRDogREUgMjg5IDIzNyA4NzkKRWluZ2V0cmFnZW4gYW0gQW10c2dlcmljaHQg
Q2hhcmxvdHRlbmJ1cmcgSFJCIDE0OTE3MyBCCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
