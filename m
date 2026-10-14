Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99439CC6B1F
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:49:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448645.1664680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvc2-00012v-FQ; Wed, 14 Oct 2026 09:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448645.1664680; Wed, 14 Oct 2026 09:49:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvc2-00012o-CO; Wed, 14 Oct 2026 09:49:30 +0000
Received: by outflank-mailman (input) for mailman id 1448645;
 Wed, 14 Oct 2026 09:49:29 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGvc1-00012h-1z
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:49:29 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGvbz-00BdJE-TU
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:49:27 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf5027-e002-0a2a0a5209dd-0a2a45088460-2
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:49:27 +0200
Received: from [209.85.221.43] (helo=mail-wr1-f43.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf5027-f659-0a2a45080019-d155dd2bdcad-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:49:27 +0200
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-48c5358fc28so209950f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 02:49:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaa3fsm10990523f8f.10.2026.10.14.02.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 02:49:26 -0700 (PDT)
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
        d=suse.com; s=google; t=1791971367; x=1792576167; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=powhFUt6aUOaxtz8n1hnkKFVk4k525ZIqn92/0ErDSw=;
        b=Xh81RxzxUFdkVN4JC1WhcD2BpREH5UAzZCVEk+Ac7xVBs5AHesidvfmBt9GU0ITvmP
         57oS17PRT8H3uGlQrhixfu+7pd1G3PUiLCevANw6SROcqQ7bGBlM8viehO99FH4Vbz46
         GVmAY1B78VIVREpsGz/m3nhJTh4eDk5ueBtrrv4zv+n6UVRdnpIb4xDwY0BuLITr1diS
         vLrHy0JK3nD1qMmhbh7RrQ4OQdxNzqSjlQoF/n8UQR5+dztnHu4FAP45LSFqQzQ3MfEP
         dpv6zj0qLXkpauoXSMKcejHSpEdRp6w4Xf/3Y0AT0hVPLV7BtqrJv1VRgUJzbwjXTtMr
         YtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971367; x=1792576167;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=powhFUt6aUOaxtz8n1hnkKFVk4k525ZIqn92/0ErDSw=;
        b=pIbnpPkwZ5tHAkZyicTrGVK0ZZvQQ0EUuWKVSL/ckyQXbUm9OnugrrjUst7DrjnBWa
         jT91bwuCVaSWZYDc6x12nDywfwLTXFqXIht1qnUyUbk0HTydvIqpVBD4iUIlKCUkIySu
         p6/+vMyNPXZQ+VnqWaixsww3ZrVl8O003/IjGTGONWP3/ODKsjfo5Uv5Oxnql3CTGtEh
         +qCFegsrvcQKRXK51E+jqKMUskDo0strTgqmAm+LIRlZHcHw13c+x3fOVtAlDb2oKBtK
         765IMOs7usshUUgO7ycWWZpgbb1mgVm9BhNrg8XrV9NNzvwrLQTBflnx0lYQ3NKzWfO5
         22gQ==
X-Gm-Message-State: AFq9FYLEH8vx3n1HVsyp+ILzqaEstxxi9qHunfkwvY39rXIGIpNih+bC
	iMi2AyTkmAZN6mZvdm4xOuXNPeD98Uro7YYogb5EwTds7Vdo5foR6p1imEOhy3Wg6w==
X-Gm-Gg: AYBFou2dz84eYcVf38yGYIMbU0dWmTIS3vdd1/ltozQuhGH8+EQrjsyEgbwFY2Q6pHr
	sPhoe+eYd6HxkJ6PPTSPiokc0PPViXF5ZLwHRFrqrZGPiv2AjD4kZYPLEeXCkO5jASbTsXVeY6p
	sU5NDJbsZQokMNumfvIQrEGOzViMJrzzxyA48jHYToI0I2+ZRB7G3/rot/YIu4QhoRCn181x3Sj
	SkjcSJ1s1c3gwJsprxtGV9Z0mNo4Md7kfRcorTrRHIH/Diszz/Nn5PG5/HOv31v31/Y1YIH/GQo
	jZfqgpkqBqfXWNbewHQwfAi+TgqWugi/+vKIwyW2OpnSHC6i55gWolTiw5FE/YJqQa5OrNq0IU5
	BY/APRTZwRE+ZJE11vdU+wrJr07+pDN8qo/CuWk//g9wXcqpJZt6Zg8VUHgXTqAJW1sFNT/pRAy
	yovzv+jEbwZycMS/Pj1KlNeHKV5Lwu0bSGVJPTj9LrdLhrr5iBHJH0Q4CaaLI6qg/rEZlaPjymu
	SgAejThacxBebz12HIg7Qeme/IQTEozq4EprWa6yvckhPGeACIKBEk437NdtQ==
X-Received: by 2002:a05:6000:25f2:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48dbacdc419mr29320275f8f.36.1791971367200;
        Wed, 14 Oct 2026 02:49:27 -0700 (PDT)
Message-ID: <3c1cfedb-abe5-4e5a-9d18-cb4323b6d699@suse.com>
Date: Wed, 14 Oct 2026 11:49:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/15] x86/PVH: split pvh_setup_vmx_realmode_helpers()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <e2a520da-9dcf-4e04-9e17-add8b12d9a0d@suse.com> <as9NpQPi-zNFDFiY@Mac.lan>
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
In-Reply-To: <as9NpQPi-zNFDFiY@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c1860d/1791971367-CCB7187B-ADC16EDE/10/78276251493
X-purgate-type: spam
X-purgate-size: 1788

On 14.10.2026 11:38, Roger Pau Monné wrote:
> On Mon, Oct 12, 2026 at 10:24:07AM +0200, Jan Beulich wrote:
>> All E820 manipulations want to happen before the initrd is placed, or else
>> pvh_steal_ram() may steal from the tail part of it. While this is
>> currently suitably ordered, mapping the initrd directly into Dom0 will
>> want to happen ahead of pvh_populate_p2m(). Hence as a third step, split
>> placing VMX data (if needed at all) from actually populating it.
>>
>> Also move the invocation of pvh_setup_vmx_realmode_helpers() out of
>> pvh_populate_p2m(). Make it unconditional as well, instead bailing from
>> the function when pvh_place_vmx_realmode_helpers() wasn't called.
> 
> I'm overall happy with the idea of moving
> pvh_setup_vmx_realmode_helpers() out of pvh_populate_p2m(), however I
> would much rather prefer for us to keep two memory maps (the real one
> in the domain struct), plus a temporary one that signals used memory,
> rather than doing allocation vs placement in two steps.  Having to
> add custom {acpi,vmx}_info structures for each metadata we want to
> place seems strictly worse than keeping two memory maps.

Hmm, that's unfortunate: I see it the other way around. I also can't seem
to be able to see how the order of operations (as listed in the reply on
the ACPI patch sub-thread) could be changed to accommodate what you want.
There's one basic ordering requirement: We need to know where the initrd
is to go ahead of populating the P2M. Yet among kernel, ACPI, and initrd
the latter is what has the least constraints on placement. Hence before
determining where the initrd is to go, we need to determine where to put
kernel and ACPI tables (as said elsewhere, I'm not finally certain about
VMX metadata).

Jan

