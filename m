Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA2CA5FB3
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2026 11:09:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1438164.1657031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEeh-0006kl-5Q; Thu, 01 Oct 2026 11:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1438164.1657031; Thu, 01 Oct 2026 11:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xCEeh-0006ke-2T; Thu, 01 Oct 2026 11:08:51 +0000
Received: by outflank-mailman (input) for mailman id 1438164;
 Thu, 01 Oct 2026 11:08:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xCEef-0006kR-EP
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 11:08:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xCEee-00FTyt-Hf
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2026 13:08:48 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe3f36-e002-0a2a0a5209dd-0a2a4505a24c-40
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:08:48 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6abe3f40-4cb1-0a2a45050019-4a7de18ca40e-3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 13:08:48 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912d391aso48960195e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2026 04:08:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a01f6db98fsm51406635e9.0.2026.10.01.04.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 04:08:47 -0700 (PDT)
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
        d=suse.com; s=google; t=1790852928; x=1791457728; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfOHFJUM1kARODcyi40nJaFMEVGuV9H/jMBu2s8f/z0=;
        b=N/BH+q29NsJVHaaJFUmDKCP1svrO7iHnwCuM6kz1BrIsR7KtfGY9EUysR9QdfT6wfq
         w0Ag5yQtkP5klIWild1+z+VgNMFSZeF+WD5CcrP4YLISeawLC9Rk+EY5pd8+BoMUI6jg
         HLUxSEr25+kyni+sspmTtlKkScYPfrUbXULz1U1FoK2z8DVxkNcxmpylFw7zBFDlUeDL
         qWy23pg9EV5UCpyZVUhsZ8roVvjdNhwrMS+faG60oXHPlsfumM1lDQT1BNFpq1SgmyJ2
         ECpgQFpaQH8cU3LpwqGjd8Z6F1Vi/3L5wl6Qg4mSfqbFzukY0+PPQ/2ammXk56witdJD
         5oyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790852928; x=1791457728;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfOHFJUM1kARODcyi40nJaFMEVGuV9H/jMBu2s8f/z0=;
        b=TWdqan2w1wrOgpBG+q1GTHljsNajRd1cB2xOoAa8nW6sHcMXWViQ6swSW0J/6q71tw
         Kk7uFgGAUwMNNPHh4OfWJwYmuGb4WLYgFfDKY3AKoBkUUcfxqeU7uZcsOODXe4Bnxw92
         hzyDl9KUdH3u+bTtOBQEyULcr4A82cH0IAgHplD/N2kfsBFEKryverxu02X/x94h0ouz
         Jfdco51IuFKUFlLKNbJkCUoiUoqStc4NL+AIqSmVG1rScloBQU83Q7X3/S1g2Rac/wPx
         99XJLiUOwZd3AQVXjTyH8yBK96G17VshqKpFB76cO0Ie0LukuAciFnuuKCySge+pe0Bl
         Su/A==
X-Gm-Message-State: AFuF++kpWBRCU70MPRzLlNeHzmXYzi8FyExGmtGBRdEso2T6ieuFHO65
	O/PRUnf6LcN5fczkbaoyyq3/rIydqiUWqcph5GgF/LapjJq8ar9G2CKUtwPl+djBZQ==
X-Gm-Gg: AYBFou2LADzeh6KrVuZStLAAzWs2enw5rOzOADA8JPIbZX4xE/VGJdG0I1MYkxq47J/
	l2IzGTUSBuC3v3KUyfKdFYOrNIntLkFDL//IOTMYewHFwAvmzs1UpjYBSSrB8h7BCSSn4DYEGPO
	PEenOjimIcTO5FNCnUqRtfqkxsWoOc/jx4P361/gFiwI75N14N/lhMySTmBk0MgGn2TUqOe0x+Z
	ulj54bR4VzxWVHf6xLuWsW9YPxErLTn+WeNw3vXtZ4vK1rYX0K46ejrlobawqJ3zWmN1GPUe9l2
	8vLBIv4RNdd/bvUP7ZDibSu2Fb/SkA3/mDG9V2kDxrtqgMo5WQkownusFs2FHqHfyrGwqBEQMD/
	2xFRaDvp53yHsM7uLWfB14z9V8B1K9weutNEEfthF3ygyXWkbHWEOTkxH9FPlb3fMQ/gUIy87yE
	y5H80tr0Aj9yc8ihaYc4geHadC0wlwlgWyjKtscx+DlUiyPfqpuFANh4sjyh3Vz2CXv46DIO396
	MLzXlRNrCV1j8B01r7BAJBG2gvpw4HjAXPzhXI9PycB3Ls/EZc+YhDfMzjxHes=
X-Received: by 2002:a05:600c:5020:b0:4a0:1efa:c746 with SMTP id 5b1f17b1804b1-4a01efad733mr36150775e9.21.1790852927874;
        Thu, 01 Oct 2026 04:08:47 -0700 (PDT)
Message-ID: <2a9c133f-004b-4360-af53-2c8127f9a0bf@suse.com>
Date: Thu, 1 Oct 2026 13:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] xen/riscv: use pte_is_valid() in pte_is_mapping()
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <1790845467.8631fc262581453bbf619ec5b2062170.1a0f6b5397a0003f66@vates.tech>
 <1790845650.8631fc262581453bbf619ec5b2062170.1a0f6b805100003f66@vates.tech>
 <1790846121.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@vates.tech>
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
In-Reply-To: <1790846121.8631fc262581453bbf619ec5b2062170.1a0f6bf34f40003f66@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1790852928-F5EA92A1-4475EA17/10/78276251493
X-purgate-type: spam
X-purgate-size: 728

On 01.10.2026 11:15, Baptiste Le Duc wrote:
> On 2026-10-01 11:07 +0200, Baptiste Le Duc wrote:
>> Use pte_is_valid() instead of open-coding the PTE_VALID check.
>>
>> No functional change.
>>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Baptiste Le Duc <baptiste.le-duc@vates.tech>
> 
> I forgot the changelog for this patch:
> 
> Changes since v3:
> - Rebase on the pte_is_reserved() -> pte_has_reserved_rwx() rename in
> patch 3, only the context line changes.
> 
> Sorry for the noise, I didn't know if the reviewed-by
> Oleksii gave applied here as I rebased the patch.

If it's a re-base which doesn't affect or alter the code change you're
doing, I don't think an R-b needs dropping.

Jan

