Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73EB1CA6012
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 07:07:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444021.1661046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF4h5-00013e-Nc; Fri, 09 Oct 2026 07:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444021.1661046; Fri, 09 Oct 2026 07:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF4h5-00013W-KO; Fri, 09 Oct 2026 07:07:03 +0000
Received: by outflank-mailman (input) for mailman id 1444021;
 Fri, 09 Oct 2026 07:07:02 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xF4h4-00013Q-4V
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 07:07:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF4h3-00Ep9J-HG
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2026 09:07:01 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac89286-e002-0a2a0a5209dd-0a2a4507bc4a-14
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 09:06:57 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac89290-b4ea-0a2a45070019-d155802dc456-3
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 09:06:57 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4a018792ab3so33742085e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 09 Oct 2026 00:06:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf2343asm64123705e9.9.2026.10.09.00.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2026 00:06:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1791529616; x=1792134416; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLtL/UQ4aw9dMmG4Iu9JqlxjJJAQbHVRvsBfn3pquMw=;
        b=RgcbAzpV5nHtvcM7KaJel3ytPSApdcefg8HCFV8qBCHY4tZ4FAVq9yVcJ7Y1X5MmNg
         86YI0mpqXkwc4KerAcS8rUEVAFnoLtf6PSRh0+fF9hiUnMr0u4Yq1wtKVWtKH0UDg4vv
         2h0TuSMLgQLOIPPlTNbIV6tUsbj0OJw6TF0wh61EXITv5zDM7vLgFSz6BzcciD1YeoMi
         fnPQm8IGJCUBwMss67m/b2szn9JaD0hNQLYo6eLjTtYFJl5ADy+nq0MCIp2sXWuFSUbW
         ehWwpLOLLQJXf4nYCTxpTYG4WBTgkD70BXSYZyLAA1N0gP4zj2PxIBW2VgyhLjaDse3d
         TKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791529616; x=1792134416;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLtL/UQ4aw9dMmG4Iu9JqlxjJJAQbHVRvsBfn3pquMw=;
        b=PkTysTI+xsgB1ExEiJjunr7fCNIMTCDPvxzVFvbjKf7h4/o+YLiQ5SgnoUIX/bFHyE
         mNmF+azX8mcMqMb7R4RN/d4bP306jMao1sdQ7sdHxbWU6f86SBrNhwj17rr7lR5GAOA1
         3rRvV4R42pTeG3FTkTg+W3vIeZbvM8uU9TkI9XN1hW4I/5K9YDXog4J/LUkzGk9dq+4B
         9gyofutlB7G7jqcZpLbKUCpjE6k4r+FGQACkg43NTzc98IvP8eaid04pVYMLkhd6d2eH
         +PhrCKBNU1He53/qOjyqWQfcb0SpMJQO5kaE5LZQ/0NIdTR5NIwRp3k4LvUyxDTDZzau
         amnA==
X-Forwarded-Encrypted: i=1; AKwUvBxfLAqIeDshRTRNzj0rM49+FiedwZ/r+f1LPCTZ6krbASN0NdtTxVj78f1UFqehOWLvlUv7E7kt1r8=@lists.xenproject.org
X-Gm-Message-State: AFuF++m0r9TWl9TOO62PW6flCNRNCnd4YpDybY6UW9VUdeCrTRYeqNu3
	pGi6rFjnGjsTTEHFwMX6aE1GfjKaUNxua1wiEO1DCmtLJpXP+rim76HNpyHjqmNHzg==
X-Gm-Gg: AYBFou0/Jby4Ipp4DqraZ9V8jKAMm+t1Ys1ZcDhnf5SXLtT8ZAEi6HKCuga+azH2EtX
	auzT9qfjbQOhW5REFYixn0N4CWEwg4e+dsOV+f2xLNFGUYFOzW3aMvnh9ro8F4k7XQpClp5b8R7
	5B93Kd6NDWKwFOztVaGRlEL1mNFyjdI8GF621l83kAQ1puGjSeHMEcSmKZhDDj2IxS2/IEwcibu
	BpCDox8mtRvnKYw0gX/daYwl89mH4HxOG6G3uT/zAtJYBTCmO9FbR1+NphIaiKz5PUm2Xrsp0Um
	ZF+MlhW3zsifdv1M4VUKyNgCg4UzoxrqmzdCg7icnCWaAoKu/pnf13A91dCsnHnlFNR5Yr4yoiI
	zQHMnU245ehmQrN7gV1YrCyS265UQLjto9mhpn9aFy7ocOR5rRknGza924svPC1mg8n3w5F2AQd
	GPWlUnzGTtB7o3Ys1TCbjyN7hbBOU/8HUh/zQcdF9z35cj7jKgBH03lba2EUb8zgg4eeLK1gIVv
	H1ncg4tmmIac0w4ugMKd6VE7VCrIdtc97tzQm+G5WKJeoe9X49hevdfATTaKQ==
X-Received: by 2002:a05:600c:8184:b0:4a0:1c17:4fb2 with SMTP id 5b1f17b1804b1-4a18e4d854cmr12053725e9.31.1791529616576;
        Fri, 09 Oct 2026 00:06:56 -0700 (PDT)
Message-ID: <10316579-4372-4ade-9114-53c737053e0c@suse.com>
Date: Fri, 9 Oct 2026 09:06:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/18] x86/hvm: introduce per-vCPU L3 page-table
To: George Dunlap <gwd@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <20261007104051.48841-1-gwd@xenproject.org>
 <20261007104051.48841-8-gwd@xenproject.org>
 <7bced27f-5391-4120-b9cf-b97bb88758ca@suse.com>
 <CAFLBxZYi+k3Zn7ALqzATsWA+XAXkPvAxeq-Z4pSca3PMocUrZQ@mail.gmail.com>
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
In-Reply-To: <CAFLBxZYi+k3Zn7ALqzATsWA+XAXkPvAxeq-Z4pSca3PMocUrZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-ef75cf/1791529617-A56C2AE4-1DDA1060/10/78276251493
X-purgate-type: spam
X-purgate-size: 1414

On 08.10.2026 23:00, George Dunlap wrote:
> On Thu, Oct 8, 2026 at 9:40 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 07.10.2026 12:40, George Dunlap wrote:
>>> --- a/xen/arch/x86/pv/domain.c
>>> +++ b/xen/arch/x86/pv/domain.c
>>> @@ -127,7 +127,7 @@ static int setup_compat_l4(struct vcpu *v)
>>>      mfn = page_to_mfn(pg);
>>>      l4tab = map_domain_page(mfn);
>>>      clear_page(l4tab);
>>> -    init_xen_l4_slots(l4tab, mfn, v->domain, INVALID_MFN, false);
>>> +    init_xen_l4_slots(l4tab, mfn, v->domain, v, INVALID_MFN, false);
>>
>> This being PV-only code, don't you want to pass NULL here? The description
>> talks about this, but (a) it's not quite clear why PV32 would want handling
>> differently from PV64 at this point and (b) in sh_make_shadow() you do pass
>> NULL unconditionally.
> 
> This is actually left over from the previous iteration of the series
> which supports PV guests; and apparently it would be a lot easier for
> implement per-vCPU pagetables for 32-bit PV guests, since the L4
> doesn't belong to the guest.  But it's outside of the scope of the
> current work.
> 
> At any rate, I'm going to try passing a single vcpu, as Roger
> suggested.  That restricts toolstacks to not being able to promote PV
> L4s before calling XEN_DOMCTL_max_vcpus, but that seems fine to me.

But my question was why it's not NULL that is being passed here.

Jan

