From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 04/34] x86/mm: don't reference hvm_funcs
 directly
Date: Mon, 20 Aug 2018 11:21:38 +0100
Message-ID: <20180820102138.cwbymuenrmz3h5fl@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
 <a1e3abddeb657a96e8989767ffc5c7d01ad20225.1534518694.git-series.wei.liu2@citrix.com>
 <bde0408e-40b6-63e1-86c7-df9c2bb97eb1@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qa+b=ld=citrix.com=prvs=763aa43e8=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1frhJe-0000XS-3i
 for xen-devel@lists.xenproject.org; Mon, 20 Aug 2018 10:21:42 +0000
Content-Disposition: inline
In-Reply-To: <bde0408e-40b6-63e1-86c7-df9c2bb97eb1@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBdWcgMjAsIDIwMTggYXQgMTA6Mjg6MjFBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxNy8wOC8yMDE4IDE2OjEyLCBXZWkgTGl1IHdyb3RlOgo+ID4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2h2bS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vaHZtLmgKPiA+IGluZGV4IDRmNzIwYWQuLjE0NjcyMGMgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2h2bS9odm0uaAo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9o
dm0vaHZtLmgKPiA+IEBAIC00NTQsNiArNDU0LDExIEBAIHN0YXRpYyBpbmxpbmUgaW50IGh2bV9l
dmVudF9wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQo+ID4gICAgICByZXR1cm4gaHZtX2Z1bmNzLmV2
ZW50X3BlbmRpbmcodik7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBodm1f
aW52bHBnKHN0cnVjdCB2Y3B1ICp2LCB1bnNpZ25lZCBsb25nIHZhKQo+IAo+IFBsZWFzZSBzL3Zh
L2xpbmVhci8gd2hpbGUgbWFraW5nIHRoaXMgYWRkaXRpb24gKG9yIGRvIGEgZ2VuZXJhbCB2YSA9
Pgo+IGxpbmVhciBjbGVhbnVwIGZvciBpbnZscGcpLsKgIFNhZGx5LCB0aGUgdGVybWlub2xvZ3kg
aGFzIGJlZW4gaW5jb3JyZWN0CgpJIHdpbGwgbWFrZSBhbm90aGVyIHBhdGNoIHRvIGNsZWFuIGl0
IHVwLgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
