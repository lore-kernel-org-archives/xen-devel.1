From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/2] x86/altp2m: Add a subop for
 obtaining the memaccess of a page
Date: Mon, 09 Jul 2018 02:35:30 -0600
Message-ID: <5B431E5202000078001D2313@prv1-mh.provo.novell.com>
References: <20180705104445.8048-1-apop@bitdefender.com>
 <20180705104445.8048-3-apop@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=x+xa=jz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fcRdx-0003JD-6p
 for xen-devel@lists.xenproject.org; Mon, 09 Jul 2018 08:35:37 +0000
In-Reply-To: <20180705104445.8048-3-apop@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Adrian Pop <apop@bitdefender.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, tamas@tklengyel.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjA3LjE4IGF0IDEyOjQ0LCA8YXBvcEBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+
IEJvdGggYWx0cDJtIGdldC9zZXQgbWVtYWNjZXNzIGZ1bmN0aW9ucyB1c2UgdGhlIHN0cnVjdAo+
IHhlbl9odm1fYWx0cDJtX21lbV9hY2Nlc3Mgd2hpY2ggaGFzIG5vdyBkcm9wcGVkIHRoZSBgc2V0
JyBwYXJ0IGFuZCBoYXMKPiBiZWVuIHJlbmFtZWQgZnJvbSB4ZW5faHZtX2FsdHAybV9zZXRfbWVt
X2FjY2Vzcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUG9wIDxhcG9wQGJpdGRlZmVuZGVy
LmNvbT4KCkxvb2tpbmcgdGhyb3VnaCB0aGlzIHBhdGNoIC0gd2hhdCdzIHRoZSBwb2ludCBvZiBw
YXRjaCAxPyBUaGVyZSdzIG5vCmZ1cnRoZXIgdXNlciBiZWluZyBpbnRyb2R1Y2VkIGhlcmUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
