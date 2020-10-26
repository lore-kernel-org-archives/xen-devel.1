Return-Path: <SRS0=Fpha=EB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99840C55178
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 16:22:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 205002074B
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 16:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 205002074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12431.32376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5GI-00063f-9I; Mon, 26 Oct 2020 16:22:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12431.32376; Mon, 26 Oct 2020 16:22:22 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX5GI-00063N-2j; Mon, 26 Oct 2020 16:22:22 +0000
Received: by outflank-mailman (input) for mailman id 12431;
 Mon, 26 Oct 2020 16:22:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kX5GG-00062S-R0
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:22:20 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 66440a05-ce01-4d1f-b9fd-bf81bda01c1e;
 Mon, 26 Oct 2020 16:22:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD4311042;
 Mon, 26 Oct 2020 09:22:19 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com
 [10.1.198.23])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2C2F3F719;
 Mon, 26 Oct 2020 09:22:18 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ht1Y=EB=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kX5GG-00062S-R0
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 16:22:20 +0000
X-Inumbo-ID: 66440a05-ce01-4d1f-b9fd-bf81bda01c1e
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 66440a05-ce01-4d1f-b9fd-bf81bda01c1e;
	Mon, 26 Oct 2020 16:22:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD4311042;
	Mon, 26 Oct 2020 09:22:19 -0700 (PDT)
Received: from e109506-lin.cambridge.arm.com (e109506-lin.cambridge.arm.com [10.1.198.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2C2F3F719;
	Mon, 26 Oct 2020 09:22:18 -0700 (PDT)
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 2/3] xen: Add an unsecure Taint type
Date: Mon, 26 Oct 2020 16:21:32 +0000
Message-Id: <d7e82b374cb7c83d6e18774e23bc4d970c4e8b53.1603728729.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
References: <a6fc6cfd71d6d53cf89bf533a348bda799b25d7d.1603728729.git.bertrand.marquis@arm.com>
In-Reply-To: <cover.1603728729.git.bertrand.marquis@arm.com>
References: <cover.1603728729.git.bertrand.marquis@arm.com>

Define a new Unsecure taint type to be used to signal a system tainted
due to an unsecure configuration or hardware feature/errata.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/kernel.c   | 4 +++-
 xen/include/xen/lib.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index c3a943f077..7a345ae45e 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -326,6 +326,7 @@ unsigned int tainted;
  *  'E' - An error (e.g. a machine check exceptions) has been injected.
  *  'H' - HVM forced emulation prefix is permitted.
  *  'M' - Machine had a machine check experience.
+ *  'U' - Platform is unsecure (usually due to an errata on the platform).
  *
  *      The string is overwritten by the next call to print_taint().
  */
@@ -333,7 +334,8 @@ char *print_tainted(char *str)
 {
     if ( tainted )
     {
-        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c",
+        snprintf(str, TAINT_STRING_MAX_LEN, "Tainted: %c%c%c%c%c",
+                 tainted & TAINT_MACHINE_UNSECURE ? 'U' : ' ',
                  tainted & TAINT_MACHINE_CHECK ? 'M' : ' ',
                  tainted & TAINT_SYNC_CONSOLE ? 'C' : ' ',
                  tainted & TAINT_ERROR_INJECT ? 'E' : ' ',
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 1983bd6b86..a9679c913d 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -193,6 +193,7 @@ uint64_t muldiv64(uint64_t a, uint32_t b, uint32_t c);
 #define TAINT_MACHINE_CHECK             (1u << 1)
 #define TAINT_ERROR_INJECT              (1u << 2)
 #define TAINT_HVM_FEP                   (1u << 3)
+#define TAINT_MACHINE_UNSECURE          (1u << 4)
 extern unsigned int tainted;
 #define TAINT_STRING_MAX_LEN            20
 extern char *print_tainted(char *str);
-- 
2.17.1


