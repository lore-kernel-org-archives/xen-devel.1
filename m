Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 891D1C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:54:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F3D220693
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 13:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F3D220693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ice.rwth-aachen.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPIX-0004E5-Ie; Fri, 05 Apr 2019 13:54:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0G5W=SH=ice.rwth-aachen.de=lukas.juenger@srs-us1.protection.inumbo.net>)
 id 1hCPIV-0004Ds-GO
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 13:54:23 +0000
X-Inumbo-ID: 4ef67cab-57aa-11e9-92d7-bc764e045a96
Received: from mail-out-2.itc.rwth-aachen.de (unknown [134.130.5.47])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ef67cab-57aa-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 13:54:20 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2D1AABQXadc/5wagoZlGwEBAQEDAQEBB?=
 =?us-ascii?q?wMBAQGBZYIRghIKtBsBLIoVIjgSAQEDAQEJAQMCbSiGAwFGgT4OBYMigXaxI4o?=
 =?us-ascii?q?zCQGBJoZyhFUXgX+BOII9bIQNBgtzhRQDpXUJgSmSUiCLTokHn0oCAgICCQIVg?=
 =?us-ascii?q?WYhgVYzGggcFIMnghYXjiE+MoEHIYx3ASWBCAGBHwEB?=
X-IPAS-Result: =?us-ascii?q?A2D1AABQXadc/5wagoZlGwEBAQEDAQEBBwMBAQGBZYIRghI?=
 =?us-ascii?q?KtBsBLIoVIjgSAQEDAQEJAQMCbSiGAwFGgT4OBYMigXaxI4ozCQGBJoZyhFUXg?=
 =?us-ascii?q?X+BOII9bIQNBgtzhRQDpXUJgSmSUiCLTokHn0oCAgICCQIVgWYhgVYzGggcFIM?=
 =?us-ascii?q?nghYXjiE+MoEHIYx3ASWBCAGBHwEB?=
X-IronPort-AV: E=Sophos;i="5.60,312,1549926000"; d="scan'208";a="74445000"
Received: from rwthex-w1-a.rwth-ad.de ([134.130.26.156])
 by mail-in-2.itc.rwth-aachen.de with ESMTP; 05 Apr 2019 15:54:18 +0200
Received: from scuti.iss.rwth-aachen.de (137.226.91.86) by
 rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1713.5; Fri, 5 Apr 2019 15:54:16 +0200
From: Lukas Juenger <juenger@ice.rwth-aachen.de>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 5 Apr 2019 15:54:04 +0200
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Originating-IP: [137.226.91.86]
X-ClientProxiedBy: rwthex-s2-a.rwth-ad.de (2a00:8a60:1:e500::26:154) To
 rwthex-w1-a.rwth-ad.de (2a00:8a60:1:e500::26:156)
Message-ID: <abc8ea85-fe26-46b6-af1a-dcaaa877fd7d@rwthex-w1-a.rwth-ad.de>
Subject: [Xen-devel] [PATCH v2] xen/arm: Cap the number of interrupt lines
 for dom0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Lukas Juenger <juenger@ice.rwth-aachen.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190405135404.mqiyZzYqORCNxXIYZt9iNcsLl6ZEwRHGwHRWrB1zVsQ@z>

RG9tMCB2R0lDIHdpbGwgdXNlIHRoZSBzYW1lIG51bWJlciBvZiBpbnRlcnJ1cHQgbGluZXMgYXMg
dGhlIGhhcmR3YXJlIEdJQy4KV2hpbGUgdGhlIGhhcmR3YXJlIEdJQyBjYW4gc3VwcG9ydCB1cCB0
byAxMDIwIGludGVycnVwdCBsaW5lcywKdGhlIHZHSUMgaXMgb25seSBzdXBwb3J0aW5nIHVwIHRv
IDk5MiBpbnRlcnJ1cHQgbGluZXMuClRoaXMgbWVhbnMgdGhhdCBYZW4gd2lsbCBub3QgYmUgYWJs
ZSB0byBib290IG9uIHBsYXRmb3JtcyB3aGVyZSB0aGUgaGFyZHdhcmUKR0lDIHN1cHBvcnRzIG1v
cmUgdGhhbiA5OTIgaW50ZXJydXB0IGxpbmVzLgpXaGlsZSBpdCB3b3VsZCBtYWtlIHNlbnNlIHRv
IGluY3JlYXNlIHRoZSBsaW1pdHMgaW4gdGhlIHZHSUNzLCB0aGlzIGlzIG5vdAp0cml2aWFsIGJl
Y2F1c2Ugb2YgdGhlIGRlc2lnbiBjaG9pY2VzLgpBdCB0aGUgbW9tZW50LCBvbmx5IG1vZGVscyBz
ZWVtIHRvIHJlcG9ydCB0aGUgbWF4aW11bSBvZiBpbnRlcnJ1cHQgbGluZXMuClRoZXkgYWxzbyBk
byBub3QgaGF2ZSBhbnkgaW50ZXJydXB0IHdpcmVkIGFib3ZlIHRoZSA5OTIgbGltaXQuClNvIGl0
IHNob3VsZCBiZSBmaW5lIHRvIGNhcCB0aGUgbnVtYmVyIG9mIGludGVycnVwdCBsaW5lcyBmb3Ig
ZG9tMCB0byA5OTIgbGluZXMuCgpTaWduZWQtb2ZmLWJ5OiBMdWthcyBKdWVuZ2VyIDxqdWVuZ2Vy
QGljZS5yd3RoLWFhY2hlbi5kZT4KCi0tLQpDaGFuZ2VkIHNpbmNlIHYxOgotIEFkYXB0ZWQgY29t
bWl0IG1lc3NhZ2UgYXMgc3VnZ2VzdGVkCi0gQ2hhbmdlZCBjb2RlIGNvbW1lbnQgdG8gcmVmbGVj
dCBjb3JyZWN0IHRlcm1pbm9sb2d5Ci0tLQogeGVuL2FyY2gvYXJtL3NldHVwLmMgfCA4ICsrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwppbmRl
eCA0NDQ4NTdhOTY3Li5jY2IwZjE4MWVhIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vc2V0dXAu
YworKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwpAQCAtODg4LDcgKzg4OCwxMyBAQCB2b2lkIF9f
aW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAogICAgIC8qIENy
ZWF0ZSBpbml0aWFsIGRvbWFpbiAwLiAqLwogICAgIC8qIFRoZSB2R0lDIGZvciBET00wIGlzIGV4
YWN0bHkgZW11bGF0aW5nIHRoZSBoYXJkd2FyZSBHSUMgKi8KICAgICBkb20wX2NmZy5hcmNoLmdp
Y192ZXJzaW9uID0gWEVOX0RPTUNUTF9DT05GSUdfR0lDX05BVElWRTsKLSAgICBkb20wX2NmZy5h
cmNoLm5yX3NwaXMgPSBnaWNfbnVtYmVyX2xpbmVzKCkgLSAzMjsKKyAgICAvKgorICAgICAqIFhl
biB2R0lDIHN1cHBvcnRzIGEgbWF4aW11bSBvZiA5OTIgaW50ZXJydXB0IGxpbmVzLgorICAgICAq
IDMyIGFyZSBzdWJzdHJhY3RlZCB0byBjb3ZlciBsb2NhbCBJUlFzLgorICAgICAqLworICAgIGRv
bTBfY2ZnLmFyY2gubnJfc3BpcyA9IG1pbihnaWNfbnVtYmVyX2xpbmVzKCksICh1bnNpZ25lZCBp
bnQpIDk5MikgLSAzMjsKKyAgICBpZiAoIGdpY19udW1iZXJfbGluZXMoKSA+IDk5MiApCisgICAg
ICAgIHByaW50ayhYRU5MT0dfV0FSTklORyAiTWF4aW11bSBudW1iZXIgb2YgdkdJQyBJUlFzIGV4
Y2VlZGVkLlxuIik7CiAgICAgZG9tMF9jZmcubWF4X3ZjcHVzID0gZG9tMF9tYXhfdmNwdXMoKTsK
IAogICAgIGRvbTAgPSBkb21haW5fY3JlYXRlKDAsICZkb20wX2NmZywgdHJ1ZSk7Ci0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
