Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A48C44533
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2026 14:58:02 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1367852.1617511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmBue-0008Gd-Tl; Tue, 21 Jul 2026 14:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1367852.1617511; Tue, 21 Jul 2026 14:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wmBue-0008GW-R2; Tue, 21 Jul 2026 14:57:40 +0000
Received: by outflank-mailman (input) for mailman id 1367852;
 Tue, 21 Jul 2026 14:57:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wmBud-0008GQ-ES
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 14:57:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wmBuc-00AWZe-Ni
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2026 16:57:38 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f88e1-2eae-0a2a0a5409dd-0a2a4503dcb2-2
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 16:57:38 +0200
Received: from [209.85.221.46] (helo=mail-wr1-f46.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a5f88e2-fae8-0a2a45030019-d155dd2ed9e2-3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 16:57:38 +0200
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-47f71156e1aso1371170f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2026 07:57:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63eddd1csm39684898f8f.29.2026.07.21.07.57.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2026 07:57:37 -0700 (PDT)
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
        d=suse.com; s=google; t=1784645858; x=1785250658; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YeOcu0/SzSC3+BNyx2E8YApufOuWfXX7Ddo6NWcd9vQ=;
        b=V02Z0ahLSIAkPGDDiMDN20HQTbWRIb3yGkZSfT2z6Wd9A5sYKSL08wsxYQJY1uH7zJ
         8nQkddyqBGBE5gZA4iLtTqd+pUNrcvX7R7sZN+Q8SKfTr+LXmG8vKwWbg/g+Le2ZMV0u
         WdK2LaIO1sAaYCa1qWqs58UMgpicF/x+lG0Td2713Iy27eK6XZJ1jUfBpTBUEA7XWZPC
         1tPB+RqfJB50mlzOjtwYYmkO7h7AELzqAPh2xf/3vt1QmsxZLlgJIg51nrj7Ibv8WWZW
         percmUDxQHLYEXuOmFE9L0rvsc++Se7dA3k7kehNjQ3yeGe/zWOH7UqqVoBmES3THQWk
         cy4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784645858; x=1785250658;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeOcu0/SzSC3+BNyx2E8YApufOuWfXX7Ddo6NWcd9vQ=;
        b=gHCl86RFEOHWuaprFBx+bSk+ogiYOrP7z1VUYM7iAZ0CfD249tN0ob301jEm/HNEUE
         cnaaoo67w1uA68cnbjj5KbWcEIoOnaN48rnPQIw6ZftdrbrkFFa5n1qoBi8JpHG0/r4R
         lWR8+QPkOFC7vfkYo0UW4PNFp3tLiWldAJakTB1FfsiOMjLhI31/Lq/vtGzRAJ8YBbsF
         E5e1yTzy2LpYBj3HghfBttJSyCRGOGc118IS/5KQWQHKDWmWCtGsjOzgQjJtaWZh1P/n
         hWYMBAjIG1D1Sqt6rmdJ6uC8LWSzxW0JDeCWPH1YqUrOgAX6h+w5cMv1bWEou6ZaZq/+
         863A==
X-Gm-Message-State: AOJu0YznVfHPeaJiYNgRBdyviX3fLZM/YUTCbsoA48QZo5IJIkkNtsgB
	rbJVQi1Sb6+28wppJsyRVCfDEyKGn66ZWnAygQtpXGFf2ggqWNPF2nn5H83m49qNfQ==
X-Gm-Gg: AR+sD10Q7kZqwNBbpQ+Lo2PWKEHemT3iJPV0aS0B/G/SQrwQC2GmMve6KCWPLCQPh/3
	JHQGpQBWpfcPYgrXWFuW05qrJJltGgayg63O68Jq8JfipqLguEXoVWcX5ezS0HaOqFB2nxtts6w
	DLDp2bPVSRTOaZ2dzniNWBZgDdFWu20cVHeQ4zbt0j3a1kG3XtSCkOBrJ+CyLTYzXjLhMQcgiG1
	N5/0d3G3WmjAw0leD9NcLzQEmUFs5GKRcUOUO+rjV1Dskgc4TT+SE4gb8/xRSmQroFFXI879E1b
	BsWSx+9IeJ4dHCxjblfMDOuTuVkGYSJ/Tr0opPiavurOt871J6MJ8xpVxvvcoWPoLeshaUYyoQz
	vw2JPxgKXmXvS/e/Z2vg5uHn3u7nkHVduGXtkxFF5IU0eGBhBt9iWjFiBxeVrHcnBoTax8FPCel
	UjkRUcRT4FutX3Bks2Nci1jwNaKzLJ66bdTKnd78Gx94EABn8KySaZN1sYf/20VRoZWg==
X-Received: by 2002:a05:6000:310f:b0:47f:83f8:a956 with SMTP id ffacd0b85a97d-47f83f8ac9cmr204433f8f.37.1784645858030;
        Tue, 21 Jul 2026 07:57:38 -0700 (PDT)
Message-ID: <05425d51-965f-4176-a297-c5e6f966d886@suse.com>
Date: Tue, 21 Jul 2026 16:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] x86/domctl: don't imply I/O port permissions from
 I/O port mapping
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <65f69026-f284-4cfd-b502-8d8955b412f5@suse.com>
 <724bd14c-ebba-4e29-be7c-012aa7aa82b2@suse.com>
 <al-G7l2IM736d-Q6@macbook.local>
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
In-Reply-To: <al-G7l2IM736d-Q6@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1784645858-74A894E9-5A992A30/0/0
X-purgate-type: clean
X-purgate-size: 2344

On 21.07.2026 16:49, Roger Pau Monné wrote:
> On Tue, Jun 30, 2026 at 03:54:04PM +0200, Jan Beulich wrote:
>> Rather than granting permissions when mapping (an operation that DM-s are
>> allowed to carry out, while they can't invoke ioport-permission), check
>> whether permissions actually were granted when adding a mapping. This then
>> also allows relaxing the necessary locking.
>>
>> While no longer granting permissions upon mapping is "only" at risk of
>> breaking guests, no longer revoking permissions upon unmapping strictly
>> requires callers to additionally invoke XEN_DOMCTL_ioport_permission. Or
>> else a security issue would arise. In-tree code already does so.
>>
>> While there switch to using %pd in the two log messages.
>>
>> Fixes: 192c4dabc344 ("domctl and p2m changes for PCI passthru")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> It's difficult to not think about someone appearing in 3 or 4 years
> complaining that this change in behavior has caused them a security
> issue, but I do agree that the previous behavior was inconsistent at
> best:

A positive aspect here is that the similar change for MMIO went without
any fallout, as far as I'm aware.

> Acked-by: Roger Pau Monné <roger@xenproject.org>

Thanks, but ...

> However you need to bump XEN_DOMCTL_INTERFACE_VERSION to note the ABI
> change as we are in 4.23 now.

... there's no interface change here. A bump therefore won't buy us
anything. I'm hesitant to take your ack as long as we disagree here.

> We possibly need to sort out the questions below, in case there are
> changes required to either libxl or QEMU.

Indeed.

>> ---
>> libxl has libxl__grant_vga_iomem_permission(), but I can't spot any I/O
>> port equivalent (nor a revoke counterpart, btw). Everywhere else MMIO and
>> I/O ports look to be treated equally.
>>
>> Qemu uses both xc_domain_{iomem_permission,memory_mapping}() in
>> igd_write_opregion(), but only xc_domain_{memory,ioport}_mapping() in
>> xen_pt_region_update() and xen_pt_{,un}register_vga_regions(). Is the IGD
>> region special in any way? Clearly this can't work from a stubdom.
> 
> Those possibly need to be answered by Anthony, but he isn't on Cc?

Oh, I had him Cc-ed on v2, but forgot to on v3. Anthony, your input is much
appreciated.

Jan

