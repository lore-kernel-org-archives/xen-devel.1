Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE37CCA5FAC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2026 11:42:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1437087.1655850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBshl-0003DY-Vt; Wed, 30 Sep 2026 11:42:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1437087.1655850; Wed, 30 Sep 2026 11:42:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xBshl-0003DR-SD; Wed, 30 Sep 2026 11:42:33 +0000
Received: by outflank-mailman (input) for mailman id 1437087;
 Wed, 30 Sep 2026 11:42:32 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xBshk-0003DL-PG
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 11:42:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xBshj-00E96w-Od
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2026 13:42:31 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5a0-2eae-0a2a0a5409dd-0a2a450bc800-20
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:42:31 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abcf5a7-b7e8-0a2a450b0019-4a7de18cbf57-3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 13:42:31 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ffed768deso11312415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2026 04:42:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0174f9eaasm52446105e9.10.2026.09.30.04.42.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2026 04:42:30 -0700 (PDT)
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
        d=suse.com; s=google; t=1790768551; x=1791373351; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wc4Id7cS0Vl1qva52paLmzuuxvowOklXlpG//tZkDsc=;
        b=NQDrLh22iXvQlXDbmQVb8x+PesJE/tNcdT4iFNoHYxYzYW7Y1OlaT/CWCRNM3YAvVW
         9xINUnwjqgAi1kAEGl/RRR340aY62Ok37kIxWSY4S48sQGDwLv6mWQh3Wm/H400FrSB9
         bx7x7uSwLihxIPGl+heflUSOU8uwGWgu3kOrMRJBEQB+n3VRrx5cnrck0mT2K+DQsq2C
         bFkpCMHajpwJhxgkKS/crqsBlbHuR66rs/5+nbvBkzqfZWGgimuJxPsVlqG9y3gcMbOE
         NF2oZnMLss544wVhNbWzWIUhBZF6dVH+QrJZ92rquneoDumpNobyU6ZWE/rr/D6R4ZMK
         xL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768551; x=1791373351;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wc4Id7cS0Vl1qva52paLmzuuxvowOklXlpG//tZkDsc=;
        b=r7dhYdLnLaP4MLMj2u5ruK9H1uCuVLH7fnwYNr/7dqZC9vxGxHIZ7oyOWqgZa6tRw5
         FzOYlfDurZyTJ6VJY2TDbZ2iF2zvLCcr1o4OaWc1i9MjAGnkfbjU788BnPicEdg6xxZ/
         Wgqo8Ip4Edz6Hkrny8OvGAZbKi53yo7JdsfhycgOI4dEH1xbo1QOqdkvO/N6nStOFGZA
         yJV/q45nWvZZVZ7bHsR81FT/QMpArN3eS/Ove+FhJkJf0Tn055d1jhJ2ALTrGPoBeVTP
         urWHQSHZFtYNKT5IlB7GwLNTQcOf2EwgPOG02V+oif3TfWNnu3werTCIXJwxEEUFX+X8
         ZNqA==
X-Gm-Message-State: AFuF++lg+TFwSqhxV+30ec75lnuETycQEokn0yV8Y04o3dc8uHT8joZu
	3Qd1vrMwPw29eEis2bJWALi0cPt2kC7Xc5Jl8L5G8r1Y2xrV0hLm8CBU7UOm4+R3NAhj1jfYE7u
	Dho+KeA==
X-Gm-Gg: AYBFou2eJiP9VaKfL6yIb9gDEy1Gq4O7Wt83/Uy/4rHOaJ2YUwDlDujlLrQ+fAV+AZo
	uuq5CBLfcI7k2nRYiI77oSpAYYb8ymZgVcK09PuqtsoCio1rAjKeB74P3K3n8bzGRguRYzsZlm1
	tZhDF/qY79qIOgCN3opU6Da5WkJe5s2/hYiqZ/EuHQNgPIxpSOOv+I6yI2rlBpqwQPzmT3bocwa
	yrtxqjORXYDCVp++27W9Fy8Ue4wnpkv/OjCpRcJ5n9pYUmUxfesKmA4CEJzz03DEyGEqrMlasoT
	mE3HcuHE8aLsJMaoZHCLgnpTuyxOXmWtTQWTqT3qJjfe2A1hvWNoB1qhfHXPqU5oZ1d3g39QOOr
	tUB3NGpkEE4IsirYYIEIiwLLVWiLGW+odmLAY/9ZqFHp7taLYD1oUXrhjcd0B1IpMK81xhYYa1l
	t1Xwhz/+glp6dkCK33buc9dVsYYbh/Tl6qUkOXS/4nk3UB3RcBK9ep5IyRTGht865U8gP3cocx3
	3bY03MvL99mydFq6OsaXZtag60EGcMuZkrAUSx6yVxs8LR84jlUSwHv1vFKgmex
X-Received: by 2002:a05:600c:4e04:b0:4a0:1b14:d009 with SMTP id 5b1f17b1804b1-4a01b188d8bmr19534495e9.1.1790768551090;
        Wed, 30 Sep 2026 04:42:31 -0700 (PDT)
Message-ID: <e3f82d25-42b1-467b-93b7-902bf6c1bf15@suse.com>
Date: Wed, 30 Sep 2026 13:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/5] x86/pass-through: alter locking around
 pt_irq_{create,destroy}_bind()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Julian Vetter <julian.vetter@vates.tech>
References: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
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
In-Reply-To: <e34484a9-03f8-40f7-8627-7d5e668dbd63@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1790768551-A9AC09EA-423AC0A5/10/78276251493
X-purgate-type: spam
X-purgate-size: 2321

The questionable use of pcidevs_lock() there was discussed more than once.
It really is pointless: The functions synchronize primarily via the per-
domain event lock. They also may already be called with the global PCI
devices lock not held: See hvm/vmsi.c:vpci_msi_update(),
hvm/vmsi.c:vpci_msi_arch_update(), and hvm/vmsi.c:vpci_msi_disable().

It's merely msixtbl_pt_{,un}register() which require the global or per-
domain PCI lock held. Switch to using the latter, which is also sufficient
to acquire in read mode. While strictly speaking this is needed only for
PT_IRQ_TYPE_MSI, keep it being unconditional. In vioapic_hwdom_map_gsi()
also unlock earlier.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Replace locking rather than dropping it altogether.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -636,9 +636,9 @@ long arch_do_domctl(
             ret = -EPERM;
         else if ( is_iommu_enabled(d) )
         {
-            pcidevs_lock();
+            read_lock(&d->pci_lock);
             ret = pt_irq_create_bind(d, bind);
-            pcidevs_unlock();
+            read_unlock(&d->pci_lock);
 
             if ( ret < 0 )
                 printk(XENLOG_G_ERR "pt_irq_create_bind failed (%ld) for %pd\n",
@@ -670,9 +670,9 @@ long arch_do_domctl(
             ret = -EPERM;
         else if ( is_iommu_enabled(d) )
         {
-            pcidevs_lock();
+            read_lock(&d->pci_lock);
             ret = pt_irq_destroy_bind(d, bind);
-            pcidevs_unlock();
+            read_unlock(&d->pci_lock);
 
             if ( ret < 0 )
                 printk(XENLOG_G_ERR "pt_irq_destroy_bind failed (%ld) for %pd\n",
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -197,8 +197,9 @@ static int vioapic_hwdom_map_gsi(unsigne
         return ret;
     }
 
-    pcidevs_lock();
+    read_lock(&currd->pci_lock);
     ret = pt_irq_create_bind(currd, &pt_irq_bind);
+    read_unlock(&currd->pci_lock);
     if ( ret )
     {
         gprintk(XENLOG_WARNING, "vioapic: error binding GSI %u: %d\n",
@@ -207,7 +208,6 @@ static int vioapic_hwdom_map_gsi(unsigne
         unmap_domain_pirq(currd, pirq);
         write_unlock(&currd->event_lock);
     }
-    pcidevs_unlock();
 
     return ret;
 }


