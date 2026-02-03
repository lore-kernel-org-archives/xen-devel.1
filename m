Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD1EE8305D
	for <xen-devel@archiver.kernel.org>; Tue,  3 Feb 2026 09:06:08 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1219161.1528091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnCM8-00057V-9G; Tue, 03 Feb 2026 09:05:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219161.1528091; Tue, 03 Feb 2026 09:05:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnCM8-00057O-62; Tue, 03 Feb 2026 09:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1219161;
 Tue, 03 Feb 2026 09:05:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnCM7-00057I-6h
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 09:05:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 88365f25-00df-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 10:05:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB006339;
 Tue,  3 Feb 2026 01:05:41 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.130])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A53863F632;
 Tue,  3 Feb 2026 01:05:46 -0800 (PST)
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
X-Inumbo-ID: 88365f25-00df-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] MAINTAINERS: Add Jens as arm TEE reviewer
Date: Tue,  3 Feb 2026 10:05:34 +0100
Message-ID: <1f545f1fc56c8e5f898cff688434b6f38fb16ed4.1770109450.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Jens as arm TEE reviewers so that he is informed of changes in FF-A
or OPTEE changes in Xen and can review them.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ceb4bba21cd..ccc25a0e55dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -547,6 +547,7 @@ F:	stubdom/
 TEE MEDIATORS
 M:	Volodymyr Babchuk <volodymyr_babchuk@epam.com>
 M:	Bertrand Marquis <bertrand.marquis@arm.com>
+R:	Jens Wiklander <jens.wiklander@linaro.org>
 S:	Supported
 F:	xen/arch/arm/include/asm/tee/
 F:	xen/arch/arm/tee/
-- 
2.51.2


