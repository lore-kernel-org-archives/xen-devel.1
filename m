From: "Jan Beulich" <jbeulich@suse.com>
Subject: Re: [PATCH v4] x86/mm: Aggregate get entry and populate
 into common funcs
Date: Mon, 15 Apr 2019 09:37:21 -0600
Message-ID: <5CB4A5310200007800155529@prv1-mh.provo.novell.com>
References: <20190415092243.3349-1-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hG3c9-0002x1-Vx
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 15:33:46 +0000
In-Reply-To: <20190415092243.3349-1-aisaila@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: aisaila@bitdefender.com
Cc: tamas@tklengyel.com, wei.liu2@citrix.com, rcojocaru@bitdefender.com, george.dunlap@eu.citrix.com, andrew.cooper3@citrix.com, george.dunlap@citrix.com, xen-devel@lists.xenproject.org, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gMDQv
MTUvMTkgMTE6MjMgQU0gPj4+Cj4tLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj4rKysg
Yi94ZW4vaW5jbHVkZS9hc20teDg2L3AybS5oCj5AQCAtNTE0LDYgKzUxNCwyMyBAQCBzdGF0aWMg
aW5saW5lIHVuc2lnbmVkIGxvbmcgbWZuX3RvX2dmbihzdHJ1Y3QgZG9tYWluICpkLCBtZm5fdCBt
Zm4pCiAgICAgICAgID5yZXR1cm4gbWZuX3gobWZuKTsKPn0KID4KPitpbnQgZ2V0X2FsdHAybV9l
bnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwgZ2ZuX3QgZ2ZuLCBtZm5fdCAqbWZuLAo+KyAg
ICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3QgKnQsIHAybV9hY2Nlc3NfdCAqYSwgYm9vbCBw
cmVwb3B1bGF0ZSk7Cj4rCj4rc3RhdGljIGlubGluZSBpbnQgYWx0cDJtX2dldF9lbnRyeV9kaXJl
Y3Qoc3RydWN0IHAybV9kb21haW4gKmFwMm0sCj4rICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPisgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCAqdCwgcDJtX2FjY2Vz
c190ICphKQo+K3sKPisgICAgcmV0dXJuIGdldF9hbHRwMm1fZW50cnkoYXAybSwgZ2ZuLCBtZm4s
IHQsIGEsIGZhbHNlKTsKPit9Cj4rCj4rc3RhdGljIGlubGluZSBpbnQgYWx0cDJtX2dldF9lbnRy
eV9wcmVwb3B1bGF0ZShzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwKPisgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwgbWZuX3QgKm1mbiwKPisg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV90eXBlX3Qg
KnQsIHAybV9hY2Nlc3NfdCAqYSkKPit7Cj4rICAgIHJldHVybiBnZXRfYWx0cDJtX2VudHJ5KGFw
Mm0sIGdmbiwgbWZuLCB0LCBhLCB0cnVlKTsKPit9CgpUaGUgd29ya2VyIGZ1bmN0aW9uIG5hbWUg
d291bGQgaW1vIGJldHRlciBiZSBhbHRwMm1fZ2V0X2VudHJ5KCksIHRoZW4gaW4gbGluZQp3aXRo
IGl0cyB0d28gd3JhcHBlcnMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
