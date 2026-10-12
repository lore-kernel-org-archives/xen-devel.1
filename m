Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178CDCA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:20:33 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445909.1661776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBGd-00086G-K8; Mon, 12 Oct 2026 08:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445909.1661776; Mon, 12 Oct 2026 08:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBGd-000869-Gz; Mon, 12 Oct 2026 08:20:19 +0000
Received: by outflank-mailman (input) for mailman id 1445909;
 Mon, 12 Oct 2026 08:20:17 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBGb-00085j-L6
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:20:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBGb-008dPg-1h
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:20:17 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9836-e002-0a2a0a5209dd-0a2a4505db12-28
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:20:16 +0200
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9840-4cb1-0a2a45050019-d1558030b1f5-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:20:16 +0200
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a061a13884so13544685e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:20:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9463230sm19785814f8f.1.2026.10.12.01.20.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:20:15 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793216; x=1792398016; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sfs9vuHfnurXyzPhSvFEZTPE91v+YY4wNKDoi7B1ZQk=;
        b=GKFPipOiLJ9pR56Q7zgEGV8R6CF/z42vKn/KHW1IGo0Lm5QguLjDlKK2BI4ZkIfFz1
         5yithxvREin3J2HDLe45Ih2oPaihZ/N7y5XBPXwPCcTo9h/0kQJjkpBUOkIp+/taDWlk
         6/zZ++YNM/5PpawBVN2HeGOKs7GqUP7jWUerg9FcLCmAQcQG5GRSxEmC5ZaR7C6XKiyK
         uj+X9/rH30yrwR9SQXy+/hIoYEKQrSyEec6Z3MGnt4adgXaoABhh63KqqYrhcQebeVc4
         TnjruipbCdUXFGi8dkZav8aPq0oJX+Hr1QuGt8aoa2dPa5SJlV6g2U9vR7xQnGJQL7iN
         hxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793216; x=1792398016;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sfs9vuHfnurXyzPhSvFEZTPE91v+YY4wNKDoi7B1ZQk=;
        b=A75Q6B7jx2YwV11uNQbKcQeYz5faRibzf9mWlPI3YvHJ0mT4fupGcXP8y7BJ+QhwUA
         T1LOZjEDlU+hoihxgsVxd01sVQQ6WJbN90K2fwuughd4Fso1Ak3l/7FrAGG2kzOrpBlQ
         r93X6Mhy5mRBUIipSXOx6BTZy8UlVENRhLCjTUmtD185Tg/Ox9rke80BxAdhGa4VVSkO
         HoBhiSKfS+U4UqdPR1OPE+6NVRI0NKDf2nppj48yx+wYQuAX2llTattPQ9g62ezOwVFs
         DoKbw5xRrQANr6qFwPAU7gu/RuTuAgPo2hJ7Ln+NPLf64RCVE62x3n0QnJ5B8kcpm0ui
         eNYw==
X-Gm-Message-State: AFq9FYIb5dSaq2c47fiDksL3F5sE0qnZFkWwJbU5ZYfPbDhw64awQ+/3
	UGPzG2o4OQ/bQjO4lto6yZkAr6V65ocUrEIYlEKRs5OaDt24FPEOfwFGW/IGL6urPvsomqx51RP
	F8UoKpQ==
X-Gm-Gg: AYBFou38PSPUN5L43712cvUtG/FqYhRauwaO82+GCE5DtFeSiQGI0hOd2Qm5aUJZad/
	rG3W2L2KzVVGoWNBIv+NDF776lFQottN4vO4t03CM9uSbDxZLynOo4igXKPc2zzd5SntHQ+Izc5
	oXQ1Ktw382j3yrlmJt7aKXqccHBLPK0knA/jHT9oABo+YRx63x6kr+ty+UqTQ32CRp0exprH+UY
	sUyZSgnuQ/dbVPGEZgPNVL571A5leUYvLrlZWYjV95kjHY+Bq3j29j2QXEvE3nzZwq7ZFa0lJVg
	EXD4/5R1p8nvG1YDsuGNQVrwvorV5Ly7Cdg4rDs5tGInuiebg3T4Jg87Dm4a6iA5/1BLG7bcNmn
	P7TiCjvKogQ4bZixxO4jkA3pLXfq3S21HEP39lobjZi5HPwmNAy1sH2M1/9lYV/skowhF1JguKj
	sU5aD57Uv66wDh7LOtZfjIkazVMtEixam7v+aryfyb2QosztG6EichCtlsbT8Ywdj54CrbM9ONx
	TeB+rd6upZOe/ocp2DgOyp8+uPeJ7IXjdY0JwQcUEdkMOmCl5eH8YobYVWBrIo=
X-Received: by 2002:a05:600c:3ba5:b0:4a1:70d4:c69 with SMTP id 5b1f17b1804b1-4a18e4c03bbmr187729245e9.28.1791793216076;
        Mon, 12 Oct 2026 01:20:16 -0700 (PDT)
Message-ID: <d1a67360-838e-4d9b-8b91-1ebfd9e6f613@suse.com>
Date: Mon, 12 Oct 2026 10:20:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 03/15] x86/setup: break out E820_RAM accumulation
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
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
In-Reply-To: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1791793216-F58AE2A1-D6C71979/10/78276251493
X-purgate-type: spam
X-purgate-size: 2452

We already have two instances of this, and we're about to gain a third.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1007,6 +1007,17 @@ static unsigned int __init copy_bios_e82
     return n;
 }
 
+static unsigned long __init nr_ram_pages(void)
+{
+    unsigned long nr_pages = 0;
+
+    for ( unsigned int i = 0; i < e820.nr_map; i++ )
+        if ( e820.map[i].type == E820_RAM )
+            nr_pages += e820.map[i].size >> PAGE_SHIFT;
+
+    return nr_pages;
+}
+
 /*
  * Calculate the maximum possible size of the dom0 cmdline.  Pieces of the
  * dom0 cmdline optionally come from the bootloader directly, from Xen's
@@ -1139,7 +1150,7 @@ void asmlinkage __init noreturn __start_
     struct cpu_info *info = get_cpu_info(), *bsp_info;
     unsigned int initrdidx, num_parked = 0;
     struct boot_info *bi;
-    unsigned long nr_pages, raw_max_page;
+    unsigned long raw_max_page;
     int i, j, bytes = 0;
     unsigned long eb_start, eb_end;
     bool acpi_boot_table_init_done = false, relocated = false;
@@ -1491,11 +1502,7 @@ void asmlinkage __init noreturn __start_
     memcpy(&boot_e820, &e820, sizeof(e820));
 
     /* Early kexec reservation (explicit static start address). */
-    nr_pages = 0;
-    for ( i = 0; i < e820.nr_map; i++ )
-        if ( e820.map[i].type == E820_RAM )
-            nr_pages += e820.map[i].size >> PAGE_SHIFT;
-    set_kexec_crash_area_size((u64)nr_pages << PAGE_SHIFT);
+    set_kexec_crash_area_size(nr_ram_pages() << PAGE_SHIFT);
     kexec_reserve_area();
 
     for ( i = 0; i < bi->nr_modules; i++ )
@@ -1862,14 +1869,10 @@ void asmlinkage __init noreturn __start_
                         (unsigned long)__va(__pa(__2M_rodata_end)),
                         PAGE_HYPERVISOR_RO);
 
-    nr_pages = 0;
-    for ( i = 0; i < e820.nr_map; i++ )
-        if ( e820.map[i].type == E820_RAM )
-            nr_pages += e820.map[i].size >> PAGE_SHIFT;
+    total_pages = nr_ram_pages();
     printk("System RAM: %luMB (%lukB)\n",
-           nr_pages >> (20 - PAGE_SHIFT),
-           nr_pages << (PAGE_SHIFT - 10));
-    total_pages = nr_pages;
+           total_pages >> (20 - PAGE_SHIFT),
+           total_pages << (PAGE_SHIFT - 10));
 
     /* Sanity check for unwanted bloat of certain hypercall structures. */
     BUILD_BUG_ON(sizeof_field(struct xen_platform_op, u) !=


