From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH] tools/firmware: update OVMF Makefile
Date: Wed, 28 Nov 2018 17:43:33 +0000
Message-ID: <20181128174333.15672-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fE64=OH=citrix.com=prvs=863b436f6=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gS3sF-0007Sz-2K
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 17:43:43 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T1ZNRiBoYXMgYmVjb21lIGRlcGVuZGVudCBvbiBPcGVuU1NMLCB3aGljaCBpdCBpcyBpbmNsdWRl
ZCBhcyBhIHN1Ym1vZHVsZS4KSW5pdGlhbGlzZSBzdWJtb2R1bGVzIGJlZm9yZSBidWlsZGluZy4K
ClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpUaGlzIHNo
b3VsZCBmaXggdGhlIGJ1aWxkIGJyZWFrYWdlIGZvciBPVk1GIGJyYW5jaCBpbiBPU1NURVNULgoK
Q2M6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgpDYzogSWFuIEph
Y2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogdG9vbHMvZmlybXdhcmUvb3Zt
Zi1tYWtlZmlsZSB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvZmlybXdhcmUvb3ZtZi1tYWtlZmlsZSBiL3Rvb2xzL2Zpcm13YXJlL292bWYt
bWFrZWZpbGUKaW5kZXggMjgzODc0NDQ2MS4uM2RlMmZjMDMwMCAxMDA2NDQKLS0tIGEvdG9vbHMv
ZmlybXdhcmUvb3ZtZi1tYWtlZmlsZQorKysgYi90b29scy9maXJtd2FyZS9vdm1mLW1ha2VmaWxl
CkBAIC0xNiw2ICsxNiw3IEBAIGFsbDogYnVpbGQKIAogLlBIT05ZOiBidWlsZAogYnVpbGQ6CisJ
JChHSVQpIHN1Ym1vZHVsZSB1cGRhdGUgLS1pbml0IC0tcmVjdXJzaXZlCiAJT3ZtZlBrZy9idWls
ZC5zaCAtYSBYNjQgLWIgJChUQVJHRVQpIC1uIDQKIAljcCBCdWlsZC9Pdm1mWDY0LyQoVEFSR0VU
KV9HQ0MqL0ZWL09WTUYuZmQgb3ZtZi5iaW4KIAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
