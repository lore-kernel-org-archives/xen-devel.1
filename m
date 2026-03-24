Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB94E9A75D
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2026 10:18:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1260279.1553656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ypa-0005xz-P5; Tue, 24 Mar 2026 10:17:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260279.1553656; Tue, 24 Mar 2026 10:17:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4ypa-0005xo-Jl; Tue, 24 Mar 2026 10:17:50 +0000
Received: by outflank-mailman (input) for mailman id 1260279;
 Tue, 24 Mar 2026 10:17:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <soumyajyotisarkar23@gmail.com>) id 1w4ypZ-0005vq-Da
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 10:17:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w4ypY-000XdF-Pa
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:17:48 +0100
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c264bf-e002-0a2a0a5209dd-0a2a4502d2e4-36
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:17:48 +0100
Received: from [209.85.216.65] (helo=mail-pj1-f65.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <soumyajyotisarkar23@gmail.com>)
 id 69c264cb-63bb-0a2a45020019-d155d841b872-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 11:17:48 +0100
Received: by mail-pj1-f65.google.com with SMTP id
 98e67ed59e1d1-356337f058aso2947602a91.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 03:17:48 -0700 (PDT)
Received: from fedora ([103.2.232.250]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c031412f2sm1939382a91.7.2026.03.24.03.17.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 03:17:45 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1774347466; x=1774952266; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6/EFfTLPPvtpKfYbDxMVwQU9jDgu7ScMy19tpR6gQjI=;
        b=Q5oW//VJ43BNtn9crNw8gtsQ2S3M9YvHWAVYYYvaoKhXnwX80dGlZeisgCfadyqHfQ
         cIcvTI8b6L7DEP3Hprn/3lH1uO4qXAhs34+21CDJt8VqNwH6o2ZqBQpip5i4RbfFUsJa
         4I77k9P3bzXMt29r0lLJ0xHn6U8T4PdMLu3MoZedN9rCSwJAMVP1V53LO7ExDkhlmEDz
         XeImNgXooMHqlbEh4eAzGACJsO5BZANiY2lJ4v0hNSRjyypZVlMtsWaTtAjsvlIr/0sC
         8p6vYRRmpHFgQfsOf6+aRIRsleGEnoVIFbamejIRn6utsgYaY4YbjWRukfFF2OPn5wxa
         7FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774347466; x=1774952266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6/EFfTLPPvtpKfYbDxMVwQU9jDgu7ScMy19tpR6gQjI=;
        b=sfJpZSeVsMC3AI/vhrjHdtBUDTLupFJuskUprzDClyeDL8dcQ421+x+JH4mXK46Ts6
         WHAc37ePBG5AjIt6fQOl2aIKU8tPrkcK3FXdjHcQOyiyWGfJr0fWISHAjrdaw/lX5cm5
         WKbt9tXTaoL7jN9ujAY8y09Oiq4Kd3EEDa2gDGOR22OVYI9tf4z+Z4dwQbQA9AvuSBWO
         eg1TcKtErKcsVWUCGEFq+6a4dG3+Y4QZLlbY823nAXGgnQZZEFOS/BI31cZJu4xF9T/7
         tQZAwUyfRZnGH77zSsEFdfIl6R8swjH60Z8RZQnA3+UoarztfZUDjdYCO6r+NOGJUWg3
         JRiQ==
X-Gm-Message-State: AOJu0YznZaDkPhUBcPg/vm0EYga+KNengPUZdF0maJ2OhEI2psU0sAvb
	cnuiB1aK+FiBZw3LN/h0o3VOPSfuTymhIpdqHsy0TLV08AeFVAIyIBVj+Skyvy47
X-Gm-Gg: ATEYQzzA9anb79Jf8woX5LTcpaZt4RHiyhVthoeyvD4ndmi45PcQoNf4v7yUvBTQ2ZO
	4yMajM5HUJtV6hP8cTdUqD8aqOG1YwNgTVXgsM5BmpXaGCQvoNgO4zUv6HNuQQXl8Sr4tbP+Pov
	JlHKxEh5DFG6O2yqbatXryqTiOzLSHXdb4ymNdWDu0bvpkrq1FEypWDdlq+py7yMTGcBus9woG3
	0Bv+d5Jh+z/mBluyAK9z4K+osdnKPB0xKhFaq6yAkxY3eJIARwUSda1SBIQw4DVQyQKOleEUQF5
	jJcaLWvD4iMgIGdoVA0tbf/f6SaZDvvqpnG3/zkCisCNLT8NRLDR1mL3tXSn3NTCGp7lUWvq8vV
	YHSbqvPFdh5yS9giwcSpmjjabC6/gvBy78E41+d1uEbkbWcU4H0iFH2vWRv4gGNJq05ZFUK47MN
	VrxkRLKOgFvKObheIfxbgY/ca5u5wM9dqf9JcGVIok1XcndkhBg7fHxVn5f3r+UV2qVPdLDh3cy
	akx98WoL8znOgR0gA4qp7TISUAdow4YNZpGg9d2UMVf92anzFD+3dSjE1Fki20uw3xk/C5+/w==
X-Received: by 2002:a17:90a:e7cb:b0:359:83d3:27d3 with SMTP id 98e67ed59e1d1-35bd2b937f5mr12836202a91.2.1774347466254;
        Tue, 24 Mar 2026 03:17:46 -0700 (PDT)
From: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
To: xen-devel@lists.xenproject.org,
	sarkarsoumyajyoti23@gmail.com
Cc: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Subject: [PATCH v4 3/3] x86/efi: Add opt-out mechanism for BGRT preservation
Date: Tue, 24 Mar 2026 15:47:26 +0530
Message-ID: <20260324101726.6929-4-soumyajyotisarkar23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
References: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-720697/1774347468-42099DB8-074385BD/0/0
X-purgate-type: clean
X-purgate-size: 3800

BGRT preservation is now enabled by default to fix ACPI corruption
for desktop/workstation systems (similar to ESRT).

As described in the task:
https://github.com/QubesOS/qubes-issues/issues/10764

Add an opt-out parameter to allow disabling BGRT preservation on
systems where the ~1MB memory overhead is not desired.

The opt-out is implemented through two boot paths with early parsing
during the EFI boot phase before preservation runs:

1. xen.efi direct boot: '-nobgrt' command line option (parsed in
   efi_start())
2. Multiboot2 (GRUB): 'efi=no-bgrt' peeked from mb2 cmdline tag
   using get_option() in efi_multiboot2()

The flag is checked at the start of efi_preserve_bgrt_img() to
skip preservation entirely when disabled. Status logging indicates
whether preservation was disabled, succeeded, or failed.

Usage:
  Default: BGRT preserved automatically
  xen.efi: Add '-nobgrt' option
  GRUB/MB2: Add 'efi=no-bgrt' to Xen command line

Signed-off-by: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
---
 xen/arch/x86/efi/efi-boot.h |  3 +++
 xen/common/efi/boot.c       | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 0547d845cd..6c986cf6c0 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -897,6 +897,9 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle,
         efi_arch_edid(gop_handle);
     }

+    if ( cmdline && get_option(cmdline, "efi=no-bgrt") )
+        opt_bgrt_disabled = true;
+
     efi_arch_edd();
     efi_arch_cpu();

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index e22a42c15b..a4db7ee516 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -170,6 +170,7 @@ static SIMPLE_TEXT_OUTPUT_INTERFACE *__initdata StdErr;

 static UINT32 __initdata mdesc_ver;
 static bool __initdata map_bs;
+static bool __initdata opt_bgrt_disabled = false;

 static struct file __initdata cfg;
 static struct file __initdata kernel;
@@ -825,6 +826,9 @@ static void __init efi_preserve_bgrt_img(void)

     bgrt_info.preserved = false;

+    if ( opt_bgrt_disabled )
+        return;
+
     bgrt = efi_get_bgrt();
     if ( !bgrt )
     {
@@ -1582,6 +1586,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                     base_video = true;
                 else if ( wstrcmp(ptr + 1, L"mapbs") == 0 )
                     map_bs = true;
+                else if ( wstrcmp(ptr + 1, L"nobgrt") == 0 )
+                    opt_bgrt_disabled = true;
                 else if ( wstrncmp(ptr + 1, L"cfg=", 4) == 0 )
                     cfg_file_name = ptr + 5;
                 else if ( i + 1 < argc && wstrcmp(ptr + 1, L"cfg") == 0 )
@@ -1592,6 +1598,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE ImageHandle,
                     PrintStr(L"Xen EFI Loader options:\r\n");
                     PrintStr(L"-basevideo   retain current video mode\r\n");
                     PrintStr(L"-mapbs       map EfiBootServices{Code,Data}\r\n");
+                    PrintStr(L"-nobgrt      disable BGRT preservation\r\n");
                     PrintStr(L"-cfg=<file>  specify configuration file\r\n");
                     PrintStr(L"-help, -?    display this help\r\n");
                     blexit(NULL);
@@ -1916,7 +1923,9 @@ void __init efi_bgrt_status_info(void)
     if ( !efi_enabled(EFI_BOOT) )
         return;

-    if ( bgrt_info.preserved )
+    if ( opt_bgrt_disabled )
+        printk(XENLOG_INFO "EFI: BGRT preservation disabled\n");
+    else if ( bgrt_info.preserved )
     {
         printk(XENLOG_INFO "EFI: BGRT image preserved: %lu KB\n",
                bgrt_info.size / 1024);
--
2.53.0


