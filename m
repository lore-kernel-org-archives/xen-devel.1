Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C77C55197
	for <xen-devel@archiver.kernel.org>; Mon,  3 Aug 2026 07:20:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1381229.1624825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy9-0002mb-TG; Mon, 03 Aug 2026 07:20:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1381229.1624825; Mon, 03 Aug 2026 07:20:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wqmy9-0002lb-Of; Mon, 03 Aug 2026 07:20:17 +0000
Received: by outflank-mailman (input) for mailman id 1381229;
 Mon, 03 Aug 2026 07:20:15 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrew.cooper3@citrix.com>) id 1wqmy7-0001yA-Lc
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 07:20:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wqmy7-00Dk9I-23
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2026 09:20:15 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a704119-e002-0a2a0a5209dd-0a2a4501c310-46
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:15 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6a70412e-5984-0a2a45010019-d1558030c113-3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 09:20:15 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4954aff6088so14417695e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2026 00:20:14 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49807b85be7sm254687935e9.2.2026.08.03.00.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 00:20:13 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=citrix.com header.i="@citrix.com" header.h="Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1785741614; x=1786346414; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjwuBsICIK/H/Y6+HpcAgCloLVRbw36ixgETurBOkCw=;
        b=X2RSM6EpKUZkN34/3ySIiuU+Be1QmfqrwwfUVPWZ3s24nv2ra0DGlD0MV2Z0rWLA5F
         8FyIsGAPcKW4KxrrXu+PNjSM5KA71DU1h9Xh/qSwZFER6W/IpHENQHSSqfXLLHDpYlY9
         RWi7WF30Y2N870dZ6G5cEpjGExOVfm6elTg28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785741614; x=1786346414;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjwuBsICIK/H/Y6+HpcAgCloLVRbw36ixgETurBOkCw=;
        b=HM1Wr4qoYrwPRDFJ0vxYxD2hgXFUQ31CCdmJE3e0WC9Ba6iYTQ1PIWwL7oFnguO56J
         y4XxO2HEWEgHx4Ijr7WvX553VjhA3YFN6bKnXztKyHHTHrpEIRaouQ0HuZPD9hAMQUXa
         mFBc4MYxVgfVjYBEcmChKExa88VWdMe9gbBShvGNVtIVwB9+R8KYh4+nOiuaJx4pxeCG
         2Cx1XNQLzMOpo2cO2YE/hVdMUEK1p2+QZYqLCRd/J8+Doh5IOo4tT1qzloQJ66nYRT49
         sufWzkM5iCg1AhMajv2UCubqRI/LYHEiNeVRMDp63M2Mdx1Z6CXA63rLJ1jUzD/0cJbJ
         AIqQ==
X-Gm-Message-State: AOJu0YyqiVH55tJzQXze4wBFNo0qhRTF8T+jKJRhVrtMXUtteJylnMlj
	LwTHNlD3V28FCxU3xMvCHBe8POQKj0LrVvV823yT4381vDrv3oLQFZYeTEAG7V3RrPloA0IIaMM
	Lf9lHHZM=
X-Gm-Gg: AR+sD13ElKyup0+QIQBgDZFOpoxm0WmK72UFcy0yVjnvjh1tmiQv1S3i+lba7LP2XRf
	hIjARuioRldmO6+X+tvb4sJNjC8PnR/mdj3xWRcytEgKPQYmydsmGhBEKFFaiiiOhYxa7tyJBcL
	rIpz/WqpGWkOglA+FBKViW9EN9h7Pa+NWtrw9tl8vSBP0esDJgalqiB6w0ydFsrc+G5sGyt9+r7
	Gs/cgF7XsJ8uKGywYIeBuLhfhBNQVE35lU5klpyzo1HISZL2xiBVfnVuAvHQ4d2rsQ5LTDh52Kt
	sotDY1UApmrSpILPiJMDWtt5p9PivWxYWfmpFkfZnvlw7rCHj1g1V44geQCNbFyUQ4arXkvgxpi
	w9VQnzNN0x+a+vzWtqfEWj8Aqli0caTfx7YlT9sE+/aJMfqiNxJou9ytBDlm02fuHjYCem95mYr
	JHOEywkzNc8ifaWgEBkvZT42bw4OutYWGhuZ4xtRBJ3NgAlMj90FX9Ye+qjUHVJUHlUMHGDVYUw
	iZcxjTkyUb9nGUBlrAd9eSDyLFRW80br6Gg328=
X-Received: by 2002:a05:600c:4504:b0:493:c194:4e7a with SMTP id 5b1f17b1804b1-4980c66c9a8mr181514035e9.3.1785741614271;
        Mon, 03 Aug 2026 00:20:14 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v3 5/5] x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
Date: Mon,  3 Aug 2026 08:20:06 +0100
Message-Id: <20260803072006.9678-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260803072006.9678-1-andrew.cooper3@citrix.com>
References: <20260803072006.9678-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1785741615-C5540757-3BC6C667/0/0
X-purgate-type: clean
X-purgate-size: 4495

Now that alternatives can fix up call displacements even when they're not the
first instruction of the replacement, move the SCF_entry_bhb conditional
inside the replacement block.

This removes a conditional branch from the fastpaths of BHI-unaffected
hardware.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <jbeulich@suse.com>
CC: Roger Pau Monné <roger@xenproject.org>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/hvm/vmx/entry.S             | 12 +++----
 xen/arch/x86/include/asm/spec_ctrl_asm.h | 43 +++++++++++++-----------
 2 files changed, 30 insertions(+), 25 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index cebc70064048..76508c0de2f3 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -59,12 +59,12 @@ FUNC(vmx_asm_vmexit_handler)
          * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
          * itself so must be after we've perfomed all the RET-safety we can.
          */
-        testb $SCF_entry_bhb, CPUINFO_scf(%rsp)
-        jz .L_skip_bhb
-        ALTERNATIVE_2 "",                                    \
-            "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-            "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L_skip_bhb:
+        .macro VMX_BHB_SEQ fn:req
+            DO_COND_BHB_SEQ \fn scf=CPUINFO_scf(%rsp)
+        .endm
+        ALTERNATIVE_2 "",                                         \
+            "VMX_BHB_SEQ fn=clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+            "VMX_BHB_SEQ fn=clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
         ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_VMX
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
diff --git a/xen/arch/x86/include/asm/spec_ctrl_asm.h b/xen/arch/x86/include/asm/spec_ctrl_asm.h
index abb64ad2b7f9..780ec57f4553 100644
--- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
+++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
@@ -92,6 +92,21 @@
 .L\@_skip:
 .endm
 
+.macro DO_COND_BHB_SEQ fn:req, scf=%bl
+/*
+ * Requires SCF (defaults to %rbx), fn=clear_bhb_{loops,tsx}
+ * Clobbers %rax, %rcx
+ *
+ * Conditionally use a BHB clearing software sequence.
+ */
+    testb  $SCF_entry_bhb, \scf
+    jz     .L\@_skip_bhb
+
+    call   \fn
+
+.L\@_skip_bhb:
+.endm
+
 .macro DO_OVERWRITE_RSB tmp=rax, xu
 /*
  * Requires nothing
@@ -277,12 +292,9 @@
      * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
      * itself so must be after we've perfomed all the RET-safety we can.
      */
-    testb $SCF_entry_bhb, %bl
-    jz .L\@_skip_bhb
-    ALTERNATIVE_2 "",                                    \
-        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L\@_skip_bhb:
+    ALTERNATIVE_2 "",                                          \
+        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
     ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_PV
 .endm
@@ -322,12 +334,9 @@
     ALTERNATIVE "", __stringify(DO_SPEC_CTRL_ENTRY maybexen=1),         \
         X86_FEATURE_SC_MSR_PV
 
-    testb $SCF_entry_bhb, %bl
-    jz .L\@_skip_bhb
-    ALTERNATIVE_2 "",                                    \
-        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L\@_skip_bhb:
+    ALTERNATIVE_2 "",                                          \
+        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
     ALTERNATIVE "lfence", "", X86_SPEC_NO_LFENCE_ENTRY_INTR
 .endm
@@ -433,13 +442,9 @@
      * Clear the BHB to mitigate BHI.  Used on eIBRS parts, and uses RETs
      * itself so must be after we've perfomed all the RET-safety we can.
      */
-    testb $SCF_entry_bhb, %bl
-    jz .L\@_skip_bhb
-
-    ALTERNATIVE_2 "",                                    \
-        "call clear_bhb_loops", X86_SPEC_BHB_LOOPS,      \
-        "call clear_bhb_tsx", X86_SPEC_BHB_TSX
-.L\@_skip_bhb:
+    ALTERNATIVE_2 "",                                          \
+        "DO_COND_BHB_SEQ clear_bhb_loops", X86_SPEC_BHB_LOOPS, \
+        "DO_COND_BHB_SEQ clear_bhb_tsx",   X86_SPEC_BHB_TSX
 
     lfence
 .endm
-- 
2.39.5


