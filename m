From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH RFC 08/10] passthrough/amd: make
	clear_iommu_pte_present static
Date: Wed, 21 Feb 2018 21:46:59 +0000
Message-ID: <20180221214701.1646-9-wei.liu2@citrix.com>
References: <20180221214701.1646-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=igdh=fp=citrix.com=prvs=5836394aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eocEE-0001g2-EL
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2018 21:47:06 +0000
In-Reply-To: <20180221214701.1646-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgaXMgb25seSBvbmUgdXNlciBpbiB0aGUgc2FtZSBmaWxlLgoKU2lnbmVkLW9mZi1ieTog
V2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCkNjOiBTdXJhdmVlIFN1dGhpa3VscGFu
aXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3g4Ni9hbWQvaW9tbXVfbWFwLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC94ODYvYW1kL2lvbW11X21hcC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2Ft
ZC9pb21tdV9tYXAuYwppbmRleCBlNTFhNWM1ZmZlLi44NTY4ODE5ZWFjIDEwMDY0NAotLS0gYS94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvYW1kL2lvbW11X21hcC5jCisrKyBiL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9hbWQvaW9tbXVfbWFwLmMKQEAgLTM3LDcgKzM3LDcgQEAgc3Rh
dGljIHVuc2lnbmVkIGludCBwZm5fdG9fcGRlX2lkeCh1bnNpZ25lZCBsb25nIHBmbiwgdW5zaWdu
ZWQgaW50IGxldmVsKQogICAgIHJldHVybiBpZHg7CiB9CiAKLXZvaWQgY2xlYXJfaW9tbXVfcHRl
X3ByZXNlbnQodW5zaWduZWQgbG9uZyBsMV9tZm4sIHVuc2lnbmVkIGxvbmcgZ2ZuKQorc3RhdGlj
IHZvaWQgY2xlYXJfaW9tbXVfcHRlX3ByZXNlbnQodW5zaWduZWQgbG9uZyBsMV9tZm4sIHVuc2ln
bmVkIGxvbmcgZ2ZuKQogewogICAgIHU2NCAqdGFibGUsICpwdGU7CiAKLS0gCjIuMTEuMAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
