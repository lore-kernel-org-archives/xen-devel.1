From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/2] SVM: introduce a VM entry helper
Date: Mon, 07 May 2018 08:11:37 -0600
Message-ID: <5AF05E9902000078001C14C2@prv1-mh.provo.novell.com>
References: <5AEC773002000078001C0BCE@prv1-mh.provo.novell.com>
 <5AEC782902000078001C0BEE@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=f+xl=h2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fFgrf-0005sM-QZ
 for xen-devel@lists.xenproject.org; Mon, 07 May 2018 14:11:43 +0000
In-Reply-To: <5AEC782902000078001C0BEE@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA1LjE4IGF0IDE3OjExLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL2VudHJ5LlMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L3N2bS9lbnRyeS5TCj4gQEAgLTYxLDIzICs2MSw4IEBAIFVOTElLRUxZX1NUQVJUKG5lLCBuc3Zt
X2hhcCkKPiAgICAgICAgICBqbXAgIC5Mc3ZtX2RvX3Jlc3VtZQo+ICBfX1VOTElLRUxZX0VORChu
c3ZtX2hhcCkKPiAgCj4gLSAgICAgICAgY2FsbCBzdm1fYXNpZF9oYW5kbGVfdm1ydW4KPiAtCj4g
LSAgICAgICAgY21wYiAkMCx0Yl9pbml0X2RvbmUoJXJpcCkKPiAtVU5MSUtFTFlfU1RBUlQobnos
IHN2bV90cmFjZSkKPiAtICAgICAgICBjYWxsIHN2bV90cmFjZV92bWVudHJ5Cj4gLVVOTElLRUxZ
X0VORChzdm1fdHJhY2UpCj4gLQo+IC0gICAgICAgIG1vdiAgVkNQVV9zdm1fdm1jYiglcmJ4KSwl
cmN4Cj4gLSAgICAgICAgbW92ICBVUkVHU19yYXgoJXJzcCksJXJheAo+IC0gICAgICAgIG1vdiAg
JXJheCxWTUNCX3JheCglcmN4KQo+IC0gICAgICAgIG1vdiAgVVJFR1NfcmlwKCVyc3ApLCVyYXgK
PiAtICAgICAgICBtb3YgICVyYXgsVk1DQl9yaXAoJXJjeCkKPiAtICAgICAgICBtb3YgIFVSRUdT
X3JzcCglcnNwKSwlcmF4Cj4gLSAgICAgICAgbW92ICAlcmF4LFZNQ0JfcnNwKCVyY3gpCj4gLSAg
ICAgICAgbW92ICBVUkVHU19lZmxhZ3MoJXJzcCksJXJheAo+IC0gICAgICAgIG9yICAgJFg4Nl9F
RkxBR1NfTUJTLCVyYXgKPiAtICAgICAgICBtb3YgICVyYXgsVk1DQl9yZmxhZ3MoJXJjeCkKPiAr
ICAgICAgICBtb3YgICVyc3AsICVyZGkKPiArICAgICAgICBjYWxsIHN2bV92bWVudGVyX2hlbHBl
cgoKV2hpbGUgSSBoYWQgY29tbWl0dGVkIHRoaXMgZWFybGllciB0b2RheSwgdGhlcmUncyBvbmUg
Y29uY2VybiBJJ3ZlIGp1c3QgY29tZQp0byB0aGluayBvZjogTm93IHRoYXQgd2UncmUgY2FsbGlu
ZyBpbnRvIEMgbGFuZCB3aXRoIENMR0kgaW4gZWZmZWN0IChmb3IgbW9yZQp0aGFuIGp1c3QgdGhl
IHRyaXZpYWwgc3ZtX3RyYWNlX3ZtZW50cnkoKSkgd2UgYXJlIGF0IHJpc2sgb2YgY29uZnVzaW5n
CnBhcnRpZXMgdXNpbmcgbG9jYWxfaXJxX2lzX2VuYWJsZWQoKSwgZmlyc3QgYW5kIGZvcmVtb3N0
CmNvbW1vbi9zcGlubG9jay5jOmNoZWNrX2xvY2soKS4gV2hpbGUgaXQncyBzb21lIGV4dHJhIG92
ZXJoZWFkLCBJIHdvbmRlcgp3aGV0aGVyIHRoZSBjYWxsIHdvdWxkbid0IGJldHRlciBiZSBmcmFt
ZWQgYnkgYSBDTEkvU1RJIHBhaXIuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
