From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] libxc: really tolerate empty PV records
Date: Tue, 27 Feb 2018 15:00:23 +0000
Message-ID: <67dfff63-9779-6090-e2ce-ab15e0c25e61@citrix.com>
References: <5A957E7A02000078001AC4CA@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ijku=fv=citrix.com=prvs=58962d594=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eqgk4-0003ws-1L
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 15:00:32 +0000
In-Reply-To: <5A957E7A02000078001AC4CA@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDIvMTggMTQ6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IENvbW1pdCAxMTllZTRkNzcz
ICgidG9vbHMvbGlieGM6IFRvbGVyYXRlIHNwZWNpZmljIHplcm8tY29udGVudCByZWNvcmRzCj4g
aW4gbWlncmF0aW9uIHYyIHN0cmVhbXMiKSBtZWFudCB0b2xlcmF0ZSB0aG9zZSwgYnV0IGZhaWxl
ZCB0byBzZXQgcmMKPiBhY2NvcmRpbmdseS4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKPiAtLS0KPiBUaGlzIGlzIHdoYXQgaXMgY3VycmVudGx5IGJy
ZWFraW5nIHNhdmUvcmVzdG9yZSBvbiB0aGUgNC44IGJyYW5jaDsgSQo+IGhhdmVuJ3QgY2hlY2tl
ZCB5ZXQgd2h5IHRoZSBzZW5kaW5nIHNpZGUgcHJvZHVjZXMgYW4gZW1wdHkgcmVjb3JkIHRoZXJl
Lgo+IEkgd29uZGVyIHdoZXRoZXIgdGhhdCdzIHJlbGF0ZWQgdG8gZjFhMGE4YzNmZSAoInRvb2xz
L2xpYnhjOiBGaXgKPiByZXN0b3JhdGlvbiBvZiBQViBNU1JzIGFmdGVyIG1pZ3JhdGUiKSBub3Qg
aGF2aW5nIGJlZW4gYmFja3BvcnRlZCB5ZXQuCj4gT3RvaCB0aGUgbGF0dGVyIGlzIG1pc3Npbmcg
b24gNC43IHRvbywgeWV0IHRoZXJlIHNhdmUvcmVzdG9yZSBkb2Vzbid0Cj4gZmFpbC4KCkl0IHdp
bGwgYmUgNzJlZmIxZGY2ICJBdm9pZCBnZW5lcmF0aW5nIGluYXBwcm9wcmlhdGUgemVyby1jb250
ZW50CnJlY29yZHMiIHdoaWNoIGlzIG1pc3NpbmcuCgpJdCB0cmlnZ2VycyB3aGVuIHRoZXJlIGFy
ZSBhIG5vbi16ZXJvIG1heGltdW0gbnVtYmVyIG9mIE1TUnMsIGJ1dCB6ZXJvCk1TUnMgdG8gdGVu
ZCBhZnRlciBYZW4gc2tpcHMgdGhlIGVtcHR5IE1TUnMuCgp+QW5kcmV3Cgo+Cj4gLS0tIGEvdG9v
bHMvbGlieGMveGNfc3JfcmVzdG9yZV94ODZfcHYuYwo+ICsrKyBiL3Rvb2xzL2xpYnhjL3hjX3Ny
X3Jlc3RvcmVfeDg2X3B2LmMKPiBAQCAtNzcwLDYgKzc3MCw3IEBAIHN0YXRpYyBpbnQgaGFuZGxl
X3g4Nl9wdl92Y3B1X2Jsb2Ioc3RydWMKPiAgICAgIHsKPiAgICAgICAgICBEQkdQUklOVEYoIlNr
aXBwaW5nIGVtcHR5ICVzIHJlY29yZCBmb3IgdmNwdSAldVxuIiwKPiAgICAgICAgICAgICAgICAg
ICAgcmVjX3R5cGVfdG9fc3RyKHJlYy0+dHlwZSksIHZoZHItPnZjcHVfaWQpOwo+ICsgICAgICAg
IHJjID0gMDsKPiAgICAgICAgICBnb3RvIG91dDsKPiAgICAgIH0KPiAgCj4KPgo+CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
