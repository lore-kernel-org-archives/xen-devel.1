From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 11/23] x86: XENMEM_resource_ioreq_server is
 HVM only
Date: Sun, 26 Aug 2018 13:19:44 +0100
Message-ID: <51741a6af59c41162ab10c5bc2a9462770bb1276.1535285866.git-series.wei.liu2@citrix.com>
References: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gpvm=lj=citrix.com=prvs=769521655=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ftu9o-0000WU-94
 for xen-devel@lists.xenproject.org; Sun, 26 Aug 2018 12:28:40 +0000
In-Reply-To: <cover.65253d1128f698146b48c4ff3bba2198f360c7b1.1535285866.git-series.wei.liu2@citrix.com>
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

UHV0IHRoZSBlbnRpcmUgY2FzZSBicmFuY2ggdW5kZXIgQ09ORklHX0hWTS4KCk5vbmV0aGVsZXNz
IGNoZWNrIEhWTSBiZWZvcmUgdHJ5aW5nIHRvIGdldCBpb3JlcSBzZXJ2ZXIuCgpTaWduZWQtb2Zm
LWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KdjI6IHB1dCBlbnRpcmUgY2Fz
ZSBicmFuY2ggdW5kZXIgQ09ORklHX0hWTQotLS0KIHhlbi9hcmNoL3g4Ni9tbS5jIHwgNiArKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0uYyBiL3hlbi9hcmNoL3g4Ni9tbS5jCmluZGV4IGE3NzQ0NTguLmVjM2NhZjQgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCkBAIC00
Mzc2LDEyICs0Mzc2LDE3IEBAIGludCBhcmNoX2FjcXVpcmVfcmVzb3VyY2Uoc3RydWN0IGRvbWFp
biAqZCwgdW5zaWduZWQgaW50IHR5cGUsCiAKICAgICBzd2l0Y2ggKCB0eXBlICkKICAgICB7Cisj
aWZkZWYgQ09ORklHX0hWTQogICAgIGNhc2UgWEVOTUVNX3Jlc291cmNlX2lvcmVxX3NlcnZlcjoK
ICAgICB7CiAgICAgICAgIGlvc2VydmlkX3QgaW9zZXJ2aWQgPSBpZDsKICAgICAgICAgdW5zaWdu
ZWQgaW50IGk7CiAKICAgICAgICAgcmMgPSAtRUlOVkFMOworICAgICAgICBpZiAoICFpc19odm1f
ZG9tYWluKGQpICkKKyAgICAgICAgICAgIGJyZWFrOworCisgICAgICAgIHJjID0gLUVJTlZBTDsK
ICAgICAgICAgaWYgKCBpZCAhPSAodW5zaWduZWQgaW50KWlvc2VydmlkICkKICAgICAgICAgICAg
IGJyZWFrOwogCkBAIC00NDA0LDYgKzQ0MDksNyBAQCBpbnQgYXJjaF9hY3F1aXJlX3Jlc291cmNl
KHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCB0eXBlLAogICAgICAgICAqZmxhZ3MgfD0g
WEVOTUVNX3JzcmNfYWNxX2NhbGxlcl9vd25lZDsKICAgICAgICAgYnJlYWs7CiAgICAgfQorI2Vu
ZGlmCiAKICAgICBkZWZhdWx0OgogICAgICAgICByYyA9IC1FT1BOT1RTVVBQOwotLSAKZ2l0LXNl
cmllcyAwLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
