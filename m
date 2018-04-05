From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 1/2] make-flight:
 do_hvm_debian_test_one: new testname_sfx and testvars args
Date: Thu, 5 Apr 2018 14:04:17 +0100
Message-ID: <1522933458-17629-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=/x8/=g2=citrix.com=prvs=6261e79ed=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1f44ZB-0005lj-LC
 for xen-devel@lists.xenproject.org; Thu, 05 Apr 2018 13:04:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Q3VycmVudGx5IG5vIGNhbGxlcnMgcGFzcyB0aGVzZSwgc28gbm8gZnVuY3Rpb25hbCBjaGFuZ2Uu
CgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AZXUuY2l0cml4LmNvbT4K
LS0tCiBtYWtlLWZsaWdodCB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbWFrZS1mbGlnaHQgYi9tYWtlLWZsaWdo
dAppbmRleCA3Y2RlNWMyLi4xYThmMGE2IDEwMDc1NQotLS0gYS9tYWtlLWZsaWdodAorKysgYi9t
YWtlLWZsaWdodApAQCAtMzk2LDkgKzM5NiwxMCBAQCBkb19odm1fZGViaWFuX3Rlc3Rfb25lICgp
IHsKICAgYmlvcz0kMwogICB4c209JDQgIyAnZmFsc2UnIG9yICd0cnVlJwogICBzdHViZG9tPSQ1
ICMgJycgKG9yIHVuc2V0KSBvciAndHJ1ZScKKyAgdGVzdG5hbWVfc2Z4PSQ2CisgIHRlc3R2YXJz
PSQ3CiAKICAgbG9jYWwgYXJjaD0kKGJyYW5jaF9kZWJpYW5odm1fYXJjaCkKLSAgbG9jYWwgdGVz
dHZhcnMKIAogICBjYXNlICIkYXJjaCIgaW4KICAgICBhbWQ2NCkgaXNvX2Rpcj0naW5zdGFsbC5h
bWQnIDs7CkBAIC00MTUsNyArNDE2LDcgQEAgZG9faHZtX2RlYmlhbl90ZXN0X29uZSAoKSB7CiAg
ICAgICBzdHViZG9tX3J1bnZhcj0iZGViaWFuaHZtX3N0dWJkb209JHN0dWJkb20iCiAgIGZpCiAK
LSAgam9iX2NyZWF0ZV90ZXN0IHRlc3QtJHhlbmFyY2gka2Vybi0kZG9tMGFyY2gtJHRvb2xzdGFj
ayRxZW11dV9zdWZmaXgkc3R1YmRvbV9zdWZmaXgtJHRlc3RuYW1lLSRhcmNoXAorICBqb2JfY3Jl
YXRlX3Rlc3QgdGVzdC0keGVuYXJjaCRrZXJuLSRkb20wYXJjaC0kdG9vbHN0YWNrJHFlbXV1X3N1
ZmZpeCRzdHViZG9tX3N1ZmZpeC0kdGVzdG5hbWUtJGFyY2gkdGVzdG5hbWVfc2Z4XAogICAgIHRl
c3QtZGViaWFuaHZtICR0b29sc3RhY2sgJHhlbmFyY2ggJGRvbTBhcmNoICRxZW11dV9ydW52YXIg
XAogICAgIGVuYWJsZV94c209JHhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogICAg
ICRzdHViZG9tX3J1bnZhciAkdGVzdHZhcnMgICAgICAgICAgICAgICAgICAgXAotLSAKMi4xLjQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
