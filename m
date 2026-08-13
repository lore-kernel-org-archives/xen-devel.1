Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01BDC5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 11:35:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389858.1630469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTie-00030R-Cm; Thu, 13 Aug 2026 11:35:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389858.1630469; Thu, 13 Aug 2026 11:35:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuTie-00030K-9j; Thu, 13 Aug 2026 11:35:32 +0000
Received: by outflank-mailman (input) for mailman id 1389858;
 Thu, 13 Aug 2026 11:35:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuTid-00030E-5w
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:35:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuTic-00CtMy-Ir
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 13:35:30 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7dabf4-bab6-0a2a0a5309dd-0a2a4508a2d8-30
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:35:30 +0200
Received: from [209.85.218.54] (helo=mail-ej1-f54.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7dac02-f659-0a2a45080019-d155da36ec44-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 13:35:30 +0200
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-c2022323c37so288139166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 04:35:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a37f8d28adsm796883a12.29.2026.08.13.04.35.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 04:35:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786620930; x=1787225730; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SeH0PcL1dLiHSbmICpL1bAmjxscHG6k7vXWYQjDDUak=;
        b=ii7tkNERJU/NlJdxZCIa+ybN9bBwLOqw/nl7/lguqnkbQ2GP5q3oGmsB6cjYe2AqUl
         t9uzWn56Ow8ZGVSbMSdcc51GZ9I3icMvbtQ4mZ7B5lHND60d9R8he8/y8RBZXwt7dMxO
         BjPgxhT4gbuBrwBUp4V7uS7gFd5BH66rWlwb6RrcQGB06hYdK4o2K54xfQv4zIOFmgnw
         uAeVgx+R/ScT7UFNg0+tW07nD4tgzZ/+eRs0M8MGlt/JkeTpJgm+ilrUJrDNYIQpdoPt
         tMWoWeHLsXOslXP2GIuHUGhcZB+dpYu5dUAkIQkZfOQs+pGFB2GEEoLj6p7QdbgEtyHU
         Fjqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786620930; x=1787225730;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SeH0PcL1dLiHSbmICpL1bAmjxscHG6k7vXWYQjDDUak=;
        b=SntiPuVEEaTGu1kfXi6rFXSokyYzNbWWNqNiXw/PL7s+kHC9fxDeQenux7lgGLBIAA
         m0q2MCCtiuea5N4llVE88TNOEKL0Ajg4LF4+gh9UKQmPW1VKKsRSD0xJKQz3+hudETlk
         dItUUY9JOOek4HVMot9uMgA2BfFpODeO9wi8Vc/Bi+CL2S/hJx5xUhUJS2iPYBARCv8k
         t/KG/W2jdYel/WOxlEm6yBvI+HyIQ54VR4zzB1LhoG4JYtFqtw5PRS2USGZX++HXMzY6
         CDcS1s+CVrUF0th+AH1ESbpm1bqOxe8naUhd3eTDDMNTGsf3FtMCz47u6u5nInyJNnqt
         /eWA==
X-Gm-Message-State: AOJu0YwTaVL/odisxsxmmzE/aNKTbFshuuDvSNU0MdUREFQXxWjJvqm6
	KSALVXodgmI6w5zqh+pNyuKIKdLDO5X08lhs7t+iyZ+6KanlHiLjBMJL
X-Gm-Gg: AR+sD10RVTV80Cdpa3W/3Wi7towJ/BMaMNmi2SL5jAUaEaF/+LWYhf7mWSMdfMZY2Ui
	ydrEAwaCVB7BmOs2hzqpRVAT4zmyUEhy5lRLxzfnW3cYUchuf/GrA37JwhPUEcfODxPOB2D6WIP
	GbJSt3b7IHWKqCnzgq65VcaZQ4qjVW4971UpDI4IVjdVTxQtulEnJCS2ww+9rerCW5CYQtN9cbH
	TyLeGISvj6oraCP7OTmSfCI7xmIjsTVJxP76IkR6sBmaDZHFaf/niPla5F6c6hiBM0w6Xrg1Ms5
	G/JOUBZM0xw9Yv93nafCuaHMmv0KaoJ0f51aMQfiGXNZQvOldFLk8Rqh1Po5wK0bVTAN3fV7Tiu
	+yPR2EG1s1hgLllGMPCvIanufL5WB+fBozasiQs7/SkQ/ha+O9yZTIINlGas7QXuRGsmGDquOV8
	bzUCXuIT7FonroQR9ykEV2jYbqSCIu5ZWmREF10cVO5kycNX9/DYSZ4TK+aWBwjV1jU+DD1Cryz
	ioSJ15pi86FENSPxMAvYzsfYfCMJT9E0tg4+CqBkYo=
X-Received: by 2002:a17:906:4790:b0:c15:db5c:7127 with SMTP id a640c23a62f3a-c2108fb4a6dmr218733066b.20.1786620929964;
        Thu, 13 Aug 2026 04:35:29 -0700 (PDT)
Message-ID: <b5013cc2-eb63-45ea-b8fc-bd97c94ac305@gmail.com>
Date: Thu, 13 Aug 2026 13:35:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/17] xen/riscv: introduce vCPU AIA initialization
To: Jan Beulich <jbeulich@suse.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613090.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@vates.tech>
 <8273fde5-98b5-4b23-9f3b-9a7cc3749716@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8273fde5-98b5-4b23-9f3b-9a7cc3749716@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1786620930-CC57487B-E2F6D969/20/8830180247
X-purgate-type: spam
X-purgate-size: 2085



On 8/13/26 11:47 AM, Jan Beulich wrote:
> On 13.08.2026 11:24, Baptiste Le Duc wrote:
>>> --- a/xen/arch/riscv/aia.c
>>> +++ b/xen/arch/riscv/aia.c
>>> @@ -14,6 +14,7 @@
>>>   #include <asm/cpufeature.h>
>>>   #include <asm/csr.h>
>>>   #include <asm/current.h>
>>> +#include <asm/imsic.h>
>>>   
>>>   struct vgein_ctrl {
>>>       unsigned long bmp;
>>> @@ -36,6 +37,35 @@ bool aia_usable(void)
>>>       return _aia_usable;
>>>   }
>>>   
>>> +void vcpu_aia_init(struct vcpu *v)
>>> +{
>>> +    unsigned int new_vsfile_id;
>>> +    int rc;
>>> +
>>> +    if ( !aia_usable() )
>>> +        return;
>>> +
>>> +    new_vsfile_id = vgein_assign(v);
>>> +
>>> +    /*
>>> +     * vgein_assign() returns 0 when no free h/w guest interrupt file is
>>> +     * available (including GEILEN == 0); imsic_map_guest_file() maps nothing
>>> +     * in that case.
>>> +     */
>>> +    rc = imsic_map_guest_file(v, new_vsfile_id);
>>> +    if ( rc )
>>> +    {
>>> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
>>> +        domain_crash(v->domain);
>>
>> The vgein id assigned a few lines up is not released here. The domain is dying
>> anyway, but the guest interrupt file stays marked in use on that pCPU forever,
>> since nothing else ever calls vgein_release(). A vgein_release(v,
>> new_vsfile_id) before the domain_crash() would fix it.
> 
> Instead of (or in addition to) doing that here, wouldn't releasing better be part
> of the normal cleanup path? Whether "instead of" or "in addition to" depends on
> the implications of deferring the release. But to guarantee no leak, domain
> cleanup will want to either do the release, or have an explicit check that is was
> done.

I think vgein_release() should be here, as when the IMSIC software 
interrupt file is supported, it will mean that domain_crash() can 
generally be dropped (there is no need to call imsic_map_guest_file() 
for s/w IMSIC interrupt file) and the vCPU can use the software 
interrupt file instead of killing the domain.

~ Oleksii

