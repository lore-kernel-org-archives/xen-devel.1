From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: x86_emulator distclean failing
Date: Mon, 26 Nov 2018 13:50:29 +0000
Message-ID: <a32a1a9ac0d1426889d940c3d0639018@AMSPEX02CL03.citrite.net>
References: <54fc65cbb31744afa42a18b56b3a8ffa@AMSPEX02CL03.citrite.net>
 <5BFBF7DB0200007800200021@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xvjC=OF=citrix.com=prvs=861df4a88=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gRHHV-0001E5-FK
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 13:50:33 +0000
In-Reply-To: <5BFBF7DB0200007800200021@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: 'Jan Beulich' <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmDQo+IE9mIEph
biBCZXVsaWNoDQo+IFNlbnQ6IDI2IE5vdmVtYmVyIDIwMTggMTM6NDENCj4gVG86IFBhdWwgRHVy
cmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+DQo+IENjOiB4ZW4tZGV2ZWwgPHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIHg4Nl9l
bXVsYXRvciBkaXN0Y2xlYW4gZmFpbGluZw0KPiANCj4gPj4+IE9uIDI2LjExLjE4IGF0IDE0OjA0
LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3RlOg0KPiA+IEFueW9uZSBlbHNlIHNlZWlu
ZyB0aGlzLCBvciBpcyBpdCBqdXN0IG1lPyBUaGlzIHdhcyBvbiBhIGZyZXNoIHB1bGwgb2YNCj4g
PiBzdGFnaW5nIGFib3V0IDUgbWlucyBhZ28uLi4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgSSBldmVy
IHJhbiBkaXN0Y2xlYW4sIGJ1dCBJIHRoaW5rIEkgY2FuIHNlZSB0aGUgaXNzdWUuDQo+IFdvdWxk
IHlvdSBtaW5kIHRyeWluZw0KPiANCj4gLS0tIGEvdG9vbHMvdGVzdHMveDg2X2VtdWxhdG9yL01h
a2VmaWxlDQo+ICsrKyBiL3Rvb2xzL3Rlc3RzL3g4Nl9lbXVsYXRvci9NYWtlZmlsZQ0KPiBAQCAt
MTY0LDcgKzE2NCw3IEBAIGRpc3RjbGVhbjogY2xlYW4NCj4gIGluc3RhbGwgdW5pbnN0YWxsOg0K
PiANCj4gIC5QSE9OWTogcnVuMzIgY2xlYW4zMg0KPiAtaWZlcSAoJChYRU5fVEFSR0VUX0FSQ0gp
LHg4Nl82NCkNCj4gK2lmZXEgKCQoWEVOX0NPTVBJTEVfQVJDSCkseDg2XzY0KQ0KPiAgcnVuMzI6
ICQoYWRkc3VmZml4IC5oLCQoVEVTVENBU0VTKSkgJChhZGRzdWZmaXggLW9wbWFzay5oLCQoT1BN
QVNLKSkNCj4gIHJ1bjMyIGNsZWFuMzI6ICUzMjoNCj4gIAkkKE1BS0UpIC1DIDMyICQqDQo+IA0K
PiBTaW1wbHkgYW4gaW5jb21wbGV0ZSByZW5hbWVkIHRoYXQgSSBoYWQgZG9uZSB3aGVuIHB1dHRp
bmcNCj4gdG9nZXRoZXIgNTJjMzdmN2FiOS4NCg0KVGhhdCBhcHBlYXJzIHRvIGRvIHRoZSB0cmlj
ay4gVGhhbmtzLA0KDQogIFBhdWwNCg0KPiANCj4gSmFuDQo+IA0KPiANCj4gDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IFhlbi1kZXZlbCBtYWls
aW5nIGxpc3QNCj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWwNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
