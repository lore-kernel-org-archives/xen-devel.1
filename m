From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 7/8] x86/mm: handle foreign mappings in
 p2m_entry_modify
Date: Wed, 06 Feb 2019 09:59:30 -0700
Message-ID: <5C5B127202000078002146B6@prv1-mh.provo.novell.com>
References: <20190130103646.53649-1-roger.pau@citrix.com>
 <20190130103646.53649-8-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F3w5=QN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1grQXt-0005n1-Qa
 for xen-devel@lists.xenproject.org; Wed, 06 Feb 2019 16:59:33 +0000
In-Reply-To: <20190130103646.53649-8-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE5IGF0IDExOjM2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiArKysgYi94ZW4vaW5jbHVkZS9hc20t
eDg2L3AybS5oCj4gQEAgLTkzMyw5ICs5MzMsMTIgQEAgc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIg
KnAybV9nZXRfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsYWdzKTsKPiAg
Cj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBwMm1fZW50cnlfbW9kaWZ5KHN0cnVjdCBwMm1fZG9tYWlu
ICpwMm0sIHAybV90eXBlX3QgbnQsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHAybV90eXBlX3Qgb3QsIHVuc2lnbmVkIGludCBsZXZlbCkKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcDJtX3R5cGVfdCBvdCwgbWZuX3QgbmZuLCBtZm5fdCBvZm4s
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBsZXZl
bCkKPiAgewo+IC0gICAgaWYgKCBsZXZlbCAhPSAxIHx8IG50ID09IG90ICkKPiArICAgIHN0cnVj
dCBwYWdlX2luZm8gKnBnOwo+ICsKPiArICAgIGlmICggbGV2ZWwgIT0gMSB8fCAobnQgPT0gb3Qg
JiYgbWZuX2VxKG5mbiwgb2ZuKSkgKQo+ICAgICAgICAgIHJldHVybjsKPiAgCj4gICAgICBzd2l0
Y2ggKCBudCApCj4gQEAgLTk0OCw2ICs5NTEsMTcgQEAgc3RhdGljIGlubGluZSB2b2lkIHAybV9l
bnRyeV9tb2RpZnkoc3RydWN0IHAybV9kb21haW4gKnAybSwgcDJtX3R5cGVfdCBudCwKPiAgICAg
ICAgICBwMm0tPmlvcmVxLmVudHJ5X2NvdW50Kys7Cj4gICAgICAgICAgYnJlYWs7Cj4gIAo+ICsg
ICAgY2FzZSBwMm1fbWFwX2ZvcmVpZ246Cj4gKyAgICAgICAgcGcgPSBtZm5fdG9fcGFnZShuZm4p
Owo+ICsKPiArICAgICAgICBpZiAoICFwZyB8fCAhcGFnZV9nZXRfb3duZXJfYW5kX3JlZmVyZW5j
ZShwZykgKQoKbWZuX3RvX3BhZ2UoKSBjYW4ndCByZXR1cm4gTlVMTCwgY2FuIGl0PyBZb3UgbWF5
IHdhbnQgdG8gQVNTRVJUKCkKYmVmb3JlaGFuZCB0aGF0IHRoZSBNRk4gaXMgbm90IElOVkFMSURf
TUZOLCB0aG91Z2guCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
