Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55988CA5FB1
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:43:50 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437100.1655875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsin-0004UJ-P4; Wed, 30 Sep 2026 11:43:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437100.1655875; Wed, 30 Sep 2026 11:43:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsin-0004UC-MM; Wed, 30 Sep 2026 11:43:37 +0000
Received: by outflank-mailman (input) for mailman id 1437100;
 Wed, 30 Sep 2026 11:43:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBsim-0004Sm-Hn
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:43:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsil-00C9D3-Ue
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:43:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5d8-bab6-0a2a0a5309dd-0a2a4503d83c-44
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:43:35 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5e7-fae8-0a2a45030019-4a7de18cecb7-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:43:35 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d3931so39712315e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:43:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01cd2114esm2701305e9.4.2026.09.30.04.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:43:34 -0700 (PDT)
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
        d=suse.com; s=google; t=1790768615; x=1791373415; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fMP+aMbGTq/QNVUvBxjH4sITe7aOmudxNWIlirIxtN0=;
        b=Ls/3u0mPvHOxLGwbLloqNtKONR/KZQetO1A7zb1ydc56wtqzCun2UJs4GJ/wbulelm
         sVcZoZcyVdl75+pM5x919ZPjXM1IkJWkPtJme/cXWbnXwtCyRNyMbq+TxljA81AgPrDL
         86J+0kyLTVZk6TmfTfX7kmeIExkWXWkWYmeJ3rIb11yISaBuLh/0o0NUzibIwO8HQpmh
         Onauc5HnjiqPjB5EXj/TfjhTwhSpHGHfqzaPR9tiI4i8hR9LT6wEJXyPR6esZfTMA+9K
         W9w+qY1raeXbRtk5doDQOV2DtiznxSPVWjCIbx/aRw8YPkARvIa/NXZQvQk3zNww2dIw
         Xjdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768615; x=1791373415;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fMP+aMbGTq/QNVUvBxjH4sITe7aOmudxNWIlirIxtN0=;
        b=FftcWVjH1s8oP44m8J+qnW3mnF0eCxKUyitGV74Vv6fW/BCyD0NxFHumdFKFNuKKI/
         6c5Mj/BTqOZ34ZcstY0xKVF74SG/EPVZFYQdK28ZvRbBECk0qGh14X8mKmD3Tz6FFwXb
         mlqVC3xo5nelT+mo448AVfs9SmdmYPyPae3NdBgj/rvQw/r8Tkq231yalZgr7ZexHIde
         YMDaLwaDMCfayzLCIPtEjnxPlJz+nMMr2QyEqtRpVT9+DsMH51MsliOpEY4LrWjjcR4w
         y6WNBYbcxXvtqnZJ/VUn5psBq0PPJT+rmxjLxYJMzBwtPf5167QbzKyjLXjBX3OFKGDR
         CSPA==
X-Gm-Message-State: AFuF++kk1JSkxYBVY5eEu+yEi4Tppb3kvjcHBqutZu9FS11Z0zyD5dAJ
	EQ/A+sBrs2v1oZ69AsthM56cuWIb1NVWyotCiXN5N0yLap/28Ds57vLHFv/nKgSoK8q9VYr7/qm
	wABNdFw==
X-Gm-Gg: AYBFou1ER9Q80ylQvTs4xcgMMdJgrr35mwnrYYMsAj56GeQSjRIjgfcX7uDQETxiGdA
	IVO2CzDz6JYkxElHFwHkmoMfbOe+syMgxc8nvgcKfODWHVXm0YeP5WXqIalpD0LxDovVcTOGlWS
	Rdog3NAS2ONIWuP81fqvf2vGA58wWb6tDjCLpgp04VGSZocXJ//K5JiH1DvogYgMtGqov6AW+Gj
	UwYRY/5YrEPbB5IhaSon5ee3+EihrVrAXVyI9iK4QkTAm96nMW+1zLMO0qzu/+PrHTGQ+oIatm0
	EDFQrYKvurUhOkTFgKVdTYbnRIhKm81tB8xC+QOPgICXPtrY/LruRaLmwPfQxVShAij1OCSDR51
	k961vYhe9TR3Cjpw6lmXHzfy9fhuxEg+3MsM5DeuLY8cVdJuiH9lHc05Feohio/hXg+lc69Kja2
	AF7eID1VetCIj29j6sodBocXQ6AJSS+pI8tIZWV6GYXWy3N1LZuh+4f8WPIf+Zprg5CKiGaVjJU
	YMEwYm56fCY7seHClSvubB9hxSUZd2qoGZ8u9xhOAEQTyhRKBa3IXUU1I2jtg==
X-Received: by 2002:a05:600c:1c02:b0:4a0:1a18:b748 with SMTP id 5b1f17b1804b1-4a01ad8f197mr19090465e9.4.1790768615216;
        Wed, 30 Sep 2026 04:43:35 -0700 (PDT)
Message-ID: <b21db453-c2ad-4321-8f8f-76d801dfe998@suse.com>
Date: Wed, 30 Sep 2026 13:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/5] x86/vPCI: make better use of "pdev" in
 vpci_msix_arch_print()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
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
In-Reply-To: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1790768615-6F2C84E9-4E7CA957/10/78276251493
X-purgate-type: spam
X-purgate-size: 1250

Move the declaration to function scope, so that not only the (so far)
immediately following spin_unlock() can make use of it, but also the
assertions at the top. Also add const, as the pdev itself isn't supposed
to be altered here.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -1044,10 +1044,11 @@ void vpci_msix_arch_init_entry(struct vp
 
 int vpci_msix_arch_print(const struct vpci_msix *msix)
 {
+    const struct pci_dev *pdev = msix->pdev;
     unsigned int i;
 
-    ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
-    ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
+    ASSERT(spin_is_locked(&pdev->vpci->lock));
 
     for ( i = 0; i < msix->max_entries; i++ )
     {
@@ -1064,9 +1065,7 @@ int vpci_msix_arch_print(const struct vp
                entry->masked, entry->arch.pirq);
         if ( i && !(i % 64) )
         {
-            struct pci_dev *pdev = msix->pdev;
-
-            spin_unlock(&msix->pdev->vpci->lock);
+            spin_unlock(&pdev->vpci->lock);
             read_unlock(&pdev->domain->pci_lock);
             process_pending_softirqs();
 


