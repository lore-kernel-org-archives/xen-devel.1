From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 3/4] x86: fix indirect thunk usage of
 CONFIG_INDIRECT_THUNK
Date: Tue, 20 Feb 2018 02:15:24 -0700
Message-ID: <5A8BF53C02000078001A97CE@prv-mh.provo.novell.com>
References: <20180219141620.20008-1-roger.pau@citrix.com>
 <20180219141620.20008-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=wunw=fo=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eo41K-0000D1-7e
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2018 09:15:30 +0000
In-Reply-To: <20180219141620.20008-4-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE4IGF0IDE1OjE2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvaW5kaXJlY3RfdGh1bmtfYXNtLmgKPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2luZGlyZWN0X3RodW5rX2FzbS5oCj4gQEAgLTMsNiArMywxMCBA
QAo+ICAgKiB1c3VhbCAjaWZkZWYnYXJ5IHRvIHR1cm4gaW50byBjb21tZW50cy4KPiAgICovCj4g
IAo+ICsuaWZuZGVmIENPTkZJR19JTkRJUkVDVF9USFVOSwo+ICsgICAgLmVxdSBDT05GSUdfSU5E
SVJFQ1RfVEhVTkssIDAKPiArLmVuZGlmCgpJIGhhdmUgdG8gd2l0aGRyYXcgbXkgUi1iOiBUaGlz
IGZhaWxzIHRvIGJ1aWxkIChJJ20gZ2V0dGluZyBhbiBlcnJvcgpvbiB0aGUgLmlmbmRlZiBhYm92
ZSBmb3IgbW9yZSB0aGFuIG9uZSBhc3NlbWJsZXIgc291cmNlKS4gSSBhc3N1bWUKdGhhdCdzIGJl
Y2F1c2Ugd2l0aCBpbmRpcmVjdCB0aHVua3MgZW5hYmxlZCB0aGUgY29uc3RhbnQgZ2V0cwpyZXBs
YWNlZCBieSBsaXRlcmFsIDEgYnkgdGhlIEMgcHJlcHJvY2Vzc29yLgoKSmFuCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
