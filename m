Return-Path: <SRS0=a+y6=DG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A24BCC4727F
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 12:17:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29DCE20759
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 12:17:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="aluXLx5n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29DCE20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.136.285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEZD-000610-Eb; Tue, 29 Sep 2020 12:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136.285; Tue, 29 Sep 2020 12:17:11 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNEZD-00060t-Aa; Tue, 29 Sep 2020 12:17:11 +0000
Received: by outflank-mailman (input) for mailman id 136;
 Tue, 29 Sep 2020 12:17:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNEZC-00060o-HE
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:17:10 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42d744b6-aa6a-4bb2-84ba-8a960a1e8859;
 Tue, 29 Sep 2020 12:17:09 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEZ8-0001Np-I7; Tue, 29 Sep 2020 12:17:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNEZ8-0007co-7O; Tue, 29 Sep 2020 12:17:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNEZC-00060o-HE
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 12:17:10 +0000
X-Inumbo-ID: 42d744b6-aa6a-4bb2-84ba-8a960a1e8859
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 42d744b6-aa6a-4bb2-84ba-8a960a1e8859;
	Tue, 29 Sep 2020 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=7FroRu0mwblMndlVMh3E1YoFonbej4asN6jkqkxNWvk=; b=aluXLx5nuE2opEqgHaoXXy8TMH
	8C8EKzcoMRWpy6tsKePc62BGNMXYJRIqYPCIizPWLndwo6XTLC7DTiUkhWhqcGjDOZKtBRM6IKb8K
	qbX9QmZ7hVGK9YPDEz/Y19M4DhpFnQDCfKmvqFo4NjgR3mzfj2+soPYpoCxEL0d9J6DE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEZ8-0001Np-I7; Tue, 29 Sep 2020 12:17:06 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNEZ8-0007co-7O; Tue, 29 Sep 2020 12:17:06 +0000
Subject: Re: [PATCH 05/12] evtchn/sched: reject poll requests for unusable
 ports
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Dario Faggioli <dfaggioli@suse.com>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2fc8d5e2-8a94-4259-1a34-4458d8df04fe@xen.org>
Date: Tue, 29 Sep 2020 13:17:04 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <802a0866-6bcf-cb52-1c3f-edb628fbc9c7@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2020 11:58, Jan Beulich wrote:
> Before and after XSA-342 there has been an asymmetry in how not really
> usable ports get treated in do_poll(): Ones beyond a certain boundary
> (max_evtchns originally, valid_evtchns subsequently) did get refused
> with -EINVAL, while lower ones were accepted despite there potentially
> being no way to wake the vCPU again from its polling state. Arrange to
> also honor evtchn_usable() output in the decision.
> 
> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

With one request (see below):

Reviewed-by: Julien Grall <jgrall@amazon.com>

> 
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1427,13 +1427,13 @@ static long do_poll(struct sched_poll *s
>           if ( __copy_from_guest_offset(&port, sched_poll->ports, i, 1) )
>               goto out;
>   
> -        rc = -EINVAL;
> -        if ( !port_is_valid(d, port) )
> -            goto out;
> -
> -        rc = 0;
> -        if ( evtchn_port_is_pending(d, port) )
> +        rc = evtchn_port_poll(d, port);
> +        if ( rc )
> +        {
> +            if ( rc > 0 )
> +                rc = 0;

This check wasn't obvious to me until I spent some times understanding 
how evtchn_port_poll() is working. I think it would be worth to...

>               goto out;
> +        }
>       }
>   
>       if ( sched_poll->nr_ports == 1 )
> --- a/xen/include/xen/event.h
> +++ b/xen/include/xen/event.h
> @@ -240,19 +240,6 @@ static inline bool evtchn_is_pending(con
>       return evtchn_usable(evtchn) && d->evtchn_port_ops->is_pending(d, evtchn);
>   }
>   
> -static inline bool evtchn_port_is_pending(struct domain *d, evtchn_port_t port)
> -{
> -    struct evtchn *evtchn = evtchn_from_port(d, port);
> -    bool rc;
> -    unsigned long flags;
> -
> -    spin_lock_irqsave(&evtchn->lock, flags);
> -    rc = evtchn_is_pending(d, evtchn);
> -    spin_unlock_irqrestore(&evtchn->lock, flags);
> -
> -    return rc;
> -}
> -
>   static inline bool evtchn_is_masked(const struct domain *d,
>                                       const struct evtchn *evtchn)
>   {
> @@ -279,6 +266,24 @@ static inline bool evtchn_is_busy(const
>              d->evtchn_port_ops->is_busy(d, evtchn);
>   }
>   
> +static inline int evtchn_port_poll(struct domain *d, evtchn_port_t port)

... add a comment on top of evtchn_port_poll() explaining that it will 
return a value < 0 if the port is not valid and > 0 if the port is pending.

> +{
> +    int rc = -EINVAL;
> +
> +    if ( port_is_valid(d, port) )
> +    {
> +        struct evtchn *evtchn = evtchn_from_port(d, port);
> +        unsigned long flags;
> +
> +        spin_lock_irqsave(&evtchn->lock, flags);
> +        if ( evtchn_usable(evtchn) )
> +            rc = evtchn_is_pending(d, evtchn);
> +        spin_unlock_irqrestore(&evtchn->lock, flags);
> +    }
> +
> +    return rc;
> +}
> +
>   static inline int evtchn_port_set_priority(struct domain *d,
>                                              struct evtchn *evtchn,
>                                              unsigned int priority)
> 

Cheers,

-- 
Julien Grall

