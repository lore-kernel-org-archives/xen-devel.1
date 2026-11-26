Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86414606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Zz52UPgK
Received: from list by lists.xenproject.org with outflank-mailman.1503441.1699152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZgG-0003bg-JP; Thu, 26 Nov 2026 13:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503441.1699152; Thu, 26 Nov 2026 13:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZgG-0003bZ-GA; Thu, 26 Nov 2026 13:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1503441;
 Thu, 26 Nov 2026 13:38:31 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZgF-0003bO-I9
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:38:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZgE-00BPAM-Uf
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:38:30 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083655-e002-0a2a0a5209dd-0a2a4508a4bc-8
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:38:30 +0100
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b083656-f659-0a2a45080019-d155802de07e-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:38:30 +0100
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a3517554f7so63903345e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:38:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab69bf62f7sm42000837f8f.13.2026.11.26.05.38.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:38:30 -0800 (PST)
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
        d=suse.com; s=google; t=1795700310; x=1796305110; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ExWKzTLHAFYjH6Cj4AilF29deBRC2JOgXeefyzpCNo=;
        b=Zz52UPgKWc39KCVkllnKKNcT2hy5mYVR5Cx0R21SopqKInPrlyvXoIEQ9aqE6i5Plu
         wlr9SEt7H1od+yVMY5Lb6ATsxfQqCFMmdW3ISssMNksy9WqC6j0SpgocBOMz0YH56+WF
         FgUzhzkL+foQGML/HnPyy7pfo84t1MXAgVqrBcLANiCZn6kdz7aDX5lygopgS9PmmIVJ
         XQ7sbU3TO/ov+wAsGkfGPAgiltxm+W5imaxozmPZ2/1fDsCUzLPGDC0Ck5En9AD/vWjI
         vvjznEFGxDTyStNZOfv9at4zoCg5h2BnCtiieByuIG0vniO5tqdgc02Pdy5lQV1mHdGD
         gSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700310; x=1796305110;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ExWKzTLHAFYjH6Cj4AilF29deBRC2JOgXeefyzpCNo=;
        b=wg14aFFvHbYp6A8NU8hhCCLIgXeQCn+ajngP5FZNnv60Vyq37fZC1gDQZ80Icbzhwu
         NlnpJ21ApKvXRFShKcb9Ktv6oSVSYURlgeHK2hE4w7dxXvJiA9Gr4Sh1hkVqCr4jwttC
         JAf+WRA229NQ26vtWWLHirOcf3NwkoymjXS9VCFt45iEP2Dq3eZw4qPW9BR7uEQ9aExH
         buv4qDJCsR9GNZUqANO1P3tfHe00DFAMAL6RcGTp5wiDHFezsO+4J+NmoCM8eul1XHCM
         P3L5oCIUZk03fW2GD749SQiWyfJOlzj/jnacoCH+Bnj+F90EbaeoYnOyPwK/eUVSIhqG
         wRsA==
X-Gm-Message-State: APuU4Z9Pwx2ldW6l04k7APIFHzavNHm6rJhPM/900EBZYwH1c7ENz0sr
	ZvzL/f1OmAfWwgxXTlkvRRO9LVWbX77Be+dP8SW3Dro7O0gITiR90LaSMt00LAcNelatRGH9EVb
	yBZ3f2g==
X-Gm-Gg: AZFdTZcnke58TiOiUIKrXfhRETwcKgNPnd64RqPA/PCrZwOsYVmQnbwK+HqZA0YJKvn
	JH05c/wmk11S22PY5CALq7wDkbu3BIJ5XA9uBwkMa1acqnYk54iLmylFOimWevgSxhXDjCiRdaU
	eptfPmrD8p6+GpGnaMy+0cGGuFq3Ha3f1vmenofOZHHSGIXsVJ0zwLbDG4TikfiLj687ZrE0ggh
	YEgzlL1J+Kiicqj2IUOZt55xNtemT7B/8lHBGMC2JPe+ee2n0Pw6Ls7YrJssB6yU51OswUETSb5
	PCOGYfofEo7IieiWw/apvuwPaHLHOjdTz8ftDVXe3/8YYgePfUlXyLYFzC+hVkOQ4A+LPS1LmJI
	D0zKi+DnraHecJj2Mlq6XdKWLYRREXU8ugc5tkESdu8fRSwnCwMuHLtCJSdIirzO5/OBNZXkMCx
	6t7IJt4+bbVZ9cn3Xmac1ulDJk0ttcm3ZcumvAB88zROfCY851LCvaa0UAFWrM9KMbfKp5vfMLJ
	qORykIVtP/ysM4hrSEPgv9AyvTH4HHHGLgXeOFRnoUgwfxq/TJAbblJ4mr9I/CANwB2ip7MZeIn
	Kf2uEoUwZ3Qq8FT/WNSpzF9QRq8HpOOypgb0Cue1pfBT1ubWdVE0foCIETUHHd9Lfy5SzbBKxa9
	L2LJYIOuaa7sGx3NvoapF2Iq82Q7qc3pnbVg00g==
X-Received: by 2002:a05:600c:3509:b0:4bb:76f6:d23a with SMTP id 5b1f17b1804b1-4bb88814d16mr458550355e9.21.1795700310376;
        Thu, 26 Nov 2026 05:38:30 -0800 (PST)
Message-ID: <4d0b59f9-2a50-4ec8-9a0d-fb427cb57421@suse.com>
Date: Thu, 26 Nov 2026 14:38:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 05/13] vm-event: use domain_vcpu() in domctl handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1ea6d02b-8fba-4b1e-969c-033d6a7be233@suse.com>
Content-Language: en-US
Cc: Tamas K Lengyel <tamas@tklengyel.com>
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
X-purgate-ID: tlsNG-c1860d/1795700310-CF95A87B-AAE525A6/10/78276251493
X-purgate-type: spam
X-purgate-size: 546
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

--- a/xen/common/vm_event.c
+++ b/xen/common/vm_event.c
@@ -622,7 +622,7 @@ int vm_event_domctl(struct domain *d, st
         return 0;
     }
 
-    if ( unlikely(d->vcpu == NULL) || unlikely(d->vcpu[0] == NULL) )
+    if ( unlikely(!domain_vcpu(d, 0)) )
     {
         gdprintk(XENLOG_INFO,
                  "Memory event op on a domain (%u) with no vcpus\n",


