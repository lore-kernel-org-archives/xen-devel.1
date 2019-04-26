Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968E2C43219
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E5920693
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 16:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70E5920693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK3ut-0008Hb-D2; Fri, 26 Apr 2019 16:41:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6UZT=S4=citrix.com=prvs=0129f9400=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hK3us-0008G7-9V
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 16:41:38 +0000
X-Inumbo-ID: 28a4586c-6842-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 28a4586c-6842-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 16:41:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,398,1549929600"; d="scan'208";a="84519742"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 26 Apr 2019 17:39:59 +0100
Message-ID: <20190426164002.22381-13-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 12/15] cross builds: mfi-common: Break
 out set_build_hostflags
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
Message-ID: <20190426163959.urIVGC_B9oSA9IG7uDbRflsVhdWw8dnlwRvFIPz0z3Q@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpWZXJpZmllZCB3aXRoIHN0YW5kYWxvbmUtZ2VuZXJhdGUt
ZHVtcC1mbGlnaHQtcnVudmFycy4KClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPgotLS0KIG1maS1jb21tb24gfCA3ICsrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZmkt
Y29tbW9uIGIvbWZpLWNvbW1vbgppbmRleCBmOTExNTZmZS4uZGFkMDNlMzkgMTAwNjQ0Ci0tLSBh
L21maS1jb21tb24KKysrIGIvbWZpLWNvbW1vbgpAQCAtMjE2LDYgKzIxNiwxMSBAQCBjcmVhdGVf
eGVuX2J1aWxkX2pvYiAoKSB7CiAgICAgJGV4dHJhX3J1bnZhcnMKIH0KIAorc2V0X2J1aWxkX2hv
c3RmbGFncyAoKSB7CisgICMgc2V0X2J1aWxkX2hvc3RmbGFncyBIT1NUX0FSQ0gKKyAgYnVpbGRf
aG9zdGZsYWdzPSJzaGFyZS1idWlsZC0kc3VpdGUtJDEsYXJjaC0kMSxzdWl0ZS0kc3VpdGUscHVy
cG9zZS1idWlsZCIKK30KKwogY3JlYXRlX2J1aWxkX2pvYnMgKCkgewogCiAgIGxvY2FsIGFyY2gK
QEAgLTM0Miw3ICszNDcsNyBAQCBjcmVhdGVfYnVpbGRfam9icyAoKSB7CiAgICAgICAgIGFyY2hf
cnVudmFycz1cIlwkQVJDSF9SVU5WQVJTXyRhcmNoXCIKICAgICAiCiAKLSAgICBidWlsZF9ob3N0
ZmxhZ3M9c2hhcmUtYnVpbGQtJHN1aXRlLSRhcmNoLGFyY2gtJGFyY2gsc3VpdGUtJHN1aXRlLHB1
cnBvc2UtYnVpbGQKKyAgICBzZXRfYnVpbGRfaG9zdGZsYWdzICRhcmNoCiAKICAgICBmb3IgZW5h
YmxlX3hzbSBpbiAkKHhzbV92YXJpYW50cyAkYXJjaCkgOyBkbwogICAgICAgaWYgWyB4JGVuYWJs
ZV94c20gPSB4dHJ1ZSBdIDsgdGhlbgotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
