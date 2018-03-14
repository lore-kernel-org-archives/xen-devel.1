From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] gitignore: ignore wrappers.c link for fuzzer
Date: Wed, 14 Mar 2018 11:02:31 +0000
Message-ID: <20180314110231.24735-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yxl5=ge=citrix.com=prvs=60440319b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ew4Bu-0008Sw-AA
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 11:03:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

QXQgdGhlIHNhbWUgdGltZSByZW9yZGVyIHRoZSBlbnRyaWVzIGFscGhhYmV0aWNhbGx5LgoKU2ln
bmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiAuZ2l0aWdub3Jl
IHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQppbmRleCBiMDE5MWJmOTFm
Li45ZjVlOWFlZDE1IDEwMDY0NAotLS0gYS8uZ2l0aWdub3JlCisrKyBiLy5naXRpZ25vcmUKQEAg
LTE2OCwxMCArMTY4LDExIEBAIHRvb2xzL2ZsYXNrL3V0aWxzL2ZsYXNrLXNldC1ib29sCiB0b29s
cy9mbGFzay91dGlscy9mbGFzay1sYWJlbC1wY2kKIHRvb2xzL2Z1enovbGliZWxmL2FmbC1saWJl
bGYtZnV6emVyCiB0b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci9hc20KLXRvb2xz
L2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL3g4Nl9lbXVsYXRlCi10b29scy9mdXp6L3g4
Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci94ODYtZW11bGF0ZS5bY2hdCiB0b29scy9mdXp6L3g4Nl9p
bnN0cnVjdGlvbl9lbXVsYXRvci9hZmwtaGFybmVzcwogdG9vbHMvZnV6ei94ODZfaW5zdHJ1Y3Rp
b25fZW11bGF0b3IvYWZsLWhhcm5lc3MtY292Cit0b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9l
bXVsYXRvci93cmFwcGVycy5jCit0b29scy9mdXp6L3g4Nl9pbnN0cnVjdGlvbl9lbXVsYXRvci94
ODZfZW11bGF0ZQordG9vbHMvZnV6ei94ODZfaW5zdHJ1Y3Rpb25fZW11bGF0b3IveDg2LWVtdWxh
dGUuW2NoXQogdG9vbHMvaGVscGVycy9fcGF0aHMuaAogdG9vbHMvaGVscGVycy9pbml0LXhlbnN0
b3JlLWRvbWFpbgogdG9vbHMvaGVscGVycy94ZW4taW5pdC1kb20wCi0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
