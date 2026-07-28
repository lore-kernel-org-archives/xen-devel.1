Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5DC9C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 13:24:52 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1374173.1621146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohnW-0005jk-Ra; Tue, 28 Jul 2026 13:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1374173.1621146; Tue, 28 Jul 2026 13:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wohnW-0005jd-OC; Tue, 28 Jul 2026 13:24:42 +0000
Received: by outflank-mailman (input) for mailman id 1374173;
 Tue, 28 Jul 2026 13:24:41 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wohnV-0005jM-Dv
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 13:24:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wohnU-002vuo-Qv
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2026 15:24:40 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad98-e002-0a2a0a5209dd-0a2a450cee00-0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:24:40 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a68ad98-f479-0a2a450c0019-d1558035d914-3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 15:24:40 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso20203925e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2026 06:24:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85bc62basm61860788f8f.13.2026.07.28.06.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2026 06:24:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1785245080; x=1785849880; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=31bEzBE374yqE4es14uilqJ/7IGdLVYHPRoJ2VGKJ8Y=;
        b=P9U2qKww9AQtG3VFAf3RjUgAESmqEdskQWIPmmKEvi8SM3u44uGOYzI+2YoUiuCcwW
         ygAKfR567D165ZNf+2X9kIxWjKrmY4QgOa1KwVngcMXmAwgjOoVO9d8psrAhTHGXS1D0
         DUf74AcWmc6oLvFUt1jMa0n+hMOmUv8pB1xrMpPIY5pQ3F+aTDyxeC4+uI6SeYBGizAw
         zalQpWUUWeHVjpIL80tREhu0IbPihYDw+2e9MAgp0t3syeTsWbSOx4JjNcq63JkfYc+W
         U1KqLWlj0o140Rv3vAlfSHMsiVRKQtkZJxO22KYnpa3a7IIbNn4ZB2rOfkqv3bAvXsVt
         FVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785245080; x=1785849880;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=31bEzBE374yqE4es14uilqJ/7IGdLVYHPRoJ2VGKJ8Y=;
        b=BeRLB6WTCXmorQ8l2EShHjDLZhn1EMK5Y+DeUxIujNw3aPEvM2Xs78l8GQ1Gi/jsTw
         VCltLAshVCCVdIBcvDSPW+nc9XpCA/2NaHnqjxSYcwqJEQaYAt4PR66Mk8vLoIHFvvKM
         KnDkAyM1oBTwtmsTL6wC43F5KFMYU1iWm1lEwdulutDHylsa+a7vKLVuQTJghMaifj6X
         cJcX2Dp49aqi0Fj3zdvY/V69zM+o2mjbhJp+85sw4ta+Yi7HmxMdYZvrFTWOnSzfoD29
         NiRwwzVKYfvjU1kjnC5AeYiPc2NgWzWA6/RXYb9ubtFqkFEWxg+Ma25fCpdRji2yVaHA
         lYlA==
X-Gm-Message-State: AOJu0YwnPWgBNGzNLT1q7GGmvUbH3TiBz3+GVPwEE7MCgDvDoGZbHDRd
	ijhmA+B3XbbTEbPPQsRjqLMiy7fvrPCE2xQomyurvykXiLKiNPNE9U3yq9UgWjqmJ2C6S44teIi
	gHqyHbg==
X-Gm-Gg: AR+sD13bSy9QoD5K4KEddsgjrNp0RIS2R9Z8BwYq0eM7HU7LQ7Cu8FuVkHETF+5PkBV
	ZxSRxguVijSLvdI+BRLmjk5yAGUEqeZtfQ/DkO9jixe0SQ1zzSpgCDjB4vjW4t+aW2rBNc50Po3
	p05Srdo3M6B3vOWGastOX3+pHWP5sK6KYYRZJ7Elk6LFvALeuI/0E5n0UcZ6MPyQMDI1q1PFwFp
	431+dhRbW8pqeBKvwj0RArdNqP147uyo0rBZdFscoPLC2D3zIYdVjdvmflX8P1D0g6zwRVJEQBz
	io6McO7FW9mxw4y2++nrvZVnJvP/WmyC0nFvDuNJ+nM/++apnKH+Wyc+qqFfKMaRZU1OawH7zCO
	KXt3t7aqUIawPXwirl3S7Rr6hhCpy2DKPzuu4dU6qOHb1ke5ZdB2QF/nKwf101e1ud7voReTjfJ
	ySSQ/tn5OPUSlwxDuSsOPfLLh73NH+BFgtjauJw5eJ79BJWkHjfdfRL/K52gJpHvbCB9BwtloMU
	3Zc
X-Received: by 2002:a05:600c:524f:b0:495:51b6:174f with SMTP id 5b1f17b1804b1-496c656539amr27433565e9.20.1785245080164;
        Tue, 28 Jul 2026 06:24:40 -0700 (PDT)
Message-ID: <4ea749a8-4bc4-41c7-92fe-ceb029ab9afb@suse.com>
Date: Tue, 28 Jul 2026 15:24:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 21/24] x86: type-correct last parameter of map_domain_pirq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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
X-purgate-ID: tlsNG-d25034/1785245080-026DEA5B-E641C06B/0/0
X-purgate-type: clean
X-purgate-size: 2091

This was meant to allow for non-MSI data to be passed if necessary, but
the way XSM/Flask uses the (propagated) argument that's not going to work
anyway without further adjustments. As no secondary use has surfaced in
many years, switch to using the correct type.

Leave XSM alone, as that'll be changed subsequently anyway (to then also
no longer use plain void).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -27,6 +27,7 @@ typedef struct {
 } vmask_t;
 
 struct irq_desc;
+struct msi_info;
 
 /*
  * Xen logic for moving interrupts around CPUs allows manipulating interrupts
@@ -161,7 +162,7 @@ struct arch_pirq {
 int pirq_shared(struct domain *d , int pirq);
 
 int map_domain_pirq(struct domain *d, int pirq, int irq, int type,
-                           void *data);
+                    struct msi_info *msi);
 int unmap_domain_pirq(struct domain *d, int pirq);
 int get_free_pirq(struct domain *d, int type);
 int get_free_pirqs(struct domain *d, unsigned int nr);
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -2180,7 +2180,7 @@ int get_free_pirqs(struct domain *d, uns
 #define MAX_MSI_IRQS 32 /* limited by MSI capability struct properties */
 
 int map_domain_pirq(
-    struct domain *d, int pirq, int irq, int type, void *data)
+    struct domain *d, int pirq, int irq, int type, struct msi_info *msi)
 {
     int ret = 0;
     int old_irq, old_pirq;
@@ -2214,7 +2214,7 @@ int map_domain_pirq(
         return 0;
     }
 
-    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, data);
+    ret = xsm_map_domain_irq(XSM_HOOK, d, irq, msi);
     if ( ret )
     {
         dprintk(XENLOG_G_ERR, "dom%d: could not permit access to irq %d mapping to pirq %d\n",
@@ -2245,7 +2245,6 @@ int map_domain_pirq(
 
     if ( type == MAP_PIRQ_TYPE_MSI || type == MAP_PIRQ_TYPE_MULTI_MSI )
     {
-        struct msi_info *msi = (struct msi_info *)data;
         struct msi_desc *msi_desc;
         struct pci_dev *pdev;
         unsigned int nr = 0;


