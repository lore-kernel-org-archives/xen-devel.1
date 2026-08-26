Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3113C61DC4
	for <xen-devel@archiver.kernel.org>; Wed, 26 Aug 2026 09:42:37 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1399757.1635735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzA96-0007JT-Hm; Wed, 26 Aug 2026 09:42:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1399757.1635735; Wed, 26 Aug 2026 09:42:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wzA96-0007JM-EU; Wed, 26 Aug 2026 09:42:12 +0000
Received: by outflank-mailman (input) for mailman id 1399757;
 Wed, 26 Aug 2026 09:42:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wzA94-0007JG-Nw
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 09:42:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wzA94-00Cfk4-0f
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2026 11:42:10 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8eb4f0-2eae-0a2a0a5409dd-0a2a450be5ee-2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 11:42:09 +0200
Received: from [209.85.208.44] (helo=mail-ed1-f44.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a8eb4f1-b7e8-0a2a450b0019-d155d02cd05f-3
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 11:42:09 +0200
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-6a1542cdb53so839181a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Aug 2026 02:42:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5deae9a75sm3007795a12.28.2026.08.26.02.42.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 02:42:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Autocrypt:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787737329; x=1788342129; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0L1OoA+cy53hgMy4ifmRPpFL/hiiCmBpvNWDGhfyJu0=;
        b=GAo/L2xhXvS1TQVKRYdZt+ilEtggBDJD1XsmSDtH65NJGxRvFDI0IY602uuirTf1Z4
         d8YI5KLkDeP9RoQNKa7UJLBcmYIZgMjCmvrMpSX7WXuCJ0Zl/aNk/v8up5B1aQ0UFRfH
         35n6W6nS4AO4kar+Hy3yT3qBuQOyvYM2SW7CCpxO5IUSq3o0V/4OvxQ107W8b/dawTAO
         /hahRHfBtfdsYp6jKafww/iEDMS9Ipa7V7h5CM9LCFNF7e/VhukY5kjBQ0VvCc8O99LW
         8wACxHL7Tw3zCK/Xyk6EbAaiYU0Eofkml5lUtBYyu2dbw5vVddw2/GRB7gyWmICRDwXb
         rMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787737329; x=1788342129;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0L1OoA+cy53hgMy4ifmRPpFL/hiiCmBpvNWDGhfyJu0=;
        b=tTlYM9eV3PBiEY8UsOnMlN9OCY2RMqaguwcD/4RrX9zRm/KZ381JSYVUq4XoZHnseO
         c5fOZ1DGzlHqSbOASvqGpxmy3sFMu57ZC3ndcSyJoI9CAXx/GbEeYRQcuvSdcJAnYG8y
         AYiC9ZNIn14Q7BpH6niA0UBuRrffby+9yuH9Ahb60LQmPzk1kxO2EF0k0MbnowCZlQpe
         8ism/fjbeagIhX9DBOiyXdKoRRsKYQgjQBx1T/Y7On/TvzeE4JU0937u0l/DvZHHqpBO
         FBXpMdV4Cc9m4MiWE/d9NbFfYgoLjSnUgqDFTsNfCczIePfBW4Y7dyzv5wNuZtIn3jd+
         BAhg==
X-Forwarded-Encrypted: i=1; AHgh+RrURAnTlzsXvbdwtrtegAUjK7gr4eH6opBOdjEJrXt6zgRLb1UytxKvzao6A6v1kTHdbV+G/IgV3HM=@lists.xenproject.org
X-Gm-Message-State: AFuF++kVmFNB24aZwr4wt+fmEKmtMRfUDobjqRtqyugzdhbCzMhP3/d9
	DZFFxDg5tXypNIkPqh8g1VV/oxKAvnYSySqrVeSWqv76lkio3fldfrrTHptw+oIDQg==
X-Gm-Gg: AR+sD12UNiMoGrliznmIYTmplrXkQt4AK91ofKXPmyScfpDULSfbovU27zkqr2SpqVw
	AYnvjnmdoacxvWZ+x6u8EBfZczYDctQtxdsALiaKkFr/O3zYu+rSMPv19tSrBzsxSazzimU9hl9
	wbe8zVCBOy/dYDqDrIfCC3mpH3q4Q0+ZujDZYolJhEkkunbga7RaJjhz2SV2fa0XjRDzLnHVb0Z
	kG2rf7Ik8YvdZIDwzr+ul7WYa9LtMOCwNdhB9dzXlToMogHrwgPB37IVj/r9Pl7CPy1+JWp8/3q
	5eFSKOdTYiKPfuypK5svlJNOeNUDBZv118piZLim0Hz5+rzSDAmkfHIFLY5CRpHe7j8eXM9v5z0
	i4xoYghFDaGn3xd3w9993zIDaNrOFHqvUaWX8OlmOXKULLqxCsqFvRxibgX8QlfspSSwjoANxoF
	vYIsq/piFgQCuzBSaPewobYRCouf6Ti0NjR5fjeddVyGdcuUHoFEmtEwYV3nPSXot5H4K9A4dvV
	Y+UMjy6b94rLv/NJtqckQEE0VnIcxlPlu5Ee4+o8RNdXCSaTH9h
X-Received: by 2002:a05:6402:458a:b0:698:6084:db7f with SMTP id 4fb4d7f45d1cf-6a5df62b3b2mr8080449a12.10.1787737329389;
        Wed, 26 Aug 2026 02:42:09 -0700 (PDT)
Message-ID: <2aa33f72-8577-4eed-98d2-099b0ced2cb7@suse.com>
Date: Wed, 26 Aug 2026 11:42:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpuid: gate the hypervisor PV-only leaf on
 is_pv_domain()
To: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Cc: Teddy Astie <teddy.astie@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <20260826072526.767424-1-Zhao.Jiaqing@amd.com>
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
In-Reply-To: <20260826072526.767424-1-Zhao.Jiaqing@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1787737329-ABED69EA-D9F24F0D/0/0
X-purgate-type: clean
X-purgate-size: 442

On 26.08.2026 09:25, Jiaqing Zhao wrote:
> Hypervisor leaf 5 is PV-specific, but is gated with !is_hvm_domain(),
> which stays a runtime test in a build without PV support. Test for a
> PV domain directly so the compiler can discard the leaf when
> CONFIG_PV is disabled.
> 
> Suggested-by: Roger Pau Monné <roger@xenproject.org>
> Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


