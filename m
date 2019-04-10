From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [PATCH v3 2/3] x86/mm: Introduce
 altp2m_set_entry_by_page_order
Date: Wed, 10 Apr 2019 14:22:42 +0000
Message-ID: <97e8f5be-cdf6-01d8-0713-c83dd638ac28@bitdefender.com>
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <20190409120324.13940-2-aisaila@bitdefender.com>
 <0ed3bfad-8c35-2143-0c1d-047492a00f31@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+r/1=SM=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hEE7i-00061S-MB
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:22:46 +0000
In-Reply-To: <0ed3bfad-8c35-2143-0c1d-047492a00f31@citrix.com>
Content-Language: en-US
Content-ID: <AC5EE50A13B0FB4FBF521274A5770AB5@eurprd02.prod.outlook.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "tamas@tklengyel.com" <tamas@tklengyel.com>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>, "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCk9uIDEwLjA0LjIwMTkgMTc6MTgsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDQvOS8x
OSAxOjAzIFBNLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IFRoaXMgcGF0Y2gg
bW92ZXMgY29tbW9uIGNvZGUgZnJvbSBwMm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKCkgYW5kDQo+
PiBwMm1fY2hhbmdlX2FsdHAybV9nZm4oKSBpbnRvIG9uZSBmdW5jdGlvbg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPj4g
LS0tDQo+PiAgIHhlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgfCAgMiArLQ0KPj4gICB4ZW4v
aW5jbHVkZS9hc20teDg2L3AybS5oICAgIHwgMTEgKysrKysrKysrKysNCj4+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX2Fj
Y2Vzcy5jDQo+PiBpbmRleCBiZjY3ZGRiMTVhLi42YTIyNTEyNTU1IDEwMDY0NA0KPj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L21tL21l
bV9hY2Nlc3MuYw0KPj4gQEAgLTI3OSw3ICsyNzksNyBAQCBpbnQgcDJtX3NldF9hbHRwMm1fbWVt
X2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFpbiAqaHAybSwNCj4+ICAg
ICAgICAgICBnZm5fdCBnZm4yID0gX2dmbihnZm5fbCAmIG1hc2spOw0KPj4gICAgICAgICAgIG1m
bl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsNCj4+ICAgDQo+PiAtICAgICAgICAv
KiBOb3RlOiBjdXJyZW50bHkgaXQgaXMgbm90IHNhZmUgdG8gcmVtYXAgdG8gYSBzaGFyZWQgZW50
cnkgKi8NCj4+ICsJLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRv
IGEgc2hhcmVkIGVudHJ5ICovDQo+PiAgICAgICAgICAgaWYgKCB0ICE9IHAybV9yYW1fcncgKQ0K
Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVTUkNIOw0KPj4gICANCj4+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0uaA0KPj4g
aW5kZXggNmRlMTU0NmQ3Ni4uOTBhNmMxMzVhNyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNsdWRl
L2FzbS14ODYvcDJtLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgNCj4+IEBA
IC00NjcsNiArNDY3LDE3IEBAIHN0YXRpYyBpbmxpbmUgbWZuX3QgYWx0cDJtX2dldF9nZm5fdHlw
ZV9hY2Nlc3MoDQo+PiAgICAgICByZXR1cm4gbWZuOw0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRp
YyBpbmxpbmUgaW50IGFsdHAybV9zZXRfZW50cnlfYnlfcGFnZV9vcmRlcigNCj4+ICsgICAgc3Ry
dWN0IHAybV9kb21haW4gKmFwMm0sIHVuc2lnbmVkIGxvbmcgZ2ZuLCAgbWZuX3QgbWZuLA0KPj4g
KyAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlciwgcDJtX3R5cGVfdCB0LCBwMm1fYWNjZXNzX3Qg
YSkNCj4gDQo+IFRoaXMgZnVuY3Rpb24gZG9lc24ndCBzZWVtIHRvIGJlIGNhbGxlZCBhbnl3aGVy
ZSBpbiB0aGlzIHNlcmllcy4NCg0KWWVzIEkgc2F3IHRoYXQgeWVzdGVyZGF5IGFmdGVyIHNlbmRp
bmcgdGhlIHBhdGNoLiBUaGUgY2FsbCBnb3QgbG9zdCBpbiANCnRoZSAgcmUtYmFzZS9tZXJnZSBw
cm9jZXNzLiBTb3JyeSBhYm91dCB0aGF0LCBpdCB3aWxsIGdvIG9uIGFnYWluIGluIHY0DQoNCkFs
ZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
