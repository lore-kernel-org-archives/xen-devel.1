Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0AF606A31E
	for <xen-devel@archiver.kernel.org>; Thu, 26 Nov 2026 13:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=X2v+1MGX
Received: from list by lists.xenproject.org with outflank-mailman.1503463.1699180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZhc-00052T-FP; Thu, 26 Nov 2026 13:39:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1503463.1699180; Thu, 26 Nov 2026 13:39:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xWZhc-00052M-BV; Thu, 26 Nov 2026 13:39:56 +0000
Received: by outflank-mailman (input) for mailman id 1503463;
 Thu, 26 Nov 2026 13:39:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xWZhb-00052A-Jz
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 13:39:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xWZha-00Fvw0-WA
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2026 14:39:55 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0836aa-8faa-0a2a0a5109dd-0a2a450b9456-0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:39:54 +0100
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6b0836aa-b7e8-0a2a450b0019-d155dd36e82a-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 14:39:54 +0100
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so4103097f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Nov 2026 05:39:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8538b09bsm1116972985e9.4.2026.11.26.05.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2026 05:39:54 -0800 (PST)
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
        d=suse.com; s=google; t=1795700394; x=1796305194; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MmOlKBivTr/k7+hbLS+oNsciiQdyU2i6x8nPAJBMwpM=;
        b=X2v+1MGX9On+evj2lNsY9NgClR/rFgUF6QFP1swhktDgfxC5rwLJYncFw86lkSoPd8
         HIPwoDedgvkiizdYgUbKHn47RLXx2awSXaWJf0wZf+iw8HKzCKlR0ns+znvBOuOtwx/K
         WmQ4Uwy+KHKUf9VqZTvZ9wbqlAuAPUdsUIQKpUWQum4cqIDEUOaWmO4bVb2o6b9HrfNy
         RcPJf3gXbH9FLGnp+1Y3lSHf2dMfknged8eBUDlJizISQvZ/+NANy3xdq2PUA/KS9sVY
         sljLfOySOsSUlOtuN8hhTEIOBKb2rFzVdHqOde1JegBUmSHji8KLzdXzGAOO+LmvFJn+
         0BpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795700394; x=1796305194;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:cc
         :content-language:references:to:from:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmOlKBivTr/k7+hbLS+oNsciiQdyU2i6x8nPAJBMwpM=;
        b=pH0bmnDVburPQCKqhl2sQ9LgLmceM7/OBVtHr6jL8ndqcTM7Ouiv3IWOkgU3BAVDru
         VYs7a5XFEqsxXMxaYPXFtproLgryh7fhNct2Pu2SND/cvth18qtFPp6V3YZ1v9M4VH3/
         CeWAO1x1xjyNsbmFWZbId1XcBOBWtYGhWrKvP2f0GZro8JJe6lueZe7bGVIDHO0f48ur
         IWGhQZU+4XxAIsbUFOuAaX/KNYTMovTlpaHn5l8+ReaPbcy/QY3ADME9FJoZI+ev47I+
         00MncnIxJne+oLpkKxkHCXYFi9s4kqAQd5AsOZ56AZp4L5yB8h3LvY/8aIi0HtZCdgFs
         MwVQ==
X-Gm-Message-State: APuU4Z8euTHdErQ/ouhs07C83D6mBkUReUZpMEuIH7GkuS0iDtF5O8XN
	L53cOzmkuwaMwSWVDwNtPPhuyD9yCcxXQTQdLeSQQdqJxeV7bBLxXNFlMvqn6QyRhYyAQ9XQuyS
	fUOdJlQ==
X-Gm-Gg: AZFdTZeOH6JYJNsg3Vg5SRRzkSHrmelD+rYOIfd+0CHXe1YExDPj8v1JB1Tk/UrJs0u
	kId49WOSrjhn22+g6W8wziyB3fiRYvFlU8ypL+kX1LW+T7ZinbnpYxrDjvgwgR5naEPJJdz735N
	ipx0CpurK+BvRUYR76txdX+bs0LjQlfZelMFw1yLUpGIBAUUnBxwDnkeU/kHli7Dc/ob6Z8k1BQ
	JYCy2Vxk32Zz6UemkuYQy+n8LgX+2/OSogwYEK5H1Nc6MjkScAtvYIVgL7najQ+8wfxPR3WkqCz
	p4BZ8rN1KqLWFt4MkKBlPHZ3RBBzx2d/P7Onh4xMOXZfbFWmhwnnnrpTy9bCrNFosM1e9QngxmL
	WZPDA7SE2QimCfUHdetQ7NNx/McRZvgDIZ9fn46/ZM2mc+k/G8BGJbK2LpdJ0pe1RZ2BjDdckXJ
	bqbHKqWT8EvVDF7UXq8WfJc949Qk8bQ38qiJCCnE+D6btgGLIk5v6BUMUnEU8vt4aw0dBhYJGb+
	btJ+aoSVmMbrbKv9pGZRDQNMF0HsLLMLIhP0zqDGp7+a/g1Uh5n1ubJWpUuR48It6wJfgwSl37X
	m2LHpJzsrIX7PgS8LEVeZGWuBxoXXVlsSUbhrmb+XsJhAAc6/MKtYT8JIvUroePrQJ26URmUby0
	BmlMeJRI0QQq2XN5DaQ==
X-Received: by 2002:a05:600c:3113:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4bb8882a4b9mr449722605e9.35.1795700394414;
        Thu, 26 Nov 2026 05:39:54 -0800 (PST)
Message-ID: <392f316b-cf6d-494a-92c1-63461fe9954a@suse.com>
Date: Thu, 26 Nov 2026 14:39:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 08/13] x86/paging: use domain_vcpu() in paging_domctl()
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
X-purgate-ID: tlsNG-42698a/1795700394-19EC69EA-2E769743/10/78276251493
X-purgate-type: spam
X-purgate-size: 568
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

--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -668,7 +668,7 @@ int paging_domctl(struct domain *d, stru
         return -EINVAL;
     }
 
-    if ( unlikely(d->vcpu == NULL) || unlikely(d->vcpu[0] == NULL) )
+    if ( unlikely(!domain_vcpu(d, 0)) )
     {
         gdprintk(XENLOG_DEBUG, "Paging op on a domain (%u) with no vcpus\n",
                  d->domain_id);


