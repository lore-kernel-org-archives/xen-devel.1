Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870A4CA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:43:01 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437089.1655858 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsi5-0003W1-6q; Wed, 30 Sep 2026 11:42:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437089.1655858; Wed, 30 Sep 2026 11:42:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBsi5-0003Vu-3F; Wed, 30 Sep 2026 11:42:53 +0000
Received: by outflank-mailman (input) for mailman id 1437089;
 Wed, 30 Sep 2026 11:42:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBsi4-0003VW-6n
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:42:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBsi3-009UzV-0d
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:42:51 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5af-bab6-0a2a0a5309dd-0a2a4504ae52-32
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:42:50 +0200
Received: from [74.125.225.141] (helo=mail-wm2-f13.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5ba-b57f-0a2a45040019-4a7de18dd1ff-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:42:50 +0200
Received: by mail-wm2-f13.google.com with SMTP id
 5b1f17b1804b1-49e83a388f8so38822825e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:42:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174e13b6sm53281035e9.4.2026.09.30.04.42.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:42:49 -0700 (PDT)
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
        d=suse.com; s=google; t=1790768570; x=1791373370; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gdmPR5YlVqOCU5CBR9lsp1BqWnYuoKLHAZ0V6nDa38=;
        b=XJDQeqFNsN05lMVNO9jTanF9OXyzfq1ZyLurpojA9pgpimQBfMKzjcaxm+KhSgvOvY
         MywMve1M890yf4rGaCR2PoYQD1xsjYuKDYbh01J+OtYAZQsgCqnN3HoLtKVbxT1XqZ8B
         GcztxigPSmKzxEEd8CpIXYCuvzjwIwE2JPp/DxivHLJlIjHqxjP6OMH7mdY8HkCjnKY5
         1zsYA3ySWaocn15H7AY9W2D8QjKbgSD47JoTw4yc618Mel1vfy1YzsgS5LIJl6fwaIrA
         i2JyAbDfINskFg08Z8IhJOwF83FX1smh/JzqiDdmf7T5KJAWSmdXpS0VNz4OXR5TgfDa
         xDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768570; x=1791373370;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gdmPR5YlVqOCU5CBR9lsp1BqWnYuoKLHAZ0V6nDa38=;
        b=IjEK9BFG49c5in5+uRpMq2vhYHS5J6+IiCoiAB290Oo1AApVtmdo2p5f7PFF6OT5ln
         fA47kpnRNEhUXml9TQOIb67kKVcRZzf0YRvc0QB+wCJgG1yoiVhNylH+Q2DAoA7wk7Ru
         TI1a5lYgI2LsmbhoRlyUK+J/LLBC+RkawlOo+EMdoTFkXvZZK7tlGnG8p5PUE9s/KR9k
         PkwndxyzpvDAu+iAtvcL1gtzBWlVNw/Ph7UO4m8NILec1TKrkv+/jCbGza477LsDY7hu
         4rywNw3j4m47dln5Nbl727fZF+WS4MLIMBl6NRSWbOXyyNrvKqSKow3SQQmvNcZLUvZ/
         DwGA==
X-Gm-Message-State: AFuF++kt25EC2jJxaYgQWob6atizmWbGOTPaqSA9V0BZnnZ+kvE1CJgj
	XrLn6OlMp3JJQAqoPYjPTwIONXu2c9Wq1eStkJwjMnOWft+qxnUTQ02nASns9kmMl7GokCsfQGh
	YuTIeaw==
X-Gm-Gg: AYBFou3we224q7HGYdUtbKoODDr1BNN/iRf64momgFX0aU3LY2MhMZ9IvcAdGAoZx5y
	QOIGk1kZDniiOJebeLKuVqPC3f4ZSOdZxuMkX3GFwaBnMIxe/1yv8Vg9p0oWRzVUwD3OLtMLKlO
	3ovDDed2qKZbNBIgRnaTvsvezDTyHmcdIo9JaNL3sByq4cT1fyM5FOqlzGgXVBh2BI7x6sEBiPh
	Keb2OQmJlvRDcD7/CqG/VWhUn/8jgZl1ILkghrLFIX4FRAG1au9b6p9PmKIFIjdN1TQij7Eu2+e
	WZKg2MLwkCJyhyU0L618ummDsi1i5pve84C7hNRAImyjXn6uu4m/aeb3pTv+ViX86gom7mbS0lF
	iINWn+rvGVHbbBStmkVI/eTzcehYOBnD5PN57SGeCrkovw9CGVBJHY/moBSWdb63FwYvhWm64yn
	1+8Yuo9chQVwnyBurF2bZUjxxEfwbHSKpG95SC8LhqiQ1QKwGtOJhh59y0Ffq/qZw5ASnPVgTGa
	P8aJs4WiBn5mS018IKiNvUZp79MdirIggSBbnnn9ptNcvzihA3D0TBBW8ep29E=
X-Received: by 2002:a05:600c:4512:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a01b00ee5dmr20087515e9.22.1790768570076;
        Wed, 30 Sep 2026 04:42:50 -0700 (PDT)
Message-ID: <1ea52be0-113f-4000-a09b-b850d93c44d3@suse.com>
Date: Wed, 30 Sep 2026 13:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/5] x86/vPCI: tighten locking assertions
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ebf023/1790768570-C1ED6B50-A72FCCC4/10/78276251493
X-purgate-type: spam
X-purgate-size: 4369

Already when they were introduced, they seemed overly lax. In particular
anything invoked solely from vpci_{read,write}() can check that the per-
domain PCI r/w lock is held. There's no need to permit the alternative of
holding the global PCI devices lock.

vpci_msi_arch_update()'s sole call site is update_msi(), which in turn is
solely called from write handling hooks.

vpci_msi_update(), besides being called from vpci_msi_arch_update() (see
above), has two further call sites:
- vpci_msi_arch_enable(), called upon control register writes,
- vpci_msix_arch_enable_entry(), called solely from update_entry(), which
  in turn is again called upon control register writes, plus from
  msix_write(), which read-locks the domain's PCI lock.
Both arch_enable functions therefore can also have their assertions
adjusted.

vpci_msi_disable() is called from
- vpci_msi_arch_disable(), called upon control register writes, 
- vpci_msix_arch_enable_entry(), covered above,
- vpci_msix_arch_disable_entry(), called update_entry() (see above) and
  upon control register writes.

Furthermore msixtbl_pt_{,un}register() are solely called from
pt_irq_{create,destroy}_bind(), callers of which (create: when using
PT_IRQ_TYPE_MSI) acquire the per-domain lock.

As not using ASSERT_PDEV_LIST_IS_READ_LOCKED() isn't unusual anymore, drop
the comment near the top of vpci_msix_arch_print().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger@xenproject.org>
---
v2: Extend to msixtbl_pt_{,un}register(). Drop comment near the top of
    vpci_msix_arch_print().

--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -621,7 +621,7 @@ int msixtbl_pt_register(struct domain *d
     struct msixtbl_entry *entry, *new_entry;
     int r = -EINVAL;
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
+    ASSERT(rw_is_locked(&d->pci_lock));
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
@@ -691,7 +691,7 @@ void msixtbl_pt_unregister(struct domain
     struct pci_dev *pdev;
     struct msixtbl_entry *entry;
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
+    ASSERT(rw_is_locked(&d->pci_lock));
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
@@ -837,7 +837,7 @@ static int vpci_msi_update(const struct
 {
     unsigned int i;
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
     if ( (address & MSI_ADDR_BASE_MASK) != MSI_ADDR_HEADER )
     {
@@ -878,7 +878,7 @@ void vpci_msi_arch_update(struct vpci_ms
     int rc;
 
     ASSERT(msi->arch.pirq != INVALID_PIRQ);
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
     for ( i = 0; i < msi->vectors && msi->arch.bound; i++ )
     {
@@ -930,7 +930,8 @@ int vpci_msi_arch_enable(struct vpci_msi
     int rc;
 
     ASSERT(msi->arch.pirq == INVALID_PIRQ);
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
+
     rc = vpci_msi_enable(pdev, vectors, 0);
     if ( rc < 0 )
         return rc;
@@ -948,7 +949,7 @@ static void vpci_msi_disable(const struc
     unsigned int i;
 
     ASSERT(pirq != INVALID_PIRQ);
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
 
     for ( i = 0; i < nr && bound; i++ )
     {
@@ -1004,7 +1005,8 @@ int vpci_msix_arch_enable_entry(struct v
     int rc;
 
     ASSERT(entry->arch.pirq == INVALID_PIRQ);
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(pdev->domain);
+    ASSERT(rw_is_locked(&pdev->domain->pci_lock));
+
     rc = vpci_msi_enable(pdev, vmsix_entry_nr(pdev->vpci->msix, entry),
                          table_base);
     if ( rc < 0 )
@@ -1044,12 +1046,6 @@ int vpci_msix_arch_print(const struct vp
 {
     unsigned int i;
 
-    /*
-     * Assert that pdev_list doesn't change. ASSERT_PDEV_LIST_IS_READ_LOCKED
-     * is not suitable here because it allows either pcidevs_lock() or
-     * pci_lock to be held, but here we rely on pci_lock being held, not
-     * pcidevs_lock() (see the transient lock dropping further down).
-     */
     ASSERT(rw_is_locked(&msix->pdev->domain->pci_lock));
     ASSERT(spin_is_locked(&msix->pdev->vpci->lock));
 


