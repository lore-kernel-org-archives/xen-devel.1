Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF819C5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:52:38 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392659.1631629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt53-0002YX-JK; Mon, 17 Aug 2026 08:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392659.1631629; Mon, 17 Aug 2026 08:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt53-0002YQ-GL; Mon, 17 Aug 2026 08:52:29 +0000
Received: by outflank-mailman (input) for mailman id 1392659;
 Mon, 17 Aug 2026 08:52:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt52-0002X2-95
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:52:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt51-002rSu-MA
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:52:27 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cbc5-8faa-0a2a0a5109dd-0a2a450c89e0-18
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:52:27 +0200
Received: from [209.85.128.46] (helo=mail-wm1-f46.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cbcb-f479-0a2a450c0019-d155802ea579-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:52:27 +0200
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-495437bb891so28915185e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:52:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4999d06167csm23897685e9.3.2026.08.17.01.52.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:52:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956747; x=1787561547; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hicPJ0lkpk7PVJS0MRWq/kXZnKXC4WFY9rX0q730ZTg=;
        b=Q18UK3pnmIklxtKxthIIrwZG+DAxCyxYHogHDQOlKRSfw+F3JrX1eae3vEEIQTyzWQ
         TePOmpjok13S+I4aBWj/c9AgsxjB0j1cN+MdrRyVtAbDxC8jlavsYx0eg9rCIoEyOMQT
         uFee7zo2XkaQPfdOrBPPMiCThTYt5StEWOzdDeJ/m7cS+ZVtbU7u1G3LJCGPzCOsmxGN
         Cx3YqGa5G7zb5XrECPdNwb6LB7xM2wnRZFPC5oq/8NcS+LkPttjLDAIH6GfMchS5GLGL
         2DIPXPJ807ngKDNOD7uTtU/tm7kNcTmy7IZMVIIyY7vmKwzdF7QRggUSspCiw0H30z/x
         JIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956747; x=1787561547;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hicPJ0lkpk7PVJS0MRWq/kXZnKXC4WFY9rX0q730ZTg=;
        b=nQ+CYMUktopTBTnzUjSD83fiKIeUUprHqpcJPFE/SmFrxOKos54wR2dW5GrICkk8m5
         DyUiXIffQ2xHBOGT8CqUmbuCJn1KZPzBvbelTZFYTGSHXxVWA5jSF7K0zhN6qZnCUEoi
         rgXMq4fFeBLcBPlKWPju8awP0u87ig1u2pqkNeOdFsKlJHRSKFvfpK4pcEZi6/nfU13z
         AWSK71bYSajx2366gVsYqVUtx1r6l1LbwgcBK889hMYhwAz1dKF4di3EOmozPl1SnrPv
         nMO9rR3o7lGXesh6evROLHXulRhjjJOUEDHouNM/1XDTSJHfxd6D+EJEcARySslWmzwU
         hHIg==
X-Gm-Message-State: AOJu0Yz/S1cg3LX3N2Z3GYbejFCl6BsyDGCmPfXzuYICz/68rOWIDk+Z
	3yyFGkzBoiI3iw9k/LwoVnHYZH1H+R3Wf791dnM6NkUd9gg3yUV50O72QsdO3RnvlpsrgJNrfrH
	f/P4yyA==
X-Gm-Gg: AR+sD10Wf3Q2TxSb/0P//3baopwYEqeJRRZRoKKZ5JAz0jcfqmfOMlhP37LTX+VMKr9
	8pCEF8t8uU3x5/GpowQFkpkoNDcmhEPicaaLLV/t9UO+8e1z1Ze/2jMuuhTgGSlwl/n6tQKIBYd
	iHLrwjf7zlKwkQ68uUunUlGiwXxtchQ3CdTUDvASd0WfehGTdbE1nWEyIGZnZ48X8Tqqn9/ap1g
	Elq5CYxiReM5PGMYySxUt931rEE3r1saGp7SmCAFomBzW8Nzv0nRPnGm/GpnsglhRJCXfYDcmap
	tRFDdiKs5m44N5b//h7R7SEN3E/ziaOFoQGGJlrQp7WYefCA3YUvyV3YGs+8w3J+A2PWTdPP2zE
	AjU2hfwBEJKoih8UN7VZVwCt5ss/ZOgWBBUi20ymQ7L8CBD3nmGdoivkKB5yTFtEz4aodivYhB6
	wccv++SL+9xn1xDH5yNziPcYfgH+TYOCFmJyTfYFekty0VqqpnmowJSl7AtlqvEvLjvhMsPZjxi
	mtGbfWvYFvgAOfaUBW3lN4zuKawqS7JFbLTD393sJyCzwCgd2Xs3D14ZIuimVc=
X-Received: by 2002:a05:600c:5643:b0:499:77ba:4b6 with SMTP id 5b1f17b1804b1-49987ad988emr253624925e9.9.1786956747083;
        Mon, 17 Aug 2026 01:52:27 -0700 (PDT)
Message-ID: <664d2a63-2745-4c33-9748-283aefce2433@suse.com>
Date: Mon, 17 Aug 2026 10:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 04/14] x86: restrict PHYSDEVOP_* when PV=n
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel Smith <dpsmith@apertussolutions.com>
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
X-purgate-ID: tlsNG-d25034/1786956747-026DEA5B-B044AD98/0/0
X-purgate-type: clean
X-purgate-size: 4589

hvm_physdev_op() permits through only a subset of sub-ops. The code
handling other sub-ops is therefore unreachable when PV=n, violating MISRA
C:2012 rule 2.1. With that the XSM .apic() hook also becomes unreachable /
dead when PV=n.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
At least for the sub-ops using xsm_apic() IS_ENABLED() cannot be used.
Therefore #ifdef is used throughout.
---
v2: Re-base over re-ordering of series.

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
@@ -526,6 +532,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#endif /* CONFIG_PV */
+
     case PHYSDEVOP_pci_mmcfg_reserved: {
         struct physdev_pci_mmcfg_reserved info;
 
@@ -560,6 +568,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#ifdef CONFIG_PV
+
     case PHYSDEVOP_restore_msi: {
         struct physdev_restore_msi restore_msi;
         struct pci_dev *pdev;
@@ -591,6 +601,8 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#endif /* CONFIG_PV */
+
     case PHYSDEVOP_setup_gsi: {
         struct physdev_setup_gsi setup_gsi;
 
@@ -610,6 +622,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
                               setup_gsi.polarity);
         break; 
     }
+
     case PHYSDEVOP_get_free_pirq: {
         struct physdev_get_free_pirq out;
 
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -644,13 +644,6 @@ static XSM_INLINE int xsm_mem_sharing_op
     return xsm_default_action(action, current->domain, cd);
 }
 
-static XSM_INLINE int xsm_apic(
-    XSM_DEFAULT_ARG struct domain *d, int cmd)
-{
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, d, NULL);
-}
-
 static XSM_INLINE int xsm_machine_memory_map(XSM_DEFAULT_VOID)
 {
     XSM_ASSERT_ACTION(XSM_PRIV);
@@ -666,6 +659,13 @@ static XSM_INLINE int xsm_domain_memory_
 
 #ifdef CONFIG_PV
 
+static XSM_INLINE int xsm_apic(
+    XSM_DEFAULT_ARG struct domain *d, int cmd)
+{
+    XSM_ASSERT_ACTION(XSM_PRIV);
+    return xsm_default_action(action, d, NULL);
+}
+
 static XSM_INLINE int xsm_do_mca(XSM_DEFAULT_VOID)
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
@@ -1750,6 +1750,19 @@ static int cf_check flask_mem_sharing_op
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
@@ -1770,18 +1783,6 @@ static int cf_check flask_apic(struct do
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


