Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF84C79F9F
	for <xen-devel@archiver.kernel.org>; Thu, 10 Sep 2026 14:24:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1414806.1644523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4fhD-00008t-76; Thu, 10 Sep 2026 14:24:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1414806.1644523; Thu, 10 Sep 2026 14:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x4fhD-00008m-2z; Thu, 10 Sep 2026 14:24:11 +0000
Received: by outflank-mailman (input) for mailman id 1414806;
 Thu, 10 Sep 2026 14:24:10 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1x4fhB-00008c-RQ
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 14:24:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x4fhB-00B5sH-7q
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2026 16:24:09 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa2bd71-e002-0a2a0a5209dd-0a2a450895f0-46
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:24:09 +0200
Received: from [74.125.228.76] (helo=mail-ed2-f12.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6aa2bd89-f659-0a2a45080019-4a7de44cbe7c-3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 16:24:09 +0200
Received: by mail-ed2-f12.google.com with SMTP id
 4fb4d7f45d1cf-6a6063d7dc4so2130749a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2026 07:24:09 -0700 (PDT)
Received: from [172.19.143.248] (IW396200.net.t-com.hr. [195.29.234.54])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a9882a8510sm2757462a12.21.2026.09.10.07.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2026 07:24:08 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:Content-Language:References:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789050249; x=1789655049; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KT9XCxucsSIL/H2mR1IcJdAIpK8HPYkvzgpLdrFGK5o=;
        b=L2Z87yry5ZgtYXQEvg/5DSqR3LbCY9E5B404f4nqoX/v8iGgHg2UT5SaTo93Ckye9Z
         iBTiu07XzbuaKG5bQKl7M7qTJZgLt/aul0I4DjIqXl+zoYRUTqLgv75HJAdC4sJmLmts
         iR0LGFEHw/7dpyDaHivaOIi7D5yi0Yx0LPyI3Mx7MDMHAuVDR68tGQGHfQ7/roBk+BYn
         VtEf+YuS+gniiz8JBHTHs0QOazHtdgM4DIkmkalWPL14ynTxzXQJNpV2ougA61iuUP1b
         yKWdxk+xd5IaO8iqD6Gm2yB4M7zMybpzp+zhg2L2saQxw8CgOyndJ+V+EiM9R2dhYvou
         HNUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050249; x=1789655049;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KT9XCxucsSIL/H2mR1IcJdAIpK8HPYkvzgpLdrFGK5o=;
        b=H5brywoGwuE576hQ/yJOZNtuXGmohDyK3LDZfuTd56/6hoGXauX3DtDx07cUu++dCT
         mpqoLsqES1xDIyQNM1xfvxI6VN8TuxlgzLev5ZRuJEDpQTpP9I14hEfmWA5PHEVxf4d1
         zc/8vZKx2ctMKFUz4Apy8jIIpdFnInHAxw7f9adVbcZ3tpIC94uUgH1Jr/23kQbQGPru
         hvXe6BuBQTJ8n10K+93S1aKXO9povqPEw6oD5aLt05+rJWjMWkzHqgO9HoQsZ+cYYHI7
         WKomC0vkMrqUP0EL8Cuu3pvm8JaSUn7DPN9UongHLR5C9LD3ZEHNdq40xJf6C0+ceUeG
         rKUg==
X-Forwarded-Encrypted: i=1; AKwUvBwmthJYQ4fcPJurzvoneMZmj6BEAc04GLR8w0qg/Icig3k/YrWKh/p6LmHJfwu58rL2yHE6Um2nLok=@lists.xenproject.org
X-Gm-Message-State: AFuF++k75p+YiNOZdD+5yMr5VWgCltRh2FWyavNH7wAwN6LVGsyx9cKN
	cVsePWzf2FBWPUs0LikhcvyUwNa13ZYAe+qqh8MMwjQY0PpfKkoh5sJe
X-Gm-Gg: AYBFou0Q0G2x2WGJ8DqisWLHcprPvwtCL+9ExB9QA2JwpZx44ySNIuoacMeo5EgPyIl
	J/DFHS3Jmtj6I2Mj/eskJAfSNZYlTofGeQt3FlL2a6VJNiAW9gkhXip3iZSAl1p7sDfV0HwC7n+
	0zwu2tGaOirbTxSCs/dX9RLl3kwDfPtPSjEi2ORYFXnIrOS62dioqGh68pLw4sWQAPbG8/KDCfM
	beGwimcla4LDrZbIPagV71QfxLwJ3wUYognqsWHWMWolrKmon8kyO3oaSCfOXLshw8BBYhIvO46
	Umgk59yIUZRQaZ3169ks22HcDaY9cbyYF0MN/jOIrp3XdifwoWwt3idxC5Y+ZDJ84JS2UpmSTzF
	L2mn5RHjbNK1sZS5K/qtpWfdeKPYer+pwmN2HCjIPnNfuYjVdNeMpDtnZz5oaROHnfjxiPZbtbi
	Yjl85FBvTn5AXvHQ0zHYZlfcegbhWt4vDdFkLMiqKAAoX8cOloI79YLxWJnukvixdSa4pG2ks1r
	jnwSHdMHBLbM3RqE7x7FZdZyljmsmmW
X-Received: by 2002:a05:6402:4513:b0:6a6:757d:6311 with SMTP id 4fb4d7f45d1cf-6a99ccc36c1mr6930430a12.9.1789050248498;
        Thu, 10 Sep 2026 07:24:08 -0700 (PDT)
Message-ID: <efd67e96-e24f-4bfb-b484-51514c5fc18b@gmail.com>
Date: Thu, 10 Sep 2026 16:24:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 09/39] xen/riscv: implement virtual APLIC MMIO
 emulation
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
 <4413e157dfe67167f651df1ea92ab61ca4182723.1787838835.git.oleksii.kurochko@gmail.com>
 <68ab5241-7301-4988-9420-bcccc4b16e3d@suse.com>
 <071ed630-4c72-4df1-b15e-3037e3f076ba@gmail.com>
 <48857983-ac79-44a0-8a11-93f62ac3d0c4@suse.com>
Content-Language: en-US
In-Reply-To: <48857983-ac79-44a0-8a11-93f62ac3d0c4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c1860d/1789050249-CC57487B-FDD917DB/10/73395122804
X-purgate-type: spam
X-purgate-size: 2691



On 9/10/26 1:14 PM, Jan Beulich wrote:
> On 10.09.2026 12:37, Oleksii Kurochko wrote:
>> On 9/9/26 4:26 PM, Jan Beulich wrote:
>>> On 27.08.2026 17:20, Oleksii Kurochko wrote:
>>>> +uint32_t aplic_msi_target_gen(const struct vcpu *target_vcpu,
>>>> +                              uint32_t base_val)
>>>> +{
>>>> +    unsigned int guest_id = vcpu_guest_file_id(target_vcpu);
>>>> +    unsigned long hart_field = aplic_hart_field(target_vcpu->processor);
>>>
>>> What guarantees target_vcpu's ->processor field to be meaningful at this
>>> point?
>>
>> Good question. Considering the places where it is called, I would expect
>> target_vcpu->processor to have something meaningful, since it is called
>> from a place that can only be reached when the guest is running.
>>
>> Even without that, I don't think there is a big issue here, as
>> ->processor is initialized to 0 at allocation time. This means that the
>> target register will be configured in such a way that CPU 0 will handle
>> such IRQs.
> 
> I may not have been explicit enough then: Whether the guest (as a whole)
> is running is of no interest. If the specific vCPU is running, all is fine.
> If the specific vCPU is in the process of being moved to a different CPU,
> and if you read ->processor just before the new value is put there, is
> all going to be fine as well? I doubt that.
> 

You're right, and it's worse than a stale CPU number: v->processor is 
updated by the scheduler (sched_unit_migrate_finish()) before 
sched_move_irqs() -> imsic_migrate_vcpu() moves the interrupt file, so a 
concurrent vAPLIC TARGET write can combine the new CPU with the old 
guest file index (an MSI into someone else's file, which 
aplic_reconfigure_target(), which is introduced later in this patch 
series, won't catch), or compute a correct old target but write it after 
aplic_reconfigure_target() (the function which is called during 
migration to re-target irqs to new pCPU) has already scanned.

In v3 I'll (a) stop using ->processor and take the (guest_file_id, 
vsfile_cpu) pair, which imsic_update_state() updates atomically under 
vsfile_lock, and (b) do the snapshot plus the h/w TARGET write under 
aplic.lock, which aplic_reconfigure_target() also holds. As 
imsic_update_state() completes before aplic_reconfigure_target() (also 
that could be checked in this patch series and is introduced a little 
bit later. Probably I have to re-order some patches again) takes the 
lock, the emulated write either happens before the scan (and gets fixed 
up, or skipped as already correct) or after it (and sees the new location).

Any better option I have now?

~ Oleksii

