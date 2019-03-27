From: Julien Grall <Julien.Grall@arm.com>
Subject: Re: [PATCH 05/12] xen/arm64: bitops: Match the register
 size with the value size in flsl
Date: Wed, 27 Mar 2019 20:13:50 +0000
Message-ID: <bac73177-1ff7-7b7c-6852-832f88707555@arm.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-6-julien.grall@arm.com>
 <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h58V=R6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1h9Evs-0002M1-77
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 20:13:56 +0000
In-Reply-To: <2af3ed7f-00d4-2eb7-0dde-c9570578dd4e@citrix.com>
Content-Language: en-US
Content-ID: <1774B916AD8F7D40825C5C52E9569F75@eurprd08.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "Artem_Mygaiev@epam.com" <Artem_Mygaiev@epam.com>, "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>, nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGksDQoNCk9uIDI3LzAzLzIwMTkgMTk6MDMsIEFuZHJldyBDb29wZXIgd3JvdGU6DQo+IE9uIDI3
LzAzLzIwMTkgMTg6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IENsYW5nIGlzIHBpY2tpZXIg
dGhhbiBHQ0MgZm9yIHRoZSByZWdpc3RlciBzaXplIGluIGFzbSBzdGF0ZW1lbnQuIEl0IGV4cGVj
dHMNCj4+IHRoZSByZWdpc3RlciBzaXplIHRvIG1hdGNoIHRoZSB2YWx1ZSBzaXplLg0KPj4NCj4+
IFRoZSBpbnN0cnVjdGlvbiBjbHogaXMgZXhwZWN0aW5nIHRoZSB0d28gb3BlcmFuZHMgdG8gYmUg
dGhlIHNhbWUgc2l6ZQ0KPj4gKGkuZSAzMi1iaXQgb3IgNjQtYml0KS4gQXMgdGhlIGZsc2wgZnVu
Y3Rpb24gaXMgZGVhbGluZyB3aXRoIDY0LWJpdA0KPj4gdmFsdWUsIHdlIG5lZWQgdG8gbWFrZSB0
aGUgZGVzdGluYXRpb24gdmFyaWFibGUgNjQtYml0IGFzIHdlbGwuDQo+Pg0KPj4gV2hpbGUgYXQg
aXQsIGFkZCBhIG5ld2xpbmUgYmVmb3JlIHRoZSByZXR1cm4gc3RhdGVtZW50Lg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+DQo+PiAtLS0N
Cj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaCB8IDMgKystDQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9iaXRvcHMuaCBiL3hlbi9pbmNsdWRl
L2FzbS1hcm0vYXJtNjQvYml0b3BzLmgNCj4+IGluZGV4IDZiZjE5MjI2ODAuLjA1MDQ1ZjExMDkg
MTAwNjQ0DQo+PiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oDQo+PiAr
KysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FybTY0L2JpdG9wcy5oDQo+PiBAQCAtMzQsMTIgKzM0
LDEzIEBAIHN0YXRpYyAvKl9fKi9hbHdheXNfaW5saW5lIHVuc2lnbmVkIGxvbmcgX19mZnModW5z
aWduZWQgbG9uZyB3b3JkKQ0KPj4gICANCj4+ICAgc3RhdGljIGlubGluZSBpbnQgZmxzbCh1bnNp
Z25lZCBsb25nIHgpDQo+PiAgIHsNCj4+IC0gICAgICAgIGludCByZXQ7DQo+PiArICAgICAgICB1
aW50NjRfdCByZXQ7DQo+PiAgIA0KPj4gICAgICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3RhbnRf
cCh4KSkNCj4+ICAgICAgICAgICAgICAgICAgcmV0dXJuIGdlbmVyaWNfZmxzbCh4KTsNCj4+ICAg
DQo+PiAgICAgICAgICAgYXNtKCJjbHpcdCUwLCAlMSIgOiAiPXIiIChyZXQpIDogInIiICh4KSk7
DQo+IA0KPiBBcyB4IGlzIGZpeGVkIGJ5IHRoZSBBQkksIHJldCBzaG91bGQgYmUgdW5zaWduZWQg
bG9uZyB0byBtYXRjaCwgc3VyZWx5Pw0KDQpObyBuZWVkIGZvciBpdC4gVGhlIHJlc3VsdCBvZiB0
aGUgaW5zdHJ1Y3Rpb24gY2x6IHdpbGwgYWx3YXlzIGJlIHNtYWxsZXIgDQp0aGFuIDY0Lg0KDQpJ
IHN1c3BlY3QgdGhleSByZXF1aXJlIGEgNjQtYml0IHJlZ2lzdGVyIGp1c3QgZm9yIHNpbXBsaWNp
dHkgYXMgdGhleSANCmVuY29kZSB0aGUgc2l6ZSBmb3IgdGhlIDIgcmVnaXN0ZXJzIGluIG9ubHkg
YSBzaW5nbGUgYml0IChpLmUgc2YpLg0KDQo+IA0KPiBUaGlzIHdpbGwgY29tcGlsZSBhcyBpdCBp
cyBhcm02NCBzcGVjaWZpYywgYnV0IGl0IGxvb2tzIGp1c3QgYXMgd3JvbmcNCj4gKHBlciB0aGUg
Y29tbWl0IG1lc3NhZ2UpIGFzIHVzaW5nIGludCBpbiB0aGUgZmlyc3QgcGxhY2UuDQpTZWUgYWJv
dmUuIEkgY2FuIGNsYXJpZnkgaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLg0KDQpDaGVlcnMsDQoN
Ci0tIA0KSnVsaWVuIEdyYWxsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
