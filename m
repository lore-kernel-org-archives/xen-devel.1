Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE47DC282DF
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF2F2186A
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 16:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF2F2186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hH9xK-00021F-7Z; Thu, 18 Apr 2019 16:32:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tvKn=SU=citrix.com=prvs=004dc2360=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hH9xJ-0001zq-FS
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 16:32:09 +0000
X-Inumbo-ID: 822aa6ce-61f7-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 822aa6ce-61f7-11e9-92d7-bc764e045a96;
 Thu, 18 Apr 2019 16:32:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,366,1549929600"; d="scan'208";a="83913772"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 18 Apr 2019 17:31:49 +0100
Message-ID: <20190418163158.11408-13-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
References: <20190418163158.11408-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 12/21] starvation: Permit step_finish to
 set the state `starved'
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
Message-ID: <20190418163149.V9tZk-EQPOPwM0UsTlxQLoT9uK62AzVgOc132rLbmMo@z>

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0pvYkRCL0V4
ZWN1dGl2ZS5wbSBiL09zc3Rlc3QvSm9iREIvRXhlY3V0aXZlLnBtCmluZGV4IDNhNjgwYzlkLi4y
ZTExYzhmMyAxMDA2NDQKLS0tIGEvT3NzdGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0KKysrIGIvT3Nz
dGVzdC9Kb2JEQi9FeGVjdXRpdmUucG0KQEAgLTI4Nyw3ICsyODcsNyBAQCBFTkQKIHN1YiBzdGVw
X2ZpbmlzaCAoJCQpIHsgI21ldGhvZAogICAgIG15ICgkamQsJHRlc3RpZCwkc3RlcHN0YXR1cykg
PSBAXzsKICAgICBkaWUgIiRmbGlnaHQuJGpvYiAkdGVzdGlkICRzdGVwc3RhdHVzIiB1bmxlc3Mg
Z3JlcCB7ICRzdGVwc3RhdHVzIGVxICRfIH0KLQlxdyhwYXNzIGZhaWwgc2tpcCBibG9ja2VkIGJy
b2tlbik7CisJcXcocGFzcyBmYWlsIHNraXAgYmxvY2tlZCBicm9rZW4gc3RhcnZlZCk7CiAgICAg
bXkgJGNoZWNrcSA9ICRkYmhfdGVzdHMtPnByZXBhcmUoPDxFTkQpOwogICAgICAgICBTRUxFQ1Qg
c3RlcG5vLCBzdGF0dXMKICAgICAgICAgICBGUk9NIHN0ZXBzCi0tIAoyLjExLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
