From: Steven Haigh <netwiz@crc.id.au>
Subject: Backport request -
 3a2b8525b883baa87fe89b3da58f5c09fa599b99 to staging-4.9
Date: Fri, 24 Aug 2018 12:32:57 +1000
Message-ID: <4ef3af75faaf88e164744c7007947590@crc.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=p22o=lh=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1ft1uM-0005ii-Hb
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 02:33:06 +0000
Received: from lamp.crc.id.au (lamp.crc.id.au [IPv6:2407:e400:b000:200::8e8e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id AB572200BD
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 12:32:57 +1000 (AEST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

Q29tbWl0OgpodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14ZW4uZ2l0O2E9Y29tbWl0
O2g9M2EyYjg1MjViODgzYmFhODdmZTg5YjNkYTU4ZjVjMDlmYTU5OWI5OQoKSSd2ZSBhbHNvIHJ1
biBhY3Jvc3MgdGhpcyBidWlsZGluZyB0aGUgc3RhZ2luZy00LjkgYnJhbmNoIG9uIFJIRUw3LgoK
QnVpbGQgZXJyb3JzIHdpdGg6CmdjYyAgLW02NCAtREJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFz
aW5nIC1zdGQ9Z251OTkgLVdhbGwgCi1Xc3RyaWN0LXByb3RvdHlwZXMgLVdkZWNsYXJhdGlvbi1h
ZnRlci1zdGF0ZW1lbnQgCi1Xbm8tdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUgLVduby11bnVzZWQt
bG9jYWwtdHlwZWRlZnMgICAtTzIgCi1mb21pdC1mcmFtZS1wb2ludGVyIAotRF9fWEVOX0lOVEVS
RkFDRV9WRVJTSU9OX189X19YRU5fTEFURVNUX0lOVEVSRkFDRV9WRVJTSU9OX18gLU1NRCAtTUYg
Ci54cy10ZXN0Lm8uZCAtRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAg
IC1XZXJyb3IgCi1JL2J1aWxkZGlyL2J1aWxkL0JVSUxEL3Rvb2xzL3Rlc3RzL3hlbnN0b3JlLy4u
Ly4uLy4uL3Rvb2xzL3hlbnN0b3JlL2luY2x1ZGUgCi1JL2J1aWxkZGlyL2J1aWxkL0JVSUxEL3Rv
b2xzL3Rlc3RzL3hlbnN0b3JlLy4uLy4uLy4uL3Rvb2xzL2luY2x1ZGUgIC1jIAotbyB4cy10ZXN0
Lm8geHMtdGVzdC5jCkJVSUxEU1RERVJSOiB4cy10ZXN0LmM6IEluIGZ1bmN0aW9uICdjYWxsX3Rl
c3QnOgpCVUlMRFNUREVSUjogeHMtdGVzdC5jOjExMTo4OiBlcnJvcjogJ3JldCcgbWF5IGJlIHVz
ZWQgdW5pbml0aWFsaXplZCBpbiAKdGhpcyBmdW5jdGlvbiBbLVdlcnJvcj1tYXliZS11bmluaXRp
YWxpemVkXQpCVUlMRFNUREVSUjogICAgICBpZiAoIHJldCApCkJVSUxEU1RERVJSOiAgICAgICAg
IF4KCi0tIApTdGV2ZW4gSGFpZ2gKCj8gbmV0d2l6QGNyYy5pZC5hdSAgICAgPyBodHRwOi8vd3d3
LmNyYy5pZC5hdQo/ICs2MSAoMykgOTAwMSA2MDkwICAgID8gMDQxMiA5MzUgODk3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
