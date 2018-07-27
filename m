From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH 1/4] iommu: remove unneeded return from
 iommu_hwdom_init
Date: Fri, 27 Jul 2018 17:31:46 +0200
Message-ID: <20180727153149.25094-2-roger.pau@citrix.com>
References: <20180727153149.25094-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=uvxm=kl=citrix.com=prvs=739380171=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fj4k4-0007XZ-LQ
 for xen-devel@lists.xenproject.org; Fri, 27 Jul 2018 15:33:20 +0000
In-Reply-To: <20180727153149.25094-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL2lvbW11LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21t
dS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwppbmRleCAyYzQ0ZmFiZjk5Li43
MGQyMThmOTEwIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCisr
KyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKQEAgLTIwNyw3ICsyMDcsNyBAQCB2
b2lkIF9faHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVjdCBkb21haW4gKmQpCiAgICAg
ICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLCByYyk7CiAgICAgfQogCi0gICAgcmV0dXJuIGhk
LT5wbGF0Zm9ybV9vcHMtPmh3ZG9tX2luaXQoZCk7CisgICAgaGQtPnBsYXRmb3JtX29wcy0+aHdk
b21faW5pdChkKTsKIH0KIAogdm9pZCBpb21tdV90ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkKQot
LSAKMi4xOC4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
