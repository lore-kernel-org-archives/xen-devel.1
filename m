Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC599CC6B1D
	for <xen-devel@archiver.kernel.org>; Wed, 14 Oct 2026 09:43:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448634.1664652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvVm-0008S0-KI; Wed, 14 Oct 2026 09:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448634.1664652; Wed, 14 Oct 2026 09:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGvVm-0008Rt-Hp; Wed, 14 Oct 2026 09:43:02 +0000
Received: by outflank-mailman (input) for mailman id 1448634;
 Wed, 14 Oct 2026 09:43:00 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xGvVk-0008Rn-JE
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 09:43:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGvVj-00Cgpv-L6
 for xen-devel@lists.xenproject.org; Wed, 14 Oct 2026 11:42:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf4e8b-8faa-0a2a0a5109dd-0a2a4506b9fa-34
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:42:59 +0200
Received: from [209.85.221.41] (helo=mail-wr1-f41.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6acf4ea3-195a-0a2a45060019-d155dd29bcc3-3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 11:42:59 +0200
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-48c45111bebso2332602f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Oct 2026 02:42:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ac5257sm11123474f8f.42.2026.10.14.02.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Oct 2026 02:42:58 -0700 (PDT)
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
        d=suse.com; s=google; t=1791970979; x=1792575779; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iSnrYC24nG3N2fHsNW9YC2B7oN5YY7daUst/rkcOfBM=;
        b=fcMv/9JJkytR2SwlWHDG6N5BLPhZRlIQrkqe4W6l9XpJ8i5YCIxXX8ASM/MWouLXGq
         4Bwsw0HXhaCpUTPTyhjD/qitHXI8mQsVWcBk/mNcG5CUbQQRP5FeHM/8dAL+plUFi2bn
         MDmO9B7MUK8gZDvIpPfhpiJCPdvIAOp5MsH8tLMSqm2+m4lg0i71ZpmD2TusuDpXnj0Z
         8zaEJ7xGTbO5nOn80Aw5L2O0ETIFKVyv/MtcOpd4ugPeZZ3PbYMavwDEvwf0E9g/6iAk
         yTkj4gEj+U1+3cw3lQAWYsYszStYNrBZd1RLWKKbU36nEtuQFsdsXfJ/b7AVzpzPpVmv
         Wfcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970979; x=1792575779;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iSnrYC24nG3N2fHsNW9YC2B7oN5YY7daUst/rkcOfBM=;
        b=mOmeV8Ts+gvaX/rpfgSpGKjNhDGUpEwio4hjMe0mCKvl7RI+YHM/n7SYTys21UvcV5
         HIbcSGame5vPlUPuHrm1gRlO9YsXYYxLcwDwN6lKoV3sDJsMLkNvUYV2Q5u+Yq3Yn+Ut
         uxjUpjabgiuCGUNd8y2hiTzDkXgrxGbL/6TtwRVOflKLgC0A/38uC0YwQXqv+rtbEJbN
         UVYIX/Nzq7ijEObmOdnUA1KcF9eabgtAOo/a19NoKxu7yyve5UVw9A8d/JLcowr+1U6y
         zQluSfsvA4ogSlTrGu5QEnQfP2wFMkEJAv+dwuVQblJKa1iHrxhBJmtDrNauTgF5HAUs
         HFtg==
X-Gm-Message-State: AFq9FYLljfLZ2mZt1T2DC5r8d0elItGZ2HCARm6tcHjHOqQrITfLeZiw
	wfKAT3Y15v7XsoNimrOhlSZNL2BPc9nMKPFCyA7V94Y7YzZIzKcORazxGZRw4yv6ug==
X-Gm-Gg: AYBFou1G4le7aP7YvyTQRw+vEEsw/L6NA1KV1v7VTGRmto3yaYSqybKdWrr+AEGZ+VL
	04rkfWrwncQQc0KRcuqnbIWSU03HxLmMS+XaOPZWK5Y0/POQtfbmxmbALYcNB8piWeTrn4DY6Pm
	Ct/Gdq15sji9feWdYqLchsP6+Cp8/xdZLi1sKF7/a44OErRBnjgqQuIdJpC+sFaOEwVAv7C3LIY
	stxqWGqKLq9rQxrdZ3N9PsgU513WFCo/SJVPcv9LZbw9S8NpuZoH483oUicEEAvpzI91jDDg6A9
	Vs/xXJf7eQZiD0HcDi/t3LcZhKHllJOx7db0MpI4f2PoIAo5/xagd7ME9clVYBmk77RSY/H+oW4
	Cy56b9AJ5QhQow/l5fS0X0aV9k4fqNZKQtuo5EAzL44t+ufaRnelhTsXloH/bPrlJW0C2feEle8
	XUJs1hSaYcJicvYvu0rBZsR8LuSvOkfG3zRjx9NpcDqE/UJxdqJI6f2fpMChibp7s2lD7xzZr31
	Aqav39MlA9Celjqcfj4IywlopxrYYInMTUNhTU80R6QQlwvh/AHWs60yB1zmg==
X-Received: by 2002:a05:6000:400d:b0:48b:10c8:2183 with SMTP id ffacd0b85a97d-48dbacdd2afmr27620958f8f.32.1791970978859;
        Wed, 14 Oct 2026 02:42:58 -0700 (PDT)
Message-ID: <791be732-4c7d-417a-8557-4f82ef62d0c0@suse.com>
Date: Wed, 14 Oct 2026 11:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86/PVH: split pvh_setup_acpi()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <1b4c2bb4-118d-497c-8d7d-f3824fd61a73@suse.com>
 <d0f1a88b-66a0-4bf9-9dd2-ea0cc48bc3ae@suse.com> <as5TyD0ZX1HnN578@Mac.lan>
 <f79d68c4-271b-44a9-950f-a6a85f4ea7ff@suse.com> <as9L5sT6SXfBWlkg@Mac.lan>
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
In-Reply-To: <as9L5sT6SXfBWlkg@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1791970979-F74C977B-3ABA8696/10/78276251493
X-purgate-type: spam
X-purgate-size: 2502

On 14.10.2026 11:31, Roger Pau Monné wrote:
> On Tue, Oct 13, 2026 at 06:04:37PM +0200, Jan Beulich wrote:
>> On 13.10.2026 17:52, Roger Pau Monné wrote:
>>> On Mon, Oct 12, 2026 at 10:23:16AM +0200, Jan Beulich wrote:
>>>> All E820 manipulations want to happen before the initrd is placed, or else
>>>> pvh_steal_ram() may steal from the tail part of it. As a second step,
>>>> split placing ACPI data from actually populating it.
>>>
>>> Would it be less intrusive to duplicate the memory map (like it's done
>>> in a change ahead of this one), and subtract the kernel and initrd
>>> region from that memory map, then use it as the basis for
>>> pvh_steal_ram()?
>>>
>>> We could adjust/replace pvh_add_mem_range() so it allows changing
>>> regions from RAM to other types.  That would seem to be less churn
>>> overall.  Maybe you did already consider this and found further
>>> problem with this approach that I'm failing to see?
>>
>> No, I didn't try that route. In fact despite the order now this patch
>> (and maybe also the VMX one) pre-dates the E820-copying one. The one
>> aspect I consider problematic with the suggested alternative is that
>> then two E820 maps need updating: The one with kernel (not sure about
>> initrd; see below) subtracted out, and the one we actually mean to hand
>> to Dom0.
>>
>> As to overall churn: I'm not sure which one would cause less. Certainly
>> the patch here would remain largely unaltered, as the splitting is
>> going to be necessary no matter what.
> 
> I'm possibly missing something, but the splitting won't be strictly
> necessary?
> 
> We could do:
> 
>  * Populate p2m
>  * Place kernel
>  * Place ACPI (also VMX metadata)
>  * Place initrd

The goal is to directly map the initrd. That direct-mapping (or at least
the determination of where it is to go) needs to happen before populating
the (rest of) the P2M (as otherwise this would populate the respective
part of the P2M). Else we'll continue to see the problem that Marek
reported. That is:

 * Place kernel
 * Place ACPI (maybe VMX metadata)
 * Place initrd (possibly direct-mapping it)
 * Populate P2M
 * Load kernel and initrd
 * Fill ACPI (maybe VMX metadata)

(Of course the order of the latter two items doesn't matter much.)

Even if we didn't direct-map the initrd along with placing it, we'd
still need to tell populate_p2m() to skip that region. I.e. the split
between placing and loading/filling would remain.

Jan

