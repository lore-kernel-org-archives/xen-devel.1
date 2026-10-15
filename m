Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5322DCCA467
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 21:05:53 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1451122.1666344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdw-0002a7-0t; Thu, 15 Oct 2026 21:05:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451122.1666344; Thu, 15 Oct 2026 21:05:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHSdv-0002Zy-Rq; Thu, 15 Oct 2026 21:05:39 +0000
Received: by outflank-mailman (input) for mailman id 1451122;
 Thu, 15 Oct 2026 21:05:38 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xHSdu-0001tY-3U
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 21:05:38 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHSdt-00Gq26-GR
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 23:05:37 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad14008-bab6-0a2a0a5309dd-0a2a4501da3a-22
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:37 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrew.cooper3@citrix.com>)
 id 6ad14021-5984-0a2a45010019-d155dd2dd085-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 23:05:37 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-48de6a62a4cso2776218f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 14:05:37 -0700 (PDT)
Received: from localhost.localdomain (host-78-146-248-75.as13285.net.
 [78.146.248.75]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4f8bd9sm501163f8f.35.2026.10.15.14.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:05:36 -0700 (PDT)
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
        d=citrix.com; s=google; t=1792098337; x=1792703137; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SjwuBsICIK/H/Y6+HpcAgCloLVRbw36ixgETurBOkCw=;
        b=Zv4Y6+tnJaPBOM4knSBXe9kwIRHvZJybRy65MYAfLgjKnQKFZIBNwmMr2HeTUAnKGy
         qFmTf7Clbo+S9HZs/wQst/dxskuaSjKfquk9awCb8scqaMDaLaLFk2z1HLABEi+bJ5Bj
         hCuUiAkwqGbi373JZf8UK7fxA0mRgTDNiF+Qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792098337; x=1792703137;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SjwuBsICIK/H/Y6+HpcAgCloLVRbw36ixgETurBOkCw=;
        b=eYQgtWgrYbJV5UgKHHnLPWWA7FSVVgP1qyMV5X5Fn8f8v010xA+wAnlQaF5dR+fb7O
         8mmNilleuCxJ4GJk4n3AwckI9lzP5TxeD8kQAh9GyidzUIDXkz0jEWvgJumvZ03IOEyy
         SB4P0G93x5Fac2k/LklaIn1GxC2MtMlqhYlxDjaZsnuy3pKjSGs9JQ74RZlErAlhi7xH
         ShKTtsKavOTcxfKTQYMRWfunhhDR8rKUaGEW9PicMheky4KcZAFz4YNUqeyg77AURcW6
         rmM7elO8ETFn2A0lCllJvftZzTXlePHsSQ2mokQwUqu4Ym1RYofPMjgTLEuDvJ8II47f
         F0ew==
X-Gm-Message-State: AFq9FYJWfO0skGiCQ2dhE7ZDejgmMVOxeBPsvIBqXmgRRm1sqaJ9vB2O
	yUFr8A14c4riw8GamhCk7P6zXSFa5WRmABq1Aa9g/K2KFRdhIPb/wgNR7+KwMAKtQUot0Hf543w
	QybBuE8U=
X-Gm-Gg: AYBFou3XZvs24ACXvHD6m/PTKn0h1+qJZ7VRB0zCDNoqMIbCoMU1W/jU3v42qxHwhWX
	BHJi2sswBiM+0YH3u9GeUoFQGdeuwWptTmG5paST788e9B1eVatkoa19czC0NbFkiJXQoVKvl6Q
	i3WxS2ngIqEW3uXsrIf7QTwRxRVpcMhgDL9bjHYPIrpAk3M3gTpBpBO4TVUwR3QTj3tVySzT80O
	dUljBge45Sn7dA5uCvpoLgmnILE8sk/ZdVyx336cG2+16j9RcMQCW4JzQJMIy4BL+KAsCHEIe4O
	UxbDKu4R4a0eKOatwBOFT1tvFyWT+JTDwguf1RMZ/ffSp9LR8D7NCRXSAtitL9FlpRETZ9eJVQO
	vNKcN5K/0ev4PdijYw2Q5QXij+rJqvBdTmOTkxLFqDbLGb3k2/Rx12GoQWLmoIuoKwwDgNWsVTF
	YZe0tm/KILbyMThXUIV7KppY+Y+zu1698vyIvCbIWIp+MujbmuQzh9A6OkxyxTJViB5JLEeoxE/
	bYs3XzI8CdU4OrVsBLLqyo/tjGtUqoh5eEHYCW5BSMjm2UT
X-Received: by 2002:a5d:588e:0:b0:48a:fcf9:acb5 with SMTP id ffacd0b85a97d-48dba787752mr39811513f8f.2.1792098336646;
        Thu, 15 Oct 2026 14:05:36 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH v4 5/5] x86/spec-ctrl: Introduce and use DO_COND_BHB_SEQ
Date: Thu, 15 Oct 2026 22:05:30 +0100
Message-Id: <20261015210530.786604-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261015210530.786604-1-andrew.cooper3@citrix.com>
References: <20261015210530.786604-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1792098337-1E27A757-1931DB85/10/78276251493
X-purgate-type: spam
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


