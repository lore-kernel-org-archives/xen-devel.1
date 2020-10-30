Return-Path: <SRS0=Brpk=EF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A242C4363A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 10:58:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87A24206E5
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2020 10:57:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="ByzGBSxj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87A24206E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.15664.38724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYS6Q-0004eU-3s; Fri, 30 Oct 2020 10:57:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 15664.38724; Fri, 30 Oct 2020 10:57:50 +0000
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
	id 1kYS6Q-0004eN-0l; Fri, 30 Oct 2020 10:57:50 +0000
Received: by outflank-mailman (input) for mailman id 15664;
 Fri, 30 Oct 2020 10:57:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kYS6O-0004eG-Ng
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:57:48 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a7c5135-9d74-4c12-ab68-dba026070e57;
 Fri, 30 Oct 2020 10:57:47 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYS6L-0006Cb-6z; Fri, 30 Oct 2020 10:57:45 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kYS6K-00080N-Vd; Fri, 30 Oct 2020 10:57:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pDD0=EF=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kYS6O-0004eG-Ng
	for xen-devel@lists.xenproject.org; Fri, 30 Oct 2020 10:57:48 +0000
X-Inumbo-ID: 4a7c5135-9d74-4c12-ab68-dba026070e57
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4a7c5135-9d74-4c12-ab68-dba026070e57;
	Fri, 30 Oct 2020 10:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=3WRNYdd2rXXQ/VLt51xZpzNQFRLGTVLdg0Gqequr51Q=; b=ByzGBSxj0E9zsO700sm64JuJ0b
	hOb7B9k3SwXLf32UEUNBIjiFekycp+WCBMvP7GQGOvgczA/fYO9TreWj2gu4H4iAoV2IQIOdECXoJ
	VJQNs2oAtottdWoSgfv6jIyzDdvuZDqqaK6XB2w2Y+ZdVYddT4EKjkytJWpQP97ixDr0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYS6L-0006Cb-6z; Fri, 30 Oct 2020 10:57:45 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kYS6K-00080N-Vd; Fri, 30 Oct 2020 10:57:45 +0000
Subject: Re: [PATCH v2 6/8] evtchn: convert vIRQ lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <19babf20-3649-5c63-44a9-7edfa81835aa@suse.com>
 <53a2fc39-1bf1-38ce-bbdf-b512c5279b4f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6dec1d48-b8c8-6122-087c-38f36f30596e@xen.org>
Date: Fri, 30 Oct 2020 10:57:42 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <53a2fc39-1bf1-38ce-bbdf-b512c5279b4f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/10/2020 15:10, Jan Beulich wrote:
> There's no need to serialize all sending of vIRQ-s; all that's needed
> is serialization against the closing of the respective event channels
> (so far by means of a barrier). To facilitate the conversion, switch to
> an ordinary write locked region in evtchn_close().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Don't introduce/use rw_barrier() here. Add comment to
>      evtchn_bind_virq(). Re-base.
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
> @@ -449,6 +449,13 @@ int evtchn_bind_virq(evtchn_bind_virq_t
>   
>       spin_unlock_irqrestore(&chn->lock, flags);
>   
> +    /*
> +     * If by any, the update of virq_to_evtchn[] would need guarding by
> +     * virq_lock, but since this is the last action here, there's no strict
> +     * need to acquire the lock. Hnece holding event_lock isn't helpful

s/Hnece/Hence/

> +     * anymore at this point, but utilize that its unlocking acts as the
> +     * otherwise necessary smp_wmb() here.
> +     */
>       v->virq_to_evtchn[virq] = bind->port = port;

I think all access to v->virq_to_evtchn[virq] should use ACCESS_ONCE() 
or {read, write}_atomic() to avoid any store/load tearing.

Cheers,

-- 
Julien Grall

