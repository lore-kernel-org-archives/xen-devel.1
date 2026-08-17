Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39749C5DF70
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:52:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392653.1631622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt4e-000261-D8; Mon, 17 Aug 2026 08:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392653.1631622; Mon, 17 Aug 2026 08:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt4e-00025u-8Z; Mon, 17 Aug 2026 08:52:04 +0000
Received: by outflank-mailman (input) for mailman id 1392653;
 Mon, 17 Aug 2026 08:52:03 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt4d-00025k-E6
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:52:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt4c-00GMOB-RE
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:52:02 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cbb0-e002-0a2a0a5209dd-0a2a4502c5ea-8
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:52:02 +0200
Received: from [209.85.221.52] (helo=mail-wr1-f52.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cbb2-6ca4-0a2a45020019-d155dd34ede4-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:52:02 +0200
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so3185593f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:52:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b7cd38sm2338219f8f.32.2026.08.17.01.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:52:01 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956722; x=1787561522; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K2Unx129q4eX6PMvb4yv3itragzYIlcm4Wp+G/Yi98I=;
        b=L8XZFSbcoa2DGBjoFKPXeDoMPB61/F3oNkl4mlUfUzaUpWwsGo3mzY9HcNCY7GaWPg
         199juwsootLOVb90tGjrxwMGz/tfvHnKwXDNixlCkb4LwuMB8K77y8ciCBZc8vtaIDCM
         a5pHgf4qFQHyh7pibsqCjqyMz5J4QEfBxSrnbTjFRxvVSa6rlFrVpfNm81Yl1x4RFkdj
         JBjgOogQiVFvIQdupqpDjED23OLGzLTEnsT7cO5OgUglgDgIphshT2JtErZ1BRRsnFdp
         ehKiOWcz3sNOKe5apET+UOhsCNkuvUs6aHMFDX0YNOs6K3gWljO6Yw+5mgUPUNpf7Q67
         sPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956722; x=1787561522;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K2Unx129q4eX6PMvb4yv3itragzYIlcm4Wp+G/Yi98I=;
        b=IdbN07rpyhrRMQK+dps+jUZH3g/9/QZP3j1h6DQRlBlwdRrvs4S45WpC9nmGYDKtEW
         R4bCifRt4qM3+ovWdeS83NjdDoeHUJ6ohGU82weyIkhl4cgx8BRt0MAzeiKbFx+EZG5o
         zmFGjp5EkbWTh6fI5iUjAQDQvr7TeuqcIvBrt3n0OBKNoFtuUJdcgi8fQ9M6r8g9NJJN
         tWYv/Hoox63m+9NxIIxjGa9qTl4OQn5daQi5LLiqO5ZEgDyhNS3k/F6nr00xnf8KtlSp
         36AdpTHVZK9QUTmS7Dr16VfUsJ1Fje8hbkNaNupZfV1X+sP4JvkRZYfkSPmmhCSmxTrh
         Q1jg==
X-Gm-Message-State: AOJu0YwOM+He4Cp5EP6tdgBtserRXxURsn1LLglpaRCFi7va1/kJug75
	POUF8QSbPOZCObIGmvP5rReVfjqWOse2cgx8YRytsAkC6q9aNw1+WflngcDhWVkZF8NM4/hP/Yz
	OtN85pA==
X-Gm-Gg: AR+sD13D3fbF34G28gs+qj2EzOfP6+3y/RzC3Wz2l2y7SIBA6F90HVSrcEU1ezOEyh7
	jxzv023zRG4hwnngAeTZHVtArcpy3EexZpzdL6dHIjNRu/aTo/sCtEzGnH5Vwv6ZhCFdIjGU2UH
	L04IXR6EeUwjafgcMhN8fuIA6T01oXUbvhhe05t4dT2wAmQOAXxZ4ex300plC7fxlf6PmMOF6v3
	FQtT8I9PpAGznDV2S4bL5S5KAzMWDTp/VEy5ET56BYFq2+SUkNGmd/I6HYBw3JTUysUKVYe1oc6
	2r8DicYsc9CDuSTQY0dKEhEJb4Dh2U+br4Cd4/0DmURSrxJgciJOYivi7bFWncMNOpdnkJuMT6o
	A93Ylanxfwn2p3Lvn1r+FJ/+msGm4UdTAm+tgO2S+AEL8XhrPAg2DrGD7TVByUtHwabGnnyuydP
	iDEpJqyxEDBN2oKE7DXJGc/jU18/FUCLEOiUi++JWPoOk7apxITshgpi3EWlf+VDi4JpmzbiYuu
	vhVTUIFovczeEkmhwUsndUptcK6NLtFOG/76kb2uV51eZm8Lc7anQqgxhLIy8Y=
X-Received: by 2002:a05:6000:230f:b0:47f:f1ab:9075 with SMTP id ffacd0b85a97d-4816074ccd8mr32295966f8f.20.1786956722292;
        Mon, 17 Aug 2026 01:52:02 -0700 (PDT)
Message-ID: <4f7a34b6-b522-4d8f-a678-304ef4c0f916@suse.com>
Date: Mon, 17 Aug 2026 10:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 03/14] x86/mm: get_page_from_l1e() is PV-or-shadow-only
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
X-purgate-ID: tlsNG-720697/1786956722-303C42AC-3D3C2DEA/0/0
X-purgate-type: clean
X-purgate-size: 3450

Otherwise the function is unreachable, violating MISRA C:2012 rule 2.1.
With the function compiled out, its dedicated XSM hook also becomes
unreachable, so it is similarly guarded.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
It feels suspicious that the .priv_mapping() check is used for HVM guests
in shadow mode, but not for ones in HAP mode.
---
v2: Also conditionalize the declaration.

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -404,10 +404,13 @@ int  get_page_type(struct page_info *pag
 int  put_page_type_preemptible(struct page_info *page);
 int  get_page_type_preemptible(struct page_info *page, unsigned long type);
 int  put_old_guest_table(struct vcpu *v);
-int  get_page_from_l1e(
-    l1_pgentry_t l1e, struct domain *l1e_owner, struct domain *pg_owner);
 void put_page_from_l1e(l1_pgentry_t l1e, struct domain *l1e_owner);
 
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
+int get_page_from_l1e(
+    l1_pgentry_t l1e, struct domain *l1e_owner, struct domain *pg_owner);
+#endif
+
 static inline struct page_info *get_page_from_mfn(mfn_t mfn, struct domain *d)
 {
     struct page_info *page = mfn_to_page(mfn);
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -836,6 +836,8 @@ static int cf_check print_mmio_emul_rang
 }
 #endif
 
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
+
 /*
  * get_page_from_l1e returns:
  *   0  => success (page not present also counts as such)
@@ -1037,6 +1039,8 @@ get_page_from_l1e(
     return -EBUSY;
 }
 
+#endif /* CONFIG_PV || CONFIG_SHADOW_PAGING */
+
 /*
  * The following flags are used to specify behavior of various get and
  * put commands.  The first is also stored in page->partial_flags to
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -701,12 +701,14 @@ static XSM_INLINE int xsm_update_va_mapp
 
 #endif /* CONFIG_PV */
 
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 static XSM_INLINE int xsm_priv_mapping(
     XSM_DEFAULT_ARG struct domain *d, struct domain *t)
 {
     XSM_ASSERT_ACTION(XSM_TARGET);
     return xsm_default_action(action, d, t);
 }
+#endif
 
 static XSM_INLINE int xsm_ioport_permission(
     XSM_DEFAULT_ARG struct domain *d, uint32_t s, uint32_t e, bool allow)
--- a/xen/include/xsm/hooks.h
+++ b/xen/include/xsm/hooks.h
@@ -141,7 +141,9 @@ XSM_HOOK(int, mmu_update, struct domain
 XSM_HOOK(int, mmuext_op, struct domain *, struct domain *)
 XSM_HOOK(int, update_va_mapping, struct domain *, struct domain *, l1_pgentry_t)
 #endif /* CONFIG_PV */
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 XSM_HOOK(int, priv_mapping, struct domain *, struct domain *)
+#endif
 XSM_HOOK(int, ioport_permission, struct domain *, uint32_t, uint32_t, bool)
 XSM_HOOK(int, ioport_mapping, struct domain *, uint32_t, uint32_t, bool)
 XSM_HOOK(int, pmu_op, struct domain *, unsigned int)
--- a/xen/xsm/flask/hooks.c
+++ b/xen/xsm/flask/hooks.c
@@ -1829,10 +1829,12 @@ static int cf_check flask_update_va_mapp
 
 #endif /* CONFIG_PV */
 
+#if defined(CONFIG_PV) || defined(CONFIG_SHADOW_PAGING)
 static int cf_check flask_priv_mapping(struct domain *d, struct domain *t)
 {
     return domain_has_perm(d, t, SECCLASS_MMU, MMU__TARGET_HACK);
 }
+#endif
 
 static int cf_check flask_pmu_op(struct domain *d, unsigned int op)
 {


