Return-Path: <SRS0=mHc1=DJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE43FC4727D
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559D3206A5
	for <xen-devel@archiver.kernel.org>; Fri,  2 Oct 2020 14:22:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="dxMoJeXe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 559D3206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.2187.6444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOLwy-0007M2-2y; Fri, 02 Oct 2020 14:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2187.6444; Fri, 02 Oct 2020 14:22:20 +0000
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
	id 1kOLwx-0007Lv-Vv; Fri, 02 Oct 2020 14:22:19 +0000
Received: by outflank-mailman (input) for mailman id 2187;
 Fri, 02 Oct 2020 14:22:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kOLww-0007Ll-KW
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:18 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 115fcdda-7f1e-4de6-a0a0-a351702fd735;
 Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07C60B1B5;
 Fri,  2 Oct 2020 14:22:17 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2E3y=DJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kOLww-0007Ll-KW
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 14:22:18 +0000
X-Inumbo-ID: 115fcdda-7f1e-4de6-a0a0-a351702fd735
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 115fcdda-7f1e-4de6-a0a0-a351702fd735;
	Fri, 02 Oct 2020 14:22:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601648537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QVStcnVJjPF4gY7YOMoOTncos7ovJW/Nu+5aH+zrqlg=;
	b=dxMoJeXeQtm5fkVKhE6U4HksCWMlADYRMJjM0ZG93Uxe4cqmFgR2zQE1a2bSpXazxKF+uN
	eEm4XHd0VpwKzMnlHFt0zQa+GvuFLtjzLUW6NHfHYfOLnzk2jk3/2BvM8ZApxKRDS2jy1y
	nq3+WAgAjOovi3yTatXyghgCcUDSSvs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 07C60B1B5;
	Fri,  2 Oct 2020 14:22:17 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] tools/libs/store: don't use symbolic links for external files
Date: Fri,  2 Oct 2020 16:22:14 +0200
Message-Id: <20201002142214.3438-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201002142214.3438-1-jgross@suse.com>
References: <20201002142214.3438-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using symbolic links to include files from xenstored use
the vpath directive and an include path.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/store/Makefile | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 930e763de9..bc89b9cd70 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -21,12 +21,8 @@ CFLAGS += $(CFLAGS_libxentoolcore)
 CFLAGS += -DXEN_LIB_STORED="\"$(XEN_LIB_STORED)\""
 CFLAGS += -DXEN_RUN_STORED="\"$(XEN_RUN_STORED)\""
 
-LINK_FILES = xs_lib.c list.h utils.h
-
-$(LIB_OBJS): $(LINK_FILES)
-
-$(LINK_FILES):
-	ln -sf $(XEN_ROOT)/tools/xenstore/$@ $@
+vpath xs_lib.c $(XEN_ROOT)/tools/xenstore
+CFLAGS += -I $(XEN_ROOT)/tools/xenstore
 
 xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
-- 
2.26.2


