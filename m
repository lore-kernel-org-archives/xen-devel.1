From: George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH for-4.12] x86/p2m: fix
 p2m_finish_type_change()
Date: Thu, 10 Jan 2019 23:48:00 +0000
Message-ID: <8D86A5F8-4D73-4299-BE89-E60D322DC909@citrix.com>
References: <1547030466-3547-1-git-send-email-rcojocaru@bitdefender.com>
 <5C35D802020000780020BC2B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n6Fr=PS=citrix.com=prvs=906c3ced9=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ghk3d-0008Cz-Tp
 for xen-devel@lists.xenproject.org; Thu, 10 Jan 2019 23:48:17 +0000
In-Reply-To: <5C35D802020000780020BC2B@prv1-mh.provo.novell.com>
Content-Language: en-US
Content-ID: <28E437C91F7C6543B7A03FCAF9A027D0@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>, Anthony Perard <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

DQo+IE9uIEphbiA5LCAyMDE5LCBhdCA5OjE2IFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOg0KPiANCj4+Pj4gT24gMDkuMDEuMTkgYXQgMTE6NDEsIDxyY29qb2NhcnVA
Yml0ZGVmZW5kZXIuY29tPiB3cm90ZToNCj4+IGZpbmlzaF90eXBlX2NoYW5nZSgpIHJldHVybnMg
YSBuZWdhdGl2ZSBpbnQgb24gZXJyb3IsIGJ1dCB0aGUNCj4+IGN1cnJlbnQgY29kZSBjaGVja3Mg
aWYgKCAhcmMgKS4NCj4gDQo+IEZvciB0aGUgcHVycG9zZSBvZiBkZXRlcm1pbmluZyB0aGUgYmFj
a3BvcnRpbmcgc2NvcGUgKG5vbmUgaGVyZSkNCj4gaXQgd291bGQgYmUgbmljZSBpZiBpbiBzdWNo
IGEgY2FzZSB5b3UgY291bGQgcG9pbnQgb3V0IHRoZSBjb21taXQNCj4gaW50cm9kdWNpbmcgdGhl
IGJyZWFrYWdlLg0KPiANCj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYw0KPj4gKysrIGIv
eGVuL2FyY2gveDg2L21tL3AybS5jDQo+PiBAQCAtMTE3Niw3ICsxMTc2LDcgQEAgaW50IHAybV9m
aW5pc2hfdHlwZV9jaGFuZ2Uoc3RydWN0IGRvbWFpbiAqZCwNCj4+IA0KPj4gICAgIHJjID0gZmlu
aXNoX3R5cGVfY2hhbmdlKGhvc3RwMm0sIGZpcnN0X2dmbiwgbWF4X25yKTsNCj4+IA0KPj4gLSAg
ICBpZiAoICFyYyApDQo+PiArICAgIGlmICggcmMgPCAwICkNCj4+ICAgICAgICAgZ290byBvdXQ7
DQo+PiANCj4+ICNpZmRlZiBDT05GSUdfSFZNDQo+PiBAQCAtMTE5MywxMyArMTE5MywxMyBAQCBp
bnQgcDJtX2ZpbmlzaF90eXBlX2NoYW5nZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gICAgICAgICAg
ICAgICAgIHJjID0gZmluaXNoX3R5cGVfY2hhbmdlKGFsdHAybSwgZmlyc3RfZ2ZuLCBtYXhfbnIp
Ow0KPj4gICAgICAgICAgICAgICAgIHAybV91bmxvY2soYWx0cDJtKTsNCj4+IA0KPj4gLSAgICAg
ICAgICAgICAgICBpZiAoICFyYyApDQo+PiArICAgICAgICAgICAgICAgIGlmICggcmMgPCAwICkN
Cj4+ICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7DQo+PiAgICAgICAgICAgICB9DQo+PiAg
ICAgfQ0KPj4gI2VuZGlmDQo+IA0KPiBNYXkgSSBhc2sgdGhhdCB5b3UgYWxzbyBmaXggdGhlIG90
aGVyIHJldHVybiB2YWx1ZSBpc3N1ZSBoZXJlOiBFaXRoZXINCj4gd2UgbWVhbiB0byBpbmRpY2F0
ZSB0byB0aGUgY2FsbGVyIHRoZSAwLzEgZGlzdGluY3Rpb24gKGluIHdoaWNoIGNhc2UNCj4gaXQg
c2hvdWxkIGJlIGNvcnJlY3QsIGkuZS4gY3VtdWxhdGl2ZSBhY3Jvc3MgYWxsIGZpbmlzaF90eXBl
X2NoYW5nZSgpDQo+IGNhbGxzIG1hZGUgaGVyZSksIHdoaWNoIHdhcyB0aGUgYmVoYXZpb3IgYmVm
b3JlIDBmYjRiNThjOGINCj4gKCJ4ODYvYWx0cDJtOiBmaXggZGlzcGxheSBmcm96ZW4gd2hlbiBz
d2l0Y2hpbmcgdG8gYSBuZXcgdmlldyBlYXJseSIpLA0KPiBvciB3ZSBtZWFuIHRvIHNpZ25hbCBz
dWNjZXNzIHRvIHRoZSBjYWxsZXIgb25seSBieSBoYW5kaW5nIGJhY2sgemVyby4NCg0KVGhlIOKA
nHJvb3TigJ0gY2FsbGVyIG9mIHAybV9maW5pc2hfdHlwZV9jaGFuZ2UoKSBpcyBYRU5fRE1PUF9t
YXBfbWVtX3R5cGVfdG9faW9yZXFfc2VydmVyOyBJdCBkb2VzbuKAmXQgbG9vayBsaWtlIGl0IGRv
ZXMgYW55dGhpbmcgdXNlZnVsIHdpdGggcG9zaXRpdmUgdmFsdWVzLCBhbmQgaXTigJlzIG5vdCBj
bGVhciBmcm9tIGFuIGludGVyZmFjZSBwZXJzcGVjdGl2ZSB0aGF0IHJldHVybmluZyBhIHBvc2l0
aXZlIHZhbHVlIGZyb20gdGhhdCBoeXBlcmNhbGwgbWFrZXMgYW55IHNlbnNlLg0KDQpQZXJoYXBz
IGl0IHdvdWxkIGJlIGJlc3QgdG8ganVzdCBkaXNjYXJkIHRoZSBwb3NpdGl2ZSB2YWx1ZXMgZm9y
IG5vdy4NCg0KIC1HZW9yZ2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
