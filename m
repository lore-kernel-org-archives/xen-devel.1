Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E52D606A899
	for <xen-devel@archiver.kernel.org>; Wed, 11 Nov 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=geflKnRS
Received: from list by lists.xenproject.org with outflank-mailman.1484149.1687514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9zi-0007tJ-4y; Wed, 11 Nov 2026 15:12:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1484149.1687514; Wed, 11 Nov 2026 15:12:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xR9zi-0007tC-1t; Wed, 11 Nov 2026 15:12:14 +0000
Received: by outflank-mailman (input) for mailman id 1484149;
 Wed, 11 Nov 2026 15:12:12 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xR9zg-0007r2-1B
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 15:12:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xR9zf-003pYC-EH
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2026 16:12:11 +0100
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485bc-2eae-0a2a0a5409dd-0a2a45048e46-42
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:12:08 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af485c8-b57f-0a2a45040019-d1558030a519-3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 16:12:08 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a9a8d6cea8so39658415e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2026 07:12:08 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4c4a3d30sm3716315e9.0.2026.11.11.07.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 07:12:07 -0800 (PST)
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
        d=suse.com; s=google; t=1794409928; x=1795014728; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RuVjbvxfNJBTFFAmGPAwA75h3udLXoBhuC/IYWFOm4g=;
        b=geflKnRSZCKyjPh9nZ77KHbvXzygASslHYpq9G1yb/rIRJdVbqOpwml0Tyx5S3jnMb
         VFCGSjfG2fILtIXPZFgC2eYEnN27FZoRMSColSIuR/2bQM+c0F8H2efiwSqEHq5FEgxg
         zYSU+9+uMcrHldvsKIXg1YXBJS63GHcBAbXh3bCQfeNkVe1nougxstmbncKfVnj8ZoGl
         Qlz1zXxPTz8QO1JNLRf1j8HcyDGboFeNbo94mlT4HM35QmeQUQxhNaKIv0LFpGprCHSQ
         Jd944SiWFEed8S130Q9tlyHBJMosi5YtrwewXlH18Iei53MWv+FAT7o2KSuNCWnfj1tf
         pqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794409928; x=1795014728;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RuVjbvxfNJBTFFAmGPAwA75h3udLXoBhuC/IYWFOm4g=;
        b=qJzTnNr50OOLt/ME2tnt0Vadcb+rZwdjXNd+fR3YJQmZL8jEyMfnonWzS7PiCGIWNA
         K/eO8YDRmIrDDePW4AygVL2K2YWK/Mhe5A56cBB5ZBYc7UsXEiOf0y6/BX+7W3aIBL9w
         uX6blnxi2djjw6T7nXsraOOyoPFjCCdZkBXeLkiSJ+GLKiMeotCKDFtpTwOyLB5B77Tq
         Un8Dy8fTqSy1nA+xURaDdu4LO8MVhf6HJT1etW+0UOstST12imZGRfqpvdybbNf869ur
         ODOnfQeDqbdWM5YbomNG/PqkRbcQ5G+/69DxNfPxXN5aeFScmztrLO7inp/zbou8i1YW
         4T7A==
X-Gm-Message-State: APuU4Z9QSBpDxo+3r26JB7eHnp5MerNQWyNgoHAFq7mCtqN75+txCX4J
	YFPSqScYapDUdWubgtY60iMR4+WNI1a8103B/rT2dIlJgu0n7n/Oag6u47GW2y3DNot7JLgS6sR
	kSqZvPA==
X-Gm-Gg: AYBFou2gzTWJYLDqS/KBIz8LmfV8sE3UcID0EKtSvvolRInZBX8wUHon8qGwIvU1pwf
	d2O9RfX5vcn9xIS9XTAKEyO+ICcdEPKuMJZQqbx0cAtUELlVBSvNNyKfXoQxsXbH4CnuJ1CvFZ4
	mJ8gN/w2O0YOJxtNZcwgx1rv1j6gmpM4cJF3BB5rImL7SyIMGWRyovdFyobSeLVL8xLESb4/BUx
	JGlDxlh8L7TK7sDYlnPA9UXGUMQfYEqhlLoJmA6TqgITZaAYOQxvSvgGWOcmrxdqj2u9hPvPNpe
	uLnu2F9kCl5nr7IQnF9f8Sc3nzvd/KLp5hsEM9TXEaI1NmCY+nccMcnApHkI328j3V4WnOvzCwx
	dv+SJF13a0T9K1Z0YdI0cAuw64L3jlAvtSY2e5sXaxjgZZlwO/EjEjl+vHoAPnJ3LEX0oI8sAMX
	3eEzG7G4RUYedDD58fhVfQCndUgUDkRYtZapv7mT8R83YwGyaSKfXbQJvsGmhxWU5h/A6x//0jL
	wRxZx9y8CznXliSDCWzni9li6YnAuugEv/ExV4oihg8sil5M8/X9tTEA4KIr7dcuORQRLSEqS72
	JIpcpgMwS5FizgEzr+HYhIWB5GZyP/puQUsgs3o6OAdfvlaFraAa0Gn9vefj3egTMt9dTSG7u7G
	GE9TNdGNXxFJwuYg3f8k=
X-Received: by 2002:a05:600c:8b83:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4ba0935bde1mr51674625e9.5.1794409927589;
        Wed, 11 Nov 2026 07:12:07 -0800 (PST)
Message-ID: <291e5110-e987-463b-9c5d-9085444fdfe3@suse.com>
Date: Wed, 11 Nov 2026 16:12:06 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 12/28] x86/HVM: respect AMX tile dimensions for emulation
 caching
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
References: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
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
In-Reply-To: <0407294d-d605-41f3-a16b-1505d897ef3f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ebf023/1794409928-52CCFB50-CBF346A5/10/78276251493
X-purgate-type: spam
X-purgate-size: 2067
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Both caches may need higher capacity, and the upper bound needs to be
determined dynamically based on CPUID policy (for AMX'es TILELOAD /
TILESTORE at least). For now we need to use the maximum policy there,
until vCPU creation happens after CPUID setup.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v4: New.
---
TBD: With hvmemul_cache_init() now becoming CPUID policy dependent, we
     could of course take the opportunity and also reduce overhead when
     AVX512 (and maybe even AVX) is unavailable (in the future: to the
     guest); AVX10/256 may in particular become of interest here.

--- a/xen/arch/x86/hvm/emulate.c
+++ b/xen/arch/x86/hvm/emulate.c
@@ -20,6 +20,7 @@
 #include <xen/xvmalloc.h>
 
 #include <asm/altp2m.h>
+#include <asm/cpu-policy.h>
 #include <asm/event.h>
 #include <asm/i387.h>
 #include <asm/xstate.h>
@@ -3064,9 +3065,34 @@ int hvmemul_cache_init(struct vcpu *v)
      */
     unsigned int nents = 16 * 2 * (CONFIG_PAGING_LEVELS + 1);
     unsigned int i, max_bytes = 64;
+    /*
+     * NB: Want to use guest policy here, once that gets established ahead
+     * of vCPU creation.
+     */
+    const struct cpu_policy *p = &hvm_max_cpu_policy;
     struct hvmemul_cache *cache;
 
     /*
+     * AMX load/store insns can access up to max_rows independent linear
+     * addresses, up to bytes_per_row in size. Each such linear range can
+     * again span a page boundary.
+     */
+    if ( p->tile.max_palette >= 1 )
+    {
+        unsigned int tents = (p->tile.palette1.bytes_per_row /
+                              sizeof(cache->ents->data)) + 1;
+
+        tents = (tents + 2 * CONFIG_PAGING_LEVELS) *
+                p->tile.palette1.max_rows;
+
+        if ( tents > nents )
+            nents = tents;
+
+        if ( p->tile.palette1.bytes_per_row > max_bytes )
+            max_bytes = p->tile.palette1.bytes_per_row;
+    }
+
+    /*
      * Account for each insn byte individually, both for simplicity and to
      * leave some slack space.
      */


