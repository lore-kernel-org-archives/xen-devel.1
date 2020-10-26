Return-Path: <SRS0=Fpha=EB=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E0B6C388F9
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 09:13:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00F8E2076D
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2020 09:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="LNO+6NWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00F8E2076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.12082.31675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWyZH-0004qm-6W; Mon, 26 Oct 2020 09:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12082.31675; Mon, 26 Oct 2020 09:13:31 +0000
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
	id 1kWyZH-0004qd-0L; Mon, 26 Oct 2020 09:13:31 +0000
Received: by outflank-mailman (input) for mailman id 12082;
 Mon, 26 Oct 2020 09:13:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWyZG-0004ev-Dq
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 465e31a0-6598-4ac1-9d0f-563313d478fe;
 Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 77B4CB23B;
 Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l58c=EB=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWyZG-0004ev-Dq
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 09:13:30 +0000
X-Inumbo-ID: 465e31a0-6598-4ac1-9d0f-563313d478fe
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 465e31a0-6598-4ac1-9d0f-563313d478fe;
	Mon, 26 Oct 2020 09:13:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603703599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XbeoD7GvpOh4XVGvOVBLgVXAc4wxwYUa82TSh2+/HXM=;
	b=LNO+6NWhImdPet4PPhCO14zZyZJ1jDYmYTHxHlsEVoSK+QGZDlMXEve6KJroGdheLj5ERn
	WrJ4SJgnuN7YlGZ/hXxTuT/10gRKyxo5QzxYhV1XFXre87ESC0n8Jz61LddgzbFlSuaVVW
	D/gkfdp8syZHWsoqLwvre3IG5Msnsbc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 77B4CB23B;
	Mon, 26 Oct 2020 09:13:19 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH 04/12] xen/sched: sort included headers in cpupool.c
Date: Mon, 26 Oct 2020 10:13:08 +0100
Message-Id: <20201026091316.25680-5-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201026091316.25680-1-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Common style is to include header files in alphabetical order. Sort the
#include statements in cpupool.c accordingly.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/cpupool.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
index 6429c8f7b5..84f326ea63 100644
--- a/xen/common/sched/cpupool.c
+++ b/xen/common/sched/cpupool.c
@@ -11,15 +11,15 @@
  * (C) 2009, Juergen Gross, Fujitsu Technology Solutions
  */
 
-#include <xen/lib.h>
-#include <xen/init.h>
+#include <xen/cpu.h>
 #include <xen/cpumask.h>
+#include <xen/init.h>
+#include <xen/keyhandler.h>
+#include <xen/lib.h>
 #include <xen/param.h>
 #include <xen/percpu.h>
 #include <xen/sched.h>
 #include <xen/warning.h>
-#include <xen/keyhandler.h>
-#include <xen/cpu.h>
 
 #include "private.h"
 
-- 
2.26.2


