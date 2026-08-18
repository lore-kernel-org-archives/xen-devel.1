Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D44C5DF67
	for <xen-devel@archiver.kernel.org>; Tue, 18 Aug 2026 07:58:40 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1393604.1632424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEiI-0003rz-Cv; Tue, 18 Aug 2026 07:58:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1393604.1632424; Tue, 18 Aug 2026 07:58:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wwEiI-0003rs-9G; Tue, 18 Aug 2026 07:58:26 +0000
Received: by outflank-mailman (input) for mailman id 1393604;
 Tue, 18 Aug 2026 07:58:24 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wwEiG-0003rm-Gg
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 07:58:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wwEiE-00EJb1-OX
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2026 09:58:22 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84109e-bab6-0a2a0a5309dd-0a2a4509e082-2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:58:22 +0200
Received: from [209.85.221.48] (helo=mail-wr1-f48.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a84109e-be1a-0a2a45090019-d155dd30b05b-3
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 09:58:22 +0200
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-472326ca506so3020633f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Aug 2026 00:58:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482a5b783c6sm10571925f8f.31.2026.08.18.00.58.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Aug 2026 00:58:21 -0700 (PDT)
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
        d=suse.com; s=google; t=1787039902; x=1787644702; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qEAPiSMgkMnRLHoTW3o1ymMnjgIDMjAExbQhjcPQ0ZM=;
        b=LvkoNKuQl2csWdShj69tqMKdnqR92MbI9xDGWf6PQjk6MSvb+5a4ldEjXcfGZKZj1e
         U6mUJ/LbgC7BTinOWRw9vSLzdoFQmOjLXRo+XhK9Vx2q/tznBpOUaD7SPBMqrSUn6mzg
         0KE7O47YR63ilYAqTc6mIFZN9V52M8QccFxEhjWz37g8rhGUDJrWH+Q73IApKdWEzAmH
         Yw9vnYWjJx2DDTYgsZfZVUwA6T1RNHStURqBnNscxhAwT+2JHsPbjrOwvh6ntNXMSWrP
         mDjABgM5tjmM28UxkUF0991fRjgjkCMJUwDlFfkGsA6Gv48XhF/6pabS+96CkmgtSJph
         9zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039902; x=1787644702;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qEAPiSMgkMnRLHoTW3o1ymMnjgIDMjAExbQhjcPQ0ZM=;
        b=GKbqE4B6gq+vDExnFWdD3/9N3PvYB0uer2QLidwm84LhjozXkXH2rx/oCGZqmIVuGb
         6HV1CBPGAydqiQxrO15TI7u2AV4J2ApTSAvVkyDpZ4s7rXmymxFfVykCfVTB9PxezvKC
         HokAK/JLYf7bGIO67+8KAk2iL9SVlIWKZnK84bl4tDRtRlGu1lADFtjFLTtJiPIFktWI
         dgLkdi4/OjkgLWDBDbmkQMUoDcPdNK8Sd69J77NyZl3hZAJ8B52mmzFp1RowEErpDQkl
         8DjibUqN67Es/ItgBelOs1x6ynb0lYlYQNUsUlwTTddsCjBR/LkKdHR6Rqs1fH/HIBjx
         gv5g==
X-Forwarded-Encrypted: i=1; AHgh+RrSkXAx3cloiNTFIsv74PGUaFOovnLYqbP4ALYtt169IM+DX+gc2S4c/LGXlK2EZqV1J+dC+N13Zfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyocl8YYuWSya5LWdPWk89RohvsZfLBmHqxmU0mBm3WeW14R/Mw
	zcD5bl4WvbjmBYBzslTBrPr3VpFoaBtqoUDfC5NPnFRvruu3Dy3SniJbmvJ2iihukA==
X-Gm-Gg: AR+sD10jqAwKiW47SIxlgyBLSORdJbPlCoQwBNNI7dKaO4slPl0rDQnym3fNGlmjqiW
	8fggB65yByWYxRY3+l/EBTO/eqxBHXy4ly2USyR77Z4hdlzCeY8WPLEYqFtfVAzJur+v+MxGFVZ
	O0Qa1FHFwYQpFfRnJDNVHgutmbyLvZQfS6f3vmNWalzUe7JDDL02/lWW9vgV4lfcyj8GRYrqjGZ
	rO2PZkn3LX2LpQnaD7ApOs0b9mh4noOH0s4OyWKFw53t1rdCiimjuzo4FhVzPEEXxZyrMQjLJ2M
	n4KodrbUlRRGHoWXY8oSvxGlGprnuBc4niau93UMwIZTCTw74Z5I1AzQESMSGkKSXYp51juNGG9
	GSd/v+nHjnrhBnjsMZQepPjXHoqQe/ejN9v1P8sfpxXiJPQfGhAr85iOqQ2E58SbcLHDrmK0dfz
	1dtxpLO0E58ePa97AE/hmenNMW2x/EbBVDl0zj6nZScUoxY2OxWK48FYhazS3z+Oki6aeGGqAaD
	KOgEOfjYUFrLwud6XzztUpdDow4ENjYc2/WddS6S8DGyPfEQfJG
X-Received: by 2002:a05:6000:288d:b0:47f:9de0:c27f with SMTP id ffacd0b85a97d-482a8fe9b80mr10234019f8f.1.1787039902023;
        Tue, 18 Aug 2026 00:58:22 -0700 (PDT)
Message-ID: <eeedd10c-0c14-438e-a48f-05383ba49ec8@suse.com>
Date: Tue, 18 Aug 2026 09:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/17] xen/riscv: extend exception tables with type and
 data fields
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <1eb9050ff6632f91682151471440990bd718ed90.1784560663.git.oleksii.kurochko@gmail.com>
 <be932384-6661-4c92-9137-8f6a9cd54057@suse.com>
 <3c9ef195-a8d4-489c-8daf-5635d3b53063@gmail.com>
 <87339fc0-fbf7-44eb-8b08-cc95ac7d1cb6@gmail.com>
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
In-Reply-To: <87339fc0-fbf7-44eb-8b08-cc95ac7d1cb6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1787039902-3A8D9034-B4CE8CD4/0/0
X-purgate-type: clean
X-purgate-size: 719

On 17.08.2026 13:39, Oleksii Kurochko wrote:
> On 8/17/26 1:33 PM, Oleksii Kurochko wrote:
>>>
>>>> +    BUG_ON(!trap_info);
>>>> +
>>>> +    trap_info->sepc = csr_read(CSR_SEPC);
>>>> +    trap_info->scause = csr_read(CSR_SCAUSE);
>>>> +    trap_info->stval = csr_read(CSR_STVAL);
>>>
>>> Do you really need to re-read all three registers here? Didn't you 
>>> read at least
>>> scause already, in order to make it here in the first place?
>>
>> Agree, ->scause and ->sepc are already read.
> 
> scause should be re-reaad as we don't save it inside cpu_user_regs 
> structure.

It could be propagated as a function argument. Question really is how
expensive these CSR reads are.

Jan

