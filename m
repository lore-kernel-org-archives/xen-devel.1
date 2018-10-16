From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC PATCH v2 02/17] libxl: Add
 "stubdomain_version" to domain_build_info.
Date: Tue, 16 Oct 2018 17:43:34 +0100
Message-ID: <23494.5430.77966.734666@mariner.uk.xensource.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <7c30330d13abc993594a264e3c7c61693c9fc316.1533608042.git-series.marmarek@invisiblethingslab.com>
 <20180809092541.u6xwmsk2egugwbu6@citrix.com>	<20180903222527.GB1353@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=b3lb=m4=citrix.com=prvs=820ed1191=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gCSRv-0005vP-Ug
 for xen-devel@lists.xenproject.org; Tue, 16 Oct 2018 16:44:03 +0000
In-Reply-To: <20180903222527.GB1353@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Eric Shelton <eshelton@pobox.com>
List-Id: xen-devel@lists.xenproject.org

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIlJlOiBbUkZDIFBBVENIIHYyIDAy
LzE3XSBsaWJ4bDogQWRkICJzdHViZG9tYWluX3ZlcnNpb24iIHRvIGRvbWFpbl9idWlsZF9pbmZv
LiIpOgo+IEFjdHVhbGx5LCB3aXRoIHBhdGNoIDA0LzE3IHlvdSBjYW4gc2V0IGV4cGxpY2l0IHN0
dWJkb21haW4gcGF0aCwgc28KPiBzdHViZG9tYWluX3ZlcnNpb24gaXMgb25seSBhbm90aGVyIHdh
eSAocmVkdW5kYW50IHRvCj4gZGV2aWNlX21vZGVsX3ZlcnNpb24pIHRvIHNpZ25hbCB3aGF0IHBy
b3RvY29sIHRvIGNvbW11bmljYXRlIHdpdGgKPiBzdHViZG9tYWluIHNob3VsZCBiZSB1c2VkLiBS
aWdodCBub3cgZWFjaCBxZW11IHZlcnNpb24gaGF2ZSBvbmx5IG9uZQo+IHN0dWJkb21haW4gcHJv
dG9jb2w6Cj4gIC0gcWVtdS14ZW4tdHJhZGl0aW9uYWwgLSAibWluaSBvcyIgb25lCj4gIC0gcWVt
dS14ZW4gLSAibGludXgiIG9uZSAtIHNlZSBjb3ZlciBsZXR0ZXIKCkknbSBub3Qgc3VyZSB3aHkg
eW91IG5lZWQgaW50cm9kdWNlIGEgc3R1YmRvbWFpbl92ZXJzaW9uIHZhcmlhYmxlCmludGVybmFs
bHksIG9yIHRoZSBjb3JyZXNwb25kaW5nIHN0dWJkb21haW5fdmVyc2lvbiBjb25maWcgb3B0aW9u
LCBhdAphbGwuCgpEbyB3ZSBleHBlY3QgdG8gaGF2ZSBxZW11IHRyYWQgb24gTGludXggPyAgU2Vl
bXMgdW5saWtlbHkuICBXZSBoYXZlCmJlZW4gdHJ5aW5nIHRvIGRvIG1vZGVybiBxZW11IG9uIG1p
bmlvcyBvciBydW1wIGtlcm5lbHMgb3Igc29tZXRoaW5nCmZvciB5ZWFycyBhbmQgZ290dGVuIG5v
d2hlcmUuCgpTbyBtYXliZSB3aGF0IHdlIHNob3VsZCBoYXZlIGlzIGFuIGludGVybmFsIG1hY3Jv
IG9yIGlubGluZSBmdW5jdGlvbgpjYWxsZWQgc3R1YmRvbWFpbl9pc19saW51eCwgc28gd2UgY2Fu
IGFkZCBuZXcgdmFyaWFudHMgbGF0ZXIKaW50ZXJuYWxseS4KCkJ1dCBJIGRvbid0IHNlZSB0aGUg
bmVlZCBmb3IgdGhpcyB0byBiZSBpbiB0aGUgcHVibGljIGFuZCBzdGFibGUgbGlieGwKQUJJLiAg
VW5sZXNzIEknbSBtaXNzaW5nIHNvbWV0aGluZy4KClRoYW5rcywKSWFuLgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
