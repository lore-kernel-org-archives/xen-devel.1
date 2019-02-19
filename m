From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] x86/mm: split p2m ioreq server pages
 special handling into helper
Date: Tue, 19 Feb 2019 01:49:18 -0700
Message-ID: <5C6BC30E0200007800217E0E@prv1-mh.provo.novell.com>
References: <20190218172727.19644-1-roger.pau@citrix.com>
 <20190218172727.19644-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+Con=Q2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gw15g-0001Pa-Mm
 for xen-devel@lists.xenproject.org; Tue, 19 Feb 2019 08:49:24 +0000
In-Reply-To: <20190218172727.19644-2-roger.pau@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjAyLjE5IGF0IDE4OjI3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4gQEAgLTMxODgsNiArMzE4OCw5IEBAIHNoYWRvd193cml0
ZV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm4sCj4gICAgICBp
ZiAoIGxpa2VseShkLT5hcmNoLnBhZ2luZy5zaGFkb3cudG90YWxfcGFnZXMgIT0gMCkgKQo+ICAg
ICAgICAgICBzaF91bnNoYWRvd19mb3JfcDJtX2NoYW5nZShkLCBnZm4sIHAsIG5ldywgbGV2ZWwp
Owo+ICAKPiArICAgIHAybV9lbnRyeV9tb2RpZnkocDJtX2dldF9ob3N0cDJtKGQpLCBwMm1fZmxh
Z3NfdG9fdHlwZShsMWVfZ2V0X2ZsYWdzKG5ldykpLAo+ICsgICAgICAgICAgICAgICAgICAgICBw
Mm1fZmxhZ3NfdG9fdHlwZShsMWVfZ2V0X2ZsYWdzKCpwKSksIGxldmVsKTsKPiArCj4gICAgICAv
KiBVcGRhdGUgdGhlIGVudHJ5IHdpdGggbmV3IGNvbnRlbnQgKi8KPiAgICAgIHNhZmVfd3JpdGVf
cHRlKHAsIG5ldyk7CgpTdHJpY3RseSBzcGVha2luZyB5b3Ugc2hvdWxkIENjIFRpbSBmb3IgdGhp
cyBjaGFuZ2UuCgpBbHNvIGF0IHRoaXMgZXhhbXBsZSAoYSBwb3NzaWJsZSBpc3N1ZSBlbHNld2hl
cmUgYXMgd2VsbCkgLSBpcwphY3Rpbmcgb24gdGhlIGhvc3QgUDJNIChvbmx5KSByZWFsbHkgdGhl
IHJpZ2h0IHRoaW5nIHRvIGRvIGhlcmU/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
