Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAA5C98302
	for <xen-devel@archiver.kernel.org>; Tue, 22 Sep 2026 13:58:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1428890.1651801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x910y-0000vz-Qp; Tue, 22 Sep 2026 13:58:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1428890.1651801; Tue, 22 Sep 2026 13:58:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x910y-0000vs-Ny; Tue, 22 Sep 2026 13:58:32 +0000
Received: by outflank-mailman (input) for mailman id 1428890;
 Tue, 22 Sep 2026 13:58:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x910x-0000vi-Vr
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 13:58:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x910w-00AZCX-WE
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2026 15:58:31 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab28979-bab6-0a2a0a5309dd-0a2a4508af1c-28
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:58:30 +0200
Received: from [74.125.225.140] (helo=mail-wm2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6ab28986-f659-0a2a45080019-4a7de18cf71d-3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 15:58:30 +0200
Received: by mail-wm2-f12.google.com with SMTP id
 5b1f17b1804b1-49b912df756so29140045e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 22 Sep 2026 06:58:30 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fd8b97385sm84318545e9.2.2026.09.22.06.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2026 06:58:29 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1790085510; x=1790690310; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PR9XOsE+XnvE6AH4I0DYy0W5jkKN9kElBVLGNxt+jAg=;
        b=O3FjBWR/poNNOoczkreQmfbqgqPVCVizqoY7mZb7Stg3J7p2J5Yd5KWuQuBH+D+kMs
         3B+z24ZLPhjQeIsH2MSyKqAdxFrgXCeGtDb01pKpV6ANwBKlyHU2/JVIFoe8I+yvtEPA
         b509cAiICRU+L0MSxTouaasWp1polXz1M+I6ypgVsWyWVcoLU8yFymzcVSMpJtpIEm8H
         wDOddKFzHjouyYtqMU1bFaeyOY5ZQu5p5fyUqtxg3AQFWBEN9SXlHYcBZPCpxsAp7EsK
         iVHdoR1C3MhKCXxui+yqk3h7F7Anoz1wa2YozJNFDJ5bG3FZL9QN5JHlDujgxpvoBgwo
         KbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085510; x=1790690310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PR9XOsE+XnvE6AH4I0DYy0W5jkKN9kElBVLGNxt+jAg=;
        b=fBFXzAidDbJeg7EFtWfqGeirKEIJgcUZQLoTkmMPfexX1wOgnX2nSO5RpBsn/9w/5E
         w76sYwK1DcprQxEFmuH/DYMqriZ3MX7JZRz+7zDyusE1JldMbIf2LqQsCGkA/VKpO95Y
         Fm3GCzQczhQhN0kQBUNNlccvWLUKLiYBbx90X4nJthRmf/YjE9o+ryVcjnNjH5lrSOVS
         GBp3xafoR8AL1rK5uz278bsR/GT/wPdlhu7DAOLOY8fzeNFDsL62Tigmhu4W7Evut2kN
         aPVyZo40XJJJtbg2VElVF/LxdBPIAZjQaqSH4647Z/1IOnTT7SZ7neVlp7vXFSiwuuaN
         5IsQ==
X-Forwarded-Encrypted: i=1; AKwUvBylJysLO2d68ALgjGJV3D/r2Bup6/tnDqqiipSj3eD2UcvBrFecLP5L2VmpCk5XqWSt1oLVCMKrkpE=@lists.xenproject.org
X-Gm-Message-State: AFuF++mmu5dWxN6YtU6aC1NeBAPhHX7LLJr/A2qkzmnEz8HSDnK69jhZ
	3Kysi54K4UQco5J21KK4pEH+GqD7GOt+tKOlhfo2fJGUh6x2xKZvucRk
X-Gm-Gg: AYBFou036iz4jrkofNaUQx9AzWDoSOt+iOcm7zOtNYxB2aM6OAKI2Lq/Mc+zuImnpJQ
	TPkoF9ninvaUsE5NwxvEaqdN7RA3Q4k8J5aeL9gLRqdQUyKY7+LO2dM1eOarOQmIg7mGVDU0YwX
	nVVvsoS9RFMPciei2J8WSByJ+pfb/CYwQyep0Ww39uoeysjgHeLADRmHT4/w84LUV1hwECvB95x
	bnNjkJRZsIupG88GtzSOUQqrhIC7r3ZOpGD60ELHXoRVeVTk0oF2A8JEPzXHpB+FfqyoVWzjXO/
	b46BZPrhihc2tmY7fr+LlycXlgo+55sIcy0OHUcE/l1+c3wLgaaixyw4/sq4KsVCovwcibTgohz
	5taVW1fyYJA97RA9OsMk2EE/dwWmqOF57pKu83MuSdvCFJYffCdaAzNZw7xmmkWC6g9+t4h0c0h
	DceiBOueTjvSwFojLinY2tjJqRze6bWz1xzBVVzrLM0EmM6RVaqkir3M/b3/swNsiLa+8Qkg0fV
	MNeugB7NNVO+GJRKsdg+cVTYVcloclRI7hdiDGdWpyJkt7S3g==
X-Received: by 2002:a05:600c:1c1a:b0:49d:1de5:ce0a with SMTP id 5b1f17b1804b1-49fc56d4238mr246209275e9.13.1790085510219;
        Tue, 22 Sep 2026 06:58:30 -0700 (PDT)
Message-ID: <f0cd866e-de50-48d8-bb81-a1fc116658d3@gmail.com>
Date: Tue, 22 Sep 2026 15:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 38/39] xen/riscv: implement continue_new_vcpu()
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
 <a282887cc08cd9b05f59d46cab9377915e83c61d.1787838835.git.oleksii.kurochko@gmail.com>
 <8dbc4ba6-bf92-4e9f-b4b6-7286d5a96443@suse.com>
 <96f66feb-8889-4475-b39f-ed52b1f58a68@gmail.com>
 <a88e1326-14da-4613-9d01-2e374b574467@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <a88e1326-14da-4613-9d01-2e374b574467@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1790085510-D5F4787B-C2AB749A/10/73395122804
X-purgate-type: spam
X-purgate-size: 3934



On 9/22/26 12:20 PM, Jan Beulich wrote:
> On 22.09.2026 10:23, Oleksii Kurochko wrote:
>> On 9/21/26 2:12 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>>>> continue_new_vcpu() is the arch hook invoked the first time a freshly
>>>> created vCPU is scheduled. Implement both cases it has to cover:
>>>>    - for the idle vCPU, switch to its own stack and jump to idle_loop();
>>>>    - for a guest vCPU, restore hstatus and enter the guest through the new
>>>>      return_to_new_vcpu() path in entry.S, which loads sepc, passes the
>>>>      hart id in a0 and the DTB address in a1 as expected by the RISC-V
>>>>      boot protocol, sets sstatus.SPP and executes sret.
>>>
>>> Is this a requirement for all CPUs, or just for the boot one? (I can't
>>> quite see why secondary processors would need passing a DTB address.)
>>
>> It is requirement for boot one. For secondary processors it is HSM boot
>> data which is passed to sbi_hsm_hart_start() and then intercpeted by Xen.
>>
>> At the moment of writing of this commit message we have only boot CPU
>> and so only DTB could be passed.
> 
> That you're talking about Xen. Despite Xen being UP only right now, guests
> still can have more than one vCPU, can't they?

They can.

> 
>> I can update the commit message and the comment in return_to_new_vcpu()
>> to tell that it could be DTB address for boot cpu and/or for secondary
>> CPUs HSM boot data or it will be better to add info about HSM boot data
>> during and an introduction of secondary CPUs support?
> 
> As per above you want to deal with multi-vCPU guests right now.

Then I will update the commit message and the comment in 
return_to_new_vcpu() to say that a1 holds the DTB address for the boot 
vCPU, and for secondary vCPUs the opaque value the guest passed to SBI 
HSM hart_start().

For commit message:

  - for a guest vCPU, restore hstatus and enter the guest through the new
     return_to_new_vcpu() path in entry.S, which loads sepc, passes the
     hart id in a0 and, in a1, either the DTB address (boot vCPU) or the
     opaque argument of SBI HSM hart_start() (secondary vCPUs), as 
required by the RISC-V boot protocol and the SBI specification, sets 
sstatus.SPP and executes sret.

In the code:

         /*
          * .a1 holds the DTB address for the boot vCPU, or the opaque value
          * passed to SBI HSM hart_start() for secondary vCPUs
          */

>>>> +        /* Set guest mode to supervisor */
>>>> +        li      t0, SSTATUS_SPP
>>>> +        csrs    CSR_SSTATUS, t0
>>>> +
>>>> +        /* Enter guest */
>>>> +        sret
>>>> +END(return_to_new_vcpu)
>>>
>>> Aiui SRET does not switch stacks. Shouldn't you therefore clear sp here?
>>> And perhaps also other GPRs, not the least ra? Exposing hypervisor
>>> register values to guests is, well, a bit of a problem.
>>
>> Good point, sret leaves all GPRs as they are, so the guest would indeed
>> see Xen's sp, ra and friends. Only a0 and a1 are architecturally
>> meaningful for a booting hart, so I'll clear every other GPR right
>> before sret.
>>
>> I will add the following before sret:
>>
>>           /*
>>            * sret doesn't switch stacks and leaves the GPRs alone, so every
>>            * register which isn't meaningful to the vCPU being started
>> has to be
>>            * cleared here: otherwise the guest would see Xen's values, sp
>> (this
>>            * vCPU's Xen stack) and ra among them.
>>            */
>>           .irp reg, ra, sp, gp, tp, t0, t1, t2, s0, s1, a2, a3, a4, a5,
>> a6, a7, \
>>                     s2, s3, s4, s5, s6, s7, s8, s9, s10, s11, t3, t4, t5, t6
>>           mv      \reg, zero
>>           .endr
> 
> At which point discussing the clobbering of t0 in the comment ahead of
> the function also isn't needed anymore.

Indeed, I'll drop it.

~ Oleksii


