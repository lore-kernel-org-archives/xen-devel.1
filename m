Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69176C43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A921C2088F
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A921C2088F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgeO-0002oI-TQ; Thu, 25 Apr 2019 15:51:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JXZu=S3=citrix.com=prvs=011b70836=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hJgeO-0002o6-4d
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:51:04 +0000
X-Inumbo-ID: ed15375c-6771-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ed15375c-6771-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 15:51:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84415673"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 25 Apr 2019 16:50:50 +0100
Message-ID: <20190425155056.23145-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH v2 0/6] stretch fallout: run 32-bit
 builds on 64-bit Linux
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
Message-ID: <20190425155050.3_6BfvphGVr0V0Hfm3tv85IDQfepycfWnMa2exlHYcQ@z>

TXkgcHJldmlvdXMgYXR0ZW1wdCBmYWlsZWQgYmVjYXVzZSBtYW55IGJ1aWxkIHN5c3RlbXMgbG9v
ayBhdCB1bmFtZQphbmQgZW5kIHVwIGNvbmZ1c2VkIGFib3V0IHRoZSBhcmNoaXRlY3R1cmUuICBJ
biB0aGlzIHYyIG9mIHRoZSBzZXJpZXMsCkkgdGFrZSBjb3VudGVybWVhc3VyZXMuCgpJYW4gSmFj
a3NvbiAoNik6CiAgdHMtc3lzbG9nLXNlcnZlcjogLS1uby1zdGRpbiBvcHRpb24KICBzZy1ydW4t
am9iLCB0cy1ob3N0LWluc3RhbGw6IE5ldyAtLWJ1aWxkIG9wdGlvbgogIG1nLXJlcHJvLXNldHVw
OiBGaXggcnVudmFyIGFkanVzdG1lbnQgc2hlbGwgc3ludGF4CiAgRGViaWFuOiBwcmVmZXJyZWQg
YXJjaDogSG9ub3VyIExpbnV4S2VyblByZWZlcnJlZEFyY2hJbmZvCiAgRGViaWFuOiBwcmVmZXJy
ZWQgYXJjaDogQXBwbHkgc2V0YXJjaCB0byBzc2hkCiAgYnVpbGRzOiBSdW4gaTM4NiBidWlsZHMg
b24gYW1kNjQga2VybmVscwoKIE9zc3Rlc3QvRGViaWFuLnBtIHwgNDcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIG1nLXJlcHJvLXNldHVwICAgIHwgIDIg
Ky0KIHNnLXJ1bi1qb2IgICAgICAgIHwgIDIgKy0KIHRzLWhvc3QtaW5zdGFsbCAgIHwgIDkgKysr
KysrKysrCiB0cy1zeXNsb2ctc2VydmVyICB8IDEwICsrKysrKysrKy0KIDUgZmlsZXMgY2hhbmdl
ZCwgNjcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
