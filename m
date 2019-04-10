Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0375BC10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C938320850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C938320850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEBB-0000B5-RW; Wed, 10 Apr 2019 14:26:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAe-0007DC-86
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:48 +0000
X-Inumbo-ID: 87bed887-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 87bed887-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:46 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227762"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:59 +0100
Message-ID: <20190410142408.22848-54-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 53/62] ts-xen-install: Install
 libpciaccess0
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142359.BeHEnwGy-TShgOoldNFKfSyDnoYrHr7Ex88ER9vGyuY@z>

SW4gInRzLXhlbi1idWlsZC1wcmVwOiBpbnN0YWxsIHBhY2thZ2VzIGZvciBzdWl0ZXMgPmplc3Np
ZSIsCmxpYnBjaWFjY2Vzcy1kZXYgd2FzIGFkZGVkIGZvciB0aGUgYmVuZWZpdCBvZiBxZW11LiAg
bGlidmlydCBuZWVkcyBpdAp0b28uCgpXZSBhbHNvIG5lZWQgdGhlIHJ1bnRpbWUgbGlicmFyeS4g
IFdpdGhvdXQgaXQsIGxpYnZpcnQgZG9lcyBub3Qgc3RhcnQ6CgogIDIwMTktMDQtMDQgMjI6MzU6
MzYuNzYwKzAwMDA6IDM2MjM6IGVycm9yIDogdmlyTW9kdWxlTG9hZEZpbGU6NTMgOiBpbnRlcm5h
bCBlcnJvcjogRmFpbGVkIHRvIGxvYWQgbW9kdWxlICcvdXNyL2xvY2FsL2xpYi9saWJ2aXJ0L2Nv
bm5lY3Rpb24tZHJpdmVyL2xpYnZpcnRfZHJpdmVyX25vZGVkZXYuc28nOiBsaWJwY2lhY2Nlc3Mu
c28uMDogY2Fubm90IG9wZW4gc2hhcmVkIG9iamVjdCBmaWxlOiBObyBzdWNoIGZpbGUgb3IgZGly
ZWN0b3J5CgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4
LmNvbT4KLS0tCiB0cy14ZW4taW5zdGFsbCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdHMteGVuLWluc3RhbGwgYi90
cy14ZW4taW5zdGFsbAppbmRleCAwM2Y4YzAzZS4uOWY3OGE3NWYgMTAwNzU1Ci0tLSBhL3RzLXhl
bi1pbnN0YWxsCisrKyBiL3RzLXhlbi1pbnN0YWxsCkBAIC01Myw3ICs1Myw4IEBAIHN1YiBwYWNr
YWdlcyAoKSB7CiAJCQkgICAgICAgcWVtdS11dGlscwogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIG5ldGNhdC1vcGVuYnNkKSk7CiAgICAgaWYgKCRoby0+e1N1aXRlfSAhfiBtL3NxdWVl
emV8d2hlZXp5fGplc3NpZS8pIHsKLSAgICAgICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhv
LCBxdyhuZXQtdG9vbHMgbGlibmwtcm91dGUtMy0yMDApKTsKKyAgICAgICAgdGFyZ2V0X2luc3Rh
bGxfcGFja2FnZXMoJGhvLCBxdyhuZXQtdG9vbHMgbGlibmwtcm91dGUtMy0yMDAgCisJCQkJCWxp
YnBjaWFjY2VzczApKTsKICAgICB9CiAgICAgaWYgKCRoby0+e1N1aXRlfSA9fiBtL2plc3NpZS8p
IHsKICAgICAgICAgdGFyZ2V0X2luc3RhbGxfcGFja2FnZXMoJGhvLCBxdyhsaWJubC1yb3V0ZS0z
LTIwMCkpOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
