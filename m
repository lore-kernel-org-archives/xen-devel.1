Return-Path: <SRS0=VIWx=JT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBF06C433B4
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:54:11 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DFEC61426
	for <xen-devel@archiver.kernel.org>; Thu, 22 Apr 2021 14:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DFEC61426
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.115535.220463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaiO-0005eh-JE; Thu, 22 Apr 2021 14:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115535.220463; Thu, 22 Apr 2021 14:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZaiO-0005ea-G8; Thu, 22 Apr 2021 14:54:00 +0000
Received: by outflank-mailman (input) for mailman id 115535;
 Thu, 22 Apr 2021 14:53:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uib8=JT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZaiN-0005eO-Gn
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 14:53:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 084e26c9-62dc-41a8-91ce-30799c849cb7;
 Thu, 22 Apr 2021 14:53:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 07DEEABB1;
 Thu, 22 Apr 2021 14:53:58 +0000 (UTC)
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
X-Inumbo-ID: 084e26c9-62dc-41a8-91ce-30799c849cb7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619103238; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6XR0QmmTejtrJcAjrfXrTJZ6XGbzGG7Zeqjm+UvbQ8=;
	b=J7MjrzDZ4cpYV3cK4wCeLjdQ2DCVmKFWSgSHkpbntrVMZhF9C90a+gYJR2omoa/xSxDeat
	UZpwODr0ZWpk+acLQ+NpIoGDxjYIYstBW7nNCpWI5VPsQlQjkZKyZmQqRPWPkfFAneAKju
	WCDNrj/AlWVV8yz95HFzimwqo8SgS6A=
Subject: [PATCH v3 16/22] x86: introduce struct for TILECFG register
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Message-ID: <022f5561-8c90-e5c5-9a9c-1878ef17518c@suse.com>
Date: Thu, 22 Apr 2021 16:53:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <322de6db-e01f-0b57-5777-5d94a13c441a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Introduce a new x86-types.h to hold various architectural type
definitions, the TILECFG register layout being the first. Arrange for
the insn emulator to include this header.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -26,7 +26,7 @@ GCOV_FLAGS := --coverage
 	$(CC) -c $(CFLAGS) $(GCOV_FLAGS) $< -o $@
 
 x86.h := $(addprefix $(XEN_ROOT)/tools/include/xen/asm/,\
-                     x86-vendors.h x86-defns.h msr-index.h) \
+                     x86-vendors.h x86-types.h x86-defns.h msr-index.h) \
          $(addprefix $(XEN_ROOT)/tools/include/xen/lib/x86/, \
                      cpuid.h cpuid-autogen.h)
 x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h $(x86.h)
--- a/tools/tests/x86_emulator/Makefile
+++ b/tools/tests/x86_emulator/Makefile
@@ -284,7 +284,7 @@ $(call cc-option-add,HOSTCFLAGS-x86_64,H
 HOSTCFLAGS += $(CFLAGS_xeninclude) -I. $(HOSTCFLAGS-$(XEN_COMPILE_ARCH))
 
 x86.h := $(addprefix $(XEN_ROOT)/tools/include/xen/asm/,\
-                     x86-vendors.h x86-defns.h msr-index.h) \
+                     x86-vendors.h x86-types.h x86-defns.h msr-index.h) \
          $(addprefix $(XEN_ROOT)/tools/include/xen/lib/x86/, \
                      cpuid.h cpuid-autogen.h)
 x86_emulate.h := x86-emulate.h x86_emulate/x86_emulate.h $(x86.h)
--- a/tools/tests/x86_emulator/x86-emulate.h
+++ b/tools/tests/x86_emulator/x86-emulate.h
@@ -37,6 +37,7 @@
 
 #include <xen/asm/msr-index.h>
 #include <xen/asm/x86-defns.h>
+#include <xen/asm/x86-types.h>
 #include <xen/asm/x86-vendors.h>
 
 #include <xen-tools/libs.h>
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -17,6 +17,7 @@
 #include <asm/xstate.h>
 #include <asm/amd.h> /* cpu_has_amd_erratum() */
 #include <asm/debugreg.h>
+#include <asm/x86-types.h>
 
 /* Avoid namespace pollution. */
 #undef cmpxchg
--- /dev/null
+++ b/xen/include/asm-x86/x86-types.h
@@ -0,0 +1,14 @@
+#ifndef __XEN_X86_TYPES_H__
+#define __XEN_X86_TYPES_H__
+
+/*
+ * TILECFG register
+ */
+struct x86_tilecfg {
+    uint8_t palette, start_row;
+    uint8_t res[14];
+    uint16_t colsb[16];
+    uint8_t rows[16];
+};
+
+#endif	/* __XEN_X86_TYPES_H__ */


