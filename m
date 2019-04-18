Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A382C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 044D92183F
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 044D92183F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xQ-0002A8-HF; Thu, 18 Apr 2019 16:32:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xO-00026E-42
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:14 +0000
X-Inumbo-ID: 850054c1-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 850054c1-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:13 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913794"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:47 +0100
Message-ID: <20190418163158.11408-11-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 10/21] TestSupport: Make "broken" print
 the actual job state
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190418163147.JjHZvID_JL7lWOrC3bmijBoQYRXfbBhw8027Gor8W7k@z>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UgZXhjZXB0IHRvIGEgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6
IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBldS5jaXRyaXguY29tPgotLS0KIE9zc3Rlc3QvVGVz
dFN1cHBvcnQucG0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtIGIvT3NzdGVzdC9U
ZXN0U3VwcG9ydC5wbQppbmRleCAzOGMxN2Q2MC4uZTIxOGZmMzUgMTAwNjQ0Ci0tLSBhL09zc3Rl
c3QvVGVzdFN1cHBvcnQucG0KKysrIGIvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQpAQCAtMjQyLDcg
KzI0Miw3IEBAIHN1YiBicm9rZW4gKCQ7JCkgewogICAgICAgICAgICAgICAgQU5EIChzdGF0dXM9
J3F1ZXVlZCcgT1Igc3RhdHVzPSdydW5uaW5nJyBPUiBzdGF0dXM9J3ByZXBhcmluZycpCiBFTkQK
ICAgICB9KTsKLSAgICBkaWUgIkJST0tFTjogJG07ICIuICgkYWZmZWN0ZWQ+MCA/ICJtYXJrZWQg
JGZsaWdodC4kam9iICRuZXdzdCIKKyAgICBkaWUgdWMoJG5ld3N0KS4iOiAkbTsgIi4gKCRhZmZl
Y3RlZD4wID8gIm1hcmtlZCAkZmxpZ2h0LiRqb2IgJG5ld3N0IgogICAgICAgICAgICAgICAgICAg
ICAgICAgIDogIigkZmxpZ2h0LiRqb2Igbm90IG1hcmtlZCAkbmV3c3QpIik7CiB9CiAKLS0gCjIu
MTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
