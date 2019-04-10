Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5A1C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B6020850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B6020850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAN-0006Ws-6A; Wed, 10 Apr 2019 14:25:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAK-0006R4-7v
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:28 +0000
X-Inumbo-ID: 7c79b4da-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7c79b4da-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:27 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227699"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:35 +0100
Message-ID: <20190410142408.22848-30-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 29/62] ts-host-install: Put canary in
 70-persistent-net.rules
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
Message-ID: <20190410142335.s46hyPe6u3UwJxr-JeK0t9oqVynE-72LkIglIrgdqV8@z>

VGhpcyB3aWxsIGFsbG93IHVzIHRvIHNlZSBpZiB0aGUgaW5pdHJhbWZzJ3MgbmV0d29yayBuYW1l
cyBhcmUgYmVpbmcKcHJvcGVybHkgY29waWVkIHRvIHRoZSBpbnN0YWxsZWQgc3lzdGVtLiAgSWUs
IHRoaXMgaXMganVzdCBhIGRlYnVnZ2luZwphaWQuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWluc3RhbGwgfCA0ICsr
KysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy1ob3N0
LWluc3RhbGwgYi90cy1ob3N0LWluc3RhbGwKaW5kZXggNzQyM2ViOWIuLmVhMDg3YTI1IDEwMDc1
NQotLS0gYS90cy1ob3N0LWluc3RhbGwKKysrIGIvdHMtaG9zdC1pbnN0YWxsCkBAIC0yMTgsNiAr
MjE4LDEwIEBAIFNVQlNZU1RFTT09Im5ldCIsIEFDVElPTj09ImFkZCIsIERSSVZFUlM9PSI/KiIs
IEFUVFJ7YWRkcmVzc309PSIkaG8tPntFdGhlcn0iLCBBCiBFTkQKICAgICB9CiAKKyAgICBvcGVu
IENBTkFSWSwgJz4+JywgIiRwZXJzaXN0ZW50X25ldF9ydWxlcyIgb3IgZGllICQhOworICAgIHBy
aW50IENBTkFSWSAiXG4jIC0gY2FuYXJ5IC0gY2FtZSB2aWEgaW5pdHJhbWZzXG4iIG9yIGRpZSAk
ITsKKyAgICBjbG9zZSBDQU5BUlkgb3IgZGllICQhOworCiAgICAgbXkgJXhvcHRzOwogCiAgICAg
ZGlfc3BlY2lhbF9rZXJuZWwoJGhvLCBzdWIgewotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
