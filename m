Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF0FCA5FFC
	for <xen-devel@archiver.kernel.org>; Tue,  6 Oct 2026 06:00:15 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1441229.1658787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDyDX-0001Jr-Pg; Tue, 06 Oct 2026 05:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1441229.1658787; Tue, 06 Oct 2026 05:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xDyDX-0001Jk-Mn; Tue, 06 Oct 2026 05:59:59 +0000
Received: by outflank-mailman (input) for mailman id 1441229;
 Tue, 06 Oct 2026 05:59:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xDyDW-0001Je-IF
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 05:59:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xDyDV-00Aq1q-VB
 for xen-devel@lists.xenproject.org; Tue, 06 Oct 2026 07:59:57 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac48e50-bab6-0a2a0a5309dd-0a2a4509d8b8-18
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 07:59:57 +0200
Received: from [209.85.128.51] (helo=mail-wm1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6ac48e5d-be1a-0a2a45090019-d1558033d839-3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Oct 2026 07:59:57 +0200
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4a020e65269so2530025e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Oct 2026 22:59:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a178db04edsm50214495e9.11.2026.10.05.22.59.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Oct 2026 22:59:56 -0700 (PDT)
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
        d=suse.com; s=google; t=1791266397; x=1791871197; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CCHim4EnGv5ISJNtzeANfBYoH+J0BefRMjb9Cnm0c0=;
        b=GauytJkFBLIrcD9mNj8QW5bdfpYLEc+NtU7q5SvJlGttm3Uuy4SnugtzXSLnWnHS1P
         7OURL1nalxvkBnoWaoWRKSNIcTl9btlOSqlivptewSMB6hHfN2TAsZbXfN1f5MXxCX4l
         ssPHhuPZpXE4ryBcPiPpa3ldEX2FD53VpD2Jp53TndGi1zrnLety4JkdIUxSKqcg3ob9
         enWJzQ8dHyCsZBV+RA/tkxc9/NDuInZbdhHAMleJ1d5dOc4B6NW2sIuWcoRNMFbivqdN
         n464QGOUwPRfVF6rPpzziGeHwvJs8ij0hSYpE59k+qCXRBEXzvv3LpYWW3vWOpZKmsO7
         sSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266397; x=1791871197;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CCHim4EnGv5ISJNtzeANfBYoH+J0BefRMjb9Cnm0c0=;
        b=PN44XJ5qoXpLJR9Wp9MAlnyTniTza/4K5M8iHexdi4EHzlHAtRS/UlEhRzUxFDGZ9Z
         h/L62xzQD3aqWayVTIrg6wTX2ohykWiTH50d2JuyIPtjacDWV7muDDujeYuo+pYx3k4w
         XW3j9wD/cf473ZqlRLUiuj9GcV6kp0QRLRMsg2N2ZXw+yxZiLwtjRn1BU3nNCI5TIDKs
         VBLO2NoDnANBHOFeFYMNuN0aNvTZeEgMERFiRuHCdZ8Xz09f6RWXH2WD3vEPxZYTK3qC
         yupsLcNTwRfLtdRMv96RkBMXPWHA4c+oiT0UT/LDvy4mXHXsCnLB7yKnvMK/XqQF4fpv
         0JqA==
X-Gm-Message-State: AFuF++kF636czieM6pSZMecI/l0aGVNXGWU2GnqIdEpWmwnxA7B4XtBV
	EQXpdDA3uo4KyDlEUP1yjlzas7LtyielOXiyMQ9KCsOYlzeaifdiTsBMqaEE8SN4fQ==
X-Gm-Gg: AYBFou33+kpQR52MvM8+drR4yNjMswkWuCMmtQh2XbNp5v6+KR6sgugjO3l8ofFh5nV
	yG0i5rE8xLsuUTeV6zj/oOV269lwb/yTiHHNVEgiQ/zIO5F9sMchJYJpAiW/PQzHkseJmcXef7r
	b2P/IJumPV6OF3Ag2C+/ho4xSrbhsRg397u/gazpmrdvlw4D5A1pTi5PzWhUDBiaO2/fkZdEYpV
	9Vfua4P4MfscvUYh+2klSp3DBuoY45FgAO6TKm70eNH/yeUmLYR1F4mlC04QwEE1IVW9bFHbxGI
	PDgFUGk3Znh5PwmUu51+phxeheKO2wpOyyxhnmxxKhnkHgnuS+87lYaOsiVUPqHcI4/8MK6b727
	HRnjozwuJhjRnCy9EVTT7wwSe7O9M4eInOoXAB68eWJAEvi+KqzxrsK+ToEBes5JKKLy01V0m07
	AHdyZuQNiMGalwt9/cVDlt1y/A1nwwrlrcKMDoJyK7YPWgynAJ/KOlQiBofKUK3S/ky7ZtgHIHa
	ZBObqBxAQ835+c7I7gSFT/sWm2hoWzQ/Y2D6TH8t/GueT6ZUnsWgbIXH0QiLvhOTeIND7HD
X-Received: by 2002:a05:600c:4ed0:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a17b526f07mr5669245e9.8.1791266397339;
        Mon, 05 Oct 2026 22:59:57 -0700 (PDT)
Message-ID: <46943494-89be-4d72-943a-dfc28b96cbf9@suse.com>
Date: Tue, 6 Oct 2026 07:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/14] gnttab: don't cast away constness
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>
References: <0ff5676d-2ad3-49e3-a94b-90e7c3edb55f@suse.com>
 <1f55b457-c8cc-4ef9-ba5a-96e52b95fbbe@suse.com> <asPXWmwRpzWtHXR9@Mac.lan>
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
In-Reply-To: <asPXWmwRpzWtHXR9@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1791266397-3A4DB034-B2368457/10/78276251493
X-purgate-type: spam
X-purgate-size: 1482

On 05.10.2026 18:59, Roger Pau Monné wrote:
> On Wed, Sep 02, 2026 at 08:35:47AM +0200, Jan Beulich wrote:
>> While _set_status_v2() indeed doesn't alter the grant_entry_header_t it
>> is handed a pointer to, _set_status_v1() does. Drop the const from the
>> parameter of the latter (and then necessarily also from _set_status()'s),
>> while adding const to the local variable of the former.
>>
>> No functional change.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks.

> Could we also use a union in the functions themselves to avoid the cast?
> 
> union {
>     const grant_entry_header_t *shah;
>     uint32_t *raw;
> } grant = { .shah = shah };

Possibly. However, irrespective of us using such all over the place, it
still is - strictly speaking - UB.

>> ---
>> Really I think it would be best if we did away with the raw_shah local
>> variables (which looks reasonably simple for at least _set_status_v2()).
>> I'm unconvinced that we really need to use ACCESS_ONCE() here. Torn reads
>> aren't a problem; what we require is that we look at a stable local copy,
>> and that can be achieved by putting barrier() after the reads.
> 
> Possibly - I would be fine with that, which kinds of render my
> previous suggestion to use a union not very useful, if we can get rid
> of those variables in the first place.

I'll add a todo item to my list to give this a try.

Jan

