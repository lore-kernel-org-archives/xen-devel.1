Return-Path: <SRS0=FDQh=L6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A903AC07E96
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 10:29:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6766F608FE
	for <xen-devel@archiver.kernel.org>; Tue,  6 Jul 2021 10:29:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6766F608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.151001.279116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iK8-0005Y9-6T; Tue, 06 Jul 2021 10:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 151001.279116; Tue, 06 Jul 2021 10:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0iK8-0005Y2-1o; Tue, 06 Jul 2021 10:29:04 +0000
Received: by outflank-mailman (input) for mailman id 151001;
 Tue, 06 Jul 2021 10:29:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbbY=L6=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1m0iK6-0005Xw-LF
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 10:29:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id faaf77c9-de44-11eb-8483-12813bfff9fa;
 Tue, 06 Jul 2021 10:29:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A64031FB;
 Tue,  6 Jul 2021 03:29:00 -0700 (PDT)
Received: from e123311-lin.arm.com (unknown [10.57.8.167])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6BB993F5A1;
 Tue,  6 Jul 2021 03:28:59 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: faaf77c9-de44-11eb-8483-12813bfff9fa
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	bertrand.marquis@arm.com,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] arm: Fix arch_initialise_vcpu to be unsupported
Date: Tue,  6 Jul 2021 12:28:53 +0200
Message-Id: <20210706102853.10251-1-michal.orzel@arm.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function arch_initialise_vcpu is not reachable as the
VCPUOP_initialise is an unsupported operation on arm.
Modify the function by adding ASSERT_UNREACHABLE() and
returning -EOPNOTSUPP.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/arm/domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index c021a03c61..a2aa8b77ad 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -923,7 +923,8 @@ int arch_set_info_guest(
 
 int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
-    return default_initialise_vcpu(v, arg);
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
 }
 
 int arch_vcpu_reset(struct vcpu *v)
-- 
2.29.0


