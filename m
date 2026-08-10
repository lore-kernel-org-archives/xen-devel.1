Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DF5C5AD4E
	for <xen-devel@archiver.kernel.org>; Mon, 10 Aug 2026 10:01:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1387297.1628555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtMoz-0006De-8U; Mon, 10 Aug 2026 10:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1387297.1628555; Mon, 10 Aug 2026 10:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wtMoz-0006DX-5Z; Mon, 10 Aug 2026 10:01:29 +0000
Received: by outflank-mailman (input) for mailman id 1387297;
 Mon, 10 Aug 2026 10:01:27 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wtMox-0006DR-Da
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 10:01:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wtMow-00Dt4l-0w
 for xen-devel@lists.xenproject.org; Mon, 10 Aug 2026 12:01:26 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79a16e-bab6-0a2a0a5309dd-0a2a45018e30-22
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:01:25 +0200
Received: from [209.85.221.44] (helo=mail-wr1-f44.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a79a175-5984-0a2a45010019-d155dd2cb803-3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 12:01:25 +0200
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-47362928f65so1390297f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Aug 2026 03:01:25 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48002145839sm32564405f8f.7.2026.08.10.03.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Aug 2026 03:01:11 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786356085; x=1786960885; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXQIqdRVAv8DGRTLU1MiBZfEi64arVF7ua5/ksd67b4=;
        b=dVjJaIM2+gdjvKVMk3ahl5PpWQVmT6hiSh6KB7BgVmKXcc86FBCpcsPxToHdi3beFo
         Iy4GNslUXEEYVo6D+oWvkPUziinCcGDOO1dPmmp/RqprbRRwVwxmP9Jr2Q6DBQV5uk44
         SiyqBIQHFeuVAnDp071MhFpF1Y89wU1e5jd1Tr8fMt3eAzAONvksis7xmcBfCAESSTI0
         ZCDXa5yUuNQI+YJZn/+Qzq8gGjY6XnmX1T/bEOlUxi/gaY89czcPI0O7hF6fp0t4/VoT
         KH3AfYxmxnS0hmug3A55vX16oeGm3d/MXedHQxbfIVeN7G3JqfUqvrI0vJKK0cD7viu9
         3a7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786356085; x=1786960885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXQIqdRVAv8DGRTLU1MiBZfEi64arVF7ua5/ksd67b4=;
        b=W27yEKzeHVfBBJwEJAmql18XO3GmrY4lcEdWQkKpMsi+XmKwHB/gyb7ev8Dd+AUhFp
         HK63gKaQrjwX1KbpSpArYvH5D04PZ06oB/vsmkRsy3+wb6GkW9ii0VqGzYBronh4UUhu
         xl0cpocWysQNFBWiH/4qnxkhmO5cWQBHvZlLlxfaib0qqBdMaP/IVRDviOp9OnX8VuGX
         F0UUZFEFzxmEgRtTb/0IZWqT7CWAjVCsRLiBqL0+oZiXbqihQ/qpERqKGGLblpxGDcpL
         NEEh+JDXFaI0RFzS9W4pbLCfuaStRFXbA6XVSmhPvywCqxyCmLpTzDopgHbi8+qpV6lb
         YNyQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQj6MYV1Kj7W4vr1Lub3a1lU34okqL6O5+Klnk0mJ/hoCXQr7eTbt3dNNHK/jXIkEsqtrOCL9Mpjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4Mr41BDuVmlopKjALyO8j8xZCj81Pa3udt6ah8Dg+R24L1WVo
	Kv7svPKhjvcqxtFBU5SnLDb/lteZvux/S2WeKrsHaUSRy5fGCPjn95Q3tFMF1Q==
X-Gm-Gg: AR+sD11VpJq9wwZx0z72s5kcpS7Yl+40F5u81dkbcNsMpyS4FP7/morShGOo4chhPtc
	fKfRKZ1EtFIMSAhRT0/sfZrOPt3hBdJh9x3Yd3qYcIKdk86JahUq65f/gdwRrEIlpX0ShkQIom2
	YBj+cuxrNdeL/91E+G+d5whRM9sPMFpS8PGInnHgt9xcp4HCowOHT5FgeoO8KXio7Ixsjn1Aw9e
	HC8BduPZIW30wd8aFkXA8lr59yIcw/ZTuIfVZkrCzriM6+QM3qM12GV3zRKRvXJLPk186SQQ23/
	OLDz6+SF0ruLA348OqPCqmdMl7UpkrxdHGoHDR7WXzm7jklsy69OwVLydAxC2+20BavsLoO9xZW
	3MqoW2nLvGuc1YnuUSCRASyypniRRlWUfDmF52LptMhcdBAPOOLaUpeBOQRj+3U/Vm5NeB26byz
	22Q855Fb7cgeuV0JZg879TT7WY1tObXeFxquCkrLW5J209aT37Bz9c6ll+qUBfPf6jswN+vLkzf
	vzapaKo7NDCZ97+W2y7dQ6NZm6ACz4yJbx6NbFfjhM=
X-Received: by 2002:a05:6000:491e:b0:47d:ee9d:90c8 with SMTP id ffacd0b85a97d-47fec4e2910mr68258764f8f.3.1786356071544;
        Mon, 10 Aug 2026 03:01:11 -0700 (PDT)
Message-ID: <55d800f3-6211-4c18-95b6-8682ecfe3330@gmail.com>
Date: Mon, 10 Aug 2026 12:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/17] xen/riscv: introduce vCPU AIA initialization
To: Jan Beulich <jbeulich@suse.com>
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
 <f3e14d18-7732-4a34-9ae4-31cdc89e6495@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <f3e14d18-7732-4a34-9ae4-31cdc89e6495@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786356085-C5540757-6A469E5C/10/73395122804
X-purgate-type: spam
X-purgate-size: 4800



On 8/6/26 4:56 PM, Jan Beulich wrote:
> On 20.07.2026 18:02, Oleksii Kurochko wrote:
>> Introduce vcpu_aia_init() to initialize the AIA-related state needed
>> for a vCPU to have a working guest interrupt file.
>>
>> A guest (VS) interrupt file must be mapped to one of a pCPU's
>> hardware interrupt files (if they exist), so the pCPU a vCPU will actually
>> run on needs to be known first. arch_vcpu_create() is therefore not a
>> suitable place to call vcpu_aia_init(), since the pCPU assigned to a
>> vCPU can still change before it is first scheduled. To avoid
>> reassigning the VS interrupt file id and remapping it to a different
>> pCPU's hardware interrupt file, vcpu_aia_init() will instead be
>> called from a later point in the scheduling path (e.g.
>> continue_to_new_vcpu()), to be introduced in a follow-up patch. Since
>> it will end up being called from a non-__init context, it is not
>> itself marked __init.
> 
> If it's called during scheduling, perhaps vcpu_aia_init() simply isn't
> an appropriate name, and that issue is then also reflected in a
> misleading patch subject?z
I also thought about that while working on the IMSIC interrupt file 
support, but I was thinking of moving it to imsic.c.

Regarding the function name, a better name would be 
vcpu_imsic_hw_vsfile_attach(). Alternatively, we could use a slightly 
more architectural term, such as HGEI/VGEIN, and call it 
vcpu_imsic_hgei_attach(). I think I prefer vcpu_imsic_hw_vsfile_attach().

Considering your observation and question, it could also be placed where 
it will actually be called from continue_new() in the future, so 
riscv/domain.c might be the right place for it but at the moment I think 
it will be better to put it in imsic.c closer to other IMSIC functionality.

> 
>> @@ -36,6 +37,35 @@ bool aia_usable(void)
>>       return _aia_usable;
>>   }
>>   
>> +void vcpu_aia_init(struct vcpu *v)
>> +{
>> +    unsigned int new_vsfile_id;
>> +    int rc;
>> +
>> +    if ( !aia_usable() )
>> +        return;
>> +
>> +    new_vsfile_id = vgein_assign(v);

I will add here also the check that if new_vsfile_id = 0 then we don't 
need to map guest file.

>> +
>> +    /*
>> +     * vgein_assign() returns 0 when no free h/w guest interrupt file is
>> +     * available (including GEILEN == 0); imsic_map_guest_file() maps nothing
>> +     * in that case.
>> +     */
>> +    rc = imsic_map_guest_file(v, new_vsfile_id);
>> +    if ( rc )
>> +    {

I missed here vgein_release().

>> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
>> +        domain_crash(v->domain);
>> +        return;
>> +    }
>> +
>> +    vcpu_guest_cpu_user_regs(v)->hstatus |=
>> +        MASK_INSR(new_vsfile_id, HSTATUS_VGEIN);
> 
> Looks like you're assuming that no other ID was previously stored in that
> field. That can't be quite right when the function is called after the
> vCPU moved to a different pCPU.

I don't use it during the migration process as during migration it is a 
little bit different sequence of how all of that inside the function is 
called; I use it only jumping to new vCPU (continue_new_cpu()), where I 
expect ->hstatus.vgein to be zero because of how the area for the vCPU 
registers is allocated, via vzalloc().

Probably I should consider to rework that and make it re-usable for both 
creating/jumping_to_new_vcpu and migration process.

> 
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -83,6 +83,19 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v)
>>       return ACCESS_ONCE(v->arch.vimsic_state->guest_file_id);
>>   }
>>   
>> +void imsic_update_state(struct vcpu *v, unsigned int guest_file_id)
>> +{
>> +    unsigned long flags;
>> +    struct vimsic_state *vimsic_state = v->arch.vimsic_state;
>> +    unsigned long pcpu = ( !guest_file_id ) ?
>> +                         NR_CPUS : cpuid_to_hartid(v->processor);
> 
> "pcpu" as a name is misleading when what you store is a hart ID. NR_CPUS
> then also isn't a suitable sentinel.
> 

Agree. I will store here v->processor and NR_CPUS if s/w interrupt file 
is used and then use cpuid_to_hartid() when it will be necessary.

> Also, style nit: The parentheses aren't really needed around the conditional.
> But what's definitely wrong are the blanks immediately inside them.

I will deal with that.

> 
>> +    write_lock_irqsave(&vimsic_state->vsfile_lock, flags);
>> +    vimsic_state->guest_file_id = guest_file_id;
>> +    vimsic_state->vsfile_pcpu = pcpu;
> 
> By implication from the remark above, the field name stored into then also
> is misnamed.

I think with the suggested changed above here everything will be fine.

Thanks.

~ Oleksii

