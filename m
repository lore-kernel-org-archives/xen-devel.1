Return-Path: <SRS0=zJBp=LZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB35C11F64
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 227D9613B7
	for <xen-devel@archiver.kernel.org>; Thu,  1 Jul 2021 14:11:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 227D9613B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.148722.274961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPM-00040O-Lz; Thu, 01 Jul 2021 14:11:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148722.274961; Thu, 01 Jul 2021 14:11:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPM-000406-Hy; Thu, 01 Jul 2021 14:11:12 +0000
Received: by outflank-mailman (input) for mailman id 148722;
 Thu, 01 Jul 2021 14:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPL-0005tj-1D
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:11 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3ababa9-cdb4-485b-a491-5eb323d0578c;
 Thu, 01 Jul 2021 14:10:40 +0000 (UTC)
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
X-Inumbo-ID: c3ababa9-cdb4-485b-a491-5eb323d0578c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mqaWfEcjARBVnWLFkl8yloMkvtnZhEKKi1UvpQrE8eE=;
  b=V/QnKzyBSD7idx/X9I+01F7g53WK5ZZqgkGaBOJkxYze6WhJztK+wVT8
   4OAfgRSIt1NgODyl3oS435XuEeY/bSC5FyfE0rd9ORpAUPlvzpHO1UkG4
   FymPQRCVQKJXVLRl3kOTppKQxtmDLC3eXVTAECcYgiC1WANA9TA1TK87T
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QB1JIgJBju7vB+HZgMiwhjOl7rzVaEimuCoCTSoV99oRVVvqXoPWgfEZzlAV0yt9Z/h6VjZ+Xi
 Kg+yqw86il+GmltT/+2CWPXZsFpY+GYXHVxVuSNVDplj1hCAQYJ/iC4+bvuP8OAhXhCxH1rKGS
 t6RM0ZoMFNGYdkxwRKHOEw6pTfxcDzVVNJ2ZRFEjm553cpvVqYRvv7MIAm4O8PJW8K967KPYzv
 D/h/2BlvgGKhRlcNSpw5+d6pM6nqRmrlt+XI4mCRY2Y+SQRTveRw41dd+BlOLBGoaTVWRI7KNj
 atU=
X-SBRS: 5.1
X-MesageID: 47093349
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:GlAQNKqRnYb+k9v+WBdo34saV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47093349"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 15/31] build: move make option changes check earlier
Date: Thu, 1 Jul 2021 15:09:55 +0100
Message-ID: <20210701141011.785641-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

And thus avoiding checking for those variable over and over again.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 22 ++++++++++++++++++++++
 xen/Rules.mk | 22 ----------------------
 2 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index dae0247067ff..06d7bfab3e2c 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -56,6 +56,28 @@ include scripts/Kbuild.include
 ifneq ($(root-make-done),y)
 # section to run before calling Rules.mk, but only once.
 
+ifneq ($(origin crash_debug),undefined)
+$(error "You must use 'make menuconfig' to enable/disable crash_debug now.")
+endif
+ifeq ($(origin debug),command line)
+$(warning "You must use 'make menuconfig' to enable/disable debug now.")
+endif
+ifneq ($(origin frame_pointer),undefined)
+$(error "You must use 'make menuconfig' to enable/disable frame_pointer now.")
+endif
+ifneq ($(origin kexec),undefined)
+$(error "You must use 'make menuconfig' to enable/disable kexec now.")
+endif
+ifneq ($(origin lock_profile),undefined)
+$(error "You must use 'make menuconfig' to enable/disable lock_profile now.")
+endif
+ifneq ($(origin perfc),undefined)
+$(error "You must use 'make menuconfig' to enable/disable perfc now.")
+endif
+ifneq ($(origin verbose),undefined)
+$(error "You must use 'make menuconfig' to enable/disable verbose now.")
+endif
+
 # Beautify output
 # ---------------------------------------------------------------------------
 #
diff --git a/xen/Rules.mk b/xen/Rules.mk
index ede408efc515..894f2b83a04e 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -9,28 +9,6 @@ include $(XEN_ROOT)/Config.mk
 include $(BASEDIR)/scripts/Kbuild.include
 
 
-ifneq ($(origin crash_debug),undefined)
-$(error "You must use 'make menuconfig' to enable/disable crash_debug now.")
-endif
-ifeq ($(origin debug),command line)
-$(warning "You must use 'make menuconfig' to enable/disable debug now.")
-endif
-ifneq ($(origin frame_pointer),undefined)
-$(error "You must use 'make menuconfig' to enable/disable frame_pointer now.")
-endif
-ifneq ($(origin kexec),undefined)
-$(error "You must use 'make menuconfig' to enable/disable kexec now.")
-endif
-ifneq ($(origin lock_profile),undefined)
-$(error "You must use 'make menuconfig' to enable/disable lock_profile now.")
-endif
-ifneq ($(origin perfc),undefined)
-$(error "You must use 'make menuconfig' to enable/disable perfc now.")
-endif
-ifneq ($(origin verbose),undefined)
-$(error "You must use 'make menuconfig' to enable/disable verbose now.")
-endif
-
 TARGET := $(BASEDIR)/xen
 
 # Note that link order matters!
-- 
Anthony PERARD


