Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60532606A32E
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 09:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=BPXZUEu2
Received: from list by lists.xenproject.org with outflank-mailman.1469375.1678204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBAm-0002Ag-8C; Tue, 03 Nov 2026 09:51:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469375.1678204; Tue, 03 Nov 2026 09:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOBAm-0002AZ-4m; Tue, 03 Nov 2026 09:51:20 +0000
Received: by outflank-mailman (input) for mailman id 1469375;
 Tue, 03 Nov 2026 09:51:18 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOBAk-0002AR-AY
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 09:51:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOBAj-002A4j-NS
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2026 10:51:17 +0100
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ae95-e002-0a2a0a5209dd-0a2a450a8404-2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:51:17 +0100
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae9ae95-f2d2-0a2a450a0019-d155802cd134-3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 10:51:17 +0100
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4a214c5c4c0so35078295e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Nov 2026 01:51:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b2a555e59dsm49728195e9.0.2026.11.03.01.51.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Nov 2026 01:51:16 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793699477; x=1794304277; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CxZOvHrfLcUpgm8GUFz5tIPN2W3obHHozpp1et7VvfA=;
        b=BPXZUEu2SSxz/T5H0apoAhPxlB6yHPHmDlqz95nDymsNKV9ftiG9I2hACk38wvYX85
         pYAPrCnHtaYX0XK7WdbzWQyJSaqHfYsbbHwuzBjn7s+EXDgWTOv9rrr+lcFypLmbC7Lt
         1lzTfSFiOdn9QJmrs2FzyJGHOP+UCrGrkm2G/yLwO1pX4NHsdpRctX1XDa6Pcdk74dd3
         7WnJSSQCEQ1NX3yQ0MUVjQWPPqaT6tYdMrpQgfWAUIQQ7rxvwge++dkDE/nS/y6emMuf
         9j+Tt8KzW9sVWU3YuIhLPHpTMcKfSM34CKriCR3HXB+m2Y2S0oQJUGpELVBxRNJ4eZ96
         4mGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793699477; x=1794304277;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CxZOvHrfLcUpgm8GUFz5tIPN2W3obHHozpp1et7VvfA=;
        b=KuzTVJGTgDnhv5+QWlGLF3XhhnGWnpJiErvnIrJLjaTj2SwHif52X1HzrbaxfZPkVE
         G2wF6YewU6XotPEX586snIK1BWe/Rz5EitWzWYF3kxGNbhJZt65UfRBuHXZhhN+rOs4B
         7p5lfO2efnzrH1HYRYwOqywvanhzl/m5ZPEW2d/CJVfXSQCvzop5Qflre9t0pdCnlDE5
         NPrAIpwUsHXUOw/SKG7fDki4SIcRDu1wmXuRRR+wbqo/ZoCOMmUrbN+G8xpPhWuInsS3
         6eMwhlRxn1RjHjghgWZ1ilwI7rMY5Fz3EhG0WNTv5RKaFNHOWQHiBQ6jnvQWrlX6YgLR
         17nw==
X-Gm-Message-State: APuU4Z8ncc5k1hWCSgh1RHjzdrAOWV9Rct82ZTRKq1jgTAUTmGgCPp7v
	njPvj+zn89BMY1HgsT7pIA0BBmlPkx5JjZ2zExE4iNQGAm+9OAdfveBoy7atrf4VKuhFXQw8JjI
	JPTB1nw==
X-Gm-Gg: AYBFou1nSftfUPUWwTY5LfmzMx3e083J25ZrAmbCMvU/IOW6kFWf9r6CP14tZjxzz3d
	BVY/L486plRlUyADaotk575sUe07DnlIAIfUZiM/4VcAvhhGcxNnSkOLYcVXWZXiiKm/f1Qk/4U
	zpPAesdgTghv+32QCvwAIzdtXG11GLBTkt3/z6MUFRF+aj22h6D47/MGDf5BhelaBOdBpO0YCk7
	b78U6rl0zWvaVrOjVoM76E2eAk3lWN7qppoDOmSyQfzxugKYzPu/pZZpUZy2WLW9xxy2fZla6AJ
	m1QgG4ZXMgTL5uj0N6ceh3leTdSUSA8omZwCw0POWj2QKPyRKZ34XwtUYyH5TLJYyrwX9KOKGRZ
	DbaIfn4WtMZJDilCjbD+EaHo8O0+018NaQEoZTB+eJsbuf/bzB+Ipks+KGG7MK9cczQsz+xcCH2
	YhBNlJM5AfYGAlvGy10BRzl/rSWHjvotleWR5/qLBIgoo/XzCO4oBsrxILc+CEDllzIbTs3WYxi
	F12esM88hW3p3+rGR/qegddu2utxTt1Cpf1vjy/3jafX05/KpZ8VV/+rIFB+mgG1dvZ+s+0ThEr
	B88WzH68HWaME01yTeLZFW7UYMCD2BZ4SnA7LR1sjfEio+kgvl69pw+JBUnas0Xu+o27OFjzr+G
	PnkM7dQzTlD4hp8Q=
X-Received: by 2002:a05:600c:6208:b0:4a2:397:73fd with SMTP id 5b1f17b1804b1-4ac182dc32cmr288603955e9.12.1793699476975;
        Tue, 03 Nov 2026 01:51:16 -0800 (PST)
Message-ID: <013f0876-9911-4ec0-9c66-4f271b0415a7@suse.com>
Date: Tue, 3 Nov 2026 10:51:15 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] x86/MCE: reduce number of MSR reads/lookups
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Peter Deggendorfer <pd@cortex-media.de>
References: <beb9293a-e93e-4965-96d0-43df23b33c32@suse.com>
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
In-Reply-To: <beb9293a-e93e-4965-96d0-43df23b33c32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-4011c0/1793699477-5A5DBCFC-38D6BDAE/10/78276251493
X-purgate-type: spam
X-purgate-size: 4702
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MSRs mcheck_mca_logout() already reads don't need re-reading by functions
it calls, even less so when it calls them exclusively. Seeing reports like
[1], this also makes sure that what we use internally also is propagated
to the MCE log.

While touching function signatures, also switch bank number parameters to
unsigned int.

[1] https://lists.xen.org/archives/html/xen-devel/2026-10/msg01825.html

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
mcheck_cmn_handler()'s read of MSR_IA32_MCG_STATUS could likely also be
dropped, by having mcheck_mca_logout() provide the value it read.

--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -138,12 +138,8 @@ void mcabanks_free(struct mca_banks *ban
     xfree(banks);
 }
 
-static void mcabank_clear(int banknum)
+static void mcabank_clear(unsigned int banknum, uint64_t status)
 {
-    uint64_t status;
-
-    status = mca_rdmsr(MSR_IA32_MCx_STATUS(banknum));
-
     if ( status & MCi_STATUS_ADDRV )
         mca_wrmsr(MSR_IA32_MCx_ADDR(banknum), 0x0ULL);
     if ( status & MCi_STATUS_MISCV )
@@ -165,7 +161,8 @@ const struct mca_error_handler *__read_m
 unsigned int __read_mostly mce_dhandler_num;
 unsigned int __read_mostly mce_uhandler_num;
 
-static void mca_init_bank(enum mca_source who, struct mc_info *mi, int bank)
+static void mca_init_bank(enum mca_source who, struct mc_info *mi,
+                          unsigned int bank, uint64_t status)
 {
     struct mcinfo_bank *mib;
 
@@ -179,20 +176,20 @@ static void mca_init_bank(enum mca_sourc
         return;
     }
 
-    mib->mc_status = mca_rdmsr(MSR_IA32_MCx_STATUS(bank));
+    mib->mc_status = status;
 
     mib->mc_bank = bank;
     mib->mc_domid = DOMID_INVALID;
 
-    if ( mib->mc_status & MCi_STATUS_MISCV )
+    if ( status & MCi_STATUS_MISCV )
         mib->mc_misc = mca_rdmsr(MSR_IA32_MCx_MISC(bank));
 
-    if ( mib->mc_status & MCi_STATUS_ADDRV )
+    if ( status & MCi_STATUS_ADDRV )
         mib->mc_addr = mca_rdmsr(MSR_IA32_MCx_ADDR(bank));
 
-    if ( (mib->mc_status & MCi_STATUS_MISCV) &&
-         (mib->mc_status & MCi_STATUS_ADDRV) &&
-         alternative_call(mce_callbacks.check_addr, mib->mc_status,
+    if ( (status & MCi_STATUS_MISCV) &&
+         (status & MCi_STATUS_ADDRV) &&
+         alternative_call(mce_callbacks.check_addr, status,
                           mib->mc_misc, MC_ADDR_PHYSICAL) &&
          (who == MCA_POLLER || who == MCA_CMCI_HANDLER) &&
          (mfn_valid(_mfn(paddr_to_pfn(mib->mc_addr)))) )
@@ -211,14 +208,13 @@ static void mca_init_bank(enum mca_sourc
     }
 }
 
-static int mca_init_global(uint32_t flags, struct mcinfo_global *mig)
+static int mca_init_global(uint32_t flags, struct mcinfo_global *mig,
+                           uint64_t status)
 {
-    uint64_t status;
     int cpu_nr;
     const struct vcpu *curr = current;
 
     /* Set global information */
-    status = mca_rdmsr(MSR_IA32_MCG_STATUS);
     mig->mc_gstatus = status;
     mig->mc_domid = DOMID_INVALID;
     mig->mc_vcpuid = XEN_MC_VCPUID_INVALID;
@@ -331,7 +327,7 @@ mcheck_mca_logout(enum mca_source who, s
                 mig = x86_mcinfo_reserve(mci, sizeof(*mig), MC_TYPE_GLOBAL);
                 /* mc_info should at least hold up the global information */
                 ASSERT(mig);
-                mca_init_global(mc_flags, mig);
+                mca_init_global(mc_flags, mig, gstatus);
                 /* A hook here to get global extended msrs */
                 if ( IS_ENABLED(CONFIG_INTEL) &&
                      boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
@@ -351,7 +347,7 @@ mcheck_mca_logout(enum mca_source who, s
             /* uc = true, recover = true, we need not panic. */
             recover = alternative_call(mce_callbacks.recoverable_scan, status);
 
-        mca_init_bank(who, mci, i);
+        mca_init_bank(who, mci, i, status);
 
         if ( mce_callbacks.info_collect )
             alternative_vcall(mce_callbacks.info_collect, mci, i, status);
@@ -359,7 +355,7 @@ mcheck_mca_logout(enum mca_source who, s
         /* By default, need_clear = true */
         if ( who != MCA_MCE_SCAN && need_clear )
             /* Clear bank */
-            mcabank_clear(i);
+            mcabank_clear(i, status);
         else if ( who == MCA_MCE_SCAN && need_clear )
             mcabanks_set(i, clear_bank);
     }
@@ -548,7 +544,7 @@ void mcheck_mca_clearbanks(struct mca_ba
     {
         if ( !mcabanks_test(i, bankmask) )
             continue;
-        mcabank_clear(i);
+        mcabank_clear(i, mca_rdmsr(MSR_IA32_MCx_STATUS(i)));
     }
 }
 


