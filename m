Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3B606A31C
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=YvB21mtQ
Received: from list by lists.xenproject.org with outflank-mailman.1503455.1699170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZhD-0004af-8K; Thu, 26 Nov 2026 13:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503455.1699170; Thu, 26 Nov 2026 13:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZhD-0004aY-4D; Thu, 26 Nov 2026 13:39:31 +0000
Received: by outflank-mailman (input) for mailman id 1503455;
 Thu, 26 Nov 2026 13:39:30 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZhC-0004YW-L5
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:39:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZhC-00Fvq0-0y
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:39:30 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083681-8faa-0a2a0a5109dd-0a2a450b841e-36
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:39:30 +0100
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083691-b7e8-0a2a450b0019-d155dd31e138-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:39:29 +0100
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-48dee593f18so6550893f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:39:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab65cb41f4sm39430596f8f.7.2026.11.26.05.39.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:39:29 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:Cc:Content-Language:References:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795700369; x=1796305169; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/F9twjHB3DFynA6lMxxDV/v+d+cXdeXECvoyPLY1Ds=;
        b=YvB21mtQymxZu0zvByTdq+RotWGWqPsHIeohsV/JwMSIocRjWa4exT0PvQLmhEXNN/
         Z+BbZY9Y2ep0rF2eRBMkVuXRh6LIIXvnSidA7t8k2xO+wtg+pcezD++TAnLprOWG7fYA
         J6pTNza67S0aKvfi2P9Eq8M4sRzv45jWxFVBLLsSLaA03tjULvxwaaRkw8U45hmjlwgb
         NeU+qXvN9vUYZ6O9W5ZRk0igrs+5ipAO8vOhWXU9JLgiQXUgOY+Z0EJgXBoKxvR5eoXa
         NQ9mzJKwt8SZNUCBTC2vybqcquqsvRF6YgFWECQ+3uCHrwNVLzmdE8IhG8Hf0rVo06wB
         snxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700369; x=1796305169;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/F9twjHB3DFynA6lMxxDV/v+d+cXdeXECvoyPLY1Ds=;
        b=nHe2bHFPTmzO4+ZNg3MkKZehswIj6ssgS3y6wD590iUNQQ+7ZkTJ6nQBh6fuVXZuqa
         BqAyNR6AaGrlAbv5ueYEdaIOMMBdqrUiiQWNbzygDpm5xSyYb6G8pk8GKckcziJAvrkm
         Hq1B6MUkkPdDhSqJuahLxluGgef0Hlw0cCelfagBc67hTG5dAI/bdbmZlhjN+ys1Yqtc
         gjSwl7gPSoDlbJysXt38NK7ofioa5hIx+dbk1sLa7grV0mrBdJfzi4bYeIRms9QllLvn
         gTe6Vi4jaINGCyFoInqozUL567esVrTQ3oXT01Fj3UM0ggnJu7mCUcHXxi7ONHLy0b19
         IaaA==
X-Gm-Message-State: APuU4Z9IAUqheSQ2t0j8ddmzfQZvgaYLF6A7z2E6PG62x2k/uqgd2s1j
	un/6u3XvjjXX//OH3hQQv15o+D8TVFklzSX8dEqLCRehLBa7EeIoguzi4xZ4tEGK72R3bH4ONKT
	2GkDS7g==
X-Gm-Gg: AZFdTZenev0geb/7fFXCPRvY8HNprxw58gxzIRxOIbtSQZma+LW/bEQPK8nBpGTc9Nf
	y0Gc5MVbAIvAiBmK0LpzL7R7NfANdw76oNaUwEZF0zFleOdxKr9wUIsmiuuVsmwZ0DFozfH9N4T
	ucKRn1VLa6HaaedpOq+jmJDVVGOmcir69ys6THsnIoLUkTh3WeCkkR7gZSlBE4xO7xZ9QNeo8E1
	tOU0eOhBSTOsfXTd+DRs0OetEnPB9b4cAf3Kfpxn5Sx5DYQP0wceGkKTQ3bQeu9IKV7FxcZVBQc
	T8oLp/uiC3fZ1aBczQBuUfnQtCsluZQ7qwkuOoKNykmGnWYaVVUEadj91yko4JOObwTIJIFp0Or
	6PH7Eqg3dkI5ql6v7QLGcG/RF+hpMxZUoHMD7W674u+dxFuK9hti6ZA6uopi5UKZR+eUGPS8NZY
	wUAZAid0ppeA8dqV5dW+iaP4Mq+h46V78bYtphNSl52OXah7xJ2Yfj+hy+dztIPV3Px0hAFOEc3
	374NtF+T1NPymVyeZqFHPc5XfLpa45711EWLS6vd/nGiot+dlzM4d6Cq+JddJVSY0OULn5pPwKB
	wNPe2IuGIuv16y0Nbt8vlmX4g9iDyQYUcKvuT34v7UeIvUOV4gdxpsbwVz7sU2zGoK4z4qVsW+4
	4e0ETczEe6+d9cNJLwA==
X-Received: by 2002:a05:6000:299c:10b0:4a7:9630:7b5a with SMTP id ffacd0b85a97d-4abb47b2043mr30255589f8f.47.1795700369474;
        Thu, 26 Nov 2026 05:39:29 -0800 (PST)
Message-ID: <ca238147-e4bd-4928-b3a6-d4a8dacecf13@suse.com>
Date: Thu, 26 Nov 2026 14:39:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 07/13] x86/time: use domain_vcpu() in tsc_set_info()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>
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
In-Reply-To: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1795700369-18AC89EA-BF431F38/10/78276251493
X-purgate-type: spam
X-purgate-size: 1241
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If for nothing else, then to reduce the number of open-coded d->vcpu[]
accesses.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -3076,12 +3076,16 @@ int tsc_set_info(struct domain *d,
     d->arch.incarnation = incarnation + 1;
     if ( is_hvm_domain(d) )
     {
+        struct vcpu *v;
+
         if ( hvm_tsc_scaling_supported && !d->arch.vtsc )
             d->arch.hvm.tsc_scaling_ratio =
                 hvm_get_tsc_scaling_ratio(d->arch.tsc_khz);
 
         hvm_set_rdtsc_exiting(d, d->arch.vtsc);
-        if ( d->vcpu && d->vcpu[0] && incarnation == 0 )
+
+        v = domain_vcpu(d, 0);
+        if ( v && !incarnation )
         {
             /*
              * set_tsc_offset() is called from hvm_vcpu_initialise() before
@@ -3092,8 +3096,7 @@ int tsc_set_info(struct domain *d,
              * will sync their TSC to BSP's sync_tsc.
              */
             d->arch.hvm.sync_tsc = rdtsc();
-            hvm_set_tsc_offset(d->vcpu[0],
-                               d->vcpu[0]->arch.hvm.cache_tsc_offset);
+            hvm_set_tsc_offset(v, v->arch.hvm.cache_tsc_offset);
         }
     }
 


