Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80DCC79F80
	for <xen-devel@archiver.kernel.org>; Fri,  4 Sep 2026 16:56:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1408876.1641154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XDB-0007qu-BZ; Fri, 04 Sep 2026 16:56:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1408876.1641154; Fri, 04 Sep 2026 16:56:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x2XDB-0007qn-8k; Fri, 04 Sep 2026 16:56:21 +0000
Received: by outflank-mailman (input) for mailman id 1408876;
 Fri, 04 Sep 2026 16:56:20 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x2XDA-0007qh-1V
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 16:56:20 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x2XD8-008DUc-Tg
 for xen-devel@lists.xenproject.org; Fri, 04 Sep 2026 18:56:18 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9af82c-8faa-0a2a0a5109dd-0a2a450b9850-2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 18:56:18 +0200
Received: from [209.85.128.45] (helo=mail-wm1-f45.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6a9af832-b7e8-0a2a450b0019-d155802de1c4-3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 18:56:18 +0200
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-49cd9add88aso8727475e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 04 Sep 2026 09:56:18 -0700 (PDT)
Received: from [192.168.1.6] (user-109-243-71-234.play-internet.pl.
 [109.243.71.234]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cee3b0af8sm170951985e9.0.2026.09.04.09.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2026 09:56:17 -0700 (PDT)
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
        d=gmail.com; s=20251104; t=1788540978; x=1789145778; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8PynylFYm4sY0Xl0aAJeG3VPTE5sVKvJJyvGzuWpf+s=;
        b=RsnFHbds31LXFQAYtjjmXtwHht5kkJSgQFY0SSADzAeL4hkhiwSCjhB+GOJlAVNujq
         LdiapEuabRXG/IrZ3C2ww7/eYnrtDq6FuZikasCwMiitunOM31Ha2NAufgwVlqDR2aMA
         i349e0WM+jtLNm4xERld6wgrOFie1iIB30qoyJMMbuDBa7JasVJG92Gw+4QKRmnYsROh
         MLgUynZCIECAEm3bED2jM+5qdr/4ngjK0sUrDL2GVPXgSOFZYB0dJcXFD6aBG71hQzC1
         8f1qe1drb7swFAGiBJjhbh7JUN6nQJiMJ4HuW2R0VltpLw41TpAh1efHMHlrn/rf9Nml
         ev5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540978; x=1789145778;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8PynylFYm4sY0Xl0aAJeG3VPTE5sVKvJJyvGzuWpf+s=;
        b=hh2sV4o31iZOMOWpENZKhV0u2TT7Nuh/lH3tcEDrW9Q+ip/4q51sn26ob05jWbtUbm
         H82TVlAMkhpUM9/MmrBa52KILArXyjmhB0Hd0YJ+yq9jX9X8kfiURvHCc9deoL2DnQ7T
         Nyz4dgwq6hHcg02GGh+e2AGSLkx/3G2dYMJ7HcSZUwwYCiIpuF9mAVYcCYSVo5Xd4N8+
         yjIznqkoghn7ET06bPFlqehWk69yC0L5VPb2GkSZovbpVnj2en3DyQ+w22AWb+qRP+ia
         yoekYxqpHHl7uUNTcD8j+Ss3zOiNr4sGbyHSzhIErE9Qr5TxY4OX4bwwyxCrXCzMCU8/
         cJQg==
X-Gm-Message-State: AFuF++knD5MdEUYZiNrh5UsJg1rU4JXh3oMLy4YhR1ArgoUUqk7jRaKh
	TVkGpeX469mNL15CRB7HiRQvMzAVLHoUGpSx5Gpm+6VyVpvtYsA4qLZH
X-Gm-Gg: AYBFou1RljUsWO5UeGHfj7gow2YCmVG3jwcKhrZ+85Iq2CPEqB1/pnyxZbyZkNQvPNs
	vtiN7KpYOGz0ibBpuphBAeKbH8HDnN7LrLxNN4o/ZNu69UOR+bw+dTohc/fFOU6WFeoB7B/Jwyz
	9Q3JJ7fRyXAC313pJznJTXz/ENajgAJlFC7nTJjztja6uxO6V4h+ZuqsakJkPmXCRLy6oP7MzzH
	btJovepR+mmybAQ4XgVxoNHttP2aCGrPrLxvz3j5lrOPylBgKsNKz1Lhdavk7aePyYUXr4W7TUz
	i30YuOK3kTDNN8HlpiKZjaYw4qdEAxoXkpd/F/5kLD6r64V8/kp+SXcvpb0nvp7Xb5bGIMG66S8
	4aup44LpIsw4yio3b70ze8b8dzAlzFKIws+SYozJU72S6/3zh5ffyMog8CwEjsUhZk+YANssrYL
	Ulfx/qIevvix/ItU+bb+jGCOFD91rgN9tjJ8Y2eWIYbeYQf5ANUiROjFdCocy27atxywsE037G/
	AxGjbh6f2czK0SzT7iKCTkFi3LJA0o4rnvsSy/39ilyXKNzpXvY
X-Received: by 2002:a05:600c:19d1:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49cfc6e8e05mr52339725e9.31.1788540978067;
        Fri, 04 Sep 2026 09:56:18 -0700 (PDT)
Message-ID: <890cda7e-a80e-4965-9d91-69c15076de88@gmail.com>
Date: Fri, 4 Sep 2026 18:56:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/39] xen/riscv: add IMSIC vCPU context switch
 handlers
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org,
 Romain Caritey <Romain.Caritey@microchip.com>,
 Zheng Zhang <zhangzheng@iscas.ac.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1787838835.git.oleksii.kurochko@gmail.com>
 <867af892784c295296cdf63e0371fa1b7ed7a1e7.1787838835.git.oleksii.kurochko@gmail.com>
 <1788521592.8631fc262581453bbf619ec5b2062170.1a06c31b828000c4f3@vates.tech>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <1788521592.8631fc262581453bbf619ec5b2062170.1a06c31b828000c4f3@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-42698a/1788540978-A94C39EA-B444B5B2/10/73395122804
X-purgate-type: spam
X-purgate-size: 4563



On 9/4/26 1:33 PM, Baptiste Le Duc wrote:
>> IMSIC state currently needs to track only which physical CPU owns a vCPU's
>> IMSIC guest interrupt file, as the CPU id is part of the physical address
>> the file is mapped at.
>>
>> Add imsic_ctxt_switch_from() to record that CPU when a vCPU is switched
>> out. A vCPU running on the s/w VS-file has no h/w file bound to a CPU, so
>> there is nothing to record for it. The recorded value stays unused until
>> vCPU migration support, which needs it to find the file to move away from,
>> is added later.
>>
>> imsic_ctxt_switch_to() has nothing to do: by the time a vCPU is switched
>> in, VGEIN is already assigned to it and its guest interrupt file is already
>> mapped. Work is only required once a vCPU can move to a different CPU,
>> which means recalculating VGEIN and remapping the file; that is handled
>> separately by the vCPU migration patches.
>>
>> Install both as the ctxt_switch_{from,to} hooks of struct vintc_ops. MSI
>> delivery is the only mode Xen supports ( aplic_init() panics on an APLIC
>> without an "msi-parent" property, and a guest's domaincfg.DM reads back as
>> a fixed one) so the vAPLIC state to save and restore is always the IMSIC
>> one and no vAPLIC-level forwarder is needed. Being indirect call targets,
>> both handlers get cf_check.
>>
>> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>
>> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
>> index ad0a220eda..3787f270d8 100644
>> --- a/xen/arch/riscv/imsic.c
>> +++ b/xen/arch/riscv/imsic.c
>> @@ -20,6 +20,7 @@
>>   #include <xen/init.h>
>>   #include <xen/libfdt/libfdt.h>
>>   #include <xen/macros.h>
>> +#include <xen/rwlock.h>
>>   #include <xen/sched.h>
>>   #include <xen/smp.h>
>>   #include <xen/spinlock.h>
>> @@ -342,6 +343,28 @@ static int __init imsic_parse_node(const struct dt_device_node *node,
>>       return 0;
>>   }
>>   
>> +void cf_check imsic_ctxt_switch_from(struct vcpu *v)
>> +{
>> +    struct vimsic_state *imsic_state = v->arch.vimsic_state;
>> +    unsigned long flags;
>> +
>> +    /*
>> +     * A vCPU using the s/w IMSIC VS-file (guest_file_id == 0) has no h/w
>> +     * VS-file bound to a physical CPU, so there is no location to record.
>> +     */
>> +    if ( !vcpu_guest_file_id(v) )
>> +        return;
>> +
>> +    write_lock_irqsave(&imsic_state->vsfile_lock, flags);
>> +    imsic_state->vsfile_cpu = v->processor;
>> +    write_unlock_irqrestore(&imsic_state->vsfile_lock, flags);
>> +}
>> +
>> +void cf_check imsic_ctxt_switch_to(struct vcpu *v)
>> +{
>> +    /* Nothing to do */
>> +}
>> +
>>   int cf_check vcpu_imsic_init(struct vcpu *v)
>>   {
>>       struct vimsic_state *imsic_state;
>> diff --git a/xen/arch/riscv/include/asm/imsic.h b/xen/arch/riscv/include/asm/imsic.h
>> index 93f9e44c7d..73129c3c9e 100644
>> --- a/xen/arch/riscv/include/asm/imsic.h
>> +++ b/xen/arch/riscv/include/asm/imsic.h
>> @@ -109,4 +109,7 @@ unsigned int vcpu_guest_file_id(const struct vcpu *v);
>>   
>>   int vimsic_make_domu_dt_node(struct kernel_info *kinfo, unsigned int *phandle);
>>   
>> +void imsic_ctxt_switch_from(struct vcpu *v);
>> +void imsic_ctxt_switch_to(struct vcpu *v);
>> +
>>   #endif /* ASM_RISCV_IMSIC_H */
>> diff --git a/xen/arch/riscv/vaplic.c b/xen/arch/riscv/vaplic.c
>> index 8726f7203d..6c60fe2baf 100644
>> --- a/xen/arch/riscv/vaplic.c
>> +++ b/xen/arch/riscv/vaplic.c
>> @@ -422,6 +422,13 @@ static const struct mmio_handler_ops vaplic_mmio_ops = {
>>   static const struct vintc_ops vintc_ops = {
>>       .vcpu_init = vcpu_imsic_init,
>>       .vcpu_deinit = vcpu_imsic_deinit,
>> +    /*
>> +     * MSI delivery is the only supported mode: aplic_init() panics on an
>> +     * APLIC without an "msi-parent", so the vAPLIC state to save and restore
>> +     * is always the IMSIC one.
>> +     */
>> +    .ctxt_switch_from = imsic_ctxt_switch_from,
>> +    .ctxt_switch_to = imsic_ctxt_switch_to,
> 
> Maybe this patch could be merged with previous one: patch 50fe9554e1c0 ("xen/riscv: introduce vintc_ctxt_switch_{from,to}()")

At some point I agree but I think I prefer a little bit to separate 
them. It is safe to have them separately as context switch isn't 
happening between these patches so any problem will occur. What I 
intented to do is that to separately introduce abstraction and 
separately introduce users of this abstraction.

~ Oleksii

