Return-Path: <SRS0=D8k1=HP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 669F6C433DB
	for <xen-devel@archiver.kernel.org>; Sat, 13 Feb 2021 14:49:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF32964E35
	for <xen-devel@archiver.kernel.org>; Sat, 13 Feb 2021 14:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF32964E35
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=daemonizer.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.84622.158713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAwEI-0000nN-5Y; Sat, 13 Feb 2021 14:49:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84622.158713; Sat, 13 Feb 2021 14:49:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAwEI-0000nG-22; Sat, 13 Feb 2021 14:49:02 +0000
Received: by outflank-mailman (input) for mailman id 84622;
 Sat, 13 Feb 2021 14:49:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uKQL=HP=daemonizer.de=maxi@srs-us1.protection.inumbo.net>)
 id 1lAwEG-0000mz-Tx
 for xen-devel@lists.xenproject.org; Sat, 13 Feb 2021 14:49:00 +0000
Received: from mx1.somlen.de (unknown [2a00:1828:a019::100:0])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86049f9a-5c79-4b4c-ae22-852cd601aefe;
 Sat, 13 Feb 2021 14:48:59 +0000 (UTC)
Received: by mx1.somlen.de with ESMTPSA id 3E6C9C3AF0D;
 Sat, 13 Feb 2021 15:48:58 +0100 (CET)
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
X-Inumbo-ID: 86049f9a-5c79-4b4c-ae22-852cd601aefe
From: Maximilian Engelhardt <maxi@daemonizer.de>
To: xen-devel@lists.xenproject.org
Cc: Maximilian Engelhardt <maxi@daemonizer.de>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: [XEN PATCH v1 1/1] docs: set date to SOURCE_DATE_EPOCH if available
Date: Sat, 13 Feb 2021 15:48:25 +0100
Message-Id: <b607a676b98320977a6c592079569a3c01e46781.1613227389.git.maxi@daemonizer.de>
In-Reply-To: <cover.1613227389.git.maxi@daemonizer.de>
References: <cover.1613227389.git.maxi@daemonizer.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the solution described in [1] to replace the call to the 'date'
command with a version that uses SOURCE_DATE_EPOCH if available. This
is needed for reproducible builds.

[1] https://reproducible-builds.org/docs/source-date-epoch/

Signed-off-by: Maximilian Engelhardt <maxi@daemonizer.de>
---
 docs/Makefile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/docs/Makefile b/docs/Makefile
index 8de1efb6f5..ac6792ff7c 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -3,7 +3,13 @@ include $(XEN_ROOT)/Config.mk
 -include $(XEN_ROOT)/config/Docs.mk
 
 VERSION		:= $(shell $(MAKE) -C $(XEN_ROOT)/xen --no-print-directory xenversion)
-DATE		:= $(shell date +%Y-%m-%d)
+
+DATE_FMT	:= +%Y-%m-%d
+ifdef SOURCE_DATE_EPOCH
+DATE		:= $(shell date -u -d "@$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u -r "$(SOURCE_DATE_EPOCH)" "$(DATE_FMT)" 2>/dev/null || date -u "$(DATE_FMT)")
+else
+DATE		:= $(shell date "$(DATE_FMT)")
+endif
 
 DOC_ARCHES      := arm x86_32 x86_64
 MAN_SECTIONS    := 1 5 7 8
-- 
2.20.1


