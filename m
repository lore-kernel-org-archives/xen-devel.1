Return-Path: <SRS0=a+y6=DG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96187C4727C
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 13:03:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16DB9207F7
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 13:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="kXEyfALq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16DB9207F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.199.456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNFIA-0003Jb-QH; Tue, 29 Sep 2020 13:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199.456; Tue, 29 Sep 2020 13:03:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNFIA-0003JU-N8; Tue, 29 Sep 2020 13:03:38 +0000
Received: by outflank-mailman (input) for mailman id 199;
 Tue, 29 Sep 2020 13:03:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNFI9-0003Iy-L9
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 13:03:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87aea51d-cbe2-4427-9b4b-bdb18f262a1d;
 Tue, 29 Sep 2020 13:03:36 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNFI5-0002Nm-3K; Tue, 29 Sep 2020 13:03:33 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNFI4-0002y4-PK; Tue, 29 Sep 2020 13:03:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNFI9-0003Iy-L9
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 13:03:37 +0000
X-Inumbo-ID: 87aea51d-cbe2-4427-9b4b-bdb18f262a1d
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 87aea51d-cbe2-4427-9b4b-bdb18f262a1d;
	Tue, 29 Sep 2020 13:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=xRkjYzuaOnwR0KxRgmSk8jlmCFqC75NtDWHDpMVkYSQ=; b=kXEyfALqe/PMd14VTt4CjMfrvL
	m8SY0FUn7X3NjRDC4YsP8zFFz6DYvsS1WrrfOwXtoDJ+o9cFBCLluDfPB/2bmDT7qVPdRiYCh51WH
	0K6vpuP+KBo1qncd6a2AdcCfZUUo6KEX1ZSRIpsqdvizghM99BVBCZsbhOvJf+gwzgBY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNFI5-0002Nm-3K; Tue, 29 Sep 2020 13:03:33 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNFI4-0002y4-PK; Tue, 29 Sep 2020 13:03:32 +0000
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <56faf769-d305-22d3-c3fe-2f9d767f0f07@xen.org>
Date: Tue, 29 Sep 2020 14:03:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2020 12:02, Jan Beulich wrote:
> There's no need to serialize all sending of vIRQ-s; all that's needed
> is serialization against the closing of the respective event channels
> (by means of a barrier). To facilitate the conversion, introduce a new
> rw_barrier().

Looking at the code below, all the spin_lock() have been replaced by a 
read_lock_*(). This is a bit surprising,

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -160,7 +160,7 @@ struct vcpu *vcpu_create(struct domain *
>       v->vcpu_id = vcpu_id;
>       v->dirty_cpu = VCPU_CPU_CLEAN;
>   
> -    spin_lock_init(&v->virq_lock);
> +    rwlock_init(&v->virq_lock);
>   
>       tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
>   
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -640,7 +640,7 @@ int evtchn_close(struct domain *d1, int
>               if ( v->virq_to_evtchn[chn1->u.virq] != port1 )
>                   continue;
>               v->virq_to_evtchn[chn1->u.virq] = 0;
> -            spin_barrier(&v->virq_lock);
> +            rw_barrier(&v->virq_lock);
>           }
>           break;
>   
> @@ -794,7 +794,7 @@ void send_guest_vcpu_virq(struct vcpu *v
>   
>       ASSERT(!virq_is_global(virq));
>   
> -    spin_lock_irqsave(&v->virq_lock, flags);
> +    read_lock_irqsave(&v->virq_lock, flags);
>   
>       port = v->virq_to_evtchn[virq];
>       if ( unlikely(port == 0) )
> @@ -807,7 +807,7 @@ void send_guest_vcpu_virq(struct vcpu *v
>       spin_unlock(&chn->lock);
>   
>    out:
> -    spin_unlock_irqrestore(&v->virq_lock, flags);
> +    read_unlock_irqrestore(&v->virq_lock, flags);
>   }
>   
>   void send_guest_global_virq(struct domain *d, uint32_t virq)
> @@ -826,7 +826,7 @@ void send_guest_global_virq(struct domai
>       if ( unlikely(v == NULL) )
>           return;
>   
> -    spin_lock_irqsave(&v->virq_lock, flags);
> +    read_lock_irqsave(&v->virq_lock, flags);
>   
>       port = v->virq_to_evtchn[virq];
>       if ( unlikely(port == 0) )
> @@ -838,7 +838,7 @@ void send_guest_global_virq(struct domai
>       spin_unlock(&chn->lock);
>   
>    out:
> -    spin_unlock_irqrestore(&v->virq_lock, flags);
> +    read_unlock_irqrestore(&v->virq_lock, flags);
>   }
>   
>   void send_guest_pirq(struct domain *d, const struct pirq *pirq)
> --- a/xen/common/spinlock.c
> +++ b/xen/common/spinlock.c
> @@ -2,7 +2,7 @@
>   #include <xen/irq.h>
>   #include <xen/smp.h>
>   #include <xen/time.h>
> -#include <xen/spinlock.h>
> +#include <xen/rwlock.h>

I would prefer if keep including <xen/spinlock.h> as the fact 
<xen/rwlock.h> include it is merely an implementation details.

>   #include <xen/guest_access.h>
>   #include <xen/preempt.h>
>   #include <public/sysctl.h>
> @@ -334,6 +334,12 @@ void _spin_unlock_recursive(spinlock_t *
>       }
>   }
>   
> +void _rw_barrier(rwlock_t *lock)
> +{
> +    check_barrier(&lock->lock.debug);
> +    do { smp_mb(); } while ( _rw_is_locked(lock) );
> +}

Why do you need to call smp_mb() at each loop? Would not it be 
sufficient to write something similar to spin_barrier(). I.e:

smp_mb();
while ( _rw_is_locked(lock) )
   cpu_relax();
smp_mb();

But I wonder if there is a risk with either implementation for 
_rw_is_locked() to always return true and therefore never end.

Let say we receive an interrupt, by the time it is handled, the 
read/lock may have been taken again.

spin_barrier() seems to handle this situation fine because it just wait 
for the head to change. I don't think we can do the same here...

I am thinking that it may be easier to hold the write lock when doing 
the update.

Cheers,

-- 
Julien Grall

