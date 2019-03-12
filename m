From: "Hawrylko, Lukasz" <lukasz.hawrylko@intel.com>
Subject: [PATCH 1/1] Update TXT maintainter
Date: Tue, 12 Mar 2019 09:39:26 +0000
Message-ID: <129fd12dfea45b7c051fb19359cffd0db204591e.1552379750.git.lukasz.hawrylko@intel.com>
References: <cover.1552379750.git.lukasz.hawrylko@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4tes=RP=intel.com=lukasz.hawrylko@srs-us1.protection.inumbo.net>)
 id 1h3dsh-0007QQ-OV
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 09:39:31 +0000
In-Reply-To: <cover.1552379750.git.lukasz.hawrylko@intel.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "wei.liu2@citrix.com" <wei.liu2@citrix.com>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>, "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>, "jbeulich@suse.com" <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogTHVrYXN6IEhhd3J5bGtvIDxsdWthc3ouaGF3cnlsa29AaW50ZWwuY29t
PgotLS0KIE1BSU5UQUlORVJTIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwpp
bmRleCBhMGNkYTRmN2ExLi40YzQ3Mjk0NzA2IDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysg
Yi9NQUlOVEFJTkVSUwpAQCAtMjM3LDcgKzIzNyw3IEBAIEY6CXhlbi9hcmNoL3g4Ni9kZWJ1Zy5j
CiBGOgl0b29scy9kZWJ1Z2dlci9nZGJzeC8KIAogSU5URUwoUikgVFJVU1RFRCBFWEVDVVRJT04g
VEVDSE5PTE9HWSAoVFhUKQotTToJR2FuZyBXZWkgPGdhbmcud2VpQGludGVsLmNvbT4KK006CUx1
a2FzeiBIYXdyeWxrbyA8bHVrYXN6Lmhhd3J5bGtvQGludGVsLmNvbT4KIE06CVNoYW5lIFdhbmcg
PHNoYW5lLndhbmdAaW50ZWwuY29tPgogUzoJU3VwcG9ydGVkCiBGOgl4ZW4vYXJjaC94ODYvdGJv
b3QuYwotLSAKMi4yMC4xCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKSW50ZWwgVGVjaG5vbG9neSBQb2xhbmQgc3Au
IHogby5vLgp1bC4gU2xvd2Fja2llZ28gMTczIHwgODAtMjk4IEdkYW5zayB8IFNhZCBSZWpvbm93
eSBHZGFuc2sgUG9sbm9jIHwgVklJIFd5ZHppYWwgR29zcG9kYXJjenkgS3Jham93ZWdvIFJlamVz
dHJ1IFNhZG93ZWdvIC0gS1JTIDEwMTg4MiB8IE5JUCA5NTctMDctNTItMzE2IHwgS2FwaXRhbCB6
YWtsYWRvd3kgMjAwLjAwMCBQTE4uCgpUYSB3aWFkb21vc2Mgd3JheiB6IHphbGFjem5pa2FtaSBq
ZXN0IHByemV6bmFjem9uYSBkbGEgb2tyZXNsb25lZ28gYWRyZXNhdGEgaSBtb3plIHphd2llcmFj
IGluZm9ybWFjamUgcG91Zm5lLiBXIHJhemllIHByenlwYWRrb3dlZ28gb3RyenltYW5pYSB0ZWog
d2lhZG9tb3NjaSwgcHJvc2lteSBvIHBvd2lhZG9taWVuaWUgbmFkYXdjeSBvcmF6IHRyd2FsZSBq
ZWogdXN1bmllY2llOyBqYWtpZWtvbHdpZWsKcHJ6ZWdsYWRhbmllIGx1YiByb3pwb3dzemVjaG5p
YW5pZSBqZXN0IHphYnJvbmlvbmUuClRoaXMgZS1tYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgbWF5
IGNvbnRhaW4gY29uZmlkZW50aWFsIG1hdGVyaWFsIGZvciB0aGUgc29sZSB1c2Ugb2YgdGhlIGlu
dGVuZGVkIHJlY2lwaWVudChzKS4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVu
dCwgcGxlYXNlIGNvbnRhY3QgdGhlIHNlbmRlciBhbmQgZGVsZXRlIGFsbCBjb3BpZXM7IGFueSBy
ZXZpZXcgb3IgZGlzdHJpYnV0aW9uIGJ5Cm90aGVycyBpcyBzdHJpY3RseSBwcm9oaWJpdGVkLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
