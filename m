Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC78CC44515
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2026 08:55:28 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1366305.1616190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljmK-0007aL-8F; Mon, 20 Jul 2026 08:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1366305.1616190; Mon, 20 Jul 2026 08:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wljmK-0007aE-4X; Mon, 20 Jul 2026 08:55:12 +0000
Received: by outflank-mailman (input) for mailman id 1366305;
 Mon, 20 Jul 2026 08:55:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wljmI-0007Zv-Bq
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 08:55:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wljmH-0062A2-I6
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2026 10:55:09 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5de25b-e002-0a2a0a5209dd-0a2a450cdcf6-46
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:55:09 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5de26d-f479-0a2a450c0019-d155dd35dcb5-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 10:55:09 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-474560436c3so4827880f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2026 01:55:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eea8afsm29365479f8f.33.2026.07.20.01.55.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2026 01:55:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784537709; x=1785142509; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rmJ+M9GkQtLvSF4zOF81Z8C/mlEyAL29S16dnHYdL3Y=;
        b=IjWxwRgSEQq3Ja8svQ3jXctguBsovM/i2ScziZ3jYS+sRrVW3mAWTUcx2cn1Z3IRc8
         MGhtdSLikPU2bAbku+R45s2sKunexyaCKdoBXvoVBgOeA6ZuTUaX5JQj5bZQj09URTOL
         mA3or7iuksgI16e6cJE5X8m/5Ayyjj1Pft8M+AxVml7wvLKhjEDPiXMtSWD9DbtATgHm
         D84ucKINdQJR+MIbwXsG60eXnHOpgJvLM+GLiXo1oBUxhz1PpUvAKd4uBVqWreQs6fvB
         qZU4JnDCQkF2axyIcUFkNkGE69oqQBGPFFtAKjMnH6RSWpOmg/6Klxv34ZFczX2uTozx
         9Vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784537709; x=1785142509;
        h=content-transfer-encoding:content-type:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rmJ+M9GkQtLvSF4zOF81Z8C/mlEyAL29S16dnHYdL3Y=;
        b=D32pz3T5KbZ++i9IAJf3STeLaDwCegYzPzuQIjupg6AEWGwCcUv6VRzMNGHSM0V2Wn
         O2IonW4Ioy3cmKHsmiN97iHfyldwAkYPd1WMexg422qDKotppLjxrOK/Kx4LcyJkmKTT
         0PeCwg8nR5rRVjjDwgU4oztFnOd6WbiI7lCGnA8Fc9qvGU3Cp7pDtuZrARy3Z6jR/Y2h
         enzTFU3Jyp/jfkb0b6CO2Z1Ty1tGEohg4S7pVKojoSTFL6ou8a4pPrXP6NL5ZY7VrXHx
         LFGdiPbbR5Uc2pwaBFyGU1I4taYj+FEKlRxHvaJVMbJB+Q4V3ACj/AO7vGSLaaVXmcph
         dptg==
X-Gm-Message-State: AOJu0YzH/4lg0Hswc08iSxAV02aEkpaMCzaIlsWg9JOCbO2/rrO0NKoG
	7QYe7Q4dd9RxE88up3U00UyNKKd1cL5H/jZoJk73qTE/r80ruq+QO9GSlofUYcL2J5W7bVxJFHH
	W0lp9OA==
X-Gm-Gg: AfdE7ckpM9gLfOlyp4IrMSX7QUQssQKHzonY5T250f5xoIhFENJAz/J7gFGCMEQTMru
	Fbm9emQG+M1cfcoSFX8yf9HuSpnoBpOMmZz13MPy6kFouaFNJWe+UsoCmYDO7Mmp9Bnxx44cP8M
	EZ5TfVejbiIDMTX2QYZKzRFPvc/nsjRdOpzYkFgBqyhBsyadwg/p3qK8Eho+HgXBz/gykoIzaHS
	kQ+gEMg/hdvg2GwIpgQ/dF/Za6O4eFHQ65rssWL5R3hwDoODI9c/79ycMvgXbXQvrvPMWchpiiR
	deEclVIeQmwQTmfqayjm7mAC7WC6VKBJen2xE6HFvex/BdD645MZfYELdq3dJp3xm1P1qUVvVQ2
	idb0SIXIcKl/SpQrogae6Q9NaGoUh0HAYm5hEpCa4rVxd4MF2Zpd9JuNBC5w0doDR1Wf/UwBEga
	S9aZntVA1aLbr3wEFIcvsY9aAj8R2OF5G4CrA82p8r2BKGHdWrlHdhpegYEjJt6N2aWA==
X-Received: by 2002:a05:6000:29c8:b0:47f:699b:a80c with SMTP id ffacd0b85a97d-47f699ba8a2mr6819887f8f.52.1784537708669;
        Mon, 20 Jul 2026 01:55:08 -0700 (PDT)
Message-ID: <b3b1f23e-a430-4772-af29-13e59cfeb640@suse.com>
Date: Mon, 20 Jul 2026 10:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] memory: check incoming GFNs
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
X-purgate-ID: tlsNG-d25034/1784537709-03CD3A5B-D1E12003/0/0
X-purgate-type: clean
X-purgate-size: 5192

P2M handling (for translated domains) is at best undefined when passing in
GFNs which aren't aligned according to the requested order.

For non-translated domains the same isn't necessarily true, and domains
may possibly be able to leverage present behavior; in fact
XENMEM_memory_exchange is known to be used in such ways. Instead the
supplied GPFN has to at least pass VALID_M2P().

In memory_exchange() go farther than merely adding checks: Restrict the
scopes of the two variables such that it becomes more clear across which
range of code the validity checks actually apply. Also don't limit
checking there to non-translated domains (as of now steal_page() would
prevent things from working on translated ones), to avoid giving bad
examples or leaving latent traps.

Furthermore, covering translated domains in memory_exchange() is forward-
looking: Right now steal_page() prevents (successful) use of that sub-op
by such domains, but there are intentions to relax that.

Fixes: e4dfe0cdba5e ("Replace dom_mem_op hypercall with memory_op hypercall with")
Fixes: 6f8668f57256 ("New memory hypercall 'populate_physmap'")
Fixes: 516250dac6a8 ("New memory_op XENMEM_exchange")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I'm not sure at all whether for the direct-mapped case the checking in
populate_physmap() is appropriate.
---
v2: Drop the paging_mode_translate() part from the two GMFN checks.
    Tighten the GPFN check in populate_physmap(). Add ChangeLog entry.

--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,9 @@ The format is based on [Keep a Changelog
 ### Changed
  - XEN_DOMCTL_DEV_DT's, FLASK_[GS]ETBOOL's, and FLASK_DEVICETREE_LABEL's input
    string sizes need to include the nul terminator.
+ - XEMMEM_populate_physmap, XENMEM_decrease_reservation, and
+   XENMEM_memory_exchange now check input frame numbers more strictly (for
+   alignment according to the indicated order).
 
 ### Added
 
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -40,6 +40,10 @@
 #include <asm/guest.h>
 #endif
 
+#ifndef VALID_M2P
+# define VALID_M2P(gpfn) ((gpfn) != INVALID_M2P_ENTRY)
+#endif
+
 struct memop_args {
     /* INPUT */
     struct domain *domain;     /* Domain to be affected. */
@@ -277,6 +281,10 @@ static void populate_physmap(struct memo
         if ( unlikely(__copy_from_guest_offset(&gpfn, a->extent_list, i, 1)) )
             goto out;
 
+        if ( !IS_ALIGNED(gpfn, 1UL << a->extent_order) ||
+             (!paging_mode_translate(d) && !VALID_M2P(gpfn)) )
+            goto out;
+
         if ( a->memflags & MEMF_populate_on_demand )
         {
             /* Disallow populating PoD pages on oneself. */
@@ -586,6 +594,9 @@ static void decrease_reservation(struct
         if ( unlikely(__copy_from_guest_offset(&gmfn, a->extent_list, i, 1)) )
             goto out;
 
+        if ( !IS_ALIGNED(gmfn, 1UL << a->extent_order) )
+            goto out;
+
         if ( tb_init_done )
         {
             struct {
@@ -665,7 +676,6 @@ static long memory_exchange(XEN_GUEST_HA
     PAGE_LIST_HEAD(in_chunk_list);
     PAGE_LIST_HEAD(out_chunk_list);
     unsigned long in_chunk_order, out_chunk_order;
-    xen_pfn_t     gpfn, gmfn;
     mfn_t         mfn;
     unsigned long i, j, k;
     unsigned int  memflags = 0;
@@ -778,6 +788,8 @@ static long memory_exchange(XEN_GUEST_HA
         /* Steal a chunk's worth of input pages from the domain. */
         for ( j = 0; j < (1UL << in_chunk_order); j++ )
         {
+            xen_pfn_t gmfn;
+
             if ( unlikely(__copy_from_guest_offset(
                 &gmfn, exch.in.extent_start, (i<<in_chunk_order)+j, 1)) )
             {
@@ -785,6 +797,12 @@ static long memory_exchange(XEN_GUEST_HA
                 goto fail;
             }
 
+            if ( !IS_ALIGNED(gmfn, 1UL << exch.in.extent_order) )
+            {
+                rc = -EDOM;
+                goto fail;
+            }
+
             for ( k = 0; k < (1UL << exch.in.extent_order); k++ )
             {
 #ifdef CONFIG_X86
@@ -867,6 +885,8 @@ static long memory_exchange(XEN_GUEST_HA
         /* Assign each output page to the domain. */
         for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
         {
+            xen_pfn_t gpfn;
+
             if ( assign_page(page, exch.out.extent_order, d,
                              MEMF_no_refcount) )
             {
@@ -903,6 +923,18 @@ static long memory_exchange(XEN_GUEST_HA
                 continue;
             }
 
+            /*
+             * PV domains are known to pass arbitrary PFNs into this hypercall.
+             * Therefore we cannot apply the alignment check there.
+             */
+            if ( paging_mode_translate(d)
+                 ? !IS_ALIGNED(gpfn, 1UL << exch.out.extent_order)
+                 : !VALID_M2P(gpfn) )
+            {
+                rc = -EDOM;
+                continue;
+            }
+
             mfn = page_to_mfn(page);
             rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
                                         exch.out.extent_order) ?: rc;

