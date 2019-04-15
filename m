Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C528AC10F12
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 16:28:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DC6820818
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 16:28:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DC6820818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG4Sz-0007Ua-01; Mon, 15 Apr 2019 16:28:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tbw4=SR=citrix.com=prvs=001b8ac9c=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hG4Sx-0007UR-4n
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 16:28:19 +0000
X-Inumbo-ID: 794e0d33-5f9b-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 794e0d33-5f9b-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 16:28:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,354,1549929600"; d="scan'208";a="83602166"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Apr 2019 17:28:09 +0100
Message-ID: <20190415162809.23675-3-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
References: <20190415162809.23675-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/2] DO NOT APPLY git-checkout.sh: add sleep to
 demonstrate race
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
Message-ID: <20190415162809.aqHUa_G9EkiwvMUTrRjJae7qJmHhjaaPFyBIEroFwwc@z>

VGhpcyBhbGxvd3MgZWFzeSByZXByb2R1Y3Rpb24gb2YgZ2l0LWNoZWNrb3V0IHJhY2VzOiBlYWNo
IGNoZWNrb3V0CndhaXRzIHVudGlsIHlvdSBraWxsIGl0cyBzbGVlcC4gIFlvdSBjYW4gc2VlIHRo
ZSBtdWx0aXBsZSBpZGVudGljYWwKY2hlY2tvdXQgcnVuZXMgaW4gcHMgZXRjLiAgQSBnb29kIHJ1
bmUgaXM6CiAgd2F0Y2ggJ3BzIC1mSHRwdHMvNjAnCihyZXBsYWNpbmcgcHRzLzYwIHdpdGggdGhl
IHB0eSBvZiB5b3VyIGJ1aWxkIGpvYikuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBzY3JpcHRzL2dpdC1jaGVja291dC5zaCB8IDIg
KysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9zY3JpcHRz
L2dpdC1jaGVja291dC5zaCBiL3NjcmlwdHMvZ2l0LWNoZWNrb3V0LnNoCmluZGV4IDIwYWUzMWZm
MjMuLjI5MDAyNmFkMzIgMTAwNzU1Ci0tLSBhL3NjcmlwdHMvZ2l0LWNoZWNrb3V0LnNoCisrKyBi
L3NjcmlwdHMvZ2l0LWNoZWNrb3V0LnNoCkBAIC0xMSw2ICsxMSw4IEBAIERJUj0kMwogCiBzZXQg
LWUKIAorc2xlZXAgMTAwMCB8fDoKKwogaWYgdGVzdCBcISAtZCAkRElSLXJlbW90ZTsgdGhlbgog
CXJtIC1yZiAkRElSLXJlbW90ZSAkRElSLXJlbW90ZS50bXAKIAlta2RpciAtcCAkRElSLXJlbW90
ZS50bXA7IHJtZGlyICRESVItcmVtb3RlLnRtcAotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
