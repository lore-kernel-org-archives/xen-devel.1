Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C48C79F99
	for <xen-devel@archiver.kernel.org>; Tue,  8 Sep 2026 13:02:34 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1411995.1642472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vSx-0006VR-70; Tue, 08 Sep 2026 13:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1411995.1642472; Tue, 08 Sep 2026 13:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x3vSx-0006VK-4L; Tue, 08 Sep 2026 13:02:23 +0000
Received: by outflank-mailman (input) for mailman id 1411995;
 Tue, 08 Sep 2026 13:02:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1x3vSv-0006V6-Ok
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 13:02:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x3vSv-00BuDp-5C
 for xen-devel@lists.xenproject.org; Tue, 08 Sep 2026 15:02:21 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa00759-8faa-0a2a0a5109dd-0a2a4508a30e-26
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:02:21 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aa0075c-f659-0a2a45080019-4a7de18c96d2-3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 15:02:21 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49cd6185db7so6626425e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Sep 2026 06:02:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce5952560sm435083775e9.3.2026.09.08.06.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2026 06:02:20 -0700 (PDT)
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
        d=suse.com; s=google; t=1788872540; x=1789477340; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=o0d1D4rqSgyoha+rBAysFKG64mCQkEkUN/Iu3QpC/L0=;
        b=cohtIV/Ai114lus60zViohoPaSkSFgfaUoZuTmSpb3/wJYTg9EKvOYyeZ0Hb4xu2Ux
         v595O1UDzYf0Ak5wKydWxYwr4AtpbQQGM72r527YgKJcR1Vr6LN6DHtKM6mmJrAMUoYK
         UsmN88dFuFW2WUlbL5GsBW8IFpwGw44JwCefm263d0MoqzGIhAmn16PesALzLjSzQbHv
         jdxCTFcUQQQvz/scA8QCpxAn6i43K6Nqit/pVcEv4SeUQMMgNaTD56ONh3Lp9ZY/uszl
         S+XxPNJYaLGmcnk0tDSEsXq9wQUN9YN5YXyo+lOzmNRJ08tHzxBm9z0utYmKSA4LDyKx
         qWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872540; x=1789477340;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o0d1D4rqSgyoha+rBAysFKG64mCQkEkUN/Iu3QpC/L0=;
        b=qjsobDUd56ztLbo3/pEFwxX9AVf/2CIu4OW2FkShgyO+n68ttxkS6S9CpNQNINrkEH
         XCt7XXJht2xOWwvGzyCvqejPJ+bMa8JfrX1ffaAs1NAcdIc/UMPbdaMu5OJh5ngK1X9j
         Sh5aZLyIm0gFnJt4sRmco9/6P/pDWoW8MbQmaF9j6n+jkfYddD/IKQ0FykZszewDU59u
         aWiME7Nj3TAf5ql7znr6WgMCEZ7hbYQszcsCFTSlgFfVnQK4pSwiVC4HC+2UbmSXnnz8
         F8iKd8g+zHbt05eRh+ZgLIH8gbI6SIXsErGvLprWFApYzJvWL1Z/n5D5j1Ug1fMSid8x
         3r4g==
X-Gm-Message-State: AFuF++m4BXjlUx5YvQXTY3TY6nY6Ts2OtLVXKXjjp4+S3VlU5FG/vquC
	R8kzR1ojxRJRs97b2vJd31EIY7PqqjGgt2fNxIe8J5mOy1mvDr+w4Oatdh3i10gyaD11yglzswg
	ijX83IQ==
X-Gm-Gg: AYBFou3C3TMW/AM9tYecKW8SdIlwD8ASrcjMBnIbfEDxQ9gNUMAf8sc6n+zEq15GUNZ
	wB1nLd430GCbM4XKVNb5I6Npf8CQ6jOQ0q5neGd2qGap671AtcXuefL/09OYCsG/sODqmdCzJ2i
	B+WYGuL/oYHUliNEghILI9iP0jTreg8LHZortauFlGkOmPiLsX2zeRLeGNidkRY7/8pTuE2OBep
	GuN8rvlcnJS9lXREJnOLxPjId2NHebsf63sy9M6tEZBKfF6Dn6f3sfAfcVBBaAtXGw1chdyWicL
	abBHKLFICVht92BusBCz0/e6x/4m9mcmTT85SB/f+cO+hRWGbfxknr3NBaWLEoE/6AUxBcySPYa
	EbFXMXp+v6Eldfgn5L/QOAdl5WPUPjo+lmnR/zLM0T1kptMrsLheIkVuPrrYx58Hs/o1xIMrcID
	kEJPDEkpbyHsc5irq5JxlSsPnZ2wYb4OYdkCyh9VUxaodyVhJfRdhR9hkr/lfV+EzjdUJDWq55U
	G/Eu+2ETuoN2aB4HsHrrrQZ4aOkBMrV/99+5Nd8+RUh30bs8IZN
X-Received: by 2002:a05:600c:1c21:b0:49d:1e79:35d6 with SMTP id 5b1f17b1804b1-49d1e79368dmr199645e9.14.1788872540374;
        Tue, 08 Sep 2026 06:02:20 -0700 (PDT)
Message-ID: <1b8c4276-0031-4a19-9663-b63799f5cf81@suse.com>
Date: Tue, 8 Sep 2026 15:02:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/6] x86/vPCI: tighten locking assertions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
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
In-Reply-To: <eb5925e4-2409-452c-8768-4ca6717eb156@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1788872541-CD74B87B-912D8256/0/0
X-purgate-type: clean
X-purgate-size: 2867

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

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
With this perhaps the comment near the top of vpci_msix_arch_print() might
better go away. Thoughts?

--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
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


