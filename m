Return-Path: <SRS0=2EqH=MG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023D2C07E9A
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 16:24:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D5761378
	for <xen-devel@archiver.kernel.org>; Wed, 14 Jul 2021 16:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5D5761378
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.156109.288054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hfl-0006ps-Pm; Wed, 14 Jul 2021 16:23:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156109.288054; Wed, 14 Jul 2021 16:23:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3hfl-0006pl-MA; Wed, 14 Jul 2021 16:23:45 +0000
Received: by outflank-mailman (input) for mailman id 156109;
 Wed, 14 Jul 2021 16:23:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z5uq=MG=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1m3hfk-0006pd-8Y
 for xen-devel@lists.xenproject.org; Wed, 14 Jul 2021 16:23:44 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f3de6a9d-c5bd-4392-824d-31e780256793;
 Wed, 14 Jul 2021 16:23:43 +0000 (UTC)
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
X-Inumbo-ID: f3de6a9d-c5bd-4392-824d-31e780256793
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1626279822;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+oIamF65xOJYpqm9F/0U7SPwc0rb7tTmwQOWYZ4yTRk=;
  b=ZlaM9TYWNr0pu68A2KapMVLrZBM/TVRy4rhvv9TTYJrZ3y0o+RUwIpBP
   iOXcANF3T4u1ipCd8nsaB4QNAxzEfbYxdQEEV6PkPhemcBQXc+NPByP4W
   yMRzAwUwe0+p0pJC1+6oA1kggX+A7Ct3YiPpjNWFGbYri4bbIsHfc73lm
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: nzDWEIqEia5qkWyJaarIh+nToFrTzhY5WJHPYOawEI5b8udIxJ/IVYjmpnzLxStjoQ80UYv98S
 UlgJKh3EKCqTSktwOaoMFUb4C40uxoDBmIHI+PsQ/4mI3IXe9TTslLDiMREgw3xEXj6gCe21dJ
 4wzyg2mGZyILosnQaZtb77myRNibyZNfpoIvU03WZ54uLnfQSyBP6dPKsoi89hBqkUmc7ynhoY
 5XUY1sK9IArkDSDc4GseAbaS+y3hiVnUgxVX7uhrUJFc+uROQ+pQ2PFhrg4SovdNWI02NBtwse
 Wz0=
X-SBRS: 5.1
X-MesageID: 48656805
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:I4PKu6uVbR7gxmjEVuyCXE507skDetV00zEX/kB9WHVpmszxra
 6TdZMgpHvJYVcqKRcdcL+7WJVoLUmxyXcX2/h1AV7BZniEhILAFugLhuGO/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.84,239,1620705600"; 
   d="scan'208";a="48656805"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH] xen: allow XSM_FLASK_POLICY only if checkpolicy binary is available
Date: Wed, 14 Jul 2021 17:17:34 +0100
Message-ID: <20210714161734.256246-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will help prevent the CI loop from having build failures when
`checkpolicy` isn't available, when doing "randconfig" jobs.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 Config.mk          | 6 ------
 xen/Makefile       | 2 ++
 xen/common/Kconfig | 7 +++++--
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/Config.mk b/Config.mk
index d08fa8d60dd7..97d3633706b3 100644
--- a/Config.mk
+++ b/Config.mk
@@ -137,12 +137,6 @@ export XEN_HAS_BUILD_ID=y
 build_id_linker := --build-id=sha1
 endif
 
-ifndef XEN_HAS_CHECKPOLICY
-    CHECKPOLICY ?= checkpolicy
-    XEN_HAS_CHECKPOLICY := $(shell $(CHECKPOLICY) -h 2>&1 | grep -q xen && echo y || echo n)
-    export XEN_HAS_CHECKPOLICY
-endif
-
 define buildmakevars2shellvars
     export PREFIX="$(prefix)";                                            \
     export XEN_SCRIPT_DIR="$(XEN_SCRIPT_DIR)";                            \
diff --git a/xen/Makefile b/xen/Makefile
index 8023680ffbf2..a60e49903d0c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -17,6 +17,8 @@ export XEN_BUILD_HOST	?= $(shell hostname)
 PYTHON_INTERPRETER	:= $(word 1,$(shell which python3 python python2 2>/dev/null) python)
 export PYTHON		?= $(PYTHON_INTERPRETER)
 
+export CHECKPOLICY	?= checkpolicy
+
 export BASEDIR := $(CURDIR)
 export XEN_ROOT := $(BASEDIR)/..
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11af3..13537e460b8f 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -25,6 +25,9 @@ config GRANT_TABLE
 config HAS_ALTERNATIVE
 	bool
 
+config HAS_CHECKPOLICY
+	def_bool $(success,$(CHECKPOLICY) -h 2>&1 | grep -q xen)
+
 config HAS_COMPAT
 	bool
 
@@ -235,8 +238,8 @@ config XSM_FLASK_AVC_STATS
 
 config XSM_FLASK_POLICY
 	bool "Compile Xen with a built-in FLASK security policy"
-	default y if "$(XEN_HAS_CHECKPOLICY)" = "y"
-	depends on XSM_FLASK
+	default y
+	depends on XSM_FLASK && HAS_CHECKPOLICY
 	---help---
 	  This includes a default XSM policy in the hypervisor so that the
 	  bootloader does not need to load a policy to get sane behavior from an
-- 
Anthony PERARD


