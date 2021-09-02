Return-Path: <SRS0=MtyD=NY=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B5DFC432BE
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 11:48:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 082DA6109E
	for <xen-devel@archiver.kernel.org>; Thu,  2 Sep 2021 11:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 082DA6109E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.177252.322577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLlCx-0004MG-8Y; Thu, 02 Sep 2021 11:48:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 177252.322577; Thu, 02 Sep 2021 11:48:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLlCx-0004M9-5N; Thu, 02 Sep 2021 11:48:39 +0000
Received: by outflank-mailman (input) for mailman id 177252;
 Thu, 02 Sep 2021 11:48:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLlCv-0004M3-Hu
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 11:48:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLlCt-0003Zn-1W; Thu, 02 Sep 2021 11:48:35 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLlCs-0002RI-RT; Thu, 02 Sep 2021 11:48:34 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=L0tCeXQQ0xIWkKx0h3OLF+sIBF+AtFWb5ivng8j3Ihs=; b=u1syOfYhFbWNxBbrx/kqAZuDlZ
	svczd0Uk+UKljZ/aD9daeMtL98EyjG4z4+hpYojPGi32ObgHlZ80bqXZ+Pw7qt4YvDCqRI3jJxLFP
	fqO9Oh92i+O+r8TXpdPPQFTpXZm0+WfWlMm+XQ8c/TRxVJxNqc4h30fOjFc0JAzwdhRQ=;
Subject: Re: vcpu_show_execution_state() difference between Arm and x86
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <85dc06ff-04df-2148-81c5-26bd25d1142f@suse.com>
 <8f295eeb-e8f2-a115-3f83-60922d0fe5f9@xen.org>
 <00457189-6ab5-24e4-b2ec-1050ebec67eb@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ed59ccdc-5ac0-3b9a-eb4c-33499a316a34@xen.org>
Date: Thu, 2 Sep 2021 12:48:32 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <00457189-6ab5-24e4-b2ec-1050ebec67eb@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 02/09/2021 07:45, Jan Beulich wrote:
> On 01.09.2021 20:11, Julien Grall wrote:
>> On 01/09/2021 14:39, Jan Beulich wrote:
>>> back in 2016 Andrew added code to x86'es variant to avoid interleaving
>>> of output. The same issue ought to exist on Arm.
>>
>> Agree. I guess we got away so far because it is pretty rare to have two
>> CPUs running at the same.
> 
> I guess you've meant "crashing", not "running"?

Yes.

> 
>>> The lock acquired,
>>> or more importantly the turning off of IRQs while doing so, is now
>>> getting in the way of having PVH Dom0's state dumped the 2nd time.
>>
>> I am not quite too sure to understand the problem with PVH dom0. Do you
>> have a pointer to the issue?
> 
> Locking in both cases: For registers it was VMX'es vmx_vmcs_enter()
> acquiring a (non-IRQ-safe) lock, and for the stack it is the P2M lock.
> Neither can / should sensibly be made IRQ-safe.
> 
>>> For
>>> register state I did find a sufficiently simple (yet not pretty)
>>> workaround. For the stack, where I can't reasonably avoid using p2m
>>> functions, this is going to be more difficult. >
>>> Since I expect Arm to want to also have interleave protection at some
>>> point, and since Arm also acquires the p2m lock while accessing Dom0's
>>> stacks, I wonder whether anyone has any clever idea on how to avoid
>>> the (valid) triggering of check_lock()'s assertion without intrusive
>>> changes. (As to intrusive changes - acquiring the p2m lock up front in
>>> recursive mode, plus silencing check_lock() for nested acquires of a
>>> lock that's already being held by a CPU was my initial idea.)
>>
>> At least one Arm, the P2M lock is a rwlock which is not yet recursive.
> 
> Right; the same is tru on x86. Hence the expected intrusiveness.
> 
>> But then it feels to me that this solution is only going to cause us
>> more trouble in the future.
> 
> Same here - we'd need to be very careful not only when making such
> a change, but also going forward. Hence my desire to come up with a
> better approach.
> 
>> I looked at the original commit to find out the reason to use the
>> console lock. AFAICT, this was to allow console_force_unlock() to work
>> properly. But it is not entirely clear why we couldn't get a new lock
>> (with IRQ enabled) that could be forced unlocked in that function.
>>
>> Can either you or Andrew clarify it?
> 
> AIUI any new lock would need to be IRQ-safe as well, as the lock
> would be on paths taken to output stuff when the system crashed.

Hmmm... Just to confirm, what you are saying is some of the callers of 
vcpu_show_execution_state() & co may do it with IRQ-disabled. Is that 
correct?

I have tried to play with it on Arm but then I realized that 
check_lock() is not properly working on Arm because we don't call 
spin_debug_enable() at boot. :/ So it would make sense why we never saw 
any issue there...

> Hence it would be pointless to introduce yet another lock when the
> one we have is already good enough. But I may be missing aspects,
> in which case I'd have to defer to Andrew.
> 
>> The other solution I can think off is buffering the output for
>> show_registers and only print it once at the end. The downside is we may
>> not get any output if there is an issue in the middle of the dump.
> 
> Indeed; I'd prefer to avoid that, the more that it may be hard to
> predict how much output there's going to be.

And it is not going to work as we couldn't grab the P2M lock with IRQ 
disabled.

On Arm, the only problem is going to be the P2M lock for dump the guest 
trace. A possible controversial approach for Arm is to just not dump the 
guest stack or move it outside of the new lock and dump when IRQ is 
enabled (I am not aware of any places where the guest stack will be 
dumped and we have IRQ disabled).

Bertrand, Stefano? Do you use the guest stack in the dump? If so, what 
are the cases?

Cheers,

-- 
Julien Grall

