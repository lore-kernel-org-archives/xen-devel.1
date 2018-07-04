From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH] x86/altp2m: Add a subop for obtaining the
 mem access of a page
Date: Wed, 4 Jul 2018 14:05:27 +0000
Message-ID: <A722A246-C6D6-4CF0-A26D-E788CDEC685B@citrix.com>
References: <20180628130036.23241-1-apop@bitdefender.com>
 <5B36529202000078001CF466@prv1-mh.provo.novell.com>
 <5435e9f9-21ea-1e36-294c-a79250ba9119@bitdefender.com>
 <5B39C76D02000078001CF8DF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=fhxi=ju=citrix.com=prvs=716d989b0=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1faiPW-0007aG-S4
 for xen-devel@lists.xenproject.org; Wed, 04 Jul 2018 14:05:34 +0000
In-Reply-To: <5B39C76D02000078001CF8DF@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <E06DE36DEFEE2E458F7E4C6707029D8B@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Adrian Pop <apop@bitdefender.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim (Xen.org)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>, "tamas@tklengyel.com" <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>, Ian Jackson <Ian.Jackson@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQoNCj4gT24gSnVsIDIsIDIwMTgsIGF0IDc6MzQgQU0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBz
dXNlLmNvbT4gd3JvdGU6DQo+IA0KPj4+PiBPbiAyOS4wNi4xOCBhdCAxODozOSwgPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4gT24gMDYvMjkvMjAxOCAwNjozOCBQTSwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMjguMDYuMTggYXQgMTU6MDAsIDxhcG9wQGJpdGRl
ZmVuZGVyLmNvbT4gd3JvdGU6DQo+Pj4+IEBAIC00NjY2LDYgKzQ2NjcsMjMgQEAgc3RhdGljIGlu
dCBkb19hbHRwMm1fb3AoDQo+Pj4+ICAgICAgICAgfQ0KPj4+PiAgICAgICAgIGJyZWFrOw0KPj4+
PiANCj4+Pj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9nZXRfbWVtX2FjY2VzczoNCj4+Pj4gKyAg
ICAgICAgaWYgKCBhLnUubWVtX2FjY2Vzcy5wYWQgKQ0KPj4+PiArICAgICAgICAgICAgcmMgPSAt
RUlOVkFMOw0KPj4+PiArICAgICAgICBlbHNlDQo+Pj4+ICsgICAgICAgIHsNCj4+Pj4gKyAgICAg
ICAgICAgIHhlbm1lbV9hY2Nlc3NfdCBhY2Nlc3M7DQo+Pj4+ICsNCj4+Pj4gKyAgICAgICAgICAg
IHJjID0gcDJtX2dldF9tZW1fYWNjZXNzKGQsIF9nZm4oYS51Lm1lbV9hY2Nlc3MuZ2ZuKSwgJmFj
Y2VzcywNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGEudS5tZW1f
YWNjZXNzLnZpZXcpOw0KPj4+PiArICAgICAgICAgICAgaWYgKCAhcmMgKQ0KPj4+PiArICAgICAg
ICAgICAgew0KPj4+PiArICAgICAgICAgICAgICAgIGEudS5tZW1fYWNjZXNzLmh2bW1lbV9hY2Nl
c3MgPSBhY2Nlc3M7DQo+Pj4+ICsgICAgICAgICAgICAgICAgcmMgPSBfX2NvcHlfdG9fZ3Vlc3Qo
YXJnLCAmYSwgMSkgPyAtRUZBVUxUIDogMDsNCj4+PiANCj4+PiBfX2NvcHlfZmllbGRfdG9fZ3Vl
c3QoKT8gT3Igd2FpdCwgbm8sIHRoZSBmdW5jdGlvbiBhcmd1bWVudCBpcyBzdGlsbCBhDQo+Pj4g
aGFuZGxlIG9mIHZvaWQuDQo+Pj4gDQo+Pj4gQW5kIHRoZW4gLSBoZXJlIHdlIGFyZSBhZ2Fpbjog
SXMgaXQgcmVhc29uYWJsZSB0byBwZXJtaXQgYSBkb21haW4gaW5xdWlyaW5nDQo+Pj4gZm9yIGl0
c2VsZj8NCj4+IA0KPj4gQSBnb29kIHF1ZXN0aW9uLiBQZXJoYXBzIHRoZSBmb2xsb3dpbmcgYXJl
IGRlY2lzaW9uIGZhY3RvcnM6DQo+PiANCj4+IDEuIEl0IGlzIGFscmVhZHkgcG9zc2libGUgZm9y
IGEgZG9tYWluIHRvIHNldCBtZW1fYWNjZXNzIHJlc3RyaWN0aW9ucw0KPj4gKHZpYSBIVk1PUF9h
bHRwMm1fc2V0X21lbV9hY2Nlc3MpIG9uIGl0c2VsZi4NCj4gDQo+IFdoaWNoLCBhcyBiZWZvcmUs
IEkgY29uc2lkZXIgYSBmbGF3Lg0KDQpIb3cgbWFueSB0aW1lcyBkbyB3ZSBoYXZlIHRvIGdvIG92
ZXIgdGhpcz8gIEhlcmUgaXMgbXkgcmVjb2xsZWN0aW9uIGZyb20gdGhlIGxhc3QgdGltZSB3ZSBo
YWQgYSBkaXNjdXNzaW9uIG9uIHRoaXMgdG9waWM6DQoNCiogVGhlIG9yaWdpbmFsIGF1dGhvcnMg
b2YgdGhpcyBjb2RlIHByb2JhYmx5IHRob3VnaHQgaGF2aW5nIGd1ZXN0cyBzZXQgdGhlaXIgb3du
IG1lbWFjY2VzcyB3b3VsZCBiZSBhIHBvdGVudGlhbCB1c2UgY2FzZQ0KKiBUaGUgbWFpbnRhaW5l
cnMgYW5kIG1haW4gdXNlcnMgb2YgdGhlIGNvZGUgKFRhbWFzIGFuZCBSYXp2YW4pIHRoaW5rIGl0
4oCZcyBhIHVzZWZ1bCB1c2UgY2FzZQ0KKiBUaGUgTU0gbWFpbnRhaW5lciAobWUpIGFuZCBvbmUg
b2YgdGhlIHg4NiBtYWludGFpbmVycyAoQW5keSkgdGhpbmsgaXTigJlzIGEgdXNlZnVsIHVzZSBj
YXNlLg0KDQooQ29ycmVjdCBtZSBpZiBJ4oCZdmUgbWlzcmVtZW1iZXJlZCBhbnl3aGVyZS4pDQoN
CkRvIHdlIG5lZWQgdG8gaGF2ZSBhIGZvcm1hbCB2b3RlIGJ5IHRoZSBjb21taXR0ZXJzIGZvciB5
b3UgdG8gYWNjZXB0IHRoYXQgdGhpcyBzaG91bGQgYmUgYSBzdXBwb3J0ZWQgdXNlIGNhc2UsIGFu
ZCBzdG9wIG1ha2luZyBvYmplY3Rpb25zIGFueSB0aW1lIHNvbWVvbmUgd2FudHMgdG8gaW1wcm92
ZSBpdD8NCg0KQXMgbG9uZyBhcyBub3QgYmVpbmcgYWJsZSB0byBjYWxsIGFsdHAybV9zZXRfbWVt
X2FjY2VzcyAgbWVhbnMgbm90IGJlaW5nIGFibGUgdG8gY2FsbCBhbHRwMm1fZ2V0X21lbV9hY2Nl
c3MsIHRoaXMgc2hvdWxkIGJlIGZpbmUuDQoNCiAtR2VvcmdlCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
