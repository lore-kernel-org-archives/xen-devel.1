Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA91B606A31B
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=JAPmU/8Q
Received: from list by lists.xenproject.org with outflank-mailman.1474745.1681749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxes-0002a2-9X; Thu, 05 Nov 2026 13:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474745.1681749; Thu, 05 Nov 2026 13:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxes-0002Zu-6Q; Thu, 05 Nov 2026 13:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1474745;
 Thu, 05 Nov 2026 13:37:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxeq-0002Uh-Iw
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:37:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxep-009r25-VL
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:37:35 +0100
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8693-8faa-0a2a0a5109dd-0a2a45098b76-32
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:37:35 +0100
Received: from [209.85.218.42] (helo=mail-ej1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec869f-be1a-0a2a45090019-d155da2addfa-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:37:35 +0100
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-c4301e334ceso156481066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:37:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d0e140fa1sm175042366b.7.2026.11.05.05.37.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:37:34 -0800 (PST)
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
        d=suse.com; s=google; t=1793885855; x=1794490655; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d2sVV/P+QXxHkGFl11/0QW1t/tIUxIiQ/ud1zR58BTo=;
        b=JAPmU/8QmXClX04VDJIOf3Gc11Dw56l0PzdkPwXK55tU7a8TKY/gArItxyPDQMrL8R
         7OV1Y+jUUKQRiy5JRIDVpuY9ZtVnfhOGOWEdPpVDTTSI43wyOyl/3EtuvbVBt3b0BlJz
         Vz35bgl7T1ZHHd1cjUiKLjDsbO1yxu35u/foaKRt6ufx8gqjhCafUM2uMg7ROo+RV+Jg
         TkKFgdMsPXQK+R/wt58atgmVjU3FYoAhnP6lb6pZRTVZEEaXiPiFGhkuQhAytIXXiLDI
         mvevYgCWYUArkNkBeEdUr684Zs7TNExsVjCOw/kgVT91wFiDlccKIQYMmzLZMujzLN4d
         mDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885855; x=1794490655;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d2sVV/P+QXxHkGFl11/0QW1t/tIUxIiQ/ud1zR58BTo=;
        b=ayYeyaBaBSYH7avriiFXRNVd3seM8+XNKhuV161BOPWsjIbpDtAGgw4s2SEz3B3iFn
         7Qeb/7rNJYa3sMIwrIPJRrAnUlSZX7XciwZGz2qT1FrwB6Df+nZXlGTl2A7NIZ+awr4c
         gmva6LBv5vcBGiYHoGED8GNi81P26U3gYE3GFO3X57+F1DDjn0ftmPjNKzWAaCw679/C
         YroneyKNVne/d0ZhlsAl3Y/+1RYCS5f0uGphptEMIn53amzJlXFOHoU7MvlRMRkmcLwn
         h79+tz25+nJOD1r+pldzY8y9BGrSPEiTHnMFWdliazKlope64Wql2EDnt++J5VE3Q2qK
         /Zjg==
X-Gm-Message-State: APuU4Z8CT9zYoE+ilDX1dHVvn8P4jlXNhWcpNbWMQD1v3VaJKg7TlT2M
	FlZ5hTQcZ6/gtDZAjfNfVrP92DymJZ1V3t2Eb4qlBYhBjaDp5wD8j6/nYL5saC435os/AE2bG+e
	OGoleHA==
X-Gm-Gg: AYBFou0SoCrSEklJOuu347/usnEIDRtJlM9yl48kBSNeP3xKQrGrHcCzX2OsEIEJgCK
	ULcif38IbQCAkvm0Wz88o9MQ/vX6CoJtbM5q+Smw1XQCMyrfJA6FhnSyl5HKHTQh68Hxbl+G+oN
	O0jyLYCHUrg3vRcNs4+H/1R/DyXtd+PdvQ9Q6WzjlK8L/IDzu1O0rIpFCVEXb9dvTYT6ODd6Oke
	cS4NOnieNyfGza9rgiyDQkKJdTy1geCCQIZByODrSb19zxAq1RQp1NJtJyDZUUphrelSOMJR78f
	JDMcNYTsJ8Io0AD2QIQt8K+B9TiEkXvfEYDWBtplWfaTLHogytG55VpdtzwN5NCgM5DJP+IPTFg
	jJTQtUsSJEi3rUG7lSEvn3BfkfIk2YXh3g2GH/8KoBHTbAZIqhdtn/BMFYr3YpyWkMKL1QlMuMQ
	u2rVOhx3v0wcvxp0JQ0KzaWtwgux7TDRV44Zlw8sNciuKwtLsWhFd+dMOxYBD6+q05tJwc/3mBr
	rQ503DM6SA/cabGfi8u0/PVM8g573r05uTdohbmWU3eF551xD78NPVYONQNz4UVIGBnnkCdoxq1
	HZYpF3tqwDHM4bqi7iSGMeoErVBdO5EH9yeUunnLFNKDlZ44x0j58oWsBrXfXeuYbu5OdbfU2vx
	5dc3ACh8VQ6rs+pc=
X-Received: by 2002:a17:907:1c8e:b0:c49:c76f:dad4 with SMTP id a640c23a62f3a-c4ca7a6e69fmr1735171766b.31.1793885855282;
        Thu, 05 Nov 2026 05:37:35 -0800 (PST)
Message-ID: <96282903-34bf-4395-9a1f-a9828ab7ac3e@suse.com>
Date: Thu, 5 Nov 2026 14:37:34 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 14/14] x86/PVH: check Dom0 start_info for truncation;
 adjust entrypoint type
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
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
In-Reply-To: <a1f88104-14ae-400c-b950-163d5a7e552b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1793885855-BF4D3034-40E60711/10/78276251493
X-purgate-type: spam
X-purgate-size: 2204
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

While for start_info we now (supposedly) guarantee that it lives below
4Gb, check it nevertheless to play/stay safe.

For the entrypoint address the situation is different: libelf already
hands us a 32-bit quantity; if there was truncation there, it would be
inside libelf (when extracting the value from the ELF notes). Reflect
the 32-bit-ness in types used.

Requested-by: Roger Pau Monné <roger@xenproject.rog>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -798,7 +798,7 @@ static bool __init check_and_adjust_load
 static int __init pvh_place_kernel(
     const struct boot_domain *bd,
     struct elf_binary *elf,
-    paddr_t *entry)
+    uint32_t *entry)
 {
     struct domain *d = bd->d;
     struct boot_module *image = bd->kernel;
@@ -1097,7 +1097,7 @@ static int __init pvh_load_kernel(
     return 0;
 }
 
-static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
+static int __init pvh_setup_cpus(struct domain *d, uint32_t entry,
                                  paddr_t start_info)
 {
     struct vcpu *v = d->vcpu[0];
@@ -1123,6 +1123,13 @@ static int __init pvh_setup_cpus(struct
         .cpu_regs.x86_32.tr_ar = 0x8b,
     };
 
+    if ( cpu_ctx.cpu_regs.x86_32.ebx != start_info )
+    {
+        printk("%pd: start-info address truncation: %p)\n",
+               d, _p(start_info));
+        return -ERANGE;
+    }
+
     sched_setup_dom0_vcpus(d);
 
     rc = arch_set_info_hvm_guest(v, &cpu_ctx);
@@ -1640,7 +1647,7 @@ static void __init pvh_setup_mmcfg(struc
 
 int __init dom0_construct_pvh(const struct boot_domain *bd)
 {
-    paddr_t entry, start_info;
+    uint32_t entry;
     struct domain *d = bd->d;
     struct elf_binary elf;
     struct e820entry *orig_e820;
@@ -1649,7 +1656,7 @@ int __init dom0_construct_pvh(const stru
     struct acpi_info acpi = {};
     struct vmx_info vmx = {};
     struct hvm_modlist_entry initrd = {};
-    paddr_t blob_start, blob_end;
+    paddr_t start_info, blob_start, blob_end;
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);


