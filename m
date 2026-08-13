Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2A4C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 09:32:13 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389635.1630271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRn7-0005lf-1y; Thu, 13 Aug 2026 09:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389635.1630271; Thu, 13 Aug 2026 09:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuRn6-0005lY-V7; Thu, 13 Aug 2026 09:32:00 +0000
Received: by outflank-mailman (input) for mailman id 1389635;
 Thu, 13 Aug 2026 09:31:59 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuRn5-0005lQ-LG
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 09:31:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuRn4-008ufH-VY
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 11:31:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d8f0a-e002-0a2a0a5209dd-0a2a4507dad4-16
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:31:58 +0200
Received: from [209.85.128.54] (helo=mail-wm1-f54.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d8f0e-b4ea-0a2a45070019-d1558036d9fe-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 11:31:58 +0200
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso2178215e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 02:31:58 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a56981csm4885578f8f.10.2026.08.13.02.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 02:31:57 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786613518; x=1787218318; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3pQVDJwue280RgZMADMBv/5TFGknjyJyQDo6ue2b8k=;
        b=HLqVLw0LBnXssupZXIvy0PODjveniYpMBS+nG6CIPcsGmjb6MfD0s/ON+1/pPgRE4E
         5L18R0ArNdHnM/PUNgwSp7414YX+aJHtuzQGa6M0Gcdmh+9J2uhKUkUmApfvEyGGHDZC
         fSfV5h2o1wv0eZFYBogzVgnEdhh5znDPjl9OoipB6MMRn/8fVm6U7sUewCCE3WpyWmjy
         o2xwAaRDagJwnZEng9Ig4RiaChhzVIE2K/ctEGW/gnguaSBcQubrMgz7/qVPu0kQtXJo
         PZJyLVFoRAPkQ9RoKzIf0yC+H/Z/jbK/khVIyDHvoGUE6Dj1XGCXfQ9yNmhG9iAZYB0f
         rqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613518; x=1787218318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3pQVDJwue280RgZMADMBv/5TFGknjyJyQDo6ue2b8k=;
        b=YYpYPWsgBIt/1wzczgoMhcnLorQd4UomBIVMkJ+wLRER3HmgVw2ztkcMtDhSxHvaZN
         fi3JJ/KH+JReorojJmRIoWlYPk+Gz14sOTcJ/mxiaiynH1k4mmJELNJqlUT0BFR80CLq
         bvcgYttPeRNx1CDK195zOW0hIHowB8AKkEDNHdLoBahlwsE3HkbwNQ27BFq3vBJpGpDa
         Dmh+sbpi+S8d4soF+Uh6zRm0P68R0oNq66LqnUHox87svZs8bqX8Ccvzr4ES+03DTHlT
         0gXycVvc3b5UZeIPngO7BSiQRToI6/5xBbz3kFI7tkDws6/ZgAz0sc2RL+QdA9/1xpac
         Te3w==
X-Gm-Message-State: AOJu0Yyik6nTSZ/ofxdPy2SMuhjiWZqYSrSf9qJohjoqdx/2wD+oITF6
	MGWozO/oXjZHnx8U/L9ApJ3R5nfwcVYrWzM8eH7wT+2NEOAyMZf63oDB
X-Gm-Gg: AR+sD13atBWn2Q9t49WNzatq0riAir4CvSAgVhjXpDGSffj2GbyTuXpBTu8jxbvSFvK
	4brFerMuC3MWpXWSqE89Yn3sAnDx5xiCEhT06fUzSC6mwCKTq4qq8PK73Ap2WTVl12CjyhdQCL7
	0aBwAKtKhjWG0YMttTGU6x7YAU66GpF+JXGBRZEUu0BB6Zmw9ER81+7y+4Ajy2M1dmn1vWrEd9Y
	ir49C0FZJZ8kTTBp2lWyT4DyayIGE2j7KB+XWvdm6Pn1VNpMAruFeaVrU27EUbKfYUK4vPp5pYK
	Ht6wsREViI2iAILKIupeCNRSq4aWj5O4xGIqlJTQihbwrbuV/iUKgh7nLPMmfdwvXty/kmnnouu
	cFdJPMsHj3apjbwBAFE4vb5iP0OOzsFE1/fgQzYfreP1plbEmrFNI1Gvrc0ZHnQHo2uzwAltvzC
	26r9wBhdJYyXVTXYjo2ultAzvzpW5L9D1QDF5us/2zyos+tN21iXYvhVzke6wkKNJIRTZzWxVU8
	3F62kZRrnqhvuPLK/vr9qh0ABCNLufUyalgkn9sces=
X-Received: by 2002:a05:600c:4585:b0:499:726a:a017 with SMTP id 5b1f17b1804b1-499821bcfecmr46986805e9.1.1786613518164;
        Thu, 13 Aug 2026 02:31:58 -0700 (PDT)
Message-ID: <2eedac12-74a8-4b7d-91d4-e8c4cb280529@gmail.com>
Date: Thu, 13 Aug 2026 11:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/17] xen/riscv: introduce vCPU AIA initialization
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1784560663.git.oleksii.kurochko@gmail.com>
 <b3aca8278dfd70bf6ce888bfcb0a3fbc32bb4971.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613090.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1786613090.8631fc262581453bbf619ec5b2062170.19ffa7047d4000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-ef75cf/1786613518-354C3AE4-64A70EDB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2905



On 8/13/26 11:24 AM, Baptiste Le Duc wrote:
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
> 
>>
>> Introduce imsic_update_state() to update a vCPU's guest IMSIC state
>> (the guest interrupt file id and the pCPU whose hardware interrupt
>> file it is mapped to) as a single consistent unit. This state can be
>> read concurrently, e.g. by a future helper that checks whether a
>> vCPU has a pending IMSIC interrupt, though no such consumer exists
>> yet at this stage - so it is protected by a lock.
>>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/aia.c b/xen/arch/riscv/aia.c
>> index 4f7f46f58f..ed19600d46 100644
>> --- a/xen/arch/riscv/aia.c
>> +++ b/xen/arch/riscv/aia.c
>> @@ -14,6 +14,7 @@
>>   #include <asm/cpufeature.h>
>>   #include <asm/csr.h>
>>   #include <asm/current.h>
>> +#include <asm/imsic.h>
>>   
>>   struct vgein_ctrl {
>>       unsigned long bmp;
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
>> +
>> +    /*
>> +     * vgein_assign() returns 0 when no free h/w guest interrupt file is
>> +     * available (including GEILEN == 0); imsic_map_guest_file() maps nothing
>> +     * in that case.
>> +     */
>> +    rc = imsic_map_guest_file(v, new_vsfile_id);
>> +    if ( rc )
>> +    {
>> +        /* Can't continue w/o correctly mapped IMSIC interrupt file */
>> +        domain_crash(v->domain);
> 
> The vgein id assigned a few lines up is not released here. The domain is dying
> anyway, but the guest interrupt file stays marked in use on that pCPU forever,
> since nothing else ever calls vgein_release(). A vgein_release(v,
> new_vsfile_id) before the domain_crash() would fix it.
> 

Yes, agree with that vgein_release() is missed. I've mentioned that 
before in reply to Jan B.

Thanks!

~ Oleksii


