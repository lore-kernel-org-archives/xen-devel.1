From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 16/17] x86: introduce new defconfigs for PV and
 HVM
Date: Thu, 4 Oct 2018 16:43:35 +0100
Message-ID: <2b79cf7845e0e22f7a66b4d8e0b7279285669eac.1538667753.git-series.wei.liu2@citrix.com>
References: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=a7fh=mq=citrix.com=prvs=808c92aaa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g861Q-0007Kl-Fj
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 15:58:40 +0000
In-Reply-To: <cover.9120eb87824b754ecdc7b1a5b95ea216404877a3.1538667753.git-series.wei.liu2@citrix.com>
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

VGhleSB3aWxsIGJlIHVzZWQgYnkgYnVpbGQgdGVzdHMuCgpTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgotLS0KIHhlbi9hcmNoL3g4Ni9jb25maWdzL2h2bV9vbmx5
X2RlZmNvbmZpZyAgfCAyICsrCiB4ZW4vYXJjaC94ODYvY29uZmlncy9ub19odm1fcHZfZGVmY29u
ZmlnIHwgMiArKwogeGVuL2FyY2gveDg2L2NvbmZpZ3MvcHZfb25seV9kZWZjb25maWcgICB8IDIg
KysKIDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2FyY2gveDg2L2NvbmZpZ3MvaHZtX29ubHlfZGVmY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2FyY2gveDg2L2NvbmZpZ3Mvbm9faHZtX3B2X2RlZmNvbmZpZwogY3JlYXRlIG1vZGUg
MTAwNjQ0IHhlbi9hcmNoL3g4Ni9jb25maWdzL3B2X29ubHlfZGVmY29uZmlnCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L2NvbmZpZ3MvaHZtX29ubHlfZGVmY29uZmlnIGIveGVuL2FyY2gveDg2
L2NvbmZpZ3MvaHZtX29ubHlfZGVmY29uZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAw
MDAwMDAuLmU4MmNjMDQKLS0tIC9kZXYvbnVsbAorKysgYi94ZW4vYXJjaC94ODYvY29uZmlncy9o
dm1fb25seV9kZWZjb25maWcKQEAgLTAsMCArMSwyIEBACitDT05GSUdfSFZNPXkKKyMgQ09ORklH
X1BWIGlzIG5vdCBzZXQKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL25vX2h2bV9w
dl9kZWZjb25maWcgYi94ZW4vYXJjaC94ODYvY29uZmlncy9ub19odm1fcHZfZGVmY29uZmlnCm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLmVkODUzY2QKLS0tIC9kZXYvbnVsbAor
KysgYi94ZW4vYXJjaC94ODYvY29uZmlncy9ub19odm1fcHZfZGVmY29uZmlnCkBAIC0wLDAgKzEs
MiBAQAorIyBDT05GSUdfSFZNIGlzIG5vdCBzZXQKKyMgQ09ORklHX1BWIGlzIG5vdCBzZXQKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9jb25maWdzL3B2X29ubHlfZGVmY29uZmlnIGIveGVuL2Fy
Y2gveDg2L2NvbmZpZ3MvcHZfb25seV9kZWZjb25maWcKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMC4uYWNhNzdiNgotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9hcmNoL3g4Ni9jb25m
aWdzL3B2X29ubHlfZGVmY29uZmlnCkBAIC0wLDAgKzEsMiBAQAorQ09ORklHX1BWPXkKKyMgQ09O
RklHX0hWTSBpcyBub3Qgc2V0Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
