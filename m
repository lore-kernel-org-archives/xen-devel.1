Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA49606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=NBzA0J/U
Received: from list by lists.xenproject.org with outflank-mailman.1464774.1675640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR45-0000nk-Jl; Thu, 29 Oct 2026 14:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464774.1675640; Thu, 29 Oct 2026 14:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMR45-0000nd-H6; Thu, 29 Oct 2026 14:25:13 +0000
Received: by outflank-mailman (input) for mailman id 1464774;
 Thu, 29 Oct 2026 14:25:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMR44-0000nR-QB
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 14:25:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMR44-006n51-6v
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 15:25:12 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae35738-2eae-0a2a0a5409dd-0a2a4507c014-34
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:25:12 +0100
Received: from [209.85.221.50] (helo=mail-wr1-f50.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae35743-b4ea-0a2a45070019-d155dd32add4-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 15:25:07 +0100
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-48e10a70540so1440443f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 07:25:07 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece14a1sm36040424f8f.57.2026.10.29.07.25.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 07:25:05 -0700 (PDT)
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
        d=suse.com; s=google; t=1793283906; x=1793888706; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=68xddbKpJuK9lRBNK1xmW0G0FAfxhT0/ZIkUKuJLHRk=;
        b=NBzA0J/U0jcd+felBqXsvsH5hcYYGcsKo4sJ6YLQFreHGBIvWsFZm8ROTvWUNd4XKZ
         N7fYBr0FA+XnfWSTRVFO2e9msqfjOCZ17fN/fEfz+CQ0gcogo1emCXVkXfV8rgxp3klQ
         lV1Siv+QLxV6TaZ6gvUDAnYFAUXF+0o3w4lMDVs8JXmW7Kg6ojQd8xTnlVrT2z3KyWZQ
         acJbKJUU/inmZu9wPUWyl0dWMYS1cVKeyre+b4Sb2tk8qBPRsxftPhXSCDIrA1tirLk3
         xZ1eiSpG4QxrxNme6BZQysO9gMXtfxbXcs3rEQk9LxxdMLZpkgUywXaDU9TuO3uHUSCw
         TIpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283906; x=1793888706;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=68xddbKpJuK9lRBNK1xmW0G0FAfxhT0/ZIkUKuJLHRk=;
        b=mJSmooATdTvt5fxj0nIhycj4UpV/6OO+AMIr2EoBo249Ovi1UvchmY4IWUX/lumzdR
         55LkJVPYsxi9IIJg7D+/7XBLJPMddUO3rPORMN62ss9EcjwZ04Jwki+cme3j8WyMzb+1
         p4sfMf1WnQvE+fn0Qfm/lAvnGKnw942itYoMk0GZ7Eguk0QjL9o8SifJlS5dK0HIviek
         GU98MUd6TdwJCwRGSd3LoNG/MvREiBgSQUYEHQ+OtfqRqmUkyd1jTbVGYWUXMINxe649
         a6GWOOZSs8+CerR3IxwrtLIO9R8Y6L/JvN+t1lAQThqnoOVZ/b3MIxCr/gv6LK8EyVef
         IXuA==
X-Gm-Message-State: AFq9FYJ6v+FL3pPxeZC23LOZM6Gak7g1j+QZVUWizrWJB1xc2c7Vnt+3
	x851dQxieEAGCUCLHQNWvorCI6phzSsP/LbWq2zuT49jaU2AXg0nTbRiy3rHcHaEMGhHvgRXrT+
	BESJmdA==
X-Gm-Gg: AYBFou0D7lSpANOsfdnVATmlcWDEeJGiaHoFmnJraDF7sO7fCCh02IiwXt9q3UVk1HN
	0MZDOs8FH1SwT+/cRWR3dIux9ilvvK5kW2NnIBPCy8o9m1Bu2+gtY7lIj4Z/RLaMuTHBfHs42U9
	QcsZLqYUDhHVBlFyt0ycUBDi19LXf5BVjjuReGK74+9e0gnvuupGuKWWwEfvs2X9sinlBYg7Qum
	VECWX+0hT5TPccPm2eZnBZ/d16gc9sDPMngtsAm7/JHqrf29GQ6WJJL3KgxgL/6E/WCEoELA00G
	7U0pa6SJOyOd8WwOSkyRbwaMUUIv1w39+CEFcd7Q8uj0MEfQwUn3kv1KJ6YhBhfOVipTSTQsgiW
	mGTo4oNrWNBlUacXh1yObJ1ab2ZrmDCzeAvtMN1hF6Yv/5D7e5G0MkIjev59YSexzo9GE4suavW
	wOC+ECKiCLFomHr05oryrkdNm8sXjsAsuD3N+NSsb2bvVxRMrilGDLokHeBEwidQWkUCaQeDOAM
	lZvSJjM2T+PuXi+VxzQeoknNdddgUJQ5Ndzyn993u3+Q+KZvAmoEZDb9mMdva3MNYD5U6+skWi0
	oMAot4GXpVtMy2+PgswdJ2AtHuTyfjowgtX1s0AwsYiMlJLIPVszYj3rYJ1nFj22M5phyWeLDrs
	ucfOybx9mLdGpCcri
X-Received: by 2002:a05:6000:178a:b0:48d:e5c9:39a4 with SMTP id ffacd0b85a97d-48e5d5d0a3emr13312934f8f.33.1793283906515;
        Thu, 29 Oct 2026 07:25:06 -0700 (PDT)
Message-ID: <5d5bc3c9-79ef-4a80-866b-8c374c4021e5@suse.com>
Date: Thu, 29 Oct 2026 15:25:04 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/4] x86: tighten PCI-related locking assertions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Teddy Astie <teddy.astie@vates.tech>
References: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
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
In-Reply-To: <37c9675b-dc2b-4c57-b5a8-79075836311b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1793283907-A48C9AE4-5FCFF87C/10/78276251493
X-purgate-type: spam
X-purgate-size: 3615
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With recent changes the .pi_update_irte() hook as well as
{,un}map_domain_pirq() and allocate_and_map_msi_pirq() won't be called
anymore with the global PCI lock held. Convert the assertions to check for
just the domain's PCI lock.

With that the somewhat ugly ASSERT_PDEV_LIST_IS_READ_LOCKED() isn't used
outside of msi.c anymore, so move the #define there.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
It being just two use sites which remain, we may want to do away with
ASSERT_PDEV_LIST_IS_READ_LOCKED() altogether. Thoughts? (It also isn't
qite clear to me why its #define(s) sit inside an #ifdef: The expression
used ought to be fine to use also in release builds, as it looks.)

--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -419,7 +419,7 @@ static int cf_check vmx_pi_update_irte(c
 
     spin_unlock_irq(&desc->lock);
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
+    ASSERT(rw_is_locked(&msi_desc->dev->domain->pci_lock));
 
     rc = iommu_update_ire_from_msi(msi_desc, &msg);
     if ( rc > 0 )
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2250,7 +2250,7 @@ int map_domain_pirq(
         struct pci_dev *pdev;
         unsigned int nr = 0;
 
-        ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
+        ASSERT(rw_is_locked(&d->pci_lock));
 
         ret = -ENODEV;
         if ( !cpu_has_apic )
@@ -2410,7 +2410,7 @@ int unmap_domain_pirq(struct domain *d,
     if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
         return -EINVAL;
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
+    ASSERT(rw_is_locked(&d->pci_lock));
     ASSERT(rw_is_write_locked(&d->event_lock));
 
     info = pirq_info(d, pirq);
@@ -3021,7 +3021,7 @@ int allocate_and_map_msi_pirq(struct dom
 {
     int irq = -1, pirq, ret;
 
-    ASSERT_PDEV_LIST_IS_READ_LOCKED(d);
+    ASSERT(rw_is_locked(&d->pci_lock));
 
     switch ( type )
     {
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -737,6 +737,19 @@ static uint64_t read_pci_mem_bar(const s
     return (addr & PCI_BASE_ADDRESS_MEM_MASK) + disp;
 }
 
+#ifndef NDEBUG
+/*
+ * Check to ensure there will be no changes to the entries in d->pdev_list (but
+ * not the contents of each entry).
+ * This check is not suitable for protecting other state or critical regions.
+ */
+#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d)                               \
+        /* NB: d may be evaluated multiple times, or not at all */       \
+        ASSERT(pcidevs_locked() || ((d) && rw_is_locked(&(d)->pci_lock)))
+#else
+#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))
+#endif
+
 /**
  * msix_capability_init - configure device's MSI-X capability
  * @dev: pointer to the pci_dev data structure of MSI-X device function
--- a/xen/include/xen/pci.h
+++ b/xen/include/xen/pci.h
@@ -204,19 +204,6 @@ static always_inline bool pcidevs_tryloc
     return lock_evaluate_nospec(pcidevs_trylock_unsafe());
 }
 
-#ifndef NDEBUG
-/*
- * Check to ensure there will be no changes to the entries in d->pdev_list (but
- * not the contents of each entry).
- * This check is not suitable for protecting other state or critical regions.
- */
-#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d)                               \
-        /* NB: d may be evaluated multiple times, or not at all */       \
-        ASSERT(pcidevs_locked() || ((d) && rw_is_locked(&(d)->pci_lock)))
-#else
-#define ASSERT_PDEV_LIST_IS_READ_LOCKED(d) ((void)(d))
-#endif
-
 bool pci_known_segment(u16 seg);
 bool pci_device_detect(pci_sbdf_t sbdf);
 int scan_pci_devices(void);


