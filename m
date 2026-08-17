Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2497FC5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:55:00 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392691.1631666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt7H-0004XV-Mt; Mon, 17 Aug 2026 08:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392691.1631666; Mon, 17 Aug 2026 08:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt7H-0004XO-K5; Mon, 17 Aug 2026 08:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1392691;
 Mon, 17 Aug 2026 08:54:46 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt7F-0004X5-TH
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:54:46 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt7F-00BAbm-7q
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:54:45 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc49-8faa-0a2a0a5109dd-0a2a4501aab2-32
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:54:45 +0200
Received: from [209.85.128.43] (helo=mail-wm1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc55-5984-0a2a45010019-d155802be4b8-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:54:45 +0200
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4953de5be0aso23114225e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:54:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d078523sm26211435e9.6.2026.08.17.01.54.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:54:44 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956884; x=1787561684; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cPYUEycXx4QXrkSBKGzwPTxbJ3B4xNT3wDshow8ZLw4=;
        b=L+P6faDBgCuHYZIv59p1LQcFscXb22cIUGFCUawWhCM+SXGws0yORdU1WEwCFmSwqk
         3iZlzUmHTvm9mPvs3t6SGqdnK16XILlgwsXAhMEH1nyjSRsokJ0OX4iNhz4HKZw39JS0
         xSL5OYvEAMTLfmkcLVBBTSTQwvq7PJQTqV4SeWIhhtL7NxVFvpKtMhBbniUckd0++NOc
         VcsDTMq/UCiCYBZ3ittCvktB6Dco+TEGJHjXnkkksxqzJtyYo13pwSP6xMKQHQct5vDx
         tf1GkoM6XB2y4fg9eM05VXTJHOMhmnJ5VoKh+V8tcm1Ap7gkafI7r/ZbPD/0wGcfYo2U
         vDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956885; x=1787561685;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cPYUEycXx4QXrkSBKGzwPTxbJ3B4xNT3wDshow8ZLw4=;
        b=d10QfquDMoFO8L8hzW2Tz7q3wsCttuOOynVY/QBPlKmdadeRL+KEeYeGd6ZfBfy04n
         iBmYbuTWwkenhr/MM6sQqJTxKvqFeaS9FRQw+uJzIWRUtqAJz7ct4HzInOFRbzHrjNuH
         6NtsXmlznzPMQ7nBN1UTE604n8M32fQiaJIw+rJ0xiBrGAjVYUMgxjD7VDwiucHnqUIl
         NTCUdusDljafU5kdG1dQf8QTyMdNfefZ5dfuHWwzZ/6r/UpAYOKoNzEaeLbFNhvURadU
         vZut7HAeqbC7JFm8PUZwgGfAUOgbXj1jpKaY9S8MxkCD6g7espVwVFcFncPxN+iuS1Ex
         FY1w==
X-Gm-Message-State: AOJu0YxkQA/FJiKJ1SzgQVt6Qu3y0x1c7SzmKxjc65fcxXaAmHcOB5Et
	/Uy06p2II/hGOFmnEdq0wJ65tVH1mlQcEelZzlVIZzMbub0/YTWFxDqKhgAebRqi+iaF1dC9rqr
	bMa+o3w==
X-Gm-Gg: AR+sD11lcHKPth0/6iKZAw4ejJFYKAhLhdyANB4Ea/CHvYgcgLLR31w47nKi/TscuSW
	W5KYpAeEL4ZnX3/69w8x4f8eLMVtDwyJ4fEVjlP7jt7UGQ1Lp3DIqa3kg0j22eBokmfDDU++WPR
	5WXHa7QWFVjnHmpcpFTBJg10qQur5UgN3Awoi4RPv0T1AcOpRThjLQbqpr0LJXDAa2QuuHvl4T9
	dPf8dXGxeXHy3kGZYVXsKHGDz7j7GWVZmSrf9ZikzhsjASNeO+cwkSWoD9ZSop/VSGugXxb1fbU
	PTFYfYpPhfIqWDCsOHU/YKElbFtfO/3yTA+5LKLYauiHBH2FnsZfqoQ8W7BmIH7NirpdQnqwKpY
	dlwLYK20MtxWhh9E7oLqco1MVrjD9M85Zfta7RC/fuW4JaxrDD+HvlW9eiy7+BV71Rl8CM8DsNu
	0d1CCHZEimefsyPlRw+hQTH/yPu/J8xRRgnqbJWQiUfBcTGEcC3+Z0pvGGJRcN23saJXdrNv5Tj
	iNh8prF9WwB2lI1eojidl7xS3klqWsxDecJnPkDiPvTQdIazg+e
X-Received: by 2002:a05:600c:4614:b0:499:858f:2653 with SMTP id 5b1f17b1804b1-49987929193mr238357775e9.2.1786956884595;
        Mon, 17 Aug 2026 01:54:44 -0700 (PDT)
Message-ID: <f72a1f61-b258-4f7d-b61a-6ba04cb11207@suse.com>
Date: Mon, 17 Aug 2026 10:54:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 08/14] XSM: pass just SBDF to xsm_{,un}map_domain_irq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
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
In-Reply-To: <ef09b072-c935-459e-bf8b-81c96ff9cc46@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786956885-BF46D757-85A595FB/0/0
X-purgate-type: clean
X-purgate-size: 4874

That's what Flask needs, and by unifying the hooks flask_map_domain_msi()
can then also serve both flask_{,un}map_domain_irq().

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
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
@@ -470,7 +470,7 @@ static XSM_INLINE int xsm_pirq_mapping(
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
 XSM_HOOK(int, pirq_mapping, struct domain *, bool)
 #endif
 
-XSM_HOOK(int, map_domain_irq, struct domain *, int, const void *)
-XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const void *)
+XSM_HOOK(int, map_domain_irq, struct domain *, int, const pci_sbdf_t *)
+XSM_HOOK(int, unmap_domain_irq, struct domain *, int, const pci_sbdf_t *)
 XSM_HOOK(int, bind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 XSM_HOOK(int, unbind_pt_irq, struct domain *, struct xen_domctl_bind_pt_irq *)
 
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1030,17 +1030,14 @@ static int cf_check flask_pirq_mapping(s
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
 


