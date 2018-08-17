From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 29/34] x86/mm: put paging_update_nestedmode
 under CONFIG_HVM
Date: Fri, 17 Aug 2018 16:12:47 +0100
Message-ID: <86e8d3436de41c2c2ac544b19fef496aa2dbb070.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqgg8-0001Va-A7
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:44 +0000
In-Reply-To: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

TmVzdGVkIEhWTSBpcyBub3QgZW5hYmxlZCB3aGVuICFDT05GSUdfSFZNLgoKU2lnbmVkLW9mZi1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvbW0vcGFn
aW5nLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jIGIveGVuL2FyY2gveDg2L21tL3BhZ2luZy5jCmlu
ZGV4IGRjZWU0OTYuLjJhZWMxZDQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wYWdpbmcu
YworKysgYi94ZW4vYXJjaC94ODYvbW0vcGFnaW5nLmMKQEAgLTkyMSw2ICs5MjEsNyBAQCBjb25z
dCBzdHJ1Y3QgcGFnaW5nX21vZGUgKnBhZ2luZ19nZXRfbW9kZShzdHJ1Y3QgdmNwdSAqdikKIAog
dm9pZCBwYWdpbmdfdXBkYXRlX25lc3RlZG1vZGUoc3RydWN0IHZjcHUgKnYpCiB7CisjaWYgQ09O
RklHX0hWTQogICAgIEFTU0VSVChuZXN0ZWRodm1fZW5hYmxlZCh2LT5kb21haW4pKTsKICAgICBp
ZiAobmVzdGVkaHZtX3BhZ2luZ19tb2RlX2hhcCh2KSkKICAgICAgICAgLyogbmVzdGVkLW9uLW5l
c3RlZCAqLwpAQCAtOTI5LDYgKzkzMCw3IEBAIHZvaWQgcGFnaW5nX3VwZGF0ZV9uZXN0ZWRtb2Rl
KHN0cnVjdCB2Y3B1ICp2KQogICAgICAgICAvKiBUT0RPOiBzaGFkb3ctb24tc2hhZG93ICovCiAg
ICAgICAgIHYtPmFyY2gucGFnaW5nLm5lc3RlZG1vZGUgPSBOVUxMOwogICAgIGh2bV9hc2lkX2Zs
dXNoX3ZjcHUodik7CisjZW5kaWYKIH0KIAogdm9pZCBwYWdpbmdfd3JpdGVfcDJtX2VudHJ5KHN0
cnVjdCBwMm1fZG9tYWluICpwMm0sIHVuc2lnbmVkIGxvbmcgZ2ZuLAotLSAKZ2l0LXNlcmllcyAw
LjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
