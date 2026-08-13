Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F559C5B572
	for <xen-devel@archiver.kernel.org>; Thu, 13 Aug 2026 10:22:43 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1389725.1630363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSZr-0002LI-Qp; Thu, 13 Aug 2026 10:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1389725.1630363; Thu, 13 Aug 2026 10:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wuSZr-0002LB-NR; Thu, 13 Aug 2026 10:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1389725;
 Thu, 13 Aug 2026 10:22:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1wuSZq-0002L5-2y
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 10:22:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wuSZo-005zR7-TA
 for xen-devel@lists.xenproject.org; Thu, 13 Aug 2026 12:22:20 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d9ad2-2eae-0a2a0a5409dd-0a2a45018bec-32
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:22:20 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a7d9adc-5984-0a2a45010019-d155dd36c03a-3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 12:22:20 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-480001972b8so737673f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Aug 2026 03:22:20 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-144-234.play-internet.pl.
 [109.243.144.234]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5612b8sm4422783f8f.1.2026.08.13.03.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Aug 2026 03:22:19 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1786616540; x=1787221340; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwvSv0aW7xqOLgjKxaJSTejj2jZhn+Htr+waJUIGb2g=;
        b=Blpz2Bkp0FJ/9O7r5M/O4GTVXI4qwwUOYKFijdTkujjRhoc532m0HOCaSW2WQPm9cY
         Bx9LfFlJ1j+hZFDrZKxeF3d+u7bzic3y9uR/Mw53cCPlWtBXQFlDFsJnZXloXnUlpvuV
         Y+WrXx3DNAfjd08QMrsKo+h3AZJUpZ2Yw8NzGDlci2WmzXMcfjzOCBU26zYLIQ5UrOuw
         dVEpQrRqSKN8H9m7DrYEstRPz927xc/hydxL6cI+wPnPnY9IYfds3Tmp/qxDjBStGhTq
         pibxQTvjgt4NDFI2vgLyGAa/BokjqqiTfNyYvfNxA6gZXgnEWxChdJZ2pNczYCwHikoc
         YAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786616540; x=1787221340;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwvSv0aW7xqOLgjKxaJSTejj2jZhn+Htr+waJUIGb2g=;
        b=Bh6IC9JkH4nmxbX3/AWQiSHSN7xv2SBw8UlDUXqsr0OTeBqzUrBr0qlUa0s6cdKsXz
         Q5LKeAlyDfCZU+8oORBLBmsMdMl5/s2yk3EZTO8kAK2D5K4vjo+Rg+izEACevoAsdG+g
         b469MRqE456j7lKd85Cs22AWnB6LlNGNg1VgiiWqpKc/SC2TPp03EwCvmHpJegQtFAtg
         wMxIqC90e5R91Jb3PwFqYc5XCKvFAc6r1tWYJKvxCvZaIXWhhfVPzIQKzuS793FCTsp8
         nzcBsOvL9zUXQXBYR/uilVuFsMlVKFEGbzRQXKtcv8RaPz8krADLThu95KEcn284dZbs
         7eAg==
X-Gm-Message-State: AOJu0YxcKREK9+Cco9DqJPK4tB8iQTmhozRrUpfQNloD8ZO34JiMo1rj
	yAzf9lUXf4KBxAR6RAwn35n4TqTIw/WjSH0GpaRR2EXOsTayJjSSy7wS
X-Gm-Gg: AR+sD12VqnwNMHfcEw4MQfKGIVfRK8sVt3c7/ZJ0AOyvtV9PfMcigpEsflua+d6vtit
	PbUYieXsNAxnNJk5pSeT6Vgnna+RsHgMv30u4qLa7YwH5Dd/srwZdYsFdnPXOt6BGObVH+wa9yy
	mFwi800jSoaHpdJ2RZWZvlS7zLwdrQb0vj/ogliPTCl/gnSE2uiWvTw74JUUtgp7TtG26YBksaq
	ZPeItjlH3t/bjnmsUgu1LpKlZ0ezBPYH2vlDfVcq2vIusfyRsIDnk20OXhl8s8/Y6VPUUy0tBo6
	DR2iq54GmA9RY60Av60gP9MVq3LimsJts3L2kUCY0eLHIwdMdp/Uay4btHAEPfysRSDyaQz8S5V
	bQ+YzuJ80KE1vwBBYOGE5zaMTlz7wPeSNVgeHm3oxiezEmDMN40G+zmnQyIHSg6bFnR7W8K4Pe+
	rq4ExuIEr22YxMYmINcT8M2wuAYUvguHRRqX5N+OioMSUkjSQ1BgT+U17JYL1O8s7bq3TyNxjo9
	TB12nbJwpAI+jgDZ9KHhFWsE/RxBVdjZQBoQgmbOSg=
X-Received: by 2002:a05:6000:4b0b:b0:47f:96f9:a99f with SMTP id ffacd0b85a97d-48159eb91c7mr6627269f8f.13.1786616540231;
        Thu, 13 Aug 2026 03:22:20 -0700 (PDT)
Message-ID: <bf2c9455-dd88-444a-8a94-a3a519d951e2@gmail.com>
Date: Thu, 13 Aug 2026 12:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/17] xen/riscv: add IMSIC state save/restore
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
 <5e3df9ea4bafc5666d1885dfd40f534f8349879e.1784560663.git.oleksii.kurochko@gmail.com>
 <1786613430.8631fc262581453bbf619ec5b2062170.19ffa7577c9000c4f3@vates.tech>
 <9724c838-6713-4f29-89ab-54f50ec4fe8e@gmail.com>
 <82011389-489e-4076-9d3a-8c393e4a8e76@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <82011389-489e-4076-9d3a-8c393e4a8e76@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d62444/1786616540-BF063757-B53D6F5B/10/73395122804
X-purgate-type: spam
X-purgate-size: 2844



On 8/13/26 11:51 AM, Jan Beulich wrote:
> On 13.08.2026 11:34, Oleksii Kurochko wrote:
>> On 8/13/26 11:30 AM, Baptiste Le Duc wrote:
>>>> --- a/xen/arch/riscv/imsic.c
>>>> +++ b/xen/arch/riscv/imsic.c
>>>> @@ -20,6 +20,7 @@
>>>>    #include <xen/init.h>
>>>>    #include <xen/libfdt/libfdt.h>
>>>>    #include <xen/macros.h>
>>>> +#include <xen/rwlock.h>
>>>>    #include <xen/sched.h>
>>>>    #include <xen/smp.h>
>>>>    #include <xen/spinlock.h>
>>>> @@ -418,6 +419,28 @@ int imsic_map_guest_file(struct vcpu *v, unsigned int vsfile_id)
>>>>        return res;
>>>>    }
>>>>    
>>>> +void imsic_state_save(struct vcpu *v)
>>>> +{
>>>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>>>> +    unsigned long flags;
>>>> +
>>>> +    /*
>>>> +     * SW interrupt file always has ->vsfile_pcpu = NR_CPUS so nothing specific
>>>> +     * should be done in this case.
>>>> +     */
>>>> +    if ( !vcpu_guest_file_id(v) )
>>>> +        return;
>>>
>>>
>>>> +
>>>> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>>>> +    imsic_state->vsfile_pcpu = cpuid_to_hartid(v->processor);
>>>
>>> How will you detect a migration is needed? Don't you need to first know
>>> if ->vsfile_pcpu is different to cpuid_to_hartid(v->processor)? (I
>>> didn't take a look to other patchs for the moment, so the
>>> explanations might be later.)
>>
>> Migration (if you are speaking about migration of vCPU from one pCPU to
>> another) is completely different path. Look at sched_move_irqs().
> 
> See how terminology is important. As said elsewhere, "save state" and
> "restore state" don't make clear at all in which situation they're to be
> used.

I totally agree that it is important.

Just to clarify it now (before I started to re-shuffle and/or adding 
extra patches to have better context how this functions will be called) 
I will add some information here. So imsic_state_save() and 
imsic_state_restore() is going to be called from context_switch() 
function when one vCPU is de-scheduled and new vCPU is scheduled (so no 
migration here at all, yes it could happen but it is still a separate 
path and so separate question). Considering that my understanding that 
during context_switch() I have to save state of IMSIC which corresponds 
to vCPU which is going to be de-scheduled and restore a state of IMSIC 
of vCPU which is going to be scheduled.

With the current context is imsic_state_save() and imsic_state_restore() 
are correct names?

> 
> Also, can both of you please adjust Roger's email address when replying?

Could you please clarify what is wrong with it? For example, in this 
patch series:
   [PATCH v2 0/2] vpci: allow unaligned accesses by the hardware domain

This one is used: Roger Pau Monne <roger@xenproject.org>

~ Oleksii

