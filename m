From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/5] vpci: fix updating the command
 register
Date: Fri, 16 Nov 2018 05:00:29 -0700
Message-ID: <5BEEB15D02000078001FCB9A@prv1-mh.provo.novell.com>
References: <20181114115740.1050-1-roger.pau@citrix.com>
 <20181114115740.1050-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=sc98=n3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gNcnb-0000j0-Up
 for xen-devel@lists.xenproject.org; Fri, 16 Nov 2018 12:00:35 +0000
In-Reply-To: <20181114115740.1050-2-roger.pau@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDEyOjU3LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEBAIC00MTMsNyArNDEyLDcgQEAgc3RhdGljIHZvaWQgcm9tX3dyaXRlKGNvbnN0IHN0cnVjdCBw
Y2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLAo+ICAgICAgICAgIGhlYWRlci0+cm9tX2Vu
YWJsZWQgPSBuZXdfZW5hYmxlZDsKPiAgICAgICAgICBwY2lfY29uZl93cml0ZTMyKHBkZXYtPnNl
ZywgcGRldi0+YnVzLCBzbG90LCBmdW5jLCByZWcsIHZhbCk7Cj4gICAgICB9Cj4gLSAgICBlbHNl
IGlmICggbW9kaWZ5X2JhcnMocGRldiwgbmV3X2VuYWJsZWQsIHRydWUpICkKPiArICAgIGVsc2Ug
aWYgKCBtb2RpZnlfYmFycyhwZGV2LCBuZXdfZW5hYmxlZCA/IFBDSV9DT01NQU5EX01FTU9SWSA6
IDAsIHRydWUpICkKCkRvIHlvdSByZWFsbHkgbWVhbiB0byBjbGVhciBhbGwgb3RoZXIgZGVmaW5l
ZCBiaXRzIG9mIHRoZSBjb21tYW5kCnJlZ2lzdGVyIGhlcmU/CgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
