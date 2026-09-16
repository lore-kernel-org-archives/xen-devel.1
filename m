Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A2FC88E5C
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2026 05:32:35 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1422350.1647794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6iFo-0007yl-FN; Wed, 16 Sep 2026 05:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1422350.1647794; Wed, 16 Sep 2026 05:32:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x6iFo-0007ye-Bn; Wed, 16 Sep 2026 05:32:20 +0000
Received: by outflank-mailman (input) for mailman id 1422350;
 Wed, 16 Sep 2026 05:32:19 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x6iFn-0007yY-8K
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 05:32:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x6iFm-008uIj-Dw
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2026 07:32:18 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa29c8-2eae-0a2a0a5409dd-0a2a450996c0-44
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:32:18 +0200
Received: from [74.125.225.76] (helo=mail-wr2-f12.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aaa29e2-be1a-0a2a45090019-4a7de14cad05-3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Sep 2026 07:32:18 +0200
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485ac898fa4so281344f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Sep 2026 22:32:18 -0700 (PDT)
Received: from [10.250.112.129] (h-213.61.72.154.host.de.colt.net.
 [213.61.72.154]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bf27ce2sm4461406f8f.20.2026.09.15.22.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Sep 2026 22:32:13 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1789536738; x=1790141538; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fskisN0fCV738ZD+8Qg9uE6kvXTWgr+lufjzhZ4Lm/w=;
        b=SVB3dpPt4AmzMDgZVb8Du33anw4yeJj+bNDZKuw2gxPbYztuCBKcQ5Jeep5RCsaAdD
         JwdpwNB1XxuvxQ6XP+DJzJjc9dvAAyqScdKsenzEIs3qdq427tZEfZxrpElMwGYlsjku
         e42vPxqpCmuwZgxQKKjER6YpXgaGgfxcP+KrtVsupsM9Q7R0ICSQeat4l1GEu/iSDcxE
         K1A0bzEA9GsZvO1SdzsEK4gtptsrcQCf30DLyb2oPjY0Yt5lpLhcB7Vi2nW6bFF2zjWD
         bx9NZAb6KWW8IPfgezqTyKAGSMEYgKz8Iw/j3Q+QGyw9xlErVDFYfTjwrgQppEidTpqc
         KWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789536738; x=1790141538;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fskisN0fCV738ZD+8Qg9uE6kvXTWgr+lufjzhZ4Lm/w=;
        b=2rLc5RzOncTX3h86ztEpeYJEtzeTofyRkSo00C+wMcvmTlPQytc+KlQw590lRl3NcL
         h/5LBIc96O7AiRgypxl/8m4bPkWkn6wG+JC1oRAnWgd0++Gp800qyh8WhIRmAXl/eo0P
         nJql/Nas7QtbF3VDlKcold9Pi3fek0j0UP5gTybSE36BqwSH2z/JJrv33V8knuS2mZ/l
         Cou72jJsKANkjc3xTeDr056cxCPqiarwM4EdT6FTTd5BXrw2OdI4uqMDU3uWM6W5TqJz
         82TZKiKuEPWus1uRRBJgYzNG7Jh/lZKIxdFZkPL64hcKKx66A0p66r9J9ArxkD1pn0FA
         RgGA==
X-Forwarded-Encrypted: i=1; AKwUvBzxiuf6M2J316X0xYH5EWbTuPS40vddANLKuOA2BDBBj+lk/Wyyfn6mNnJEsV6VrqojuaRRTegagfM=@lists.xenproject.org
X-Gm-Message-State: AFuF++lUB6HEkpoI2RaZmymCk8uzwGxCCKZQUm2rQv82yWzvtuC3Yuwi
	7XQbgfu4qyHbEO5DaOgppCW6u3lNg9OlKf3Rg1L8oVccXVX7NIBVKq1h
X-Gm-Gg: AYBFou3qHMbPma7QE5YmInLrOmrYGL3/TmmabfsDmWlPtCmvCkgu1jBhiaQdm1BimLS
	tYYI6+zXvc6d6l/gG+rVKRpdMZvRpuIcoGWbzkTCG65TLy8vDPNkszvk9b6ly5PwrY8ztP8CFiy
	GIbNXA8L7x7t4ORTM7WLqcv0f3e3A8l2v+hzDu3KVno+ED6cGymJ6RqtFY6i+ElQD/9AmRIc1Mf
	pvWW6MdhIR1x8vjFTHvaepOHV1exgy1pAspb2vuCS9rzzn19XqNn6duu8dSMQe0pRcc4B2TBKL/
	U5cEju9df8DIl2mRqFuYruaSeDLd3IGXnHh0Iq7EBViUWIMfKgH0xrOzev17c5PwKc9NpYpTqi0
	ho/tN5sPQqGOfJ4QmhA7EZdZs05+Hcew/b+MMZfriNWwrytRreM7RpvDJbyo4yxPdjy6FYxm/B0
	mXev77J4ogE5an1v6fH9qyelGKnS2SZg/mHkkfwosFCf8DdNvIPaZxVD0F6E6P8N6xcBDWN/zAu
	0x9V0MxKeAks5sWtDO05QihOU+kcyr0q7mNeHhved35ycZZ
X-Received: by 2002:a05:6000:250c:b0:485:c240:20f7 with SMTP id ffacd0b85a97d-4870d26ec7emr1391611f8f.53.1789536737351;
        Tue, 15 Sep 2026 22:32:17 -0700 (PDT)
Message-ID: <84e978a2-ddee-4b24-b0e4-c2ee154c717b@gmail.com>
Date: Wed, 16 Sep 2026 07:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 27/39] xen/riscv: introduce arch_move_irqs()
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
 <df3d3e1be48d9e46e4884c8573550b242efe26db.1787838835.git.oleksii.kurochko@gmail.com>
 <cbebe81e-1c68-452e-9442-8c817bd68a29@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <cbebe81e-1c68-452e-9442-8c817bd68a29@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1789536738-FD26A034-2CF3BB2E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1885



On 9/14/26 2:07 PM, Jan Beulich wrote:
> On 27.08.2026 17:21, Oleksii Kurochko wrote:
>> When migrating a vCPU between pCPUs the hypervisor must also migrate
>> the associated virtual interrupt state. arch_move_irqs() is the
>> per-arch hook called by generic code to trigger that.
>>
>> Replace the static inline BUG_ON placeholder in asm/irq.h with a real
>> implementation in intc.c dispatching through a new move_irqs vintc_ops
>> callback. Wire it up in vAPLIC, which delegates to imsic_migrate_vcpu()
>> which itself still a stub to be implemented in follow-up patches.
>>
>> Note that technically ASSERT() in arch_move_irqs() could be skipped as
>> it will be anyway NULL pointer dereference (and a trap will occur) if
>> something isn't properly initialized but sometimes it is harder to
>> find place where NULL pointer derefence happened as it isn't
>> guaraunted that all necessary registers will be filled with something
>> useful.
>> As at the moment I don't find any case when ->move_irqs() could be
>> skipped, the check that ->move_irq isn't NULL is added to ASSERT()
>> instead of adding "if ( ...->move_irq) vitnc->ops->move_irqs(v)".
> 
> All of these two paragraphs look stale / inapllicable; ...
> 
>> --- a/xen/arch/riscv/intc.c
>> +++ b/xen/arch/riscv/intc.c
>> @@ -192,3 +192,11 @@ void vintc_ctxt_switch_to(struct vcpu *v)
>>   
>>       ops->ctxt_switch_to(v);
>>   }
>> +
>> +/* Move vCPU's IRQs from one pCPU to another */
>> +void arch_move_irqs(struct vcpu *v)
>> +{
>> +    const struct vintc_ops *ops = v->domain->arch.vintc->ops;
>> +
>> +    ops->move_irqs(v);
>> +}
> 
> There's no ASSERT() here (and I'd prefer if none was added). With the
> description pruned:

I will drop last two paragraphs. They are really stale.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~ Oleksii
> 
> Jan


