Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15786C43458
	for <xen-devel@archiver.kernel.org>; Mon,  6 Jul 2026 10:46:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1355303.1610073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq1-0002cV-Ul; Mon, 06 Jul 2026 10:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1355303.1610073; Mon, 06 Jul 2026 10:46:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wggq1-0002ab-OW; Mon, 06 Jul 2026 10:46:09 +0000
Received: by outflank-mailman (input) for mailman id 1355303;
 Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <freddy77@gmail.com>) id 1wggq0-0002Tv-9M
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 10:46:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wggpz-00HA6J-Da
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2026 12:46:07 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b876b-e002-0a2a0a5209dd-0a2a4501c908-10
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:07 +0200
Received: from [209.85.221.47] (helo=mail-wr1-f47.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <freddy77@gmail.com>)
 id 6a4b876f-400f-0a2a45010019-d155dd2fb15a-3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 12:46:07 +0200
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09aaso653562f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2026 03:46:07 -0700 (PDT)
Received: from localhost.localdomain (2.115.147.147.dyn.plus.net.
 [147.147.115.2]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63ba97csm349823985e9.12.2026.07.06.03.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 03:46:06 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783334767; x=1783939567; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0/pd4NebReOi1u00xuUMPx7iuXllyYVM7OCMuJ2B44=;
        b=B0Z8jrOXkZol00KL1SpDpFTKS9vWY3gULjMbRrPXVoOJT6eWi+obwwDyvU0Y8azLyB
         WNN1WXT5h2Zb6Cjw8n0/UKlxMJZBex2ROy0tObXBYmogajcXmS+7vAHBxG+dX3H4+ddC
         9ieS6ljC9Ga05ZvarY05mnkL1KsWet3aQNz0ElaCLXf07CocBiGLws9HFMgT8vqaJ4RW
         VUrZewhQCtOj59ycETSuByp2vZORDyN+vIlKS1PA7mifJ4VHykFzfjS0U8EPvb9QBUj2
         vd+JOTLvOEprw1lFET1c4SArq1TOQuaGm3vkrIlZ4phK9eoBo7l51PRdEovkSg34/Ypk
         xwkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783334767; x=1783939567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X0/pd4NebReOi1u00xuUMPx7iuXllyYVM7OCMuJ2B44=;
        b=BsWF2IKFHDgQxGfvxGPIZhsOHJ1F5Ojp/x9Et7wjiAsy4sud8qAcOcqCiG77WRju37
         RLyVrj2qcOevUFBUDzaEwVmEUQ7v6SOREZgtyowUN0nO+tSFpru9XfVwwWzrOiQCKlmn
         6AMYJb404SFE5K8/Ee1dmnm8aft1+nnGzjCIkQyB/WWlmS8EvEF2CGLrXxF7JQ+gKBNK
         JcpvNSE4CQ+jfcbdtWBao+9WazBW6/GArueRxfmKjcsdUUq9kVejI269/9h+97QXzRc7
         pNV04fE0beQRfHf/QMazX4mFLz+n7nVFxnWxEga4mtpAn1Zb1X0WqCJNjFlX7iIVUMmy
         AwuQ==
X-Gm-Message-State: AOJu0Yy3cSZ3G04czcsvaOxlv52gwKCtKThPUfR3WfhxL5c3CQ0rXfjW
	ZcKAM8i5zPWZqtIZWBy17oiY11VemwXOt3iZKyiiMDw0jsYMQ/Xj/kQ4fFek8XHvDuA=
X-Gm-Gg: AfdE7cmTNszuYrldJHpxPUAPUU5SaFbz0pYC4xep6hbIfRdQNW1a+e8RRNSHDNP04n6
	HBowAabfZuQXcSWpCcpfvITRzmGPyVAnrK1C9Upsa2rxxH4JWwPrCtAziE1uSDxV3sFnfh0sCfj
	BW9MmMCuvHMqQdKnG+gxYgZXm9lcnh3VmozshdYzrBU2sa+Y5iPVnBaKhRaiQEJlFGomK/DzL3a
	nbUtcWKevH+0iEYWbOJ7Yc3jzKcs6yes+D+ztxmo2esBmNN8bdVoU0iLeXoSEJu628g+yh0Gc0s
	Fk3p8GuBAfKqYzFnr/vqekdN9CGvVT0IvOnKRnPnlm2K2PX1LJBaptklpt7Gku6MBPiY9ZLPZvY
	h3k6TMnRpLBku5yvgNCe01K1H7OfpQ4EIgsMnBij6J6e/xWIhh5NNRz40L6AxAwXISViyQG0rYx
	unR4j47+uy7ou5sjEpCRfQiGY+62aCo8yyQZ4I2aNFE4XceH8Q7pw4hmSf/I99+TbKttAx/S5HN
	c+DotPB3B1I2M2eJMg=
X-Received: by 2002:a05:600c:3acb:b0:493:cce0:3757 with SMTP id 5b1f17b1804b1-493d11cdd57mr108272465e9.4.1783334766457;
        Mon, 06 Jul 2026 03:46:06 -0700 (PDT)
From: Frediano Ziglio <freddy77@gmail.com>
X-Google-Original-From: Frediano Ziglio <frediano.ziglio@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Teddy Astie <teddy.astie@vates.tech>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Frediano Ziglio <frediano.ziglio@citrix.com>
Subject: [PATCH v7 2/4] x86/efi: discard multiboot and PVH support for PE binary
Date: Mon,  6 Jul 2026 11:45:55 +0100
Message-ID: <20260706104557.430097-3-frediano.ziglio@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706104557.430097-1-frediano.ziglio@citrix.com>
References: <20260706104557.430097-1-frediano.ziglio@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1783334767-FF2C51E0-B5FA0B47/0/0
X-purgate-type: clean
X-purgate-size: 5049

From: Roger Pau Monné <roger.pau@citrix.com>

Multiboot and PVH booting are not supported for PE, hence discards them
in the linker script when doing a PE build.

That removes some relocations that otherwise appear due to the usage of the
start and __efi64_mb2_start symbols in the multiboot2 header.

Section discarding is not done updating DISCARD_SECTIONS definition as the
change is specific for x86.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Frediano Ziglio <frediano.ziglio@citrix.com>
---
Changes since v1:
- improve commit message;
- change section orders to avoid changing code order in final executable;
- merge 2 commits;
- removed deprecated documentation section.

Changes since v2:
- Update commit message, join 2 sentences together.

Changes since v3:
- Added Acked-by.

Changes since v4:
- more clear subject;
- removed more code/data from EFI output;
- removed Acked-by.

Changes since v5:
- simplify section exclusion using more wildcard;
- exclude more multiboot functions.
---
 docs/hypervisor-guide/x86/how-xen-boots.rst | 6 ------
 xen/arch/x86/boot/head.S                    | 8 ++++----
 xen/arch/x86/xen.lds.S                      | 7 +++++++
 xen/tools/combine_two_binaries.py           | 2 +-
 4 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/docs/hypervisor-guide/x86/how-xen-boots.rst b/docs/hypervisor-guide/x86/how-xen-boots.rst
index 8b3229005c..b6d852050a 100644
--- a/docs/hypervisor-guide/x86/how-xen-boots.rst
+++ b/docs/hypervisor-guide/x86/how-xen-boots.rst
@@ -82,12 +82,6 @@ When a PEI-capable toolchain is found, the objects are linked together and a
 PE32+ binary is created.  It can be run directly from the EFI shell, and has
 ``efi_start`` as its entry symbol.
 
-.. note::
-
-   xen.efi does contain all MB1/MB2/PVH tags included in the rest of the
-   build.  However, entry via anything other than the EFI64 protocol is
-   unsupported, and won't work.
-
 
 Boot
 ----
diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 68b963ce6f..981f262b5e 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -126,7 +126,7 @@ multiboot2_header:
         .size multiboot2_header, . - multiboot2_header
         .type multiboot2_header, @object
 
-        .section .init.rodata, "a", @progbits
+        .section .init.rodata.multiboot, "a", @progbits
 
 .Lbad_cpu_msg: .asciz "ERR: Not a 64-bit CPU!"
 .Lbad_ldr_msg: .asciz "ERR: Not a Multiboot bootloader!"
@@ -137,8 +137,7 @@ multiboot2_header:
 .Lno_nx_msg:   .asciz "ERR: Not an NX-capable CPU!"
 #endif
 
-        .section .init.data, "aw", @progbits
-        .subsection 1 /* Put data here after the page tables (in x86_64.S). */
+        .section .init.data.multiboot, "aw", @progbits
         .align 4
 
         .word   0
@@ -154,7 +153,7 @@ vga_text_buffer:
 efi_platform:
         .byte   0
 
-        .section .init.text, "ax", @progbits
+        .section .init.multiboot, "ax", @progbits
 
 early_error: /* Here to improve the disassembly. */
 
@@ -712,6 +711,7 @@ trampoline_setup:
         /* Jump into the relocated trampoline. */
         lret
 
+        .section .init.text, "ax", @progbits
 ENTRY(trampoline_start)
 #include "trampoline.S"
 ENTRY(trampoline_end)
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8e63cf5bc2..4ed1d2bec1 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -57,6 +57,10 @@ SECTIONS
   __image_base__ = .;
 #else
   . = __image_base__;
+  /DISCARD/ : {
+    *(.text.header)
+    *(.init.*multiboot)
+  }
 #endif
 
 #if 0
@@ -195,6 +199,7 @@ SECTIONS
   DECL_SECTION(.init.text) {
 #endif
        _sinittext = .;
+       *(.init.multiboot)
        *(.init.text)
        *(.text.startup)
        _einittext = .;
@@ -220,6 +225,7 @@ SECTIONS
        *(.init.rodata.cf_clobber)
        __initdata_cf_clobber_end = .;
 
+       *(.init.rodata.multiboot)
        *(.init.rodata)
        *(.init.rodata.*)
 
@@ -234,6 +240,7 @@ SECTIONS
        *(.initcall1.init)
        __initcall_end = .;
 
+       *(.init.data.multiboot)
        *(.init.data)
        *(.init.data.rel)
        *(.init.data.rel.*)
diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_binaries.py
index 581e57cbc0..5f0433dcad 100755
--- a/xen/tools/combine_two_binaries.py
+++ b/xen/tools/combine_two_binaries.py
@@ -33,7 +33,7 @@ parser.add_argument('--map', dest='mapfile',
 parser.add_argument('--exports', dest='exports',
                     help='Symbols to export')
 parser.add_argument('--section-header', dest='section_header',
-                    default='.section .init.text, "ax", @progbits',
+                    default='.section .init.multiboot, "ax", @progbits',
                     help='Section header declaration')
 parser.add_argument('-v', '--verbose',
                     action='store_true')
-- 
2.43.0


