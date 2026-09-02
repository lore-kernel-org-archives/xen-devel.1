Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F8C624D4
	for <xen-devel@archiver.kernel.org>; Wed,  2 Sep 2026 22:10:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1406253.1639614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1t9i-000734-1L; Wed, 02 Sep 2026 22:10:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1406253.1639614; Wed, 02 Sep 2026 22:10:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x1t9h-00072v-S6; Wed, 02 Sep 2026 22:10:05 +0000
Received: by outflank-mailman (input) for mailman id 1406253;
 Wed, 02 Sep 2026 22:10:04 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x1t9g-0006mx-Oy
 for xen-devel@lists.xenproject.org; Wed, 02 Sep 2026 22:10:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x1t9g-00AohW-1Z
 for xen-devel@lists.xenproject.org; Thu, 03 Sep 2026 00:10:04 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a989e97-2eae-0a2a0a5409dd-0a2a450cc034-36
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:10:03 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a989ebb-f479-0a2a450c0019-d155dd35e81d-3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Sep 2026 00:10:03 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-482e4998d28so1246626f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Sep 2026 15:10:03 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e81718sm9019892f8f.16.2026.09.02.15.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 15:10:02 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1788387003; x=1788991803; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nKrZBUjvpE2EoYngFcru125MCNl+vKUvD8ycwT7RELk=;
        b=Illa36Dyermv+bbLRqCGfIJGYADDu0T118AVT/F4aufxIhLytJHKSBNVkf7b325dkl
         cYy7zGpQnksET5pHEoAKq4ESdjZms8G9XIcllywujJUeRWSou+Q5GyDTqUNlFLxUCD5W
         G3RTNJeEqp8IYraDbAEDXHTiZmw1bataitaMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387003; x=1788991803;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nKrZBUjvpE2EoYngFcru125MCNl+vKUvD8ycwT7RELk=;
        b=ixz93bZbOOFWRC1vD8ZXpGIjyLZtpihuPud5dMItnj7GNwGaiH2oVFGkfKRLBognG1
         DWbxm9G/BamQg3qTU2JVLtv4td2rf556dwekVja5pHzZAqaMEWIuveOYDx6gJb4J5fQI
         A3QC+UMRl1CEADjScykXdW2JFRz446XuPokWUxzxmSsX4CgmNXiPT3RAkR97lTI+zR00
         SDBeWL5Jh9puyrp87pnjpQcu+VtmXfdgdn1ZFaQtMIMgOXpszJCiCvk27vRUSxCPP9Kg
         qlX+7oa8sKZ3GpPv/MdlqXLP0zEenzlHq9IK00ZovJQkk13E6xQy9XNuD2wYglFHOohl
         Ha8Q==
X-Gm-Message-State: AFuF++mD3YthK28A5Nxi7P4cGBtV/zswg2bXi1lgOB8brVp7e9BLNJ+q
	vuUXcMHAjUeXvI4GCp922HOeOp4jV2w4p2l96yrppSfkw8FGQOkTQViT9r9XKGMouMf0kaL/L0r
	aY+pkzvw=
X-Gm-Gg: AYBFou1ceVvXVyESIaUxNXz4YifDZ4B4600Np4riKBB1bjA4RmMziJusvLygZQnncB8
	7zU9cH0FHPvvSdNQrbaBD+vBv/vqfN8+qZEHLxyIDd1OCRw9EggnTVjY9B9f3YyarTeFmI7zd/X
	CL3cLqasYn3CioRyoTQmwhysrrmG5sSJSrLpLrJy3V8bnCtM7TWnTXhkLDYGRreHsRN5i/28NbN
	sTsBnJQfufHTTYndvNwoUElF5rNGcDxDqhqlmyUYUsUjcNNzFEBeWprCi+qBGuKt3VHUH9Buzet
	OtScRjodv7P0kuPZs5jak54TFeD2g8A39FMpH7gw1R9pkHVtnApeMFnMd/o7QIOLnOndjs/qf29
	kx32PKflKVOv4pNVUYdnUIQbp4I+Qq+WGxofIlIfEyc+HiOOXkls2a+6+S4wA6InMf/zo1r/EnK
	R93YjWW8sWlW9sVCd/psbDmE9M8z6igJ+rY4HF3wmOuOnYkmEkwATU4Q1nX6ufd3JKMyBG7YSpx
	Cy98YT8XtJc/vv3hdzGNcII+xYUmaZRlvjy35c=
X-Received: by 2002:a05:6000:603:b0:484:3326:983b with SMTP id ffacd0b85a97d-48488f225d7mr12389571f8f.26.1788387003176;
        Wed, 02 Sep 2026 15:10:03 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH] x86/ucode: Work around Granite Rapids erraturm GNR98
Date: Wed,  2 Sep 2026 23:10:00 +0100
Message-Id: <20260902221000.2967167-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1788387003-026DEA5B-4E3AF17D/0/0
X-purgate-type: clean
X-purgate-size: 2415

Block loads which are known to hang the system.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

A more complete solution is in the works, but it's taken 4 months to get this
much published...
---
 xen/arch/x86/cpu/microcode/intel.c | 31 ++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index c45b00c6b033..2160befd3197 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -27,6 +27,7 @@
 #include <xen/string.h>
 #include <xen/xmalloc.h>
 
+#include <asm/intel-family.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/system.h>
@@ -273,6 +274,35 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
     return false;
 }
 
+static bool microcode_safe_to_load(const struct microcode_patch *mc)
+{
+    struct cpu_signature *cpu_sig = &this_cpu(cpu_sig);
+
+    /*
+     * Treat pre-production as always safe - anyone using pre-production
+     * microcode knows what they are doing, and can keep any resulting pieces.
+     */
+    if ( cpu_sig->rev < 0 || mc->rev < 0 )
+        return true;
+
+    /*
+     * GNR98.  Granite Rapids systems hang when loading new ucode on
+     * sufficiently old firmware.
+     */
+    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
+         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
+         cpu_sig->rev < 0x01000405 &&
+         mc->rev      > 0x01000405 )
+    {
+        printk_once(XENLOG_WARNING
+                    "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
+                    "microcode: Firmware update recommended\n", mc->rev);
+        return false;
+    }
+
+    return true;
+}
+
 static int cf_check intel_compare(
     const struct microcode_patch *old, const struct microcode_patch *new)
 {
@@ -365,6 +395,7 @@ static struct microcode_patch *cf_check intel_ucode_parse(
          * one with higher revision.
          */
         if ( microcode_fits_cpu(mc) &&
+             microcode_safe_to_load(mc) &&
              (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
             saved = mc;
 
-- 
2.39.5


