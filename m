Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C555606A31C
	for <xen-devel@archiver.kernel.org>; Mon,  9 Nov 2026 09:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=aZ53jMZb
Received: from list by lists.xenproject.org with outflank-mailman.1479727.1683638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLk5-0001Nh-Ki; Mon, 09 Nov 2026 09:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1479727.1683638; Mon, 09 Nov 2026 09:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xQLk5-0001Na-HM; Mon, 09 Nov 2026 09:32:45 +0000
Received: by outflank-mailman (input) for mailman id 1479727;
 Mon, 09 Nov 2026 09:32:44 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xQLk4-0001NU-4D
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 09:32:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xQLk1-00DSH1-JU
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2026 10:32:41 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af1932f-2eae-0a2a0a5409dd-0a2a4506bcc2-44
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:32:41 +0100
Received: from [209.85.128.48] (helo=mail-wm1-f48.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6af19339-195a-0a2a45060019-d1558030d898-3
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 10:32:41 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so4002995e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 09 Nov 2026 01:32:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b9f93c04afsm69209125e9.3.2026.11.09.01.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Nov 2026 01:32:40 -0800 (PST)
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
        d=suse.com; s=google; t=1794216761; x=1794821561; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QAa/fGpE6RuU8cCUn3X33VBhTYm4eTgpDDkqV875uNM=;
        b=aZ53jMZbIdlKrxcbJr+zuRvtW03NEFXkxIgQxEdk9dEnlwXxVCT9qwZ1qH/2qH0KIZ
         ZqxDvpewk83qBc2aYY9ybseribEwSeDtz3/oJbj9JC5NGRf9hmt0sSAGOhWnDS15fkee
         sGJAW1ksXSKI6xtIDs/ZbRCobEhYgtGPS0MhKRBwG0Apl99Lw+gURdUU3jRfQ3ur53eF
         D/FFQoVeY81v3G1QsbrGAhs0xsk75XNTlkCZmVXwG85VcbaITB3YSwxuekrQ17pY6GKl
         DXp8VqYz6Gsabm+UAuvqy9YVDNiLBbizc4HJm3CR9B8i6SaZ6hpFgJgyRcCd/piHTbEM
         F9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216761; x=1794821561;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QAa/fGpE6RuU8cCUn3X33VBhTYm4eTgpDDkqV875uNM=;
        b=fDTvwEHvpwzDNdRdClvQJX+gFQ5etqV//FrNHqv1Jsbkb3eiJd6KCjBAFm44pVd1mx
         WrhJ/p/ZmSJw9zlfXGfus0IMeoDYF/0y/GpTO7YcnzAGs0tMi3djw0z3DWqXJjcJ1Hrl
         WnvBe8Qa29LOekTUIBjtWOm5Rb2cZwnV4IfrDibiS0RrlAwf1wVwLG0I2I+bySnqDmzx
         Gv9/8j8KdMTTjPmV9+2qwUh4A4QuzmvO4qqRNdeiC/gQiLrKx2fYIZcqwUsyMOffRzNF
         ZhbnXFvFg+8M7CSRQF/NeVsb7uH9U8xxc3VHxiXS74uj4d6Ei7okGwjMbCDLDsoQRJOd
         EcPg==
X-Forwarded-Encrypted: i=1; AL+hErElDqNHViCkLyPXJtTxgAfPbmP3Ps3taazi12Wo3dXLKvNsLWDIh/4WhCzYMwxEMvTmwAyq0Kqkuh0=@lists.xenproject.org
X-Gm-Message-State: APuU4Z9N5TXn5WlaSXXTMSBsYOwqb9c9J8a3z3MD3Yi6hGxRH8C7XBTq
	f8lx+0v5ePN0WyfUr52hy1BPU+vL+y8jiKR1HMFApnp3z1t2SvfYpL4dB7znp8zD7w==
X-Gm-Gg: AYBFou12FEXxAiuAOV8HyRRPCTfNAjF40M1wz8rFSL1tTFrFYx0M/QmqwCVbHBhqHrX
	mlm56ox90/6g2kk5sWM+w8HTtVijEQLN65n+VatH3N0Gi9uV0sGdcdv5i5U1LPV5x7APMjx2CXu
	UxV+LJXNG/5BIk47iXai//tZdNV6iYP3KbCn6SuapVJjnyB2HqLYI9pu/tTGnrcwo+N/WN8FCnJ
	p57xoAn9l3IQ4JvLssVlY/uUs6SMFbAj4G0qESEWmSN0ewhrrIU9EBW7We34DEv75FjBLHp4Xsm
	c/50hBc6mWmC1Q5VC+p8OPOIOd1WjuzLFcUFBMLIybSNhaxpj6aI4+TVH+cJjrZ1s7m0Hm0tz0B
	ZECLJ2UhREfVpq9dOyeDZb3ypj2dR6ZE1BuKR1F1GWayD18CINeS6JcBsftv8IPrRn2lBuareAS
	vi+ADzH/vT+n5i+JCaidKV+K+McxLiWhkxJjYp6LmLpzalaC4KRdcsiRjKovr0xtLaj77ERRJFp
	77QFpiPGOaUdSMvcvpeA8KW47j6N1cvh+kGXHyP8bHz1KwyGCFjJaqBr69cM5GxhzZrjKl2XxrT
	2v0dqv5KE/isF1ov9s8036WHnmnCQB8b/1DrStJDdmzNez+zrIjRpMj9tbSpErxF8k0NqzRTeSq
	eV4aOGDBD3NnwLLJZoXwjjgnbX42AIl9uYhVWtQ==
X-Received: by 2002:a05:600c:6990:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4b960e9a77cmr61595065e9.12.1794216760919;
        Mon, 09 Nov 2026 01:32:40 -0800 (PST)
Message-ID: <cf3e44aa-f48a-443b-991d-665caded21da@suse.com>
Date: Mon, 9 Nov 2026 10:32:28 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: Promote FLASK XSM Module to Supported in SUPPORT.md
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <51ed28b0-1c41-4e6b-95a9-786e59d4cd9f@apertussolutions.com>
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
In-Reply-To: <51ed28b0-1c41-4e6b-95a9-786e59d4cd9f@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1794216761-FE27077B-D651E5FE/10/78276251493
X-purgate-type: spam
X-purgate-size: 3673
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 06.11.2026 17:19, Daniel P. Smith wrote:
> Greetings,
> 
> This RFC is intended to start a dialogue following the discussion on the 
> November Xen Community Call. It proposes changing the status of the 
> FLASK XSM Module (the implementation in `xen/xsm/flask`) from 
> Experimental to Supported in SUPPORT.md, while leaving the FLASK default 
> policy Experimental.
> 
> ### Background: XSA-77 and disaggregation guidance
> 
> XSA-77 ("Disaggregated domain management security status") documented 
> that the majority of management hypercalls (most `XEN_DOMCTL_*` subops, 
> all of `__HYPERVISOR_sysctl`, certain memory operations, etc.) were 
> originally written only for fully-privileged dom0 and had not been 
> reviewed for exposure to semi-privileged, potentially hostile callers.
> 
> When XSM/FLASK is used to delegate those interfaces, a compromised 
> management domain may be able to cause host-wide denial of service or 
> privilege escalation. The security team’s policy (codified in “Security 
> Status of dom0 disaggregation” section of `docs/misc/xsm-flask.txt`) is 
> that, until the interfaces are reviewed, bugs that merely reduce the 
> security of a radically disaggregated system to that of a 
> non-disaggregated one will be handled as ordinary public bugs rather 
> than under the normal security embargo process. Only a small set of 
> subops are treated as safe for disaggregation; the remainder listed in 
> that section remain covered by the XSA-77 stance.
> 
> SUPPORT.md currently reflects this distinction and the XSA-77 caveat for 
> FLASK.
> 
> ### Current status and the case for change
> 
> Today, SUPPORT.md divides XSM support between "XSM Framework", "FLASK 
> XSM Module", "FLASK default policy", and "SILO XSM Module", where "XSM 
> Framework" and "SILO XSM Module" are marked as Supported, and "FLASK XSM 
> Module" and "FLASK default policy" are marked Experimental.
> 
> The core concern behind XSA-77 is that it has not been demonstrated 
> which fine-grained operation delegations can be done safely. The 
> documentation provides guidance on “safe”/covered interfaces precisely 
> because of that gap. At its heart, this concern is a policy- and 
> configuration-level issue.
> 
> Marking the code, "FLASK XSM Module", Experimental primarily because a 
> user could write an insecure custom policy feels inconsistent.

My recollection is a different one: There were concerns over code quality.
For example I seem to recall concerns over there being memory leaks. As a
result I further recall that the security team said that a full code audit
may be necessary to actually address those concerns. To possibly soften
this some, that concern may, to a degree, have been driven by the large
number of style violations in that part of the code base.

At the same time, yes, code and what can be done with it by careless
writing of policies want separating. This looks to be suitably reflected
in your proposed wording change ...

> ### FLASK XSM Module
> 
>      Status: Supported
> 
> Compile time disabled by default.
> 
> Using FLASK to delegate various domain control hypercalls
> to particular other domains, rather than only permitting use by dom0,
> remains specifically excluded from security support for many hypercalls.
> Please see XSA-77 and the guidance in docs/misc/xsm-flask.txt
> for more details. The Supported status of this module reflects the
> maturity of the implementation in xen/xsm/flask; any security guarantees
> for a particular policy configuration are the responsibility of the
> policy author.

... here.

Jan

