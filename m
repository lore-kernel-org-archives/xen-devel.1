Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5C606A322
	for <xen-devel@archiver.kernel.org>; Mon, 19 Oct 2026 19:23:31 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1454719.1668219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsx9-0000Ig-0t; Mon, 19 Oct 2026 19:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1454719.1668219; Mon, 19 Oct 2026 19:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xIsx8-0000IJ-UT; Mon, 19 Oct 2026 19:23:22 +0000
Received: by outflank-mailman (input) for mailman id 1454719;
 Mon, 19 Oct 2026 19:23:22 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ehem@m5p.com>) id 1xIsx8-0000I6-9U
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 19:23:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xIsx7-00FKHE-Md
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2026 21:23:21 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66e27-2eae-0a2a0a5409dd-0a2a4507a7cc-2
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:23:21 +0200
Received: from [74.104.188.4] (helo=mailhost.m5p.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <ehem@m5p.com>)
 id 6ad66e28-b4ea-0a2a45070019-4a68bc04724d-3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2026 21:23:21 +0200
Received: from m5p.com (mailhost.m5p.com [IPv6:fdc4:6ee8:648f:6bf6:0:0:0:f7])
 by mailhost.m5p.com (8.18.1/8.17.1) with ESMTPS id 69JJN6nc053166
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 19 Oct 2026 15:23:11 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.18.1/8.15.2/Submit) id 69JJN65n053165;
 Mon, 19 Oct 2026 12:23:06 -0700 (PDT) (envelope-from ehem)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Message-ID: <0b38e7ba64831575c2f2533c69e00da79c4bc958.1792436534.git.ehem+xen@m5p.com>
In-Reply-To: <cover.1792436534.git.ehem+xen@m5p.com>
References: <cover.1792436534.git.ehem+xen@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
        Anthony PERARD <anthony.perard@vates.tech>,
        Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
        Julien Grall <julien@xen.org>,
        "Roger Pau Monné" <roger@xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 19 Oct 2026 12:02:14 -0700
Subject: [PATCH 1/5] make: add use of $(realpath ) in top and main Rules.mk
 files
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-purgate-ID: tlsNG-ef75cf/1792437801-36AD8AE4-721AD8BA/0/0
X-purgate-type: clean
X-purgate-size: 1027
X-Archived-By: <archiver.kernel.org>

Date: Sat, 17 Oct 2026 12:25:36 -0700

Without this "/.." tend to accumulate in $(XEN_ROOT) and eventually
things start breaking.  Address this before something subtlely breaks.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>
---
 Makefile       | 2 +-
 tools/Rules.mk | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ea432e21b02..f063ce56819 100644
--- a/Makefile
+++ b/Makefile
@@ -15,7 +15,7 @@ TARGS_BUILD=$(patsubst %, build-%, $(SUBSYSTEMS))
 TARGS_CLEAN=$(patsubst %, clean-%, $(SUBSYSTEMS))
 TARGS_DISTCLEAN=$(patsubst %, distclean-%, $(SUBSYSTEMS))
 
-export XEN_ROOT=$(CURDIR)
+export XEN_ROOT:=$(realpath $(CURDIR))
 include Config.mk
 
 .PHONY: mini-os-dir
diff --git a/tools/Rules.mk b/tools/Rules.mk
index d9b9c740e96..97fb3e9bc09 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -1,5 +1,7 @@
 #  -*- mode: Makefile; -*-
 
+override XEN_ROOT:=$(realpath $(XEN_ROOT))
+
 # `all' is the default target
 all:
 
-- 
2.47.3


