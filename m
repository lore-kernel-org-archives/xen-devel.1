Return-Path: <SRS0=Kfrc=CS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9F0C433E2
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 21:54:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CD6E21D82
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2020 21:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CD6E21D82
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=m5p.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kG82J-0000K1-P4; Wed, 09 Sep 2020 21:53:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WRqj=CS=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kG82I-0000Iu-A4
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 21:53:50 +0000
X-Inumbo-ID: dc9f4213-1ce6-45eb-ae8b-e6cf76bced0b
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc9f4213-1ce6-45eb-ae8b-e6cf76bced0b;
 Wed, 09 Sep 2020 21:53:49 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 089LrakC039217
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 9 Sep 2020 17:53:42 -0400 (EDT) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 089LraYW039216;
 Wed, 9 Sep 2020 14:53:36 -0700 (PDT) (envelope-from ehem)
Message-Id: <202009092153.089LraYW039216@m5p.com>
From: Elliott Mitchell <ehem+xen@m5p.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
Date: Mon, 31 Aug 2020 16:01:08 -0700
Subject: [PATCH 06/11 RFC] gitignore: Create .gitignore file for xen/
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The portion of .gitignore associated with xen/ is fairly large, create a
new directory-specific .gitignore file for xen/.

Slashes were left at the start of all filenames.  Entries without slashes
match files in subdirectories, entries with a slash anywhere are a
specific path.  I feel it is more consistent to have leading slashes on
all full paths.

Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

---
Hmm, looking at this and noticing "include/headers*.chk".  I added
"/tools/libs/*/headers.chk" for the tools/.gitignore patch.  Should this
be generalized to add either "headers.chk" or "headers*.chk" to the
top-level .gitignore file?
---
 .gitignore     | 39 ---------------------------------------
 xen/.gitignore | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 39 deletions(-)
 create mode 100644 xen/.gitignore

diff --git a/.gitignore b/.gitignore
index 297cd59c5c..4f95d7b016 100644
--- a/.gitignore
+++ b/.gitignore
@@ -218,47 +218,8 @@ tools/xentrace/xentrace_setsize
 tools/xentrace/tbctl
 tools/xentrace/xenctx
 tools/xentrace/xentrace
-xen/.banner
-xen/.config
-xen/.xen.elf32
-xen/System.map
-xen/arch/x86/asm-macros.i
-xen/arch/x86/boot/mkelf32
-xen/arch/x86/boot/cmdline.S
-xen/arch/x86/boot/reloc.S
-xen/arch/x86/boot/*.lnk
-xen/arch/x86/efi.lds
-xen/arch/x86/efi/check.efi
-xen/arch/x86/efi/mkreloc
-xen/arch/*/xen.lds
-xen/arch/*/asm-offsets.s
-xen/arch/*/efi/boot.c
-xen/arch/*/efi/compat.c
-xen/arch/*/efi/efi.h
-xen/arch/*/efi/runtime.c
-xen/common/config_data.S
-xen/common/config.gz
-xen/include/headers*.chk
-xen/include/asm
-xen/include/asm-*/asm-offsets.h
-xen/include/asm-x86/asm-macros.h
-xen/include/compat/*
-xen/include/config/
-xen/include/generated/
-xen/include/public/public
-xen/include/xen/*.new
-xen/include/xen/acm_policy.h
-xen/include/xen/compile.h
-xen/include/xen/lib/x86/cpuid-autogen.h
-xen/test/livepatch/expect_config.h
-xen/test/livepatch/*.livepatch
-xen/tools/symbols
 tools/flask/policy/policy.conf
 tools/flask/policy/xenpolicy-*
-xen/xen
-xen/xen-syms
-xen/xen-syms.map
-xen/xen.*
 LibVNCServer*
 
 tools/qemu-xen-dir-remote
diff --git a/xen/.gitignore b/xen/.gitignore
new file mode 100644
index 0000000000..2f172a9ff2
--- /dev/null
+++ b/xen/.gitignore
@@ -0,0 +1,39 @@
+/.banner
+/.config
+/.xen.elf32
+/System.map
+/arch/x86/asm-macros.i
+/arch/x86/boot/mkelf32
+/arch/x86/boot/cmdline.S
+/arch/x86/boot/reloc.S
+/arch/x86/boot/*.lnk
+/arch/x86/efi.lds
+/arch/x86/efi/check.efi
+/arch/x86/efi/mkreloc
+/arch/*/xen.lds
+/arch/*/asm-offsets.s
+/arch/*/efi/boot.c
+/arch/*/efi/compat.c
+/arch/*/efi/efi.h
+/arch/*/efi/runtime.c
+/common/config_data.S
+/common/config.gz
+/include/headers*.chk
+/include/asm
+/include/asm-*/asm-offsets.h
+/include/asm-x86/asm-macros.h
+/include/compat/
+/include/config/
+/include/generated/
+/include/public/public
+/include/xen/*.new
+/include/xen/acm_policy.h
+/include/xen/compile.h
+/include/xen/lib/x86/cpuid-autogen.h
+/test/livepatch/expect_config.h
+/test/livepatch/*.livepatch
+/tools/symbols
+/xen
+/xen-syms
+/xen-syms.map
+/xen.*
-- 


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445




