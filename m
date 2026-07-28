Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB54C53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:25:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374180.1621154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohoC-0006I6-2S; Tue, 28 Jul 2026 13:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374180.1621154; Tue, 28 Jul 2026 13:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohoB-0006Hz-Vr; Tue, 28 Jul 2026 13:25:23 +0000
Received: by outflank-mailman (input) for mailman id 1374180;
 Tue, 28 Jul 2026 13:25:23 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohoB-0006Hn-68
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:25:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohoA-00HBk8-F3
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:25:22 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68adb5-2eae-0a2a0a5409dd-0a2a450b9cb2-40
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:25:22 +0200
Received: from [209.85.128.44] (helo=mail-wm1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68adc2-b7e8-0a2a450b0019-d155802cb9d0-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:25:22 +0200
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so20486015e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:25:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496c4615f5fsm74360985e9.9.2026.07.28.06.25.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:25:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1785245122; x=1785849922; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1ExWWmCax9YKIf9+ZpJTMdhUNqkD9KZ5pQgLLOZBXpU=;
        b=XvDk9J0A4GlaKJnHhe55VwETJh1a/ttqhWKkJ0ia0c0wHJQdCoqC72jBq71FWet28T
         4fndU7xgLGU7ERhn+oUozJawErKY+eS0dthmimk0swTcHtErLaYNBROT9SC/RrpdTZx2
         EnEyiO6h8MKLGHof0TXAdkvWv4Qy6VM8+zWajoohI87hQQPh+bbwK9/ipAYvegPFZ9JX
         Gqj8KgiUXMIqf9xbXI1l0Goss2w8xLOs3/h3WYFL9rWkmnPSuJUf4COHrNs4/cG4PoG0
         MaDY5xxz0d6C44ITL0bvFpriwCGQAv4nr2CBP6kVezMFy/8UjR8WMggg4wj+iDJFnx9L
         J7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245122; x=1785849922;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ExWWmCax9YKIf9+ZpJTMdhUNqkD9KZ5pQgLLOZBXpU=;
        b=UuN+9xR+jdM2h6KKXHtk4vun7Kdbo1VOvLaj9bwtYmLEYfAesplSSQNpS2VmbbokFT
         x9NRa3CU9ep3uKx7bDysCXdsE2douo70O+Iy40cU+P6W6bq1Wc/8vuNWuVy16EN5S608
         muH5flpRy+LNPU4DbPQDRNOa7rpeLk7ULsQ6XyQpvwV+CgFWauTOGg6pIjQqSdjdmMkp
         ojN3QneR7cEZG3wb6KnWR5DfToOo0lYetlH6Ti5pgSRObOGCBK4Xep2C1bMg7jitAmTP
         +Z0Bg/WvNZ78KOzjuxUy44GjwkwwCTMYrDKRGRZdVO2BSnJU5NNidQRS7aiimQ2hxaoH
         /sLg==
X-Gm-Message-State: AOJu0YwwC4vrd6dKHnjxmryuSHDVzUQABY71PIi+FMQNZ1s7ZPj8ViHy
	gAGBI92S0i2jrAth4bDzM6Gj5Z5ShjsWzPqMGGDOFeItKdgAzOxeE5bWZugtiaVLyet88NwJtIH
	n3un4rQ==
X-Gm-Gg: AR+sD10fC+7dsVU/bX5wm+mDu1mPoPMJm3G7WjWhb2YyXRYN4E35Lp6AD8q2BSxU790
	X8dNymzcDGjhZQ2mutUzBgDkeFFki6Z9eIZaYr0SbQgWukBJY3aBVYw/oFqzJgGCY2qiGU1vP9y
	OGQXjOsIbNpydF4tXt0Tu0wrh4ky8ZujVb0aKFfGqjwCb9Ti2JcT+pc6+dPTKhkHS1Z1VBf5DS8
	Gw2uDcIbcNdRo5HhVF8841eIe+Jf3KDQkxAoFRxC90sLdJ167RRMQptKdfa+cI8Rqv0j3UlkJKZ
	nNAGkbj2I7CrTp2ACN12FquvxU8AzzklwTgMF6kF0hlKkaUHrFWQ7ikuF6AzzEYdLONY2CtIwVR
	Zj/EQgZR0lpzrfeFw6AvnSjn6fYgqwMlw79eAbysYVBg1ghzb4L7YElnVxiUKF0T644wuhSeJb0
	SiNd3w26OTfwR5/TNCDDpJ5aNVFdLe/Lsrtc2KyLp32psrk5hs0CIE7l05Jpuwf7xP5A==
X-Received: by 2002:a05:600c:4fc7:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-496c6414d84mr33949815e9.7.1785245121792;
        Tue, 28 Jul 2026 06:25:21 -0700 (PDT)
Message-ID: <a1c5dd1c-9b7b-4bc2-b202-7e2a4eb210e2@suse.com>
Date: Tue, 28 Jul 2026 15:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 22/24] XSM: pass just SBDF to xsm_{,un}map_domain_irq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
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
In-Reply-To: <758c8410-a18e-45dc-8944-5913e5832397@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1785245122-AA0C59EA-B7762E0C/0/0
X-purgate-type: clean
X-purgate-size: 4820

That's what Flask needs, and by unifying the hooks flask_map_domain_msi()
can then also serve both flask_{,un}map_domain_irq().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
How come Arm doesn't use xsm_unmap_domain_irq()?

--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2214,7 +2214,7 @@ int map_domain_pirq(
         return 0;
     }
 
-    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi);
+    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi ? &msi->sbdf : NULL);
     if ( ret )
     {
         dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
@@ -2442,7 +2442,7 @@ int unmap_domain_pirq(struct domain *d,
      */
     if ( !d->is_dying )
         ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
-                                   msi_desc ? msi_desc->dev : NULL);
+                                   msi_desc ? &msi_desc->dev->sbdf : NULL);
 
     if ( ret )
         goto done;
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -470,7 +470,7 @@ static XSM_INLINE int xsm_map_domain_pir
 #endif /* CONFIG_HAS_PIRQ */
 
 static XSM_INLINE int xsm_map_domain_irq(
-    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
+    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
@@ -491,7 +491,7 @@ static XSM_INLINE int xsm_unbind_pt_irq(
 }
 
 static XSM_INLINE int xsm_unmap_domain_irq(
-    XSM_DEFAULT_ARG struct domain *d, int irq, const void *data)
+    XSM_DEFAULT_ARG struct domain *d, int irq, const pci_sbdf_t *sbdf)
 {
     XSM_ASSERT_ACTION(XSM_HOOK);
     return xsm_default_action(action, current->domain, d);
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -71,8 +71,8 @@ XSM_HOOK(int, schedop_shutdown, struct d
 XSM_HOOK(int, map_domain_pirq, struct domain *, bool)
 #endif
 
-XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
-XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const void *)
+XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *)
+XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const pci_sbdf_t *)
 XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1030,17 +1030,14 @@ static int cf_check flask_map_domain_pir
 #endif /* CONFIG_HAS_PIRQ */
 
 static int flask_map_domain_msi (
-    struct domain *d, int irq, const void *data, uint32_t *sid,
+    struct domain *d, int irq, pci_sbdf_t sbdf, uint32_t *sid,
     struct avc_audit_data *ad)
 {
 #ifdef CONFIG_HAS_PCI_MSI
-    const struct msi_info *msi = data;
-    uint32_t machine_bdf = msi->sbdf.sbdf;
-
     AVC_AUDIT_DATA_INIT(ad, DEV);
-    ad->device = machine_bdf;
+    ad->device = sbdf.sbdf;
 
-    return security_device_sid(machine_bdf, sid);
+    return security_device_sid(sbdf.sbdf, sid);
 #else
     return -EINVAL;
 #endif
@@ -1066,15 +1063,15 @@ static uint32_t flask_iommu_resource_use
 }
 
 static int cf_check flask_map_domain_irq(
-    struct domain *d, int irq, const void *data)
+    struct domain *d, int irq, const pci_sbdf_t *sbdf)
 {
     uint32_t sid, dsid;
     int rc = -EPERM;
     struct avc_audit_data ad;
     uint32_t dperm = flask_iommu_resource_use_perm(d);
 
-    if ( irq >= nr_static_irqs && data )
-        rc = flask_map_domain_msi(d, irq, data, &sid, &ad);
+    if ( irq >= nr_static_irqs && sbdf )
+        rc = flask_map_domain_msi(d, irq, *sbdf, &sid, &ad);
     else
         rc = get_irq_sid(irq, &sid, &ad);
 
@@ -1091,32 +1088,15 @@ static int cf_check flask_map_domain_irq
     return rc;
 }
 
-static int flask_unmap_domain_msi (
-    struct domain *d, int irq, const void *data, uint32_t *sid,
-    struct avc_audit_data *ad)
-{
-#ifdef CONFIG_HAS_PCI_MSI
-    const struct pci_dev *pdev = data;
-    uint32_t machine_bdf = (pdev->seg << 16) | (pdev->bus << 8) | pdev->devfn;
-
-    AVC_AUDIT_DATA_INIT(ad, DEV);
-    ad->device = machine_bdf;
-
-    return security_device_sid(machine_bdf, sid);
-#else
-    return -EINVAL;
-#endif
-}
-
 static int cf_check flask_unmap_domain_irq(
-    struct domain *d, int irq, const void *data)
+    struct domain *d, int irq, const pci_sbdf_t *sbdf)
 {
     uint32_t sid;
     int rc = -EPERM;
     struct avc_audit_data ad;
 
-    if ( irq >= nr_static_irqs && data )
-        rc = flask_unmap_domain_msi(d, irq, data, &sid, &ad);
+    if ( irq >= nr_static_irqs && sbdf )
+        rc = flask_map_domain_msi(d, irq, *sbdf, &sid, &ad);
     else
         rc = get_irq_sid(irq, &sid, &ad);
 


