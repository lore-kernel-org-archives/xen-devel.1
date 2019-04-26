Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E284EC43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB94220693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB94220693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3ub-00083G-Tj; Fri, 26 Apr 2019 16:41:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3ua-000836-Ll
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:20 +0000
X-Inumbo-ID: 1d915710-6842-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1d915710-6842-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 16:41:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519653"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:48 +0100
Message-ID: <20190426164002.22381-2-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 01/15] TestSupport: target_var: Refactor
 to allow for another host case
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
Message-ID: <20190426163948.RZbb7fgSU_dkXEpIKp9v0Vm2DfS5Xm_MkQoMg3XELjc@z>

TWFrZSBhbiBleHBsaWNpdCBsaXN0IG9mIHRoZSBwcmVmaXhlcyBhbmQgYSBsb29wIHRvIHdhbGsg
b3ZlciB0aGVtLgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQu
cG0gfCAxNiArKysrKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIv
T3NzdGVzdC9UZXN0U3VwcG9ydC5wbQppbmRleCBlYzg2N2U0Zi4uZmNiZGUwYTIgMTAwNjQ0Ci0t
LSBhL09zc3Rlc3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpA
QCAtMjQ3MSwxMCArMjQ3MSwxOCBAQCBzdWIgdGFyZ2V0X3Zhcl9wcmVmaXggKCQpIHsKIAogc3Vi
IHRhcmdldF92YXIgKCQkKSB7CiAgICAgbXkgKCRobywkdm4pID0gQF87Ci0gICAgbXkgJHBmeCA9
IHRhcmdldF92YXJfcHJlZml4KCRobyk7Ci0gICAgbXkgJGFsbHRoaW5nID0gZXhpc3RzICRoby0+
e0d1ZXN0fSA/ICJndWVzdCIgOiAiaG9zdCI7Ci0gICAgcmV0dXJuICRyeyAkcGZ4LiAkdm4gfSAv
LwotICAgICAgICAgICAkcnsgImFsbF8ke2FsbHRoaW5nfV8ke3ZufSIgfTsKKyAgICBteSBAcHJl
Zml4ZXM7CisgICAgcHVzaCBAcHJlZml4ZXMsIHRhcmdldF92YXJfcHJlZml4KCRobyk7CisgICAg
aWYgKGV4aXN0cyAkaG8tPntHdWVzdH0pIHsKKwlwdXNoIEBwcmVmaXhlcywgJ2FsbF9ndWVzdF8n
OworICAgIH0gZWxzZSB7CisJcHVzaCBAcHJlZml4ZXMsICdhbGxfaG9zdF8nOworICAgIH0KKyAg
ICBmb3JlYWNoIG15ICRwcmVmaXggKEBwcmVmaXhlcykgeworCW15ICR2ID0gJHJ7ICRwcmVmaXgu
JHZuIH07CisJcmV0dXJuICR2IGlmIGRlZmluZWQgJHY7CisgICAgfQorICAgIHJldHVybiB1bmRl
ZjsKIH0KIAogc3ViIHRhcmdldF9rZXJua2luZF9jaGVjayAoJCkgewotLSAKMi4xMS4wCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
