Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6597A606A328
	for <xen-devel@archiver.kernel.org>; Thu,  5 Nov 2026 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ByoTe8/S
Received: from list by lists.xenproject.org with outflank-mailman.1474698.1681694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxcl-0007pQ-Nk; Thu, 05 Nov 2026 13:35:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1474698.1681694; Thu, 05 Nov 2026 13:35:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xOxcl-0007pG-Kl; Thu, 05 Nov 2026 13:35:27 +0000
Received: by outflank-mailman (input) for mailman id 1474698;
 Thu, 05 Nov 2026 13:35:25 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xOxcj-0007n9-HE
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 13:35:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xOxci-00G3pg-Tx
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2026 14:35:24 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec8616-8faa-0a2a0a5109dd-0a2a4504cdde-14
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:35:24 +0100
Received: from [209.85.208.51] (helo=mail-ed1-f51.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aec861c-b57f-0a2a45040019-d155d033c593-3
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 14:35:24 +0100
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-6b5669a5100so2204756a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2026 05:35:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b55abd3da7sm1898289a12.1.2026.11.05.05.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2026 05:35:23 -0800 (PST)
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
        d=suse.com; s=google; t=1793885724; x=1794490524; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j1H0axRw7JFmol/inFP+mhs/4Cd3fWwbDSonZNiObFg=;
        b=ByoTe8/SJQKTKxYnPEaC500+t4yqrsLOYP+aeKkk+88AVsjTOS37Nh3IArfJ6vEXXd
         TlfNoMG3SZVT6qCjzymiMc36mTa9Kyuz+DzhXE5VfdFJGuIpifPWWouNVEQy1bhxMdHw
         QneAdAUrs1pHk7ObhwH9o62noP8j148SN0yy04mtOEPPGE6RolNMcVjWC+Ly4rmk4Rd0
         0rVPHvd81LgjcUa8yWNvSVS3HrARxDn1SfT0xtMaNRzmkhcQYlsbPHg3afkzb60M3kzS
         O1I4kllpsO2staPKD/a7y9DRWtDUESVmrHkmQGQ2U3VItratefo7WpYJaHbIBwJGSqVj
         XlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885724; x=1794490524;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j1H0axRw7JFmol/inFP+mhs/4Cd3fWwbDSonZNiObFg=;
        b=wNmDD2d3guRSoKxcmVuiHgVDGJU44v6dgAufTZCxT8PnoCucbeKo2SYW9hxLdkTxWN
         wjx6NbQUTlvQXNUFVmvELquHvFpUsJp09y01CtiB4sXqA/zTpEcx5oRwqafupFlKklUi
         pshG9XziuUgDgSjMzgxstpUg6yWG5ZRomvZwPbdqli8r/7FeSK2kFlsuupumTBy74ktt
         QI1t4s3BSXYEqPyOnAkhmmWOMAPa4MXwJjHvA23iCRdp30jffPe70v3QxtjpOyolcfe8
         WVBOXdb5fKOOlZdNpvDu88Z47D6v4VlgXS1+PIJCqa47vEoC702eUSLtMETj8PW85c6p
         ze+g==
X-Gm-Message-State: APuU4Z+pW+q//4tL0jrRL53FWAuZj2gYnHO0XMo4ptYm26QjRYD/zRFR
	vVF4jKrZt6ddzuSIi3s3uMU/NcflQuBQyhenbmWmkzhvAJMdUc1mJ9sWYHB8TcbwsFoRnpSIobi
	yxFvUbA==
X-Gm-Gg: AYBFou2NSPbvy0R9teSxI4NgGA+qMs2qJmW2XiO7rqXWVqNZPogrHc6ReqvTQ5ZyRKO
	VRiShexbUnUhMoBhfAFeAAspoZMGgXyLZ8bLkskaEOoAS8v2EQmbRZK+NltaakjZp0j/XEs3oqF
	4ESFdpGNKOz7ZmU2xKoU206aLdidpyQKi1Oz7cZmXOIy2N5c+1bxvciKV4tDYEQ2t/2/kH/DHwI
	+MTQJbgv3XrDP6P3uLo274JRQRQVL9kV66ZfdNRG3TrVK0wV0Q+v9zF55FE/RCI6MnQcwGUFfFd
	JIkBWYwBy26t63eb4TgoMyLEm9Y2c1ng3KdueZ0F69NH2ONXPnCNtEAcKb+M1JOIlkdgS+fx9zC
	iDR6R+TK6/p4FdzmyHw/V2hkHyLfkrwjxyXtLr9ByQh5q014N+6Z0pettcRqxXRTlIKYrXQZdjU
	219eTm00saogC1+Vl2pctSChZzUbyXhBWZ5wUQawfHF/HPt0IsDsXaXR9VlosAM93ZaeGkeCZhk
	wTE5ILpyXApcJG7JSQfIy5nhYL2E3UbPcZEnyidElhBRsN4h4CxG8yPxex/F3wDt6BJtDhj6uMT
	lhUK0xDBzD489bnfpt7vRm6lUxCaqMPbDKwjxCfBDBQJnp/DAuaOOOk0vCpb+qfHekm0fuWHVpG
	IycI73Jggexj9AFG6
X-Received: by 2002:a05:6402:4512:b0:6b5:7872:2d1a with SMTP id 4fb4d7f45d1cf-6b57872312emr1932887a12.41.1793885724030;
        Thu, 05 Nov 2026 05:35:24 -0800 (PST)
Message-ID: <65f0d55b-9552-45e5-8b36-bc76a73011d1@suse.com>
Date: Thu, 5 Nov 2026 14:35:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 08/14] x86/PVH: split pvh_setup_vmx_realmode_helpers()
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
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1793885724-50EDEB50-C9A51486/10/78276251493
X-purgate-type: spam
X-purgate-size: 5989
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

All E820 manipulations want to happen before the initrd is placed, or else
pvh_steal_ram() may steal from the tail part of it. While this is
currently suitably ordered, mapping the initrd directly into Dom0 will
want to happen ahead of pvh_populate_p2m(). Hence as a third step, split
placing VMX data (if needed at all) from actually populating it.

Also move the invocation of pvh_setup_vmx_realmode_helpers() out of
pvh_populate_p2m(). Make it unconditional as well, instead bailing from
the function when pvh_place_vmx_realmode_helpers() wasn't called.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Also log domain in moved printk().

--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -268,26 +268,30 @@ static int __init pvh_add_mem_range(stru
     return 0;
 }
 
-static int __init pvh_setup_vmx_realmode_helpers(struct domain *d)
+struct vmx_info {
+    paddr_t tss;
+    gfn_t identpt;
+};
+
+static int __init pvh_place_vmx_realmode_helpers(
+    struct domain *d,
+    struct vmx_info *info)
 {
-    uint32_t rc, *ident_pt;
-    mfn_t mfn;
     paddr_t gaddr;
-    struct vcpu *v = d->vcpu[0];
 
     /*
-     * Steal some space from the last RAM region below 4GB and use it to
-     * store the real-mode TSS. It needs to be aligned to 128 so that the
-     * TSS structure (which accounts for the first 104b) doesn't cross
-     * a page boundary.
+     * Steal some space from the last RAM region below 4GB to store the
+     * real-mode TSS.  It needs to be aligned to 128 so that the TSS
+     * structure (which accounts for the first 104b) doesn't cross a page
+     * boundary.
      */
     if ( !pvh_steal_ram(d, HVM_VM86_TSS_SIZE, 128, GB(4), &gaddr) )
     {
-        if ( hvm_copy_to_guest_phys(gaddr, NULL, HVM_VM86_TSS_SIZE, v) !=
-             HVMTRANS_okay )
-            printk("Unable to zero VM86 TSS area\n");
         d->arch.hvm.params[HVM_PARAM_VM86_TSS_SIZED] =
             VM86_TSS_UPDATED | ((uint64_t)HVM_VM86_TSS_SIZE << 32) | gaddr;
+
+        info->tss = gaddr;
+
         if ( pvh_add_mem_range(d, gaddr, gaddr + HVM_VM86_TSS_SIZE,
                                E820_RESERVED) )
             printk("Unable to set VM86 TSS as reserved in the memory map\n");
@@ -302,12 +306,42 @@ static int __init pvh_setup_vmx_realmode
         return -ENOMEM;
     }
 
+    if ( pvh_add_mem_range(d, gaddr, gaddr + PAGE_SIZE, E820_RESERVED) )
+        printk("%pd: Unable to set identity page tables as reserved in the memory map\n",
+               d);
+
+    d->arch.hvm.params[HVM_PARAM_IDENT_PT] = gaddr;
+    info->identpt = _gfn(PFN_DOWN(gaddr));
+
+    return 0;
+}
+
+static int __init pvh_setup_vmx_realmode_helpers(
+    const struct domain *d,
+    const struct vmx_info *info)
+{
+    uint32_t rc, *ident_pt;
+    mfn_t mfn;
+    struct vcpu *v = d->vcpu[0];
+
+    /* Bail if no space needed reserving in the first place. */
+    if ( gfn_eq(info->identpt, _gfn(0)) )
+        return 0;
+
+    /* Store the real-mode TSS, if space for it was successfully stolen. */
+    if ( info->tss )
+    {
+        if ( hvm_copy_to_guest_phys(info->tss, NULL, HVM_VM86_TSS_SIZE, v) !=
+             HVMTRANS_okay )
+            printk("%pd: unable to zero VM86 TSS area\n", d);
+    }
+
     /*
      * Identity-map page table is required for running with CR0.PG=0
      * when using Intel EPT. Create a 32-bit non-PAE page directory of
      * superpages.
      */
-    ident_pt = map_domain_gfn(p2m_get_hostp2m(d), _gfn(PFN_DOWN(gaddr)),
+    ident_pt = map_domain_gfn(p2m_get_hostp2m(d), info->identpt,
                               &mfn, 0, &rc);
     if ( ident_pt == NULL )
     {
@@ -317,9 +351,6 @@ static int __init pvh_setup_vmx_realmode
     write_32bit_pse_identmap(ident_pt);
     unmap_domain_page(ident_pt);
     put_page(mfn_to_page(mfn));
-    d->arch.hvm.params[HVM_PARAM_IDENT_PT] = gaddr;
-    if ( pvh_add_mem_range(d, gaddr, gaddr + PAGE_SIZE, E820_RESERVED) )
-            printk("Unable to set identity page tables as reserved in the memory map\n");
 
     return 0;
 }
@@ -481,18 +512,6 @@ static int __init pvh_populate_p2m(
         }
     }
 
-    if ( using_vmx() && !paging_mode_shadow(d) && !vmx_unrestricted_guest(v) )
-    {
-        /*
-         * Since Dom0 cannot be migrated, we will only setup the
-         * unrestricted guest helpers if they are needed by the current
-         * hardware we are running on.
-         */
-        rc = pvh_setup_vmx_realmode_helpers(d);
-        if ( rc )
-            return rc;
-    }
-
     if ( opt_dom0_verbose )
         print_order_stats(d);
 
@@ -1395,6 +1414,7 @@ int __init dom0_construct_pvh(const stru
     struct e820entry *orig_e820;
     unsigned int nr_orig_e820;
     struct acpi_info acpi = {};
+    struct vmx_info vmx = {};
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1456,6 +1476,22 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
+    /*
+     * Since Dom0 cannot be migrated, only set up the unrestricted guest
+     * helpers if they are needed by the hardware we are running on.
+     */
+    if ( using_vmx() && !paging_mode_shadow(d) &&
+         /*
+          * TODO: Unrestricted Guest should be a domain property, not a vCPU
+          * one.
+          */
+         !vmx_unrestricted_guest(d->vcpu[0]) )
+    {
+        rc = pvh_place_vmx_realmode_helpers(d, &vmx);
+        if ( rc )
+            return rc;
+    }
+
     rc = pvh_populate_p2m(d, orig_e820, nr_orig_e820);
     if ( rc )
     {
@@ -1486,6 +1522,10 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
+    rc = pvh_setup_vmx_realmode_helpers(d, &vmx);
+    if ( rc )
+        return rc;
+
     if ( opt_dom0_verbose )
     {
         printk("Dom%u memory map:\n", d->domain_id);


