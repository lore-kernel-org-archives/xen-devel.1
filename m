Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F80C79F82
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 17:15:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1412315.1642843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3zPv-0005Fa-Ju; Tue, 08 Sep 2026 17:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1412315.1642843; Tue, 08 Sep 2026 17:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3zPv-0005FT-Gf; Tue, 08 Sep 2026 17:15:31 +0000
Received: by outflank-mailman (input) for mailman id 1412315;
 Tue, 08 Sep 2026 17:15:30 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1x3zPu-0005FN-0V
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 17:15:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3zPs-002MWe-VI
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 19:15:28 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa042aa-e002-0a2a0a5209dd-0a2a450188d8-6
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 19:15:28 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6aa042b0-5984-0a2a45010019-d1558031a557-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 19:15:28 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-495437bb891so28439045e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 10:15:28 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883c6ba4sm42308095f8f.25.2026.09.08.10.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 10:15:27 -0700 (PDT)
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
        d=citrix.com; s=google; t=1788887728; x=1789492528; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJSy1oOnfZYuUJld/ZrDnUr2X+fXVk73FeNzFX3opLg=;
        b=KdT+SCW66LbI3HcZ4msa85CuNWmEagIwIsBn95T7QLSL7L+RVuOXtf6Hef5ziREJpo
         1AMGiNkB3zmPfJaW/EXXmnZhhM6SLB3j5t2SZupTDr9lmAvdn88jiArbE8u1cc25UOTC
         HwDml92IkKLzFodfBcGmg+6RL85LjgWqN+7rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788887728; x=1789492528;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mJSy1oOnfZYuUJld/ZrDnUr2X+fXVk73FeNzFX3opLg=;
        b=CK9SueLM8jclWXp8fKbTjXzuixuBNqingD5lu6d6/Y/PdL33LLdZnnZLoa1qUFDUSG
         ZrQHh0u/Wg2iDw2/YC0lqeD91/4FwlAYfK/lEzEL1Tw7NA1OVflT14H3iFS3H80r89Th
         VQ+YJsE0U9nD2n7L5QVv+fxIVvlbppJpDkNPXks/UvYNooKN0/00eP/l6UH/9Vsj+kxO
         MEDfzduF+eA1ktL/yw14T5nD1Yhjp+KIOfcjq9wmZa5acWU1ZjSbbErshgDIluUnHgsG
         ovFPTIV1CU8xBDjG7pDs8ZOuqnDmEx4ZtAMzJugXnmwJyaRV3VJAphJqRoK1ZTlfCj+b
         zH/Q==
X-Gm-Message-State: AFuF++mrFA5c9CwRJIRVZoWZP52+u+MFLz4NRZ+i8o/tWv1vOek6hnRw
	PXGynINPZasJKyM3HeEzJmHzrPhX4S70nlvW/Zm59sqMJ2V/34MRS8DBC+jQVxARxH4Ke8upPBG
	Jp9JdXVw=
X-Gm-Gg: AYBFou2iYGb5LP+jGwPeflAnnB9xrqTGw8rfuClPRhv4qezcxef1Xq1iyzLk6uEmWm9
	mTrYAbTsE4sxq2Jz9chzkcsD7CydewRL9+MRuC7zggLmIu3IgqLsFsYno/fl5iMqoWa25OHRMVt
	zD4ig/Wj9/yELesqg7pHCQQ4iuoFEZpu/m0gUhVB7DsNQmr+zidxtcHMejerBi3QK4mKM4NP/Nw
	brBM7qIpfgrW0OCyG5Ftv8qzo69bKAq/W6sd+AXx2D2SMEtFMaHc1EmHXeM5EzJHmNA+x84xpMI
	DbrBZT4c9xF1zvB2BtSX5fZx0fBEWkIzXyBKb9lf7hAjWoUMxEqCAY1YVM0Ds39h26iRlxui/iI
	cO7yvcy9Pxm9KDZ3rPD6Husln2EBTyZlCBFLt/DTEpyConozX2MdjPZ6lTiLl+J+LqeGvX4WbT7
	DH0QtHEMBkH9iYsQKVVbHqzUAwy9n3JkZr86nweNimMLTERb14GMtFYMoGgBFFfHAb1gYfvqIaW
	JRu1YGSJwnX4u2tbCBnZ0cLmfNuY2LmpOxEXbs=
X-Received: by 2002:a05:600c:74a:b0:49d:10b8:7e05 with SMTP id 5b1f17b1804b1-49d10b87ec4mr104627155e9.19.1788887727994;
        Tue, 08 Sep 2026 10:15:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3] x86/ucode: Work around Granite Rapids erraturm GNR98
Date: Tue,  8 Sep 2026 18:15:25 +0100
Message-Id: <20260908171525.3196765-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1788887728-BE07B757-E7476D12/0/0
X-purgate-type: clean
X-purgate-size: 3179

Block loads which are known to hang the system.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>

A more complete solution is in the works, but it's taken 4 months to get this
much published...

v3:
 * Double XENLOG_WARNING

v2:
 * Correct the sign of the cpu_sig->rev check.
 * Expand the comment to explain why we are not following what GNR98 says.
---
 xen/arch/x86/cpu/microcode/intel.c | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/microcode/intel.c
index c45b00c6b033..86cbfb798160 100644
--- a/xen/arch/x86/cpu/microcode/intel.c
+++ b/xen/arch/x86/cpu/microcode/intel.c
@@ -27,6 +27,7 @@
 #include <xen/string.h>
 #include <xen/xmalloc.h>
 
+#include <asm/intel-family.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
 #include <asm/system.h>
@@ -273,6 +274,44 @@ static bool microcode_fits_cpu(const struct microcode_patch *mc)
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
+    if ( (int)cpu_sig->rev < 0 || mc->rev < 0 )
+        return true;
+
+    /*
+     * GNR98 states that Granite Rapids systems hang when loading new ucode on
+     * sufficiently old firmware.  GNR101 retroactively states that one ucode
+     * had an incorrect minimum revision field, in light of discovering GNR98.
+     *
+     * Both are incomplete statements of the problem.
+     *
+     * At the time of writing (August 2026), the believed safe sequence is:
+     *   0x01000370 -> [0x01000380...0x010003f3] -> 0x01000405 -> any later
+     *
+     * Disallow known-unsafe loads while permitting believed-safe loads.  For
+     * GNR, this allows multi-hop loading to get up to the latest.
+     */
+    if ( boot_cpu_data.vfm == INTEL_GRANITERAPIDS_X &&
+         boot_cpu_data.stepping == 1 && (cpu_sig->pf & 0x95) &&
+         ((cpu_sig->rev < 0x01000380 && mc->rev >= 0x01000405) ||
+          (cpu_sig->rev < 0x01000405 && mc->rev >  0x01000405)) )
+    {
+        printk_once(XENLOG_WARNING "microcode: Granite Rapids erratum GNR98 detected.  Skipping ucode 0x%08x\n"
+                    XENLOG_WARNING "microcode: Firmware update recommended\n",
+                    mc->rev);
+        return false;
+    }
+
+    return true;
+}
+
 static int cf_check intel_compare(
     const struct microcode_patch *old, const struct microcode_patch *new)
 {
@@ -365,6 +404,7 @@ static struct microcode_patch *cf_check intel_ucode_parse(
          * one with higher revision.
          */
         if ( microcode_fits_cpu(mc) &&
+             microcode_safe_to_load(mc) &&
              (!saved || compare_revisions(saved->rev, mc->rev) == NEW_UCODE) )
             saved = mc;
 
-- 
2.39.5


