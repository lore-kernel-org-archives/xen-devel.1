Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE18C98328
	for <xen-devel@archiver.kernel.org>; Mon, 28 Sep 2026 06:15:36 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1435672.1654461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB4dx-0007DM-SP; Mon, 28 Sep 2026 06:15:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1435672.1654461; Mon, 28 Sep 2026 06:15:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xB4dx-0007DE-PC; Mon, 28 Sep 2026 06:15:17 +0000
Received: by outflank-mailman (input) for mailman id 1435672;
 Mon, 28 Sep 2026 06:15:17 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1xB4dw-0007D8-UK
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 06:15:17 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xB4dv-004O7o-IM
 for xen-devel@lists.xenproject.org; Mon, 28 Sep 2026 08:15:15 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba05ee-2eae-0a2a0a5409dd-0a2a4502d90a-28
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 08:15:14 +0200
Received: from [74.125.225.99] (helo=mail-wr2-f35.google.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6aba05f2-6ca4-0a2a45020019-4a7de1639887-3
 for <xen-devel@lists.xenproject.org>; Mon, 28 Sep 2026 08:15:14 +0200
Received: by mail-wr2-f35.google.com with SMTP id
 ffacd0b85a97d-488780459e2so2623938f8f.2
 for <xen-devel@lists.xenproject.org>; Sun, 27 Sep 2026 23:15:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00178174dsm107633735e9.10.2026.09.27.23.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2026 23:15:13 -0700 (PDT)
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
        d=suse.com; s=google; t=1790576114; x=1791180914; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mq/jQk25ixMarberfZX0bBqSMiaB5XREuzfy+pWwf28=;
        b=a99g8N0v5q+6vca3xTT+CyYH35UY8HVgfY+VI6xnnsm+R1NybWYA0SiFpEyycMAKQP
         TgSQpKe0+YdOEVXULL2HaR4UCLb0T5q31ZPcO1Prjt6Ca2clK2+nDwK9Vdy6LRW3PKZz
         p+pR7RB0qmfvhzGabTSTvnTbtUBgc8MJqz3DvXLM/4JAscUhOi9xyzALQ/s3F34lwhry
         Mg7QIcJmHGZ2Vb+9SKOhvOoue86dHlVZXKdwwi0XWRtnabYAPS1U37JEGOmg0ubgYj2b
         JmJYjKhchc0ONyiEK/AFON52wHNotjiArwqNKRNP1a9AW+uENc9YtdKuzaiysGzmnXr3
         x0EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790576114; x=1791180914;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq/jQk25ixMarberfZX0bBqSMiaB5XREuzfy+pWwf28=;
        b=Np1mJ4Bz023MwmyOECrA4Ww3OL1ISaj4XV3fY3a4hyAykT1DNMluXHgTTfygOpZpuT
         TBfdNvHKbBIIh9zvSRB821RFojVd/CCq1hVT27XIn61UaqFYejOjxQZDn7s5opAquC/M
         XyyuxBUpVmI+EfUJVmx0fZoWake4paCE7JnprKVW86nqpjpHK6iTbV+QYqZ7T1154qUx
         4fiXecySBR8GDre0ljPDmOJSMNH16RwtwUhZpNRlOUjIcCZJ7uBtaa8wu1N4yYLC+uZe
         4E1mXd1/6tnvN0/r4LRCH+EuF7UC8C7IvLplLXWEcbCldgRNnwGAhPrqN4C8CQAxdkAc
         b/dw==
X-Forwarded-Encrypted: i=1; AKwUvBzFgATLB2xhUNjd3cv0pTp3Mzdz2BMXIeLz8aT3fxn4o4AjGr+dBPCwBAltvM6N7eJbMqJ3sY89Qxw=@lists.xenproject.org
X-Gm-Message-State: AFuF++n4FePX//3k0tUp/ms5v+bCFbJGTbrqMrX+pQqkU5vUbohBXTr/
	70FFNE2iW+qAMQFFUr9yeO7YaJmCdMH+Udc+1Min8ZcSWNzDtzkVawqUHadNif+45g==
X-Gm-Gg: AYBFou0UxB0+1hhI0OpwnWqTV+6yFD1gt1GIAgFXrLZQoDFeOLtWraTcDRRGi2C81JE
	YbJoadzi9P7QtJbADJdwTCn0p4rW6gfGheCurM+66Q0D80Z1hVJL7HECDx3VE6I7vYMEwOvLeWR
	OPCpMywZkp49XCJH6beys0AUifsQIESLaGochFVKq/3Hw4lH/1hrMMVJNom5CRLDPXP0c2Dm7tM
	hf8v449knR1KRhGG+oyuvxv6ApFLg0GZGPykMYJ8aJRYXh+1loSFPAt9TfaMfzaZj52GxZO6x/Y
	edSRnoGS+Fwbdd0F70jr1CMf3FKnROMDKQm07KQK6dwTtMKEjaTm0A4p1QgWl1A4EfhKRruNpG7
	103Hz4TyMqIqA9jmtsfXe3MrAm6TOYh3StbyKDQnzIXsTdWi1f+s92xWHQ3G7EX2ZTNMG/in1A2
	YBI/v8ecotsQ1ve3FoSHihYL4+AYIq+L37x27KR3xMTleytUrg+BPbGWjC4ci0EfEqGwy5g0E2X
	6fYLhKW5YfxgGUwD3WmFZzThSE61kJ51wf1hv2jErJY0P5puwa+Al7HhseNYWo=
X-Received: by 2002:a05:600c:3486:b0:49f:f9d4:674d with SMTP id 5b1f17b1804b1-49ff9d4695dmr83129345e9.13.1790576113711;
        Sun, 27 Sep 2026 23:15:13 -0700 (PDT)
Message-ID: <38f6e47a-77d4-4b13-a4c7-94cad14db6df@suse.com>
Date: Mon, 28 Sep 2026 08:15:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] EFI: refine cfgfile buffer allocation
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <7e332eec-5c5c-4c1b-aeeb-c65e046b1318@suse.com>
 <525eb684-289d-45aa-91a3-b9edbc73c06a@citrix.com>
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
In-Reply-To: <525eb684-289d-45aa-91a3-b9edbc73c06a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-720697/1790576114-F34BE2AC-DB761CB0/0/0
X-purgate-type: clean
X-purgate-size: 1019

On 25.09.2026 17:56, Ross Lagerwall wrote:
> On 9/21/26 10:09 AM, Jan Beulich wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -878,8 +878,13 @@ static bool __init read_file(EFI_FILE_HA
>>       what = L"Allocation";
>>       file->addr = min(1UL << (32 + PAGE_SHIFT),
>>                        HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
>> -    /* For config files allocate an extra byte to put a NUL there. */
>> -    ret = efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
>> +    /*
>> +     * For config files allocate an extra byte to put a NUL there.  There's
>> +     * also no constraint on addresses for them.
>> +     */
>> +    ret = efi_bs->AllocatePages(file != &cfg ? AllocateMaxAddress
>> +                                             : AllocateAnyPages,
> 
> You could avoid the negation here, unless it was intentional?

Use of != was intentional, but that's not a "negation", so I'm not quite
sure I understand what you're referring to.

Jan

