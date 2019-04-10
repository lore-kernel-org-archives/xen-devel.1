Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A78C10F14
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775E420850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 775E420850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAY-0006yk-B8; Wed, 10 Apr 2019 14:25:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEAQ-0006eN-Eo
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:34 +0000
X-Inumbo-ID: 7f86c360-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7f86c360-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:32 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227722"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:48 +0100
Message-ID: <20190410142408.22848-43-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 42/62] preseed_hook_command: allow
 specifying di keys other than preseed/*
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
Message-ID: <20190410142348.5wOSam1JGMQHJ92M7ZwCD6JhO4cfCEyU-AKPkA-y31E@z>

SWUsIG9ubHkgYWRkIHByZXNlZWQvIGlmIHRoZXJlIGlzIG5vdCBhbHJlYWR5IGEgc2xhc2guCgpO
byBmdW5jdGlvbmFsIGNoYW5nZSB3aXRoIGV4aXN0aW5nIGNhbGwgc2l0ZXMgb3RoZXIgdGhhbiB1
cmxzIGFuZAp0ZW1wb3JhcnkgZmlsZW5hbWVzLgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogT3NzdGVzdC9EZWJpYW4ucG0gfCA5ICsr
KysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCmluZGV4
IDc4ZDI0MmU0Li5mOGZmNGY0NiAxMDA2NDQKLS0tIGEvT3NzdGVzdC9EZWJpYW4ucG0KKysrIGIv
T3NzdGVzdC9EZWJpYW4ucG0KQEAgLTE0NzIsOSArMTQ3MiwxMiBAQCBFTkQKIAogc3ViIHByZXNl
ZWRfaG9va19jb21tYW5kICgkJCQkKSB7CiAgICAgbXkgKCRobywgJGRpX2tleSwgJHNmeCwgJHRl
eHQpID0gQF87CisgICAgJGRpX2tleSA9ICJwcmVzZWVkLyRkaV9rZXkiIHVubGVzcyAkZGlfa2V5
ID1+IG17L307CisgICAgbXkgJGJhc2VuYW1lID0gJGRpX2tleTsKKyAgICAkYmFzZW5hbWUgPX4g
c3svfXstLX07CiAgICAgbXkgJGl4PSAkI3sgJHByZXNlZWRfY21kc3skZGlfa2V5fSB9ICsgMTsK
LSAgICBteSAkdXJsPSBjcmVhdGVfd2ViZmlsZSgkaG8sICIkZGlfa2V5LSRpeCRzZngiLCAkdGV4
dCk7Ci0gICAgbXkgJGZpbGU9ICIvdG1wLyRkaV9rZXktJGl4IjsKKyAgICBteSAkdXJsPSBjcmVh
dGVfd2ViZmlsZSgkaG8sICIkYmFzZW5hbWUtJGl4JHNmeCIsICR0ZXh0KTsKKyAgICBteSAkZmls
ZT0gIi90bXAvJGJhc2VuYW1lLSRpeCI7CiAgICAgbXkgJGNtZF9jbWQ9ICIkcHJlc2VlZF93Z2V0
IC1PICRmaWxlICckdXJsJyAmJiBjaG1vZCAreCAkZmlsZSAmJiAkZmlsZSI7CiAgICAgcHVzaCBA
eyAkcHJlc2VlZF9jbWRzeyRkaV9rZXl9IH0sICRjbWRfY21kOwogfQpAQCAtMTUyMSw3ICsxNTI0
LDcgQEAgRU5ECiBzdWIgcHJlc2VlZF9ob29rX2NtZHMgKCkgewogICAgIG15ICRwcmVzZWVkOwog
ICAgIGZvcmVhY2ggbXkgJGRpX2tleSAoa2V5cyAlcHJlc2VlZF9jbWRzKSB7Ci0gICAgICAgICRw
cmVzZWVkIC49ICJkLWkgcHJlc2VlZC8kZGlfa2V5IHN0cmluZyAiLgorICAgICAgICAkcHJlc2Vl
ZCAuPSAiZC1pICRkaV9rZXkgc3RyaW5nICIuCiAgICAgICAgICAgICAoam9pbiAnICYmICcsIEB7
ICRwcmVzZWVkX2NtZHN7JGRpX2tleX0gfSkuICJcbiI7CiAgICAgfQogICAgIHJldHVybiAkcHJl
c2VlZDsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
