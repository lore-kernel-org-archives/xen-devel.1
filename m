Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896BE606A31A
	for <xen-devel@archiver.kernel.org>; Tue, 27 Oct 2026 07:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=QVtVVp66
Received: from list by lists.xenproject.org with outflank-mailman.1461881.1672894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbsf-0005ye-TO; Tue, 27 Oct 2026 07:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1461881.1672894; Tue, 27 Oct 2026 07:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLbsf-0005yV-QH; Tue, 27 Oct 2026 07:46:01 +0000
Received: by outflank-mailman (input) for mailman id 1461881;
 Tue, 27 Oct 2026 07:46:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xLbse-0005yP-EJ
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 07:46:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLbsd-006lzZ-Nw
 for xen-devel@lists.xenproject.org; Tue, 27 Oct 2026 08:45:59 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae056b5-bab6-0a2a0a5309dd-0a2a45059682-8
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:45:59 +0100
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae056b7-4cb1-0a2a45050019-d155dd35ed06-3
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 08:45:59 +0100
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-48afcfc4bf5so3125398f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Oct 2026 00:45:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a35a0bae01sm306058545e9.7.2026.10.27.00.45.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2026 00:45:57 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793087159; x=1793691959; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J2WbXD4M+iilIIFHWtN5R4d1yNKj6k64QH84G9Pk9wU=;
        b=QVtVVp66gRDfITvy5wNTvIdjpO/V+beCIH9Y9QLxlYjmlcyDkPqyfIl6IFKPHvav/X
         cMNvezQSx/mLQEjLhdNLAnSinKEHPa7YalZBxc5JxB7blX6JH51rVoxZsRSGMzTFJtlq
         Ga0Osvf9ZstsY27Du6yGmvaM/d754+qT+5iG86vmfztmzVKsjYAAQYU8Y8869J24Corv
         0O1U4flmvskBp+esauq6btQJj5Rz8jriwV6OxchpvwHbyVdq1mxNpS2Zii1kBOUHmUqU
         I4jyyjPB43i4XhPSj+PdzgMcNhu6pvLPr+21LKPQI94J4mAbv9xuKLFlvAWn1C5S+f17
         mIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087159; x=1793691959;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J2WbXD4M+iilIIFHWtN5R4d1yNKj6k64QH84G9Pk9wU=;
        b=av3bpa+1ZlB3uCm3CzzrAAhCw8mVtdR064PxuwbxkTEE/ivrlLDYl3t7/K225anK6F
         Zhrgr0y9VHx5SuvGMpewcIf5LDiG4NnDOGg6nYKFMcPLd9/PgGLOxV1PmRggeAnauTh4
         d6v+dSG5dltTIpZJ1liMB7xoNqX+dtnRScbs2l46H+kKODoBAWL6v3qK7sTj+x87oKKV
         Sf5j6au+zVSn5n4YzH7jYdPt7lVu971eARR6kAAXOMPsHKbMEO32v7QJSqrFKYmQJUuF
         HelKD0bYqe1jSHwoNARbc/73AYgnqpvMqyGNtcqOS8UHOM7sOWR6eJKJYukTD30PcMdq
         ieaA==
X-Forwarded-Encrypted: i=1; AKwUvBwdXTz9fU8CdaE4cYCsgAOYB4A4V8ao5s8symMcoxn6xv/Uv1m1INBVNMDQ4zUwGfEKHYquB3f88BI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI0T3LAQNos33QgI97jzbT9Nzcvpu9gbVZIr55wRAxx/fhvRFz9
	0cb8l4GJg46+xMzxsLbNUXpH+qUlXOoVDmhZ6+L2lkbtvNL2ngAgHq4xS8fCpCGdNw==
X-Gm-Gg: AYBFou0hxthe0mugaHnHJ8uXcuED5H4/Fx+ToLMrQ2+WDRrLlUI2u1EqSdoojGtbucu
	LbpgaT8XP999aYXm5x7YHa4a2bZIeoEwarOCTZJ75Fst8jnTianvrq3N8P9uN713bMF5l6h/iNs
	SIpX3NB2E0BAjt8R0pqJbjL+LK5mQQ2g5PznLWww7iSRySDWRzl4n0954lYEGGyuxZA8eysL26x
	zR1BBR7eFomXzwvtkNx0/ccXyUq+Rf9X6VofW4vrCE5r5fVHXle0pmZmSUvkwwmYX4oTstfMRGi
	C9wraPH/I9OwoOXIFk/Bkxx5nDmqx/zfXibJBK079nX+NHSk/ECT+/QGXdL8TJVU23QVjmldq2g
	+9ePT3u+WzLDatZOVhto1LZ0d15qbMYmYOHNfylznNNXWz4oclR9hDgqIzIQWk1QgFHye08P0K7
	bBq7eBWgpt/OG2VNJN+BPA66HmPUcr7QtYqJKOVCLU1+MuHgqH3nsqi+E7JsNUubccrwRIPd6WJ
	JXejUy/sL0XPEuSAYgjeMBQgXp9gkffU2IemwwKccO9D+4xoVx30n7xP+NqLVnB8Hg29+CYU+Ak
	YvvUOvrGhuUALD/Upt7JKItXRXKY6o6TDkzHmoEAqV8=
X-Received: by 2002:a05:600c:3114:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4a35acc772dmr167243505e9.19.1793087159001;
        Tue, 27 Oct 2026 00:45:59 -0700 (PDT)
Message-ID: <a248466f-0d52-40e9-bebc-4d79fddd69ac@suse.com>
Date: Tue, 27 Oct 2026 08:45:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/nestedsvm: remove dead code for shadow-paging L1
 hosts
To: chunjie.zhu@citrix.com
Cc: andrew.cooper3@citrix.com, jason.andryuk@amd.com, roger@xenproject.org,
 teddy.astie@vates.tech, xen-devel@lists.xenproject.org
References: <c7cfb94a-1424-4ed8-bd3f-0216edb2c799@suse.com>
 <20261027073711.30963-1-chunjie.zhu@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20261027073711.30963-1-chunjie.zhu@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1793087159-247132A1-695B8FF1/10/78276251493
X-purgate-type: spam
X-purgate-size: 1612
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27.10.2026 08:37, chunjie.zhu@citrix.com wrote:
> From: Chunjie Zhu <chunjie.zhu@citrix.com>
> 
> Nested virtualization on a domain is only permitted together with HAP:
> sanitise_domain_config() rejects XEN_DOMCTL_CDF_nested_virt requested
> without XEN_DOMCTL_CDF_hap, since shadow paging is too slow to be usable
> as the L0 paging mode underneath an L1 hypervisor. This means the host
> (L0) can never be in shadow paging mode while nested_virt is enabled,
> i.e. paging_mode_shadow(v->domain) is always false in this context.
> 
> The nested SVM code still had incomplete/speculative handling for the
> 'host shadow paging + guest shadow paging' case in
> nsvm_vcpu_hostrestore(), nsvm_vmcb_prepare4vmrun(),
> nsvm_vmcb_prepare4vmexit() and nestedsvm_check_intercepts(). Remove it,
> and assert the host paging mode with a single
> BUG_ON(paging_mode_shadow(v->domain)) ahead of the guest paging mode
> checks, so the remaining comments only describe the guest mode.
> 
> In nestedsvm_check_intercepts()'s #PF handling, fold the two identical
> NESTEDHVM_VMEXIT_INJECT returns.
> 
> Also drop the now always-true paging_mode_hap() check from
> svm_nested_features_on_efer_update(), and the stale "shadow-on-shadow"
> TODO in paging_update_nestedmode().
> 
> No functional change.
> 
> Signed-off-by: Chunjie Zhu <chunjie.zhu@citrix.com>

Two formal things only for now (will look at the patch itself later):
Please send new versions of patches as roots of new threads, not in
reply to any earlier thread. And please adhere to the To: vs Cc:
separation there, too.

Jan

