Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE70BC54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:19:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374110.1621072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohiX-0000h1-FM; Tue, 28 Jul 2026 13:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374110.1621072; Tue, 28 Jul 2026 13:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohiX-0000gu-CV; Tue, 28 Jul 2026 13:19:33 +0000
Received: by outflank-mailman (input) for mailman id 1374110;
 Tue, 28 Jul 2026 13:19:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohiW-0000gg-4R
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:19:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohiV-00ES3R-HY
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:19:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac61-2eae-0a2a0a5409dd-0a2a4508ecec-4
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:19:31 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ac63-f659-0a2a45080019-d155dd2de487-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:19:31 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-47f703a9d05so2581913f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:19:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85c6e9a2sm60807339f8f.35.2026.07.28.06.19.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:19:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1785244771; x=1785849571; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oX+S8t4Xv21gIwLzdmsHp6pUsFjHDfd2dB/4aRgiBe4=;
        b=EZp31Yl7lw/Hg2w6OF+/UQbXsz+8GvhfBkMnn/XGP6UkmE0frFe36rYRmjfy1OfcrK
         ZC6sppcShi09eeBr8Zad6FKhR/cnccMouHrGlGN3TbNwPDEIs1gqlBOvJMfKmCyjTLkc
         bPiavhGx63Uhp/mVfYEPMh9Ez8gNXSonMlhtsXoYg6J/AtiFm9UhDb9ZAoArMDR8C7Ne
         Mcncx2AX9vAsbAfENoDf8q/4mruqQTUGwfVcSX+jrvFBrOaj9Vt/4ZHtqFsqqilxREHR
         mlfYvRZQ7ijH4HMmnDYsNURW+k2GGXotcXOYY5c8cuYPBzkaHW1tqzsonB57d9QSoRpT
         tqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785244771; x=1785849571;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oX+S8t4Xv21gIwLzdmsHp6pUsFjHDfd2dB/4aRgiBe4=;
        b=CZv0IgDWLgfgloDWftffM6ypXa0aI53cjpepe9G8Y0PgiGaSSQK7CvjPlujhFK3/2P
         /MEq/TNjFIu6ypj8jpw/GrVB5m+gkc2bjZGd5r2DtjfjjAHzwqwgLoTQiSV5+s/81QQF
         DaFSRqFXf/24yAd6CjWdZ9wSTbuBY1/3AWQiHjI+FBeAustsBj11pSZFrl8RO84dXGqi
         IkW07WFa2HTpOeOFPNrDOZ9GVAKm6jJ6HOTaXOWV3585FVV7bda7tVpEpdqmmzlKTWb3
         Ry0qZCHQ0fcCOsqIIUHIL7eMJTpR2ZYN985yeJL3nVe6+uk9RbJndwSA0rPsKrrMjGta
         ctlg==
X-Gm-Message-State: AOJu0Yxrret/wIPfV8Lh8Mjgsvr3QJnEk63MLn6lDrCinXo9k2PEE9eU
	UI4gjMo5bZRV7xAXBpGPoHwgLlriOj4BO0yIq2+F7Lqr92iIGDbVHJwLXxoNmK6kQzEyKEn2KHz
	t7Hm8LA==
X-Gm-Gg: AR+sD12vEcyHI/Vt1D/kGisbmSS83/2A0x2yJXAIpucr7m1g0n/s9OAtJHeR8UIrjqy
	D+yNCDox++nx7evHq51Y4Vh1B/rLgUOZEpmZTEysEUo5VLTjaM1UZkFGB40w3J1rA2IOFMNLv49
	W2u1A9mdNr7UH2jk/SiYHXy51ZBe8TWuSgkp7fP+xX0MDvFwKIBIEnA0eXzJHyVQD+m3xxG98yW
	YK33iLtXu5zvXHS34TqTJJRLsVYISR2Ur5AiGILGVCk11mPj4uNuaCTPpFu86YLhQdnHf/Aj+iU
	WCCBWJz9SRPUseXgVtRQrOhVIXngqoX8/zV5EwxycjV7INOlxVZQyHZlNhSQltXkzqI5WQqlT/J
	dBq6CzAyNztuK6mJl64zyp8JrewWuXS5JfM1Kar6dQdBkNs/nzTf2EItrIzQNUu/CjsfMVr2aG0
	/NPv1W+7aU6idnzKQeYFTILqfADvituPhtvGnoDs18P1zZGtxS2u3NxDDnyJ2Bfzxjkg==
X-Received: by 2002:a5d:5f49:0:b0:47f:97e9:fe54 with SMTP id ffacd0b85a97d-47fb1ec2661mr2952117f8f.58.1785244770818;
        Tue, 28 Jul 2026 06:19:30 -0700 (PDT)
Message-ID: <5b3ba207-aa18-4ebe-9c8b-2ccf51240698@suse.com>
Date: Tue, 28 Jul 2026 15:19:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 13/24] x86: restrict PHYSDEVOP_* when PV=n
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
X-purgate-ID: tlsNG-c1860d/1785244771-D6B4187B-7C909BD8/0/0
X-purgate-type: clean
X-purgate-size: 4521

hvm_physdev_op() permits through only a subset of sub-ops. The code
handling other sub-ops is therefore unreachable when PV=n, violating MISRA
C:2012 rule 2.1. With that the XSM .apic() hook also becomes unreachable /
dead when PV=n.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
At least for the sub-ops using xsm_apic() IS_ENABLED() cannot be used.
Therefore #ifdef is used throughout.

--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -233,6 +233,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#ifdef CONFIG_PV
+
     case PHYSDEVOP_pirq_eoi_gmfn_v2:
     case PHYSDEVOP_pirq_eoi_gmfn_v1: {
         struct physdev_pirq_eoi_gmfn info;
@@ -281,6 +283,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#endif /* CONFIG_PV */
+
     case PHYSDEVOP_irq_status_query: {
         struct physdev_irq_status_query irq_status_query;
         ret = -EFAULT;
@@ -379,6 +383,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#ifdef CONFIG_PV
+
     case PHYSDEVOP_apic_read: {
         struct physdev_apic apic;
         ret = -EFAULT;
@@ -524,6 +530,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#endif /* CONFIG_PV */
+
     case PHYSDEVOP_pci_mmcfg_reserved: {
         struct physdev_pci_mmcfg_reserved info;
 
@@ -558,6 +566,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#ifdef CONFIG_PV
+
     case PHYSDEVOP_restore_msi: {
         struct physdev_restore_msi restore_msi;
         struct pci_dev *pdev;
@@ -589,6 +599,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#endif /* CONFIG_PV */
+
     case PHYSDEVOP_setup_gsi: {
         struct physdev_setup_gsi setup_gsi;
 
@@ -608,6 +620,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
                               setup_gsi.polarity);
         break; 
     }
+
     case PHYSDEVOP_get_free_pirq: {
         struct physdev_get_free_pirq out;
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -648,13 +648,6 @@ static XSM_INLINE int cf_check xsm_mem_s
     return xsm_default_action(action, current->domain, cd);
 }
 
-static XSM_INLINE int cf_check xsm_apic(
-    XSM_DEFAULT_ARG struct domain *d, int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, d, NULL);
-}
-
 static XSM_INLINE int cf_check xsm_machine_memory_map(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -670,6 +663,13 @@ static XSM_INLINE int cf_check xsm_domai
 
 #ifdef CONFIG_PV
 
+static XSM_INLINE int cf_check xsm_apic(
+    XSM_DEFAULT_ARG struct domain *d, int cmd)
+{
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, d, NULL);
+}
+
 static XSM_INLINE int cf_check xsm_do_mca(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -131,10 +131,10 @@ XSM_HOOK(int, mem_sharing_op, struct dom
 XSM_HOOK(int, platform_op, uint32_t)
 
 #ifdef CONFIG_X86
-XSM_HOOK(int, apic, struct domain *, int)
 XSM_HOOK(int, machine_memory_map)
 XSM_HOOK(int, domain_memory_map, struct domain *)
 #ifdef CONFIG_PV
+XSM_HOOK(int, apic, struct domain *, int)
 XSM_HOOK(int, do_mca)
 XSM_HOOK(int, mmu_update, struct domain *, struct domain *, struct domain *,
                           uint32_t)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1749,6 +1749,19 @@ static int cf_check flask_mem_sharing_op
 }
 #endif
 
+static int cf_check flask_machine_memory_map(void)
+{
+    return avc_current_has_perm(SECINITSID_XEN, SECCLASS_MMU, MMU__MEMORYMAP,
+                                NULL);
+}
+
+static int cf_check flask_domain_memory_map(struct domain *d)
+{
+    return current_has_perm(d, SECCLASS_MMU, MMU__MEMORYMAP);
+}
+
+#ifdef CONFIG_PV
+
 static int cf_check flask_apic(struct domain *d, int cmd)
 {
     uint32_t perm;
@@ -1769,18 +1782,6 @@ static int cf_check flask_apic(struct do
     return domain_has_xen(d, perm);
 }
 
-static int cf_check flask_machine_memory_map(void)
-{
-    return avc_current_has_perm(SECINITSID_XEN, SECCLASS_MMU, MMU__MEMORYMAP, NULL);
-}
-
-static int cf_check flask_domain_memory_map(struct domain *d)
-{
-    return current_has_perm(d, SECCLASS_MMU, MMU__MEMORYMAP);
-}
-
-#ifdef CONFIG_PV
-
 static int cf_check flask_do_mca(void)
 {
     return domain_has_xen(current->domain, XEN__MCA_OP);


