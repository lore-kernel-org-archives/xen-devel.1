Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1B3C43458
	for <xen-devel@archiver.kernel.org>; Tue, 30 Jun 2026 14:06:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1348998.1606785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ6C-0005gL-DX; Tue, 30 Jun 2026 14:06:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1348998.1606785; Tue, 30 Jun 2026 14:06:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ6C-0005gE-9f; Tue, 30 Jun 2026 14:06:04 +0000
Received: by outflank-mailman (input) for mailman id 1348998;
 Tue, 30 Jun 2026 14:06:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weZ6B-0005g2-6C
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:06:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZ6A-0087sb-J3
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:06:02 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43cd3d-e002-0a2a0a5209dd-0a2a450cb83c-46
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:06:02 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43cd4a-f399-0a2a450c0019-d155dd2ec174-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:06:02 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-473dc4cf238so1388085f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 07:06:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475671d02f5sm8756652f8f.28.2026.06.30.07.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:06:00 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782828362; x=1783433162; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Sy1KCusVbxEhJSonLb4NPvm532hzrQz4ITq3H87NwNE=;
        b=XcOwk0X6oF82dmsG7nmesmFD6kkgVcbGAP8Si4u9+T7a7hx1PORkihcFK8IcACI2sp
         dX4in+M4EIxOUINwOSPSWv2eyYhMLxAsbFneYK8dZpfik0+FSXgM5XVN6ePj7aAlORFH
         8ZUcmMe7t0sU5Sa9I55TnMeeoLGKpR7ktHnUy+IjLu+hcdcE8ZafYHAxcEIQhNJyAJ2e
         /OiWzxsyCa4jWu2IYfpIsz8NHy1e3GjxQPP/C0nv6monGK86IdtxuPxLT/57wRU2495B
         VMonjCPfOthgJLqumXBRdSMI8UCqlspYnvArNdpyTpLFqemvOrAhrLHjnFGdLnfGI/BQ
         pd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828362; x=1783433162;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy1KCusVbxEhJSonLb4NPvm532hzrQz4ITq3H87NwNE=;
        b=FUlj0G3J8UxRjayZxhen7ThYv9/t/TGQ8zF9igjy2R7SakSVu8l/dV6Wn4o4q+h8Fx
         RxM4CK0CAG3nkwyGXbho7qKozraR+ck/wfaMLlngOflnebEUlvB16Kpj4OONmhmCBclM
         mJZx0x8s6Eyeup+eX9fn4gNzbdYJA+CUZQnn3F8GVyWDyLYC1i6AgeLo8Ge/+uknNexz
         Jn1IM12R9xVdhkVyEKlyR28YgOYVZTJpT8KbOUj4AK/r7YSrIiAL8+c1+U8Ct5QPiQmD
         hjwoHtxey/56Ajg1RaRdbDu6FsMAWyZ73hTuP/lhjqQiobysYxD/jmaJrs+ia4eDU/5i
         sdBg==
X-Gm-Message-State: AOJu0YwQ8Iv91ZQ4wuU+0kiU97B+/BwYxSY03Ghsrx7nYcwIUfDbSVLq
	6jaXdlDjE19sXl0PiTCEvyPfxudMWq0KwNkjVcPPUjefGltDD02gIHvnI266pvvweIFlVzJbWEN
	ZO+4WXQ==
X-Gm-Gg: AfdE7cmyBExW19MtMBnTb9AWx8Bog/jv8os0CC8ogUnZZS3EKIUrLamPZRhm3tDHFoU
	jBgJIdlxJar1xGIlVePqk59SoHzgPbzX4uhY+lvcZYT1PuKDDKYKkkFm8dlfd0IbsYCKeplNdrM
	dPIr+L6zH7ycC0LDBF180cJsgaQdiz6clHqyalcQlNvT1U0GAmthXlLw2KbWtRDRrKA1YCrNeNy
	BKJ76i5EWaESD2Bh7fmUmq04ihUEDPr0e+8ZJLGknmlA4cfaGMSNWqEILEPDrDfZax1svQ/Vtva
	OVuehhFU2x+0kfajDRSWdO8IFrOfZMfwwYAQtRGwp77AugwQiV5zUJfmmIJDD1r4Gqx6O2T1l/r
	dEldrJrE6XkEakW3uuseU0HUCptrYVpRj1YbAKBJZtaTisej6RSKt2LWbt5BY7HD65H4/US9AKD
	OPgG0gd2l8LwtnoNK5sb3Zkz577kHs/M0F5YptjKTC3q0TMuYBvQqg3Vk5EMOd48OVhSsbF57/I
	YaN
X-Received: by 2002:a05:6000:2011:b0:46d:d5da:f0aa with SMTP id ffacd0b85a97d-4755311d4bbmr4830507f8f.45.1782828361866;
        Tue, 30 Jun 2026 07:06:01 -0700 (PDT)
Message-ID: <b7513795-9e4b-4358-9d46-6c7036d64b81@suse.com>
Date: Tue, 30 Jun 2026 16:06:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/3] time: add "NOW() good" indicator
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
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
In-Reply-To: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1782828362-0EB3DD51-2E6F3598/0/0
X-purgate-type: clean
X-purgate-size: 2820

printk_start_of_line() checks for a value of 0 right now. In order to be
able to have NOW() return at least monotonically increasing values, that
needs replacing by an explicit indicator.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Arm and RISC-V may want to consider whether their initial get_cycles()
can't be moved yet earlier, such that the indicator also can be set
yet earlier.
---
v4: Add barriers.
v3: New.

--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -145,6 +145,8 @@ void __init preinit_xen_time(void)
         panic("Timer: Cannot initialize platform timer\n");
 
     boot_count = get_cycles();
+    smp_wmb();
+    NOW_good = true;
 }
 
 static void __init init_dt_xen_time(void)
--- a/xen/arch/riscv/time.c
+++ b/xen/arch/riscv/time.c
@@ -87,6 +87,8 @@ void __init preinit_xen_time(void)
         panic("%s: ACPI isn't supported\n", __func__);
 
     boot_clock_cycles = get_cycles();
+    smp_wmb();
+    NOW_good = true;
 
     /* set_xen_timer must have been set by sbi_init() already */
     ASSERT(set_xen_timer);
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2660,6 +2660,7 @@ void __init early_time_init(void)
 
     set_time_scale(&t->tsc_scale, tmp);
     t->stamp.local_tsc = boot_tsc_stamp;
+    NOW_good = true;
 
     init_percpu_time();
 
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -22,6 +22,8 @@
 #include <asm/div64.h>
 #include <asm/domain.h>
 
+bool __ro_after_init NOW_good;
+
 /* Nonzero if YEAR is a leap year (every 4 years,
    except every 100th isn't, and every 400th is).  */
 #define __isleap(year) \
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -975,11 +975,11 @@ static void printk_start_of_line(const c
         }
         /* fall through */
     case TSM_BOOT:
-        sec = NOW();
-        nsec = do_div(sec, 1000000000);
-
-        if ( sec | nsec )
+        if ( NOW_good )
         {
+            smp_rmb();
+            sec = NOW();
+            nsec = do_div(sec, 1000000000);
             snprintf(tstr, sizeof(tstr), "[%5"PRIu64".%06"PRIu64"] ",
                      sec, nsec / 1000);
             break;
--- a/xen/include/xen/time.h
+++ b/xen/include/xen/time.h
@@ -62,6 +62,12 @@ struct tm wallclock_time(uint64_t *ns);
 /* Chosen so (NOW() + delta) wont overflow without an uptime of 200 years */
 #define STIME_DELTA_MAX ((s_time_t)((uint64_t)~0ULL>>2))
 
+/*
+ * Indicator that the value returned by NOW() is good (earlier invocations may
+ * return zero or very small, merely monotonically increasing values).
+ */
+extern bool NOW_good;
+
 /* Explicitly OR with 1 just in case version number gets out of sync. */
 #define version_update_begin(v) (((v) + 1) | 1)
 #define version_update_end(v)   ((v) + 1)


