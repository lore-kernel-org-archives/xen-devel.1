Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9D5606A31B
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:26:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454740.1668248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIszY-0001ou-TG; Mon, 19 Oct 2026 19:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454740.1668248; Mon, 19 Oct 2026 19:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIszY-0001on-P6; Mon, 19 Oct 2026 19:25:52 +0000
Received: by outflank-mailman (input) for mailman id 1454740;
 Mon, 19 Oct 2026 19:25:50 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xIszW-0001o3-Nh
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:25:50 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIszV-004F9Y-Ab
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:25:49 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66eb9-2eae-0a2a0a5409dd-0a2a450cd96a-2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:25:49 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66ebc-f479-0a2a450c0019-4a68bc048040-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:25:49 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69JJPf8f053198
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2026 15:25:47 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69JJPf8Z053197;
 Mon, 19 Oct 2026 12:25:41 -0700 (PDT) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <3ad9849a938fcb8bc08e50216501d4c4e226ab5f.1792436534.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792436534.git.ehem+xen@m5p.com>
References: <cover.1792436534.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@vates.tech>
Date: Mon, 19 Oct 2026 12:02:14 -0700
Subject: [RFC PATCH 4/5] tools/build: use full path when checking out git
 repositories
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-d25034/1792437949-774D7A5B-8E0183C8/0/0
X-purgate-type: clean
X-purgate-size: 1821
X-Archived-By: <archiver.kernel.org>

Date: Fri, 16 Oct 2026 18:23:28 -0700

This makes the invocations of the git-checkout script consistent.  This
makes it easier to understand what is actually occurring.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 tools/Makefile          | 2 +-
 tools/firmware/Makefile | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/Makefile b/tools/Makefile
index 6ecf7c0da82..46847fca998 100644
--- a/tools/Makefile
+++ b/tools/Makefile
@@ -135,7 +135,7 @@ qemu-xen-dir-find:
 		mkdir -p qemu-xen-dir; \
 	else \
 		export GIT=$(GIT); \
-		$(XEN_ROOT)/scripts/git-checkout.sh $(QEMU_UPSTREAM_LOC) $(QEMU_UPSTREAM_REVISION) qemu-xen-dir ; \
+		$(XEN_ROOT)/scripts/git-checkout.sh $(QEMU_UPSTREAM_LOC) $(QEMU_UPSTREAM_REVISION) $(XEN_ROOT)/tools/qemu-xen-dir ; \
 	fi
 
 .PHONY: qemu-xen-dir-force-update
diff --git a/tools/firmware/Makefile b/tools/firmware/Makefile
index d69f7c69eac..a14e7cadd05 100644
--- a/tools/firmware/Makefile
+++ b/tools/firmware/Makefile
@@ -20,11 +20,11 @@ SEABIOSLD ?= $(LD)
 SEABIOS_EXTRAVERSION ?= "-Xen"
 
 ovmf-dir:
-	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh $(OVMF_UPSTREAM_URL) $(OVMF_UPSTREAM_REVISION) ovmf-dir
+	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh $(OVMF_UPSTREAM_URL) $(OVMF_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/ovmf-dir
 	cp ovmf-makefile ovmf-dir/Makefile;
 
 seabios-dir:
-	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh $(SEABIOS_UPSTREAM_URL) $(SEABIOS_UPSTREAM_REVISION) seabios-dir
+	GIT=$(GIT) $(XEN_ROOT)/scripts/git-checkout.sh $(SEABIOS_UPSTREAM_URL) $(SEABIOS_UPSTREAM_REVISION) $(XEN_ROOT)/tools/firmware/seabios-dir
 	cp seabios-config seabios-dir/.config;
 	$(MAKE) -C seabios-dir olddefconfig CC=$(SEABIOSCC) LD=$(SEABIOSLD)
 	rm -f seabios-dir/.version
-- 
2.47.3


