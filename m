Return-Path: <SRS0=55t9=TN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12B14C04AA7
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 10:24:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57D4208CA
	for <xen-devel@archiver.kernel.org>; Mon, 13 May 2019 10:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crc.id.au header.i=@crc.id.au header.b="D2PL2xWG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D57D4208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=crc.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQ88K-0003ZD-DI; Mon, 13 May 2019 10:24:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ErgS=TN=crc.id.au=netwiz@srs-us1.protection.inumbo.net>)
 id 1hQ88I-0003Z7-R4
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 10:24:35 +0000
X-Inumbo-ID: 4b93d407-7569-11e9-8980-bc764e045a96
Received: from mail.crc.id.au (unknown [2407:e400:b000:200::25])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4b93d407-7569-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 10:24:33 +0000 (UTC)
Received: from wopr.lan.crc.id.au (unknown
 [IPv6:2407:e400:b000:200:3531:a6bb:df13:221])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.crc.id.au (Postfix) with ESMTPSA id D0EFF2021D
 for <xen-devel@lists.xenproject.org>; Mon, 13 May 2019 20:24:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=crc.id.au; s=default;
 t=1557743069; bh=pzcnETj6NW7SMFigod1K4beSlPJQOtyuhP7TlUdWKSA=;
 h=Date:From:Subject:To;
 b=D2PL2xWGSYsqGRElbdKljn/DkVFHq7awHVg+p7a9bgmzOHQdeX02pOVAKPpIg3djN
 u3jdiClAHTbfF2K1WeGUd7xoLbkfXlKNNtf9tPZUF/3BT/xHByXZlVlziRziOsFp8m
 N6VBlc01jG/YnZ4t+DI6Ulb2eVYtyY3n8Sc0L9S4=
Date: Mon, 13 May 2019 20:24:28 +1000
From: Steven Haigh <netwiz@crc.id.au>
To: xen-devel@lists.xenproject.org
Message-Id: <1557743068.2372.0@crc.id.au>
X-Mailer: geary/3.32.1
MIME-Version: 1.0
Subject: [Xen-devel] pygrub not starting first menuentry in Fedora 30
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190513102428.l9SCidSpwTyepIEOo1IifsDpVKq1er4mTLBcAHEx7cY@z>

VGhlcmUgc2VlbXMgdG8gYmUgc29tZSBjaGFuZ2VzIGluIEZlZG9yYSAzMCB0aGF0IGNhdXNlIHRo
ZSBzZWNvbmQgYm9vdCAKZW50cnkgaW4gZ3J1Yi5jZmcgdG8gYmUgYm9vdGVkIGluc3RlYWQgb2Yg
dGhlIGZpcnN0LgoKVGhpcyBtZWFucyB0aGF0IEZlZG9yYSAzMCBzeXN0ZW1zIGVpdGhlciBhbHdh
eXMgYm9vdCBpbnRvIGFuIG9sZGVyIAprZXJuZWwsIG9yIGluIHRoZSBjYXNlIG9mIHN5c3RlbXMg
d2l0aCBvbmx5IG9uZSBrZXJuZWwgaW5zdGFsbGVkLCB0aGUgCnJlc2N1ZSBpbWFnZS4KClRoZXJl
IGFsc28gc2VlbXMgdG8gYmUgc29tZSBuZXcgaXNzdWVzIHdpdGggdGhlIG1vdmUgdG8gQkxTQ0ZH
IC0gCmhvd2V2ZXIgaXQgc2VlbXMgYSBuZXcgcmVxdWlyZW1lbnQgaXMgdG8gaGF2ZSAKR1JVQl9F
TkFCTEVfQkxTQ0ZHPSJmYWxzZSIgaW4gL2V0Yy9kZWZhdWx0L2dydWIuIFRoaXMgY2F1c2VzIApn
cnViMi1ta2NvbmZpZyB0byB3b3JrIGNvcnJlY3RseSBhbmQgc3BpdCBvdXQgYSBncnViLmNmZyBm
aWxlIHRoYXQgCnB5Z3J1YiBjYW4gdGhlbiB1c2UuCgpJcyB0aGlzIGEgYnVnIGluIHB5Z3J1Yiwg
b3IgYSBwcm9ibGVtIHdpdGggaG93IEZlZG9yYSAzMCBnZW5lcmF0ZXMgYSAKZ3J1Yi5jZmc/CgpJ
IHRyaWVkIHRvIHBpY2sgdGhyb3VnaCBweWdydWIgLSBidXQgY291bGRuJ3QgcXVpdGUgZm9sbG93
IHRoZSBweXRob24gCmxvZ2ljIHRvIHNlZSB3aGVyZSB0aGUgZGVmYXVsdCBib290IG9wdGlvbiBp
cyBzZWxlY3RlZC4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
