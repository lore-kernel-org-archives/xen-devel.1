Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCE7C9833E
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 08:55:55 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435788.1654579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB79C-00013B-1T; Mon, 28 Sep 2026 08:55:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435788.1654579; Mon, 28 Sep 2026 08:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB79B-000134-UI; Mon, 28 Sep 2026 08:55:41 +0000
Received: by outflank-mailman (input) for mailman id 1435788;
 Mon, 28 Sep 2026 08:55:41 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xB79B-00012y-DO
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:55:41 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB79A-00FR1t-Qe
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 10:55:40 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba2b7e-2eae-0a2a0a5409dd-0a2a450885ce-40
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:55:40 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba2b8c-f659-0a2a45080019-4a7de18c9429-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 10:55:40 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49ff9621c5dso11166765e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 01:55:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a0017652d1sm183248465e9.5.2026.09.28.01.55.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Sep 2026 01:55:39 -0700 (PDT)
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
        d=suse.com; s=google; t=1790585740; x=1791190540; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BzPJYI1DTnClJAqRRbWyMz0FcgW7iErP5wR042l9y1M=;
        b=doeO6mmlcRws0096L4+kZULdz9e22RT061qkWvDgqHdI1ufDyn6Gkd+eCTL+knAlHE
         q3H87db+8XibehSSje2afcwX1OeXb0EELEMM3fBZcAZLc6VI6GI6Qnp6JdIBEMBSnxyH
         pxb87+AN65SS6oe2LLurbjsZ7X9UYdbhj9zeYnQGrx6srXtnugS+3c74InCnMQ1WbgM+
         SbP4Aa/k2OohXCuI/7zfT9ql3siM2wZUUXUctN96kMxBOjLAahwO6Hrkpo9accnxRCEh
         OfaUb1bv5/jVc5lHXsITz11TfnynRahrMN4aRbLVNQvhPj0YJjQf/H6413cDx/PmrOqS
         0A4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790585740; x=1791190540;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BzPJYI1DTnClJAqRRbWyMz0FcgW7iErP5wR042l9y1M=;
        b=oKdZtzHfXP3YF0/WVZrrY/CsB/BN3eHV/8U7oCP3jAB0jqMWQKlw33lgnbKAtWU9yO
         ColdqfAUNX7IOfcFTDrt8oHoU92aNKXmE9tbbx/wsacmrsq92ATDabom9lBa1/lL+/MY
         Etl+fq1D9aXVltR6TjBke+zIGRO2BTcd2iMLdfIbYQs4y6DMBxgAO3vukSA3S7Neuo5H
         UFH/N6XC4gQiD3ZYXbc+esghAdPLX41LxHDknO2QSFiR6UCCjjZ8+oc2fOvmTw2rs2JK
         ZOC4q7OqOhWscQ2scBIs4KDFXz3sRJmeQt2x4c90u4LWcGAPuDXBwiunbxa4G5vHgAWA
         FlrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjNjoZtMRknWQtCgqcw8soKagtKROu3/hiZ6hNwuABOJ0AQSw7xQ0SkSETfeRpjEfe3r0Pc1jyXtc=@lists.xenproject.org
X-Gm-Message-State: AFuF++kl42j16sWuOpB35Up6IAU8gErdmKTyJv/yqqaYRxwFgA4QDK+g
	cvllkWw/N6aPvuHzZNS8QHKDlJtE3V7Mk9kiLSxybjEvdT8PzPx14YxPAKswgCHT1Q==
X-Gm-Gg: AYBFou2l7C17wOWsjIC6Tn9v00owGVB/zHsfIYzG9DzD17MyAEXFUgiUJ96BJt9Dg/d
	o++yupIZMYCe+oeKVfs3hz+vGczcTQpsTS7RNYJ+o5QDsJ8XbKy+h3NbizDZNa3yXbxhXbtc1Mk
	Haow3O7A9KATfUuO1Q0nwxGTkwVwNg2ToSHg1TAp7I9gRv9h2AVsl1YNg+Bp0pqXfpmh3MpSQsd
	zsqd4uc7onpGN93akaDhkCB8YH6alz5uhhGhFdm6ZF27gt1KO/bZzJbFv1Efq/OlSnZqcgUWGTK
	Yp9OLvwmFD8uCPs0xkk7UmnXqZNbRU3HdsQWyDrCnGHljtf2f/HQiPW5J9dVCgQm2Tfm69ObC6I
	oI2v4bzn0A92jP6INjgN4/xofv+wm6VjFbGlUNmvTZZGJSKbUBKA1+v3poupGiPpEex+24dcWSs
	U8CJOtM9AqhslpOLtgrzJLx+kaDaqNSDDiZi51OJbO+C6RWyB86tFfQ+ZIkDriY6BuAFy85Jzji
	La+0+KEhrgWC02hH1dybX4kivUoGRjTe487wNQTmy7hK8nFBoJkPEDDWiI6mg==
X-Received: by 2002:a05:600c:1d28:b0:49c:fc6e:8cbd with SMTP id 5b1f17b1804b1-49fe66fc677mr237859655e9.33.1790585740116;
        Mon, 28 Sep 2026 01:55:40 -0700 (PDT)
Message-ID: <2cde5f79-810b-4634-be43-83e9f62957b9@suse.com>
Date: Mon, 28 Sep 2026 10:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: refine cfgfile buffer allocation
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
 <525eb684-289d-45aa-91a3-b9edbc73c06a@citrix.com>
 <38f6e47a-77d4-4b13-a4c7-94cad14db6df@suse.com>
 <5c243828-44c2-49fa-8881-c97c4170f232@citrix.com>
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
In-Reply-To: <5c243828-44c2-49fa-8881-c97c4170f232@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790585740-D5B4987B-1AE9C348/0/0
X-purgate-type: clean
X-purgate-size: 1471

On 28.09.2026 10:37, Ross Lagerwall wrote:
> On 9/28/26 7:15 AM, Jan Beulich wrote:
>> On 25.09.2026 17:56, Ross Lagerwall wrote:
>>> On 9/21/26 10:09 AM, Jan Beulich wrote:
>>>> --- a/xen/common/efi/boot.c
>>>> +++ b/xen/common/efi/boot.c
>>>> @@ -878,8 +878,13 @@ static bool __init read_file(EFI_FILE_HA
>>>>        what = L"Allocation";
>>>>        file->addr = min(1UL << (32 + PAGE_SHIFT),
>>>>                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>>>> -    /* For config files allocate an extra byte to put a NUL there. */
>>>> -    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>>>> +    /*
>>>> +     * For config files allocate an extra byte to put a NUL there.  There's
>>>> +     * also no constraint on addresses for them.
>>>> +     */
>>>> +    ret = efi_bs->AllocatePages(file != &cfg ? AllocateMaxAddress
>>>> +                                             : AllocateAnyPages,
>>>
>>> You could avoid the negation here, unless it was intentional?
>>
>> Use of != was intentional, but that's not a "negation", so I'm not quite
>> sure I understand what you're referring to.
> 
> Sorry, I meant !=.
> 
> For the cfgfile, I don't think you need to allocate whole pages so it might be
> better to use AllocatePool/FreePool for those allocations.

Yet that would further increase the difference between that and the other
allocations. See e.g. free_cfg(), which right now works uniformly.

Jan

