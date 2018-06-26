From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 03/11] x86/hvm: Introduce
 hvm_save_cpu_ctxt_one func
Date: Tue, 26 Jun 2018 07:32:30 -0600
Message-ID: <5B32406E02000078001CE119@prv1-mh.provo.novell.com>
References: <1529938247-7272-1-git-send-email-aisaila@bitdefender.com>
 <1529938247-7272-4-git-send-email-aisaila@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1529938247-7272-4-git-send-email-aisaila@bitdefender.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA2LjE4IGF0IDE2OjUwLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZt
L2h2bS5jCj4gQEAgLTc4NiwxMTcgKzc4NiwxMjcgQEAgc3RhdGljIGludCBodm1fbG9hZF90c2Nf
YWRqdXN0KHN0cnVjdCBkb21haW4gKmQsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+ICBIVk1f
UkVHSVNURVJfU0FWRV9SRVNUT1JFKFRTQ19BREpVU1QsIGh2bV9zYXZlX3RzY19hZGp1c3QsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaHZtX2xvYWRfdHNjX2FkanVzdCwgMSwgSFZNU1Jf
UEVSX1ZDUFUpOwo+ICAKPiArc3RhdGljIGludCBodm1fc2F2ZV9jcHVfY3R4dF9vbmUoc3RydWN0
IHZjcHUgKnYsIGh2bV9kb21haW5fY29udGV4dF90ICpoKQo+ICt7Cj4gKyAgICBzdHJ1Y3Qgc2Vn
bWVudF9yZWdpc3RlciBzZWc7Cj4gKyAgICBzdHJ1Y3QgaHZtX2h3X2NwdSBjdHh0Owo+ICsKPiAr
ICAgIG1lbXNldCgmY3R4dCwgMCwgc2l6ZW9mKGN0eHQpKTsKPiArCj4gKyAgICAvKiBXZSBkb24n
dCBuZWVkIHRvIHNhdmUgc3RhdGUgZm9yIGEgdmNwdSB0aGF0IGlzIGRvd247IHRoZSByZXN0b3Jl
Cj4gKyAgICAgKiBjb2RlIHdpbGwgbGVhdmUgaXQgZG93biBpZiB0aGVyZSBpcyBub3RoaW5nIHNh
dmVkLiAqLwoKUGxlYXNlIHRyeSB0byBjb3JyZWN0IGNvZGluZyBzdHlsZSBpc3N1ZXMgYXMgeW91
IG1vdmUgY29kZSwgbGlrZSBjb21tZW50CnN0eWxlIGhlcmUuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
