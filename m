Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95964C43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 17:00:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66EBC206C3
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 17:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66EBC206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMbXc-00081o-SZ; Fri, 03 May 2019 17:00:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lZ0l=TD=citrix.com=prvs=019b86d19=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hMbXb-00080y-0X
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 17:00:07 +0000
X-Inumbo-ID: e67ad4ac-6dc4-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e67ad4ac-6dc4-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 17:00:06 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="85085334"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 3 May 2019 17:59:50 +0100
Message-ID: <20190503165957.5960-5-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
References: <20190503165957.5960-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 04/11] mg-repro-setup: Improve a doc
 message slightly
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
Message-ID: <20190503165950.7esOxT2o37V0MPca1RO248hREyjPv4uaGnkLebdsJMM@z>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogbWctcmVwcm8tc2V0dXAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tZy1yZXByby1zZXR1cCBiL21nLXJlcHJvLXNl
dHVwCmluZGV4IDZlZDRkODVlLi5jOGJjYWQzMyAxMDA3NTUKLS0tIGEvbWctcmVwcm8tc2V0dXAK
KysrIGIvbWctcmVwcm8tc2V0dXAKQEAgLTMzLDcgKzMzLDcgQEAgdXNhZ2UgKCkgeyBjYXQgPDxF
TkQKICAgIChkZWZhdWx0IDxpZGVudD4gaXMgXGBob3N0JykKIAogIE9QVElPTnMKLSAgIC10PGR1
cmF0aW9uPiAgICAgICAgIGVzdGltYXRlZCBkdXJhdGlvbiAoZGVmYXVsdCA9IDI4ZCkKKyAgIC10
PGR1cmF0aW9uPiAgICAgICAgIGVzdGltYXRlZCBvdmVyYWxsIGFsbG9jYXRpb24gbGlmZXRpbWUg
KGRlZmF1bHQgPSAyOGQpCiAgICAtLXJvZ3VlICAgICAgICAgICAgICBieXBhc3MgcXVldWluZyBz
eXN0ZW0gYW5kIGFsbG9jYXRlIG5vdwogICAgLS1jYXB0dXJlICAgICAgICAgICAgZG8gbm90IHN1
cHByZXNzIGxvZyBjYXB0dXJlCiAgICAtcjx2YXI+PTx2YWx1ZT4gICAgICBzZXQgcnVudmFyCi0t
IAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
