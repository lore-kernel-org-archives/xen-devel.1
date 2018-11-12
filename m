From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v7 4/7] iommu: introduce
 iommu_map_page_nocrash
Date: Mon, 12 Nov 2018 06:26:53 -0700
Message-ID: <5BE97F9D02000078001FAFE0@prv1-mh.provo.novell.com>
References: <20181015103559.22075-1-paul.durrant@citrix.com>
 <20181015103559.22075-5-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=18fz=nx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gMCF1-0004lk-Ss
 for xen-devel@lists.xenproject.org; Mon, 12 Nov 2018 13:26:59 +0000
In-Reply-To: <20181015103559.22075-5-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjEwLjE4IGF0IDEyOjM1LCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gQEAgLTMxMywxNiArMzEzLDIzIEBAIHZvaWQgaW9t
bXVfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKPiAgICAgIGhkLT5yZXNlcnZlZF9y
YW5nZXMgPSBOVUxMOwo+ICB9Cj4gIAo+IC1pbnQgaW9tbXVfbWFwX3BhZ2Uoc3RydWN0IGRvbWFp
biAqZCwgZGZuX3QgZGZuLCBtZm5fdCBtZm4sCj4gLSAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgZmxhZ3MpCj4gK2ludCBpb21tdV9tYXBfcGFnZV9ub2NyYXNoKHN0cnVjdCBkb21haW4g
KmQsIGRmbl90IGRmbiwgbWZuX3QgbWZuLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBpbnQgZmxhZ3MpCgpEaWQgeW91IGNvbnNpZGVyIHVzaW5nIGEgZmxhZyBiaXQgaW5z
dGVhZCBvZiBpbnRyb2R1Y2luZyBhIGZ1bm5pbHkKbmFtZWQgZnVuY3Rpb24gKEkgc2luY2VyZWx5
IGhvcGUgdGhhdCBpbiB0aGUgY29tbW9uIGNhc2Ugbm9uZQpvZiBvdXIgY29kZSBjcmFzaGVzKT8K
Cj4gIHsKPiAgICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQp
Owo+IC0gICAgaW50IHJjOwo+ICAKPiAgICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwgIWhkLT5w
bGF0Zm9ybV9vcHMgKQo+ICAgICAgICAgIHJldHVybiAwOwo+ICAKPiAtICAgIHJjID0gaGQtPnBs
YXRmb3JtX29wcy0+bWFwX3BhZ2UoZCwgZGZuLCBtZm4sIGZsYWdzKTsKPiArICAgIHJldHVybiBo
ZC0+cGxhdGZvcm1fb3BzLT5tYXBfcGFnZShkLCBkZm4sIG1mbiwgZmxhZ3MpOwo+ICt9Cj4gKwo+
ICtpbnQgaW9tbXVfbWFwX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCBtZm5fdCBt
Zm4sCj4gKyAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZmxhZ3MpCj4gK3sKPiArICAg
IGludCByYzsKPiArCj4gKyAgICByYyA9IGlvbW11X21hcF9wYWdlX25vY3Jhc2goZCwgZGZuLCBt
Zm4sIGZsYWdzKTsKCk90aGVyd2lzZSwgaWYgdGhlIGZ1bmN0aW9uIHNwbGl0IGlzIGluZGVlZCB0
aGUgYmV0dGVyIHJvdXRlLCBwbGVhc2UKbWFrZSB0aGlzIHRoZSBpbml0aWFsaXplciBvZiB0aGUg
dmFyaWFibGUuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
