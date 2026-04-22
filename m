Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A6EF55811
	for <xen-devel@archiver.kernel.org>; Wed, 22 Apr 2026 11:51:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1290399.1570002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFW77-0004dU-Ge; Wed, 22 Apr 2026 11:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1290399.1570002; Wed, 22 Apr 2026 11:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wFW77-0004dM-CG; Wed, 22 Apr 2026 11:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1290399;
 Wed, 22 Apr 2026 11:51:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wFW75-0004dG-IR
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 11:51:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wFW74-007LX8-VN
 for xen-devel@lists.xenproject.org; Wed, 22 Apr 2026 13:51:26 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8b63e-bab6-0a2a0a5309dd-0a2a45019628-0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:51:26 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 69e8b63e-c1f2-0a2a45010019-d1558031e5c5-3
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 13:51:26 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso55412125e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 22 Apr 2026 04:51:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1c773fsm499178525e9.12.2026.04.22.04.51.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 04:51:25 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776858686; x=1777463486; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcPZJ0EX4CLd90I+zIvaHrXZTmlFhTQJEkz1RmDvJwA=;
        b=AP7fjmqPaUS7Rz1UZgzjDA+/7pE4qkLPg7hfkJ+Rii4O/juAHFcGSFFN7Cv5hxN4mQ
         JlydiHnXtKWllH9uF3+8YmDAam/xZ7EX49U2OZ1ho4/Y7nYUp+SlhtsbikgxuuHOY2jM
         Hx0C6SS1wiftxTRoisZKBiFNCtO4x3/aeifdq9tuz+fgFe9s4si8ct+OuMB18mMep+Rl
         mdz2hwTDr6L75t5Nd6yMX+9/v1bWwlEptvj8Km7D5woF1/O3noH9o0v/klbdyhigmJeb
         CBrJfD/S5dzzQe8qGmfjf3zlyDcA4tOJSMTCzYz+XbcFTSUimMPzG5fofKqiml+hg+rC
         mbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776858686; x=1777463486;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcPZJ0EX4CLd90I+zIvaHrXZTmlFhTQJEkz1RmDvJwA=;
        b=LeXiTwOEMLx8GrGuavH1u4hihImSbye+Bn2l8cOqNfpRVnQPe4OBH4+vPWbt5C0n+S
         jS1ljFMvNxw8hnjQDHJcQAMDgVR/BkeX1tQEqPOuaLSXCLPHytHMw81/IQGwI9mR9awE
         /zwAClTg9hZ3A3itVCvRlIXtp8zTz31oSTZ63GUrppiM04rq0dg5n3/Ooy7zNBykDWRX
         bRNtBbUAdU56kddY+jO06ETwYVE/flcjANDxEsWSyp3XBWoZ6s0t+mLecqi1ILE6+5i/
         QfLNyjeZfXG6MOyk4I8LdC5hM0S8Jz6eXL9933/3UUfGzZtcqfRX2H03TGEyGc/vXcBV
         D6sA==
X-Gm-Message-State: AOJu0YyLZKUtvjh4RyKr3dl3s8wKWeS/+JqP3YSNyqPVx3Iwf0gnrnYC
	PtYgtPOs7QGB3PQVwCTh1aZMwvamvV/QXUsyy3geMhlpA5wpqFFdLUUpYbyDi2QWjqA0OupOLwu
	k3OIHFQ==
X-Gm-Gg: AeBDietmEk6Yfzbr7Qd0rRoVLrvk8eSC2YKt0p0gzI3CdGmTB0IlLPMSoJPspNXsni/
	9T45Imumk6j87+y0jKMBrb9rsnw97UZkGwb/XwqoZCEY4r0DA/b7H33wNJrYOSDLLvKTXM3XT3x
	PMJRe5c4e/dNKLIIB9w2GUSzbllx6lqrRvfuBjqblbu2gyNC76O4USRCVZS4CEp6+b6kpu2xfXA
	zrAKW22S9GEwep8SyG3HHIAODzQVN5zje5ls7+05hNeLzX9b4wI2Z4z+mhYEL6s7xc/WIgiHw2K
	ukoevZ7JHpUT7Q0yPglWpNlAPZQ+JqGo4H8L3aHvr32rLgtbSCb/5j1dLG89Wx/aFXxlEdmhwnW
	/ML4Fv2ULLTpV5m056oDMBJl4EyHt+NV0tCN4VwxRmp0lyerqnGYGnWbaJ6Z6ontso6miKBtJYU
	iyfyxgzj7ri1IzQ9lFazZfpEXmflmYzdwRiHI3A/hfWXOjyDARrxRs6WuoFHUEdjdir1uJ7IsKV
	S8lpOxEMHgmzKadbXDJ+o9JwQ==
X-Received: by 2002:a05:600c:46cb:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-488fb7451e4mr315545115e9.5.1776858686144;
        Wed, 22 Apr 2026 04:51:26 -0700 (PDT)
Message-ID: <bf990673-83c3-44c3-a76a-3b0c36108ec5@suse.com>
Date: Wed, 22 Apr 2026 13:51:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 Bernhard Kaindl <bernhard.kaindl@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] EFI: adjust cfg file buffer freeing
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1776858686-BF87AFF4-9F281D5D/0/0
X-purgate-type: clean
X-purgate-size: 2423

The boot services FreePages() needs passing the size. Since we allocated
one more byte to put a trailing nul there, we also need to bump the size
passed there. Make a small helper function to centralize this.

Note that there's no permanent memory leak because of the oversight: The
allocation is done using EfiLoaderData, and all memory of that type is
later reclaimed anyway.

Fixes: df75f77092c1 ("EFI: avoid OOB config file reads")
Reported-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2026-04/msg01044.html.

--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -778,6 +778,16 @@ static void __init efi_relocate_esrt(EFI
  */
 #include "efi-boot.h"
 
+static void __init free_cfg(void)
+{
+    if ( !cfg.need_to_free )
+        return;
+
+    /* One extra byte was allocated to put a nul character there. */
+    efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size + 1));
+    cfg.need_to_free = false;
+}
+
 void __init noreturn blexit(const CHAR16 *str)
 {
     if ( str )
@@ -787,8 +797,7 @@ void __init noreturn blexit(const CHAR16
     if ( !efi_bs )
         efi_arch_halt();
 
-    if ( cfg.need_to_free )
-        efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
+    free_cfg();
     if ( kernel.need_to_free )
         efi_bs->FreePages(kernel.addr, PFN_UP(kernel.size));
     if ( ramdisk.need_to_free )
@@ -1557,11 +1566,7 @@ void EFIAPI __init noreturn efi_start(EF
             name.s = get_value(&cfg, "global", "chain");
             if ( !name.s )
                 break;
-            if ( cfg.need_to_free )
-            {
-                efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-                cfg.need_to_free = false;
-            }
+            free_cfg();
             if ( !read_file(dir_handle, s2w(&name), &cfg, NULL) )
             {
                 PrintStr(L"Chained configuration file '");
@@ -1631,11 +1636,7 @@ void EFIAPI __init noreturn efi_start(EF
 
         efi_arch_cfg_file_late(loaded_image, dir_handle, section.s);
 
-        if ( cfg.need_to_free )
-        {
-            efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
-            cfg.need_to_free = false;
-        }
+        free_cfg();
 
         if ( dir_handle )
             dir_handle->Close(dir_handle);

