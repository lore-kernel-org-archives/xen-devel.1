Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2BBC5B572
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2026 08:54:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1392684.1631656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt6l-00042z-Eq; Mon, 17 Aug 2026 08:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1392684.1631656; Mon, 17 Aug 2026 08:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wvt6l-00042s-C9; Mon, 17 Aug 2026 08:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1392684;
 Mon, 17 Aug 2026 08:54:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wvt6j-00042b-Px
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 08:54:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wvt6j-00G9eg-6a
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2026 10:54:13 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc34-e002-0a2a0a5209dd-0a2a450180da-4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:54:13 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a82cc34-5984-0a2a45010019-d155dd2bc8a8-3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 10:54:13 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-480033bdcf4so1813602f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 17 Aug 2026 01:54:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a7168bbesm601201f8f.0.2026.08.17.01.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2026 01:54:12 -0700 (PDT)
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
        d=suse.com; s=google; t=1786956852; x=1787561652; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=31bEzBE374yqE4es14uilqJ/7IGdLVYHPRoJ2VGKJ8Y=;
        b=WXt+b+gYYg4YFkF2fWb0JmKsSl1WVwET5afkOCkxhzw8f5MB21g4p4toYiq7QeUWog
         3j/XPqd+TzC4Fntgo+JOMXasBY30f6lEk3K4itisvwA25nN/dlhiwSVmXgJwlvbXGdbr
         mG9DtFwbea1GXd50meUJYBrCHERb1vP9JW4Em4gnri5mcdbRuNq43X71nP72BtyqpVOW
         /aJTczmMN5RsuFL24c5NKvi3ENsCcjThatKb6UzE0L6T4dXMra8EUPVnwrffl7QiLwJl
         2lf1Bnmadouq1U+F6RvcSFexf/SEmaY6tSsj13eiIYBMp99G8SGL6JkOR6Bm5DNF1P9R
         6DEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786956852; x=1787561652;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=31bEzBE374yqE4es14uilqJ/7IGdLVYHPRoJ2VGKJ8Y=;
        b=bsoBDI61SGBFUVWW3W1LRHGcOzRlCd61ZufOD0tDGFFAz53aBt/jG1g/h4v9zQQ8r8
         XD3FJpQ1nFQiIi+mepgCQ9X8we8NodA6kLb+fbhjolELg/LFJxO/DVbEF1odabv0E8xX
         dYnlm1F4oRBM+QPulY82r+Bv0e/YUYmwTKDhjminDhBUHEnRZ3LpyO8Qo/XcbCYKFZX2
         CqHvlVBoaqe6JWhwqx46uuphVQUCfekOFhjy57eBtNfeHvl5KSVP8lLCDb3Xl85roU7K
         eO5bmEy5eVVwyAR4hLLQt99JELoq8DSXglWjwD6q047tXU/xPQP4tDwIostqpq/nWSG6
         hROA==
X-Gm-Message-State: AOJu0Yx0iPtoNKPGniYfxgmmE2CgmipyQOBeX0tzprKYBHiY4zfIg+uI
	EARdQEaMIOrKABttu7xlkXYYZ9tZf2yhlIuyvXIL3o49KPBQoIXkZg/1JP0aldxd5ru9rN+siNM
	ytFRfEA==
X-Gm-Gg: AR+sD13gM5RkO3e1mtfJ0WIkkZgEyhRnphTcn9XBvuFIW4DDTb3fiXDk3qMllhZq5Q8
	yIyWxftT6MjsJYQlcQPpTCHTgIy+ZgS5DCnwyZWpyOAF8ex6N+5wZ2+jRYzMNT7pmHmWtGF3Xbn
	pOYGKCDAjmYGQu/fb/Akzoni4S0shQ5o9f8jn/VSdwaZgEORbGYKCfxT3dk//IuPAT2U5GIRCFd
	lt7l+aqihuG42b+D99cm1BZVH3XH4nFaGW8mI+Sc6iOVBSVFZNaJR4GROyRgavDvvDDSjne0SRx
	fj2XdETcV6n7LVBJr1XCa1ychZcs7ZXhJnwXEdIjld5mBXJEv7WaouUOvvE1kDbFvj8vdKa2IYW
	n8WzYR7tuRVSHLz8RJnE9uE4RikghFvHtGSr+khWuVGhitS9g+qOQdNvVo7ADVWaMRf5H0vWbfB
	/nDm1AjaP+O2mhSIgroQsiaBYW0dolkonSNuuIGOyWA9Sg3VwWhBx64LoYCV78bYKu8uuJjak79
	nrpeXergiQ5kRXKzm3WTcQflwWa+XMv8Cm7XpGx1iSoght7ujCd
X-Received: by 2002:a05:6000:46db:b0:47f:7759:89df with SMTP id ffacd0b85a97d-4816071004bmr28042923f8f.3.1786956852540;
        Mon, 17 Aug 2026 01:54:12 -0700 (PDT)
Message-ID: <3c118229-c591-4f5a-afe5-7a2e95fbbdac@suse.com>
Date: Mon, 17 Aug 2026 10:54:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 07/14] x86: type-correct last parameter of
 map_domain_pirq()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
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
X-purgate-ID: tlsNG-d62444/1786956853-BC359757-19041175/0/0
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


