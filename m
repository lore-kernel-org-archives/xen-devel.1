Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB50CA9ED2
	for <xen-devel@archiver.kernel.org>; Mon, 12 Oct 2026 08:24:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1445945.1661830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBKL-0002lR-9R; Mon, 12 Oct 2026 08:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1445945.1661830; Mon, 12 Oct 2026 08:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGBKL-0002lK-6G; Mon, 12 Oct 2026 08:24:09 +0000
Received: by outflank-mailman (input) for mailman id 1445945;
 Mon, 12 Oct 2026 08:24:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGBKJ-0002k9-Ud
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 08:24:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGBKJ-004glY-B8
 for xen-devel@lists.xenproject.org; Mon, 12 Oct 2026 10:24:07 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9926-2eae-0a2a0a5409dd-0a2a45099e60-2
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:24:07 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acc9927-be1a-0a2a45090019-d1558036ccf8-3
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 10:24:07 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4a168355946so13047745e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Oct 2026 01:24:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18be964dfsm267989555e9.7.2026.10.12.01.24.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2026 01:24:06 -0700 (PDT)
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
        d=suse.com; s=google; t=1791793447; x=1792398247; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7K5SMf732bv3GcurztUVEeK+Xsb62UgCzDIrcbeQvYU=;
        b=eE9vAin7MtsAdJAuz9Uq+kWVWLzO2IVy70C9sothNiSHBosUuiE1aAAPRgMl3JPYeE
         VZNgNQEQ/0LCrkSu9Ur7RafMeAtMiYbpVM8F9BeOZAvDHBMKjl/QV6D6tji7BZmUwjc2
         W5AlYW7t/WgHsGp9/ocvD9n32O5V10tr4Xtwko8erwA7z1mjtakAHojWpLQXMehS5A16
         H2ZgcM38UGGNDnfT0U2mURujRMUymcuYjwoNzDEfqA2dK3pVOVS5P1zgQV7otYPYIFtq
         jO6i2QCXDPIuvOKYGTGXurGbZ6aC0m/M+MX8qDLyXgiLHNxtiaKCvhyhQZ+YiLdSlniU
         /G9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793447; x=1792398247;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7K5SMf732bv3GcurztUVEeK+Xsb62UgCzDIrcbeQvYU=;
        b=D4Lh8cZcg7ONR7VtkK6EsmdQchOqnO+sMLyrSVHqjETkKhsrPKLTVJ0BUXQc04sZoh
         djc1B++9sDveuU5dkBZZpIZt5yoG8/VuQtYG6LD1v8ZFpfMHN5K+9oQr/oxoZmfbq2ht
         hKyK4g+rRJ7b2mFGRUr+4mZZy2OF5mEXRnzpgaYKWyhISNFZn2W2hw78YKxHsL0VF3eQ
         G8jwRd3mCF3cGoW9pW50IrD14FtM5gdHk7ZsCW6V5BtQrNKC/U12K9Cz8aMaLTVNauL0
         gl2QmgnYNuZtU8SbotEI+S6VI4akLbVcHD9zo5dhCknJmUKF7OWfqykM/ius2Dp4o1Uw
         PvpA==
X-Gm-Message-State: AFq9FYLhZCIOxxeuRRzELPPpJFVP5x4fR8ulfcwoGhpd+UZd9HfmdGBj
	4JOFlCX0Pvt8+KeNOFaPmiwnx5vdTyIAHKO88v6g1CqgjUH0bufVoa6MCMaRwOWpwKLv3YnSZ+V
	HR7hoMw==
X-Gm-Gg: AYBFou03cbSBFzLq2FiDBA/hV8wRuKrIbOvHpgtccmGbYaVOG9uUkBRDPjSNinwMFZd
	75b2+K05sh66OCYW3heQajTtiOyGw6T/5qROOFTeVoZm383d/pum8sgAWWyJnjB6zjQ8B/EtOHz
	f70i0fxfVX7YIdCEyrWd/G4HBL00tFT831q8nhzmrJSRlNYsF/O97LJB8xlZ/tzJ6weBO9M6+XK
	hqj/vbccFseIUmmeX3w9+6Gc8zI6+kAVQkE/ZWVBPTrCDHuFd2g7skzIJ+p+a09Yyw/ryhWh3D3
	uHIhXQ0+pfWn4qo4FphniTbPJ26ZQv+zpEk3w6jO6vimKyjerfe6b6hnNfvx8H27NB7sQTr7cK6
	trZ0646HqBR0OBgVjtsUsWl7iGNHxnB/AxrAvj+FTeHRscywvalUVthEUKPfVP2JnI7dnahFmRY
	CzaFSJsVN7ZQTNS1DlgtYjgdNQwhc63g71dqIbYempuEJYxDKJLMTc8qrXLQEEHNqmS9/qKjb+G
	WMb5ZRd28oMoeMe8EG53ZRbndHEkXRTfZrgUKUqiqAmr9GbEQTlXcpylhlQ7zxPfs6xnUj4
X-Received: by 2002:a05:600c:a112:b0:4a1:9663:7633 with SMTP id 5b1f17b1804b1-4a1966379f7mr80180095e9.11.1791793446614;
        Mon, 12 Oct 2026 01:24:06 -0700 (PDT)
Message-ID: <e2a520da-9dcf-4e04-9e17-add8b12d9a0d@suse.com>
Date: Mon, 12 Oct 2026 10:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 09/15] x86/PVH: split pvh_setup_vmx_realmode_helpers()
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
X-purgate-ID: tlsNG-bad1c0/1791793447-FDC6D034-51FCC69A/10/78276251493
X-purgate-type: spam
X-purgate-size: 5911

All E820 manipulations want to happen before the initrd is placed, or else
pvh_steal_ram() may steal from the tail part of it. While this is
currently suitably ordered, mapping the initrd directly into Dom0 will
want to happen ahead of pvh_populate_p2m(). Hence as a third step, split
placing VMX data (if needed at all) from actually populating it.

Also move the invocation of pvh_setup_vmx_realmode_helpers() out of
pvh_populate_p2m(). Make it unconditional as well, instead bailing from
the function when pvh_place_vmx_realmode_helpers() wasn't called.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -302,12 +306,41 @@ static int __init pvh_setup_vmx_realmode
         return -ENOMEM;
     }
 
+    if ( pvh_add_mem_range(d, gaddr, gaddr + PAGE_SIZE, E820_RESERVED) )
+        printk("Unable to set identity page tables as reserved in the memory map\n");
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
+            printk("Unable to zero VM86 TSS area\n");
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
@@ -317,9 +350,6 @@ static int __init pvh_setup_vmx_realmode
     write_32bit_pse_identmap(ident_pt);
     unmap_domain_page(ident_pt);
     put_page(mfn_to_page(mfn));
-    d->arch.hvm.params[HVM_PARAM_IDENT_PT] = gaddr;
-    if ( pvh_add_mem_range(d, gaddr, gaddr + PAGE_SIZE, E820_RESERVED) )
-            printk("Unable to set identity page tables as reserved in the memory map\n");
 
     return 0;
 }
@@ -481,18 +511,6 @@ static int __init pvh_populate_p2m(
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
 
@@ -1402,6 +1420,7 @@ int __init dom0_construct_pvh(const stru
     struct e820entry *orig_e820;
     unsigned int nr_orig_e820;
     struct acpi_info acpi = {};
+    struct vmx_info vmx = {};
     int rc;
 
     printk(XENLOG_INFO "*** Building a PVH Dom%d ***\n", d->domain_id);
@@ -1462,6 +1481,22 @@ int __init dom0_construct_pvh(const stru
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
@@ -1492,6 +1527,10 @@ int __init dom0_construct_pvh(const stru
         return rc;
     }
 
+    rc = pvh_setup_vmx_realmode_helpers(d, &vmx);
+    if ( rc )
+        return rc;
+
     if ( opt_dom0_verbose )
     {
         printk("Dom%u memory map:\n", d->domain_id);


