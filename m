Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2B2C79FAD
	for <xen-devel@archiver.kernel.org>; Wed,  9 Sep 2026 13:00:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1413005.1643284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Hub-00079R-Kg; Wed, 09 Sep 2026 13:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1413005.1643284; Wed, 09 Sep 2026 13:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4Hub-00079K-Hy; Wed, 09 Sep 2026 13:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1413005;
 Wed, 09 Sep 2026 13:00:24 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x4HuZ-00077o-Uh
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 13:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4HuZ-007Z4F-BH
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2026 15:00:23 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15865-e002-0a2a0a5209dd-0a2a45048c36-12
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:00:23 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa15866-b57f-0a2a45040019-d155dd30ec60-3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 15:00:23 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-4858be8b509so2614034f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Sep 2026 06:00:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm38385950f8f.9.2026.09.09.06.00.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 06:00:22 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788958822; x=1789563622; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bWlSSzoVmVaek1Pzh48/jWlFrsNac/GAHMWoEX91Hj8=;
        b=BAKaWvRFLX83BoeutOQIaqvh9Sy7KER39lULuFuDn+3jpfF+1OF9rOeNMCi0CmyO3O
         yVyUE81UtbmRVO0GGthdzvGuKjTgTl6tij0HU8y4KDVRq8bfBJEkHIo3EyOHIzwaxcTl
         78aqslXjG/q7WBsGudUjFHLk+0kxK9w/02oJD3wX09GE0VEwjMQuKrtqR+VadOd+mwmO
         HRDtlTqNQlpecNP3pU3koPc7sBiEndxWmoSwsIFzPlMTR7HF/jfOFSvlVSs69RuEpJRk
         5er3jTsmxDT2RNerURMkPMkeyPgsKEiRgKLTaTsRrEaGhmXYsAg0d9dSSm4QbYkTx/0O
         A1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788958822; x=1789563622;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bWlSSzoVmVaek1Pzh48/jWlFrsNac/GAHMWoEX91Hj8=;
        b=eTlT7sq4nAU77Q0RAUQSq+r52Upfvk91nmJinziVmvSscdPKiNCtyoqe7724ZW+mqj
         bNkqTo89ebJUZFJ7IDXcqZPpWR+A8uYtpAHQzqDN6m/pEN7tVBACALjlYEfbvxifXkrh
         Mo4cXE+6i08YKntXsrQmL1j2+wGJ04o+Q3cEsf0YdCAtby4k6X6l7KtYTC1vhoPQNG0e
         lLq89vL2cD8AH0YSOMLJDS9AtBNK7Xnmhp64rtAZY5+1O8CT9ctI5CdA5s1006ZW+x9E
         NiYxpBOmHAzNPXbuIbjWZ2W4FQGo/6r3oV6TcAp1Blqt9TmDwueuOGe/Wkp4UbZvh0vT
         Z2CA==
X-Gm-Message-State: AFuF++k+GbxGDRXXpB9uXT8XAh17PjYDyZgSLa9sVRq0iSGwdH7Zxq4Q
	Oox7xwAOX26Dfqg1ScqwjdsGqrq3oeLVnW6f390llKtKyDrLIBRtSsx2zudmJH5ujF0kH9jbdiy
	5muW0MA==
X-Gm-Gg: AYBFou0bJCrJoNyTonBVBcvAdtbOlYToRry+tvVjJkGehCguTA5/DonXglhdgVVE2V9
	QjfeKcSnhX5YwVP95yUBNDd5/1D1ozg+sbwuQdeG70ztTTfiHesb6xIal6JUIh7kQAG87GbTRTp
	dJSb5PnQlJ51+JLhXGlokuSbclNETqTH1x5yrjCGOsUe5AmbnQcCJQlkUMt3bzvgY57NpEKrodz
	tKWgPAvD8Z2++j2tclEcQ0nPVihFlsYCNKIAkBJNejRXYtlSRaCeoJqUmuAiud0jQ/4IsFEsCBD
	er10lyT5YqRHt3ECdxByVnf6b0yF3TCqWHk2p7Mk6nUewXLHYKpgJ5rEXpTbecY0vaTY20kPEbT
	S7hPlj1RvEqUH4h7rebwwgcSG4nTSw1zRaam3L8ccQGz0sA0xDgiGq4ZAAsjMmPRjvnMRzTTp6A
	/FQDwDCJAulZeL+ysQ65PDnCKxWCAInOoBhsH4AqfO6tqunX7qFxPOVhEaaUz7ZSO6tpA9Td0hX
	zSHKt+HeDa9GPANYQPuNsc6txIpYyaFU7FmfJpub1QnUvuO1af+bYn+tGPV2ycx
X-Received: by 2002:a05:6000:985:b0:485:8b95:706f with SMTP id ffacd0b85a97d-4858b9570c4mr30979983f8f.13.1788958822351;
        Wed, 09 Sep 2026 06:00:22 -0700 (PDT)
Message-ID: <25c71873-9043-40c7-a514-c7cd557f91d1@suse.com>
Date: Wed, 9 Sep 2026 15:00:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/6] x86/EFI: adjust efi_multiboot2_prelude() to comply to
 Misra rule 18.2
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Content-Language: en-US
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
In-Reply-To: <c3614ea0-e5b3-4cfd-820b-9320ac327292@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1788958823-C38C1B50-5EB107AA/0/0
X-purgate-type: clean
X-purgate-size: 1446

While casting to pointer types may be more natural there, the subtraction
then ends up violating "Subtraction between pointers shall only be applied
to pointers that address elements of the same array". Use unsigned long
arithmetic instead.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/efi/mbi2.c
+++ b/xen/arch/x86/efi/mbi2.c
@@ -13,7 +13,7 @@ efi_multiboot2_prelude(uint32_t magic, c
     EFI_HANDLE ImageHandle = NULL;
     EFI_SYSTEM_TABLE *SystemTable = NULL;
     const char *cmdline = NULL;
-    const void *const mbi_raw = (const void *)mbi;
+    unsigned long mbi_raw = (unsigned long)mbi;
     bool have_bs = false;
 
     if ( magic != MULTIBOOT2_BOOTLOADER_MAGIC )
@@ -22,10 +22,10 @@ efi_multiboot2_prelude(uint32_t magic, c
     /* Skip Multiboot2 information fixed part. */
     tag = _p(ROUNDUP((unsigned long)(mbi + 1), MULTIBOOT2_TAG_ALIGN));
 
-    for ( ; (const void *)(tag + 1) - mbi_raw <= mbi->total_size &&
+    for ( ; (unsigned long)(tag + 1) - mbi_raw <= mbi->total_size &&
             tag->type != MULTIBOOT2_TAG_TYPE_END &&
             tag->size >= sizeof(*tag) &&
-            (const void *)tag + tag->size - mbi_raw <= mbi->total_size;
+            (unsigned long)tag + tag->size - mbi_raw <= mbi->total_size;
           tag = _p(ROUNDUP((unsigned long)tag + tag->size,
                    MULTIBOOT2_TAG_ALIGN)) )
     {


