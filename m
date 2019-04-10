Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DE7C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 397BC20850
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 14:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 397BC20850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eu.citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEEAB-0006Br-9A; Wed, 10 Apr 2019 14:25:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xn7x=SM=citrix.com=prvs=996f5bc6d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEEA9-0006BC-Pd
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 14:25:17 +0000
X-Inumbo-ID: 760a4e1e-5b9c-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 760a4e1e-5b9c-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 14:25:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,332,1549929600"; d="scan'208";a="83227665"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 10 Apr 2019 15:23:14 +0100
Message-ID: <20190410142408.22848-9-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [OSSTEST PATCH 08/62] ts-host-install: don't use the
 new nic naming scheme
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
Cc: Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410142314.TLDyeaXuqPnrUC4r12Lh4Byy3y-YA-dGpBEXgAPucBw@z>

RnJvbTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KClNpZ25lZC1vZmYtYnk6IFdlaSBM
aXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CkFja2VkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KLS0tCiB0cy1ob3N0LWluc3RhbGwgfCA0ICsrKysKIDEgZmlsZSBj
aGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90cy1ob3N0LWluc3RhbGwgYi90
cy1ob3N0LWluc3RhbGwKaW5kZXggMjkyNzMzYmEuLjlhYjNkZTYyIDEwMDc1NQotLS0gYS90cy1o
b3N0LWluc3RhbGwKKysrIGIvdHMtaG9zdC1pbnN0YWxsCkBAIC0yNDQsNiArMjQ0LDEwIEBAIEVO
RAogICAgICMgd2h5IHRoaXMgaXMgcmVwZWF0ZWQuCiAgICAgcHVzaCBAaG9jbWRsaW5lLCAiY29u
c29sZT0kY29uc29sZSIgdW5sZXNzICRjb25zb2xlIGVxICJOT05FIjsKIAorICAgICMgRG9uJ3Qg
dXNlICJQcmVkaWN0YWJsZSBOZXR3b3JrIEludGVyZmFjZSBOYW1lcyIKKyAgICAjIGh0dHBzOi8v
d3d3LmZyZWVkZXNrdG9wLm9yZy93aWtpL1NvZnR3YXJlL3N5c3RlbWQvUHJlZGljdGFibGVOZXR3
b3JrSW50ZXJmYWNlTmFtZXMvCisgICAgcHVzaCBAaG9jbWRsaW5lLCAibmV0LmlmbmFtZXM9MCIg
aWYgJGhvLT57U3VpdGV9ID1+IG0vc3RyZXRjaC87CisKICAgICBwdXNoIEBob2NtZGxpbmUsCiAg
ICAgICAgIGdldF9ob3N0X3Byb3BlcnR5KCRobywgImxpbnV4LWJvb3QtYXBwZW5kICRoby0+e1N1
aXRlfSIsICcnKSwKICAgICAgICAgZ2V0X2hvc3RfcHJvcGVydHkoJGhvLCAibGludXgtYm9vdC1h
cHBlbmQgJGhvLT57U3VpdGV9ICRye2FyY2h9IiwgJycpOwotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
