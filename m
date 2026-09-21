Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1847FC982E1
	for <xen-devel@archiver.kernel.org>; Mon, 21 Sep 2026 09:52:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1427248.1649879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8agW-0005kN-0l; Mon, 21 Sep 2026 09:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1427248.1649879; Mon, 21 Sep 2026 09:51:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x8agV-0005kG-Tq; Mon, 21 Sep 2026 09:51:39 +0000
Received: by outflank-mailman (input) for mailman id 1427248;
 Mon, 21 Sep 2026 09:51:39 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x8agV-0005kA-77
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 09:51:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x8agU-00Gbt7-6U
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2026 11:51:38 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab0fe29-8faa-0a2a0a5109dd-0a2a45019048-6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:51:38 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab0fe2a-5984-0a2a45010019-4a7de44ce8ca-3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 11:51:38 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a98505364aso4548661a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Sep 2026 02:51:38 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6aa67e1a45esm3966885a12.25.2026.09.21.02.51.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2026 02:51:37 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789984298; x=1790589098; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/IxU85Q5+hlg74zBf1mzGGMbph3ImCEiXQwned8esM8=;
        b=SHv3e7O4zCtels+lm1HpGPB/LbZJuBz5NppcONb+MndBZJxMMxnG2BuJhDyBXknlZ9
         379aamO41YUvtFT72/ieAzKED9Hqb7URLPptu1F3irv7tr2E/HFSIKogr+cIzqWKng8R
         8U1dKLK3rYHYDu6E70C53892P6ErHDDyzyWvZP/+aTp2myZ6N8M6l+ypeDjYaMlNl5tq
         VjH3XPi+ALeq9EpIj5WNFt6cgQ7grRLDRvz0VTBKUZjmD4h0ncRuVsQtRCFbTnkEh4UJ
         F4WnsbBNBLUwKeBoNmAlds6S4q6U0muvErx39ZgQokWeDk6orU47Em74TOswUkuYvOXl
         pplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984298; x=1790589098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/IxU85Q5+hlg74zBf1mzGGMbph3ImCEiXQwned8esM8=;
        b=mMgOuLotWl0EbEwGmVS9Qz0j97hgCO0lGjebZHm1vtUBE+qyMYUqZR0HW4Kz4cUnsF
         OroIgN1r2QI3kRTqtUvwEKKtA5BorHL4fdX6ObbinJv7nGwnBWmF62WB/BlkFNiIMjkb
         +EfhUER+4S3QKw0Iz1n4zdGaWTMvKAt7lZ3O9Cl56lquvOW/SQlTdEJY7WM4veQV8tMj
         JtWWbUASx7XmeGj29qlZ0zlsoKBld1PVzh24K6MyQ1H89BHTSkbb+nN+c89qu7Mx8Euw
         /P9vF8YYFh+Sj3vsqUW86Hx3udNPCxxFrp04U4V+tVDHO42ZLhmdPv4EW/b2850wjzxt
         NsgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBylV6pHgSYdpnCtoTBZXXIgPAeA/UcYx8hEMIA78b0BiOfkAMIBOG7FkpXuBfxpNzq51agA16fPA=@lists.xenproject.org
X-Gm-Message-State: AFuF++k9C2/LaEfPuG559WTkg8nPu4anwbpqwbJy39oIJ5fU6v5M+UoO
	nTJLIBNRAIpHobpJQYrGoi26MBZTeqmi2MOUhNiYL1OVc1jtLXUYEG0g
X-Gm-Gg: AYBFou0VvJRjoK8fPGGkp/I4s6Qe+ohmArLHf0osVm0LdnsnrqCpyE9a7bWE9AZl2fs
	BdsWl6/xMk1qp48B52ChROK4SM3UNiZuo9aiLtNIOvPbwKme08gjMjlSoYwQkCwxQL4x9rz4Ouc
	dAOjAgMvy/uJ1hcyVOROdfJOhHev+lpTqLIwmRuTfB3M3X2G63sySJ/h9Xt0T73mnqyAMWQHTsq
	+IeWY8oKwkz6qkbksyFr6t3Uoa0IPs41jlETgOJW6m6tPCSfiqeEf8isDLVdfvwtfwMp6Vy5DH6
	uf/oHtulQLdyxKKKMKce+A00OtdeT0O8FQe8yjB2S9shG+RnoLPFGaaLI3dYrVcAzlYFxwLbuGE
	jzQdoFPDVoTX4I+cEBAyfslhphrhAoULPyrhIoIvkFUf66YElOUcUiB5XtJoUAu5jU3VIzif2g+
	4iqIl2KmfnIqd61FFUZMEDtTr/w4LE8AX0jdTPHhuwjIMxtBAveGTxysuLGb8+6gUikjpHd7WlW
	Dm/WRpo21rEdc+ozLmRAbnTzpHQChcKjzabd/K7qU13p/5jhw==
X-Received: by 2002:a05:6402:510d:b0:6a9:b519:eb3f with SMTP id 4fb4d7f45d1cf-6aa53cb3d0bmr7327483a12.29.1789984297540;
        Mon, 21 Sep 2026 02:51:37 -0700 (PDT)
Message-ID: <323b4219-113e-4592-88a9-d16b92ca12d4@gmail.com>
Date: Mon, 21 Sep 2026 11:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 33/39] xen/riscv: dump old interrupt file to memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <efecffa9cd7c4bb6e9ed51b7fd084328fcd4611e.1787838835.git.oleksii.kurochko@gmail.com>
 <f8a2c7b7-7872-424c-89e0-5d81a29b77f4@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f8a2c7b7-7872-424c-89e0-5d81a29b77f4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1789984298-BC95A757-82F58171/10/73395122804
X-purgate-type: spam
X-purgate-size: 4901



On 9/14/26 5:15 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> At the old interrupt file, dump to memory all the eip and eie arrays).
>> After this step is done, the old interrupt file is no longer in use so
>> old intrrupt file VGEIN could be released.
>>
>> Restoring of old interrupt file state will be done in follow-up
>> patch.
>>
>> There are cases where it is needed to specify on which cpu it is
>> necessary to VGEIN should be released so update vgein_release() to
>> deal with that.
> 
> Beside this being difficult to parse, it looks like it is inapplicable? As
> said ...
> 
>> Keep BUG_ON("unimplemented") placeholder in imsic_migrate_vcpu() to guard
>> against silent incorrect behaviour or unexpected panics in guest VMs until
>> the function is fully implemented.
>>
>> vgein_release() is stub for now and will be introduced later.
> 
> ... also here?

Agree that paragraph should be dropped, it ins't applicable anymore.

> 
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -56,6 +56,24 @@ static unsigned int __ro_after_init guest_num_msis;
>>    */
>>   #define GUEST_IMSIC_MAX_MSIS 255U
>>   
>> +/*
>> + * The interrupt identities an IMSIC interrupt file provides are 0 (which is
>> + * never valid, but still occupies a bit) up to IMSIC_MAX_ID inclusive, so
>> + * IMSIC_MAX_ID + 1 bits have to be covered.
>> + */
>> +#define IMSIC_MAX_EIX DIV_ROUND_UP(IMSIC_MAX_ID + 1, BITS_PER_TYPE(uint64_t))
> 
> As before - plain 64 please, or it needs to become clear where the uint64_t
> is actually coming from.

I will use plain 64.

> 
>> +struct imsic_mrif_eix {
>> +    unsigned long eip[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
>> +    unsigned long eie[BITS_PER_TYPE(uint64_t) / BITS_PER_LONG];
> 
> Same here. Yet better may be to use DECLARE_BITMAP()?

It will be better. I'll use:

     DECLARE_BITMAP(eip, 64);
     DECLARE_BITMAP(eie, 64);

> 
>> @@ -85,6 +103,15 @@ do {                            \
>>       csr_clear(CSR_SIREG, v);    \
>>   } while (0)
>>   
>> +#define imsic_vs_csr_swap(c, v)     \
>> +({                                  \
>> +    unsigned long r_;               \
>> +                                    \
>> +    csr_write(CSR_VSISELECT, (c));  \
>> +    r_ = csr_swap(CSR_VSIREG, (v)); \
>> +    r_;                             \
>> +})
> 
> Excess parentheses again. Plus - what use is r_ here?

r_ stands for `return value` but it should be dropped as it could be 
done so imsic_vs_csr_swap() just returns a value directly:

#define imsic_vs_csr_swap(c, v)     \
({                                  \
     csr_write(CSR_VSISELECT, c);    \
     csr_swap(CSR_VSIREG, v);        \
})


> 
>> @@ -130,6 +157,21 @@ do {                                \
>>       imsic_switchcase_32(F, ireg + 0, ##__VA_ARGS__) \
>>       imsic_switchcase_32(F, ireg + 32, ##__VA_ARGS__)
>>   
>> +static unsigned long imsic_eix_swap(unsigned int ireg, unsigned long val)
>> +{
>> +    switch ( ireg )
>> +    {
>> +    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIP0,
>> +                        imsic_vs_csr_swap, val)
>> +    imsic_switchcase_64(imsic_switchcase_ret, IMSIC_EIE0,
>> +                        imsic_vs_csr_swap, val)
>> +    default:
>> +        ASSERT_UNREACHABLE();
>> +    }
> 
> There still wants to "break" in the default case.
> 

I'll add.

>> @@ -973,5 +1071,11 @@ void imsic_migrate_vcpu(struct vcpu *v)
>>        * to the new IMSIC VS-file.
>>        */
>>   
>> +    /* Read and clear register state from old IMSIC VS-file */
>> +    imsic_vsfile_read_clear(old_vsfile_id, old_vsfile_cpu, nr_hw_eix, &tmrif);
> 
> Why is &tmrif being passed into the function, when it's not otherwise used
> here? The function could itself have a suitable local var.
> 
tmrif isn't a scratch buffer local to the read: it carries the register 
state of the old interrupt file over to the new one. In this patch it's 
only filled in, but the next patch ("restore register state in the new 
IMSIC VS-file") passes the same buffer, via vsfile_data.mrif, to 
imsic_vsfile_local_update() on the new pCPU. By then the old file has 
been cleared and released, so the state has to live in the caller. I'll 
add a sentence to this patch's description saying the dumped state is 
consumed by the following patch:

The state is dumped into a buffer provided by the caller rather than one
local to imsic_vsfile_read_clear(), as it has to outlive the old 
interrupt file: once that file is released, the state is still needed to 
be restored into the new interrupt file.

Just to emphasize that in code I will use vsfile_data.mrif instead of 
&tmrif:

   imsic_vsfile_read_clear(old_vsfile_id, old_vsfile_cpu, 
vsfile_data.nr_eix, vsfile_data.mrif);

Thanks.

~ Oleksii



