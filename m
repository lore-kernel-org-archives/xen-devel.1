From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 16/23] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Tue, 28 Aug 2018 11:54:37 +0100
Message-ID: <20180828105437.7wxrx4c4x2qvx2k7@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
 <d4796499faf997d270ae74f82a4b0175663c20a8.1535285866.git-series.wei.liu2@citrix.com>
 <5B85285902000078001E286D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ardv=ll=citrix.com=prvs=7715574d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fubeM-0002hx-5t
 for xen-devel@lists.xenproject.org; Tue, 28 Aug 2018 10:55:06 +0000
Content-Disposition: inline
In-Reply-To: <5B85285902000078001E286D@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBdWcgMjgsIDIwMTggYXQgMDQ6NDc6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDI2LjA4LjE4IGF0IDE0OjE5LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiArc3RhdGljIGlubGluZSBpbnQgcDJtX3BvZF9zZXRfbWVtX3RhcmdldChzdHJ1Y3Qg
ZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIHRhcmdldCkKPiA+ICt7Cj4gPiArICAgIHJldHVybiAw
Owo+ID4gK30KPiAKPiBUaGlzIG9uZSwgYXQgdGhlIHZlcnkgbGVhc3QsIHNob3VsZCBub3QgYmUg
bmVlZGVkOiBUaGUgY2FzZSBibG9jawo+IGluIGFyY2hfbWVtb3J5X29wKCkgY29udGFpbmluZyB0
aGUgb25seSBjYWxsIHNob3VsZCBhbHRvZ2V0aGVyIGJlCj4gZnJhbWVkIGJ5ICNpZmRlZiBDT05G
SUdfSFZNLgoKVGhlIHRvb2xzdGFjayB1bmNvbmRpdGlvbmFsbHkgc2V0cyBwb2QgdGFyZ2V0IHdo
ZW4gc2V0dGluZyBhIGRvbWFpbidzCm1lbW9yeSB0YXJnZXQuIEkgd2lsbCBuZWVkIHRvIGNoYW5n
ZSBsaWJ4bCB0byBub3QgaXNzdWUgcG9kIGNhbGwgZm9yIFBWCmd1ZXN0cyBpbiB0aGF0IGNhc2Uu
CgpXZWkuCgo+IAo+IEphbgo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
