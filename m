Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7DBC61DBD
	for <xen-devel@archiver.kernel.org>; Fri, 28 Aug 2026 07:04:23 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1401631.1637186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqdC-0004yV-NH; Fri, 28 Aug 2026 07:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1401631.1637186; Fri, 28 Aug 2026 07:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzqdC-0004yO-KJ; Fri, 28 Aug 2026 07:04:06 +0000
Received: by outflank-mailman (input) for mailman id 1401631;
 Fri, 28 Aug 2026 07:04:04 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzqdA-0004xw-KA
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 07:04:04 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzqdA-00DmW4-0z
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2026 09:04:04 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9132df-2eae-0a2a0a5409dd-0a2a4508af0a-26
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:04:04 +0200
Received: from [209.85.128.42] (helo=mail-wm1-f42.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a9132e3-f659-0a2a45080019-d155802ab58a-3
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 09:04:03 +0200
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-49557167508so5879625e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 28 Aug 2026 00:04:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49b497fa9c5sm103143025e9.4.2026.08.28.00.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Aug 2026 00:04:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1787900643; x=1788505443; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DmF1sxJKk6keuGbs+Ea+dEobCZFX5puzwyTbL1N5ULM=;
        b=IUttZ1QqG7XhlILV0P+E3X+ePLpWRMh+3k6CuLDiJk1G7P/JryDnlSbPm3gaOWGWWT
         H53R5dVGpZUrVdEky9h/nywr+xNZUUTAby75qPeQIKezsezuWwVs2Dl7AKVRQazqqQbr
         By6/S0RNnG+p9tDslib6hqQi7baYfVsLD4gP2f7sBOyv65awszGN9MWqtXZzD4PX+E5j
         OeH4csFyxzvUWbpHAzFBZNxtKWQ9BN9yK74tB4vbx+sdL7AAKTkJ8CjkL671J4ujsRYQ
         wd31Mb0WAUnUAul7YYdUfD7RbPy44UUXA5mSfgSbEWQj9JBokmL6OS8huFmYFiEh1ox6
         W1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787900643; x=1788505443;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DmF1sxJKk6keuGbs+Ea+dEobCZFX5puzwyTbL1N5ULM=;
        b=UB83/OZIbifbYR1fNmiibIw7oyszRC50SnHbNehdERGit4lC3Lic+4S0Do11Viy6vB
         8jC7GbO/e+ibNn0F574ksFJCvEuq0KsDc7dOdv2jUZ3qlaa+tONWhD8ojUFjwSkBZNMJ
         w26zS3xs6sw6M+uTaPHlh7k0Y2u24gKDIc0UUfYC02eSKOf5iUpNtVU5hb0WETQhp/RY
         FsUZ1WOxDI0nTM+EvxArmKsnJB8oaCJUxxwa5k5fob32Z3w4Hz40cvxEqAl1WqgD/I48
         /EnZYuTr4p8kD+wAr5AnCefjFk6Q7sniVnXYizViT+13QIKOWQafGxOg5BP2sztkUOo1
         1U9g==
X-Gm-Message-State: AFuF++nj27CF05/xzphsi3WrB+JEBoD6rtNZZiVWaZQ98ThqYx5EWMMO
	Fh4r6tNL7fekmHWfiktGA62hkMd90NIdlf3Wcr7m4vaxg/o04RkAwJUBMh2wA0KI+oLXxhrYbmp
	9B163oA==
X-Gm-Gg: AR+sD11m4AQIaOvBP6N65FjFek1mxSvLjI4A2xJRWozTWWS34qDDsQA+g1eoTnUGIVN
	am0/e00B4Pox2kM9D98zxVekLAAsImO0iPcqpuCC/TqTQTM2COT/9NTvCr8w92wfWe0TUFEfroR
	ub5Vz0+nG8bnhYcPARQkEX+ZAXK3Ss94JJ70YJ0a8Pt3c1t62sAigtIDOroalMUU43Z3SM8jj4E
	wz9Ve9EN14JUoHJ0dAHFNUdol97o3XUAyfdwRnvHXynZClq62hQUimLFm6ZSOJoSCB1Ocl1lsYi
	wm/0MkY6DxJpClmQOGVA2RjvO7yE3U4nD4kzGSz6Lor8Qj/bMGSfZ5Vm/CaaSCZNm02l+tazQ6U
	9y8FaT05mkHvduvgvskGkBtDOq4kgKOheNjXOJbCs5hejoFMcnvzmozX5TnXxU2XcB52zSuiqNu
	BJX/XPJyrczlnOxUXzHaJvLSAjkM9UcDnM6kVDLGguNKuFupQo4HUCJuB6xBtwj0PiB0dzhblvb
	YTVGj8NHMh3aGkO8FVI/RUz/WymnO9KDlCJSWTbce8Y+0RPESUGZoHF6LjSfKU=
X-Received: by 2002:a05:600c:4594:b0:49b:4d64:bbc4 with SMTP id 5b1f17b1804b1-49b91c2f990mr57810185e9.8.1787900643344;
        Fri, 28 Aug 2026 00:04:03 -0700 (PDT)
Message-ID: <afa5c348-744a-4a4b-8b00-2971ca3376cd@suse.com>
Date: Fri, 28 Aug 2026 09:04:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/12] Arm/GIC: add noreturn in a few more places
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
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
In-Reply-To: <90d0e3d6-2e12-43f1-815d-7936ca4c5fc6@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1787900643-D735D87B-83B1FCEB/0/0
X-purgate-type: clean
X-purgate-size: 2030

LPI related functions having just BUG() in them are disliked by Misra /
Eclair, as long as they don't also have a noreturn attribute.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
From its description "Unreachability caused by calls to the following
functions or macros is deliberate and there is no risk of code being
unexpectedly left out." I would have expected the respective entry in
deviations.ecl to cover all of these cases, but clearly that isn't the
case.

Of course having noreturn on functions returning non-void is somewhat odd.

--- a/xen/arch/arm/gic-v2.c
+++ b/xen/arch/arm/gic-v2.c
@@ -1315,7 +1315,7 @@ static int __init gicv2_init(void)
     return 0;
 }
 
-static void gicv2_do_LPI(unsigned int lpi)
+static void noreturn gicv2_do_LPI(unsigned int lpi)
 {
     /* No LPIs in a GICv2 */
     BUG();
--- a/xen/arch/arm/include/asm/gic_v3_its.h
+++ b/xen/arch/arm/include/asm/gic_v3_its.h
@@ -229,7 +229,7 @@ static inline unsigned int vgic_v3_its_c
     return 0;
 }
 
-static inline void gicv3_do_LPI(unsigned int lpi)
+static inline void noreturn gicv3_do_LPI(unsigned int lpi)
 {
     /* We don't enable LPIs without an ITS. */
     BUG();
--- a/xen/arch/arm/vgic-v2.c
+++ b/xen/arch/arm/vgic-v2.c
@@ -718,14 +718,15 @@ static void vgic_v2_domain_free(struct d
     /* Nothing to be cleanup for this driver */
 }
 
-static struct pending_irq *vgic_v2_lpi_to_pending(struct domain *d,
-                                                  unsigned int vlpi)
+static struct pending_irq *noreturn vgic_v2_lpi_to_pending(struct domain *d,
+                                                           unsigned int vlpi)
 {
     /* Dummy function, no LPIs on a VGICv2. */
     BUG();
 }
 
-static int vgic_v2_lpi_get_priority(struct domain *d, unsigned int vlpi)
+static int noreturn vgic_v2_lpi_get_priority(struct domain *d,
+                                             unsigned int vlpi)
 {
     /* Dummy function, no LPIs on a VGICv2. */
     BUG();


