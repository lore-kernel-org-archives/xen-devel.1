From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 19/34] x86: check HVM before trying to get ioreq
 server
Date: Fri, 17 Aug 2018 16:12:37 +0100
Message-ID: <d892728cb6705be384a48eb6d0e4de3ded2e4ed6.1534518694.git-series.wei.liu2@citrix.com>
References: <cover.f5351150954129956fcf53a7781206b6295df78d.1534518694.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v/z7=la=citrix.com=prvs=760f4e3ef=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fqggM-0001qY-Qm
 for xen-devel@lists.xenproject.org; Fri, 17 Aug 2018 15:28:58 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

VGhpcyBoZWxwcyB3aXRoIGRlYWQgY29kZSBlbGltaW5hdGlvbi4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhl
bi9hcmNoL3g4Ni9tbS5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tLmMgYi94ZW4vYXJjaC94ODYvbW0uYwppbmRl
eCA4YWM0NDEyLi5mM2ZhNmNlIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0uYworKysgYi94
ZW4vYXJjaC94ODYvbW0uYwpAQCAtNDM4Miw2ICs0MzgyLDEwIEBAIGludCBhcmNoX2FjcXVpcmVf
cmVzb3VyY2Uoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IHR5cGUsCiAgICAgICAgIHVu
c2lnbmVkIGludCBpOwogCiAgICAgICAgIHJjID0gLUVJTlZBTDsKKyAgICAgICAgaWYgKCAhaXNf
aHZtX2RvbWFpbihkKSApCisgICAgICAgICAgICBicmVhazsKKworICAgICAgICByYyA9IC1FSU5W
QUw7CiAgICAgICAgIGlmICggaWQgIT0gKHVuc2lnbmVkIGludClpb3NlcnZpZCApCiAgICAgICAg
ICAgICBicmVhazsKIAotLSAKZ2l0LXNlcmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
