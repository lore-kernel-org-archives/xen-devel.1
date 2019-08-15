Return-Path: <SRS0=ymgJ=WL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04107C3A589
	for <xen-devel@archiver.kernel.org>; Thu, 15 Aug 2019 17:35:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2DB22064A
	for <xen-devel@archiver.kernel.org>; Thu, 15 Aug 2019 17:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2DB22064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyJf3-0007Qu-Gf; Thu, 15 Aug 2019 17:35:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y4W9=WL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hyJf3-0007Qp-0I
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 17:35:41 +0000
X-Inumbo-ID: 18003aca-bf83-11e9-8ba4-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 18003aca-bf83-11e9-8ba4-12813bfff9fa;
 Thu, 15 Aug 2019 17:35:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 300C828;
 Thu, 15 Aug 2019 10:35:37 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D6143F706;
 Thu, 15 Aug 2019 10:35:36 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 18:35:33 +0100
Message-Id: <20190815173533.26310-1-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
Subject: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct domain
 in construct_domain()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Y29uc3RydWN0X2RvbWFpbigpIGNhbiBiZSBjYWxsZWQgYnkgb3RoZXIgZG9tYWluIHRoYW4gZG9t
MC4gVG8gYXZvaWQKY29uZnVzaW9uIGluIHRoZSBsb2csIHByaW50IHRoZSBjb3JyZWN0IGRvbWFp
bi4KClNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Ci0t
LQogeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Rv
bWFpbl9idWlsZC5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCmluZGV4IDMzMTcxMDgx
ZWEuLmNmOWZmYmMzNjAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwor
KysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKQEAgLTE5NzgsNyArMTk3OCw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IGNvbnN0cnVjdF9kb21haW4oc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0
IGtlcm5lbF9pbmZvICpraW5mbykKICAgICAgICAgY3B1ID0gY3B1bWFza19jeWNsZShjcHUsICZj
cHVfb25saW5lX21hcCk7CiAgICAgICAgIGlmICggdmNwdV9jcmVhdGUoZCwgaSwgY3B1KSA9PSBO
VUxMICkKICAgICAgICAgewotICAgICAgICAgICAgcHJpbnRrKCJGYWlsZWQgdG8gYWxsb2NhdGUg
ZG9tMCB2Y3B1ICVkIG9uIHBjcHUgJWRcbiIsIGksIGNwdSk7CisgICAgICAgICAgICBwcmludGso
IkZhaWxlZCB0byBhbGxvY2F0ZSAlcGQgdmNwdSAlZCBvbiBwY3B1ICVkXG4iLCBkLCBpLCBjcHUp
OwogICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgIH0KIAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
