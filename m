Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFF7606A31A
	for <xen-devel@archiver.kernel.org>; Thu, 29 Oct 2026 12:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=A6uDX1pK
Received: from list by lists.xenproject.org with outflank-mailman.1464616.1675452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMPY6-00025S-RD; Thu, 29 Oct 2026 12:48:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1464616.1675452; Thu, 29 Oct 2026 12:48:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMPY6-00025L-OH; Thu, 29 Oct 2026 12:48:06 +0000
Received: by outflank-mailman (input) for mailman id 1464616;
 Thu, 29 Oct 2026 12:48:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xMPY5-00022H-CF
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 12:48:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMPY4-006Sth-P3
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2026 13:48:04 +0100
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae3407d-2eae-0a2a0a5409dd-0a2a4508ce5e-22
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 13:48:04 +0100
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ae34084-f659-0a2a45080019-d1558034b8c5-3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 13:48:04 +0100
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4a5177d78c7so20707315e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 05:48:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa7f418afbsm75021295e9.6.2026.10.29.05.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:48:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1793278084; x=1793882884; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4flZ5y66HJMbxZCV71RggMQe1+QymcPJJkwz7Ikx+8=;
        b=A6uDX1pK5CxG1EyeBBfWKljYkqQJataB3R3eGgdCV+HVj5lq3K8TGBsaKGdOY+4Rwd
         dvEWFA5ijPDhrxMZVLKJdyGWvT87cjMnFmRp2Zh6AYj07ob2AuGMCR69Lnx4CcZylAT6
         GZfBJeoBlBZUYf2+rXvpM3W0cu1VfvGGfXhnN28wJD37epy/q36rfZFNAH4NKDlwHcRN
         RMVrctq+wEoZNfO03l+Y4HvYZrvy3hwawEQ6iUsYdFgSRCgg0UNoiSnJ5fwusSFJwtz6
         psb2+orMV6SA1aA7dwIoesXoLkICNE2GyOSMqzqyDgr++tWe8Ej/9YHFyPVtpE0DesBo
         /b8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278084; x=1793882884;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4flZ5y66HJMbxZCV71RggMQe1+QymcPJJkwz7Ikx+8=;
        b=lHUZQ6B1R9Sa60x09jGbJgdqWavR0tU3QlxW7gR+WDKPVbP3ep5nIo9r4+n3Ha8luw
         IwAMAVjl+ENS1W8RbOjME9he9oXrn2ZSUNYHVLYVy/7rURGVDYQCu/f9/bdxDior13EI
         Nle7Su+PbvZ5IGZ464TKbMP5dtyTI3IpN+ABeoy/5MH6nx1qE4kg46nxwb/VwraMqUDG
         lN1bfCU1DHeWhuZWabwHqxh1uW95VZCGl9w8xMoGjiEmyFtGOeRwe9MyRItYdwVnnoH4
         OUenTzqkjVX1eSoGTgYqPfYo4uMVd7/KuBlzxWATH68sMJade3Y7JByvwYdzkYTg3CC/
         l6Ug==
X-Forwarded-Encrypted: i=1; AKwUvBwUoULlfVNJtguXDVy7FhI6Wkdj7voiA0E6cqFOwKm3YJLjV1VIMhey75IvcRTrWoojIRPPzd9WC4k=@lists.xenproject.org
X-Gm-Message-State: AFq9FYL3pMIKW539oN/MI5Z30AJv8MkGRI4OudgWoscSnwJvxngYlx8k
	ZN6W2EFjFZ4AddDI4lhEXa42nYBoUjwptZDC0DW65Myam7AXp8IoYwlPuiC4bHD0Yw==
X-Gm-Gg: AYBFou08H9XzwsT39318nEtcOx0qYu0imS39+YCQzP0Jq8twvYUdevutJ7gI91ehR4T
	H2rIG0diyMVjLg/d7WGxC5pHisTjeb8bA3jRhSxhZkopEcapA0EMlid/1LmuG+OsY/bfDYHrEjR
	391sJbTCblaAIt1upl+D3Lpru7gX+jlWD7HmnJu89p5dKl9ad7SnWXT7v4Uk7g4fTPATGLKBBj+
	Hwf61ie1pvtrv5hX8ni8rWb7MNEmiXyIHTEL2I81dSL/fwg788TH3gQpx/rgA3uH/N6AOHprZGQ
	+E9FwoXOzxF9K+96llrxNvEkcMZuWTb0ImnSqsuW+6gSU6KH3SKlwBWWxkdaTqDvoByD2K1hUv2
	9+OjO5/YiiPWzzXyd4FUsjX5Q2qLHk3xDqVR4GHbm1JIgRr4bOUVoXMnGuxvKaxsJE117yoc7tG
	aCMvgyaSsDU92UDn0Dh0EuJJjIelMIrS2UTTDsj4bkENbZ76Bj+Q4LeYR8MY6QcYDPvyOczk5US
	q4xZnzb9XI1WfIHwXm8yZ5GiMcmn0yMNj1zsZLlGL45GVDU3McJ6iBoCY/boiblxtAYdR0U9blr
	J+MeW0/UIdXWA1MDJui1VfQQiKh4M0pih9pRqf3nQJ78NdGtPRWOMHBLHx+71jfzIWcdMARMZgj
	b7j/Ikplc36QQ3Xba5w==
X-Received: by 2002:a05:600c:154e:b0:4a1:7bd4:d07d with SMTP id 5b1f17b1804b1-4a967e8d5a3mr118099775e9.34.1793278083814;
        Thu, 29 Oct 2026 05:48:03 -0700 (PDT)
Message-ID: <071c17d3-1cb9-4a37-bbf3-eb3b87910aaa@suse.com>
Date: Thu, 29 Oct 2026 13:48:02 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/irq: further gate PIRQ usage for HVM domains
To: Roger Pau Monne <roger@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20261029100741.42711-1-roger@xenproject.org>
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
In-Reply-To: <20261029100741.42711-1-roger@xenproject.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1793278084-CEF5F87B-EC7EDF96/10/78276251493
X-purgate-type: spam
X-purgate-size: 1412
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 29.10.2026 11:07, Roger Pau Monne wrote:
> Further restrict PIRQ usage for HVM domains not having the ability to route
> device interrupts over event channels.
> 
> It's still possible for HVM domains without PIRQ support to exercise the
> vector == 0 path in hvm_inject_msi(), which is intended to be used only
> when the guest has PIRQ support.  Taking the PIRQ path in hvm_inject_msi()
> inhibits the local APIC from raising an ESR error when the MSI vector is
> 0, since an MSI with vector == 0 is always processed as a PIRQ.  Introduce
> a has_pirq() check in hvm_inject_msi().
> 
> EVTCHNOP_bind_pirq is also not outright blocked for HVM domains without
> PIRQ support, so guests could attempt to bind device interrupts to event
> channels.  Short-circuit evtchn_bind_pirq() early if the domain has no PIRQ
> support.
> 
> Additionally introduce an assert in map_domain_emuirq_pirq() to ensure it's
> never called from HVM domains without PIRQ support.
> 
> Finally add an extra check in hvm_domain_use_pirq() so it returns false
> unconditionally if the domain has no PIRQ support.  Also convert the
> is_hvm_domain() check into an ASSERT(); this helper is never called against
> a PV domain.
> 
> Fixes: b96b50004804 ("x86: remove XENFEAT_hvm_pirqs for PVHv2 guests")
> Signed-off-by: Roger Pau Monné <roger@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


