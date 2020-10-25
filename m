Return-Path: <SRS0=opzi=EA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED7FC388F7
	for <xen-devel@archiver.kernel.org>; Sun, 25 Oct 2020 10:12:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E36642075B
	for <xen-devel@archiver.kernel.org>; Sun, 25 Oct 2020 10:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="RMRWxFYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E36642075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.11804.31175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kWd0h-0004I4-0E; Sun, 25 Oct 2020 10:12:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11804.31175; Sun, 25 Oct 2020 10:12:22 +0000
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
	id 1kWd0g-0004Hx-SX; Sun, 25 Oct 2020 10:12:22 +0000
Received: by outflank-mailman (input) for mailman id 11804;
 Sun, 25 Oct 2020 10:12:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kWd0f-0004Hr-KB
 for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 10:12:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93c5f21b-db38-4d7d-9f4f-3b91664639d7;
 Sun, 25 Oct 2020 10:12:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 257C9B917;
 Sun, 25 Oct 2020 10:12:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=hByA=EA=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kWd0f-0004Hr-KB
	for xen-devel@lists.xenproject.org; Sun, 25 Oct 2020 10:12:21 +0000
X-Inumbo-ID: 93c5f21b-db38-4d7d-9f4f-3b91664639d7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 93c5f21b-db38-4d7d-9f4f-3b91664639d7;
	Sun, 25 Oct 2020 10:12:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603620740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IvOcZw1DeMnPaGyM6RGdEv/N6xQF81rZ8GfMXEFkmCk=;
	b=RMRWxFYhe2KakQribLWQ9hVXdmKZT+CYXWfMLsgGuneSZH0VABpZHvtkCDgWatTn0SzvzY
	AiftEXnkyQGGhsvlsN514ZOtKWvInAz0xhZezsdN5smEaXzYWXBe+6JigI4zYvfdSPQlx4
	Mr+YWF4l7J3Ip+xFGqZdFwhTWgv9yRY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 257C9B917;
	Sun, 25 Oct 2020 10:12:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH] tools/libs/light: fix race in Makefile
Date: Sun, 25 Oct 2020 11:12:18 +0100
Message-Id: <20201025101218.20478-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header $(INCLUDE)/_lixl_list.h matches two different rules, which
can result in build breakage. Fix that.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/light/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 3424fdb61b..370537ed38 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -203,9 +203,9 @@ _libxl.api-for-check: $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
 		>$@.new
 	mv -f $@.new $@
 
-$(XEN_INCLUDE)/_libxl_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
-	$(PERL) $^ --prefix=libxl >$(notdir $@).new
-	$(call move-if-changed,$(notdir $@).new,$@)
+_libxl_list.h: $(XEN_INCLUDE)/xen-external/bsd-sys-queue-h-seddery $(XEN_INCLUDE)/xen-external/bsd-sys-queue.h
+	$(PERL) $^ --prefix=libxl >$@.new
+	$(call move-if-changed,$@.new,$@)
 
 _libxl_save_msgs_helper.c _libxl_save_msgs_callout.c \
 _libxl_save_msgs_helper.h _libxl_save_msgs_callout.h: \
-- 
2.26.2


