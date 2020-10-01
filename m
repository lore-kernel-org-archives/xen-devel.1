Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43EE9C4741F
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 16:05:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFA8020B1F
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 16:05:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="e2y8bxHc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFA8020B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1415.4528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO14k-0007fc-Ms; Thu, 01 Oct 2020 16:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1415.4528; Thu, 01 Oct 2020 16:04:58 +0000
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
	id 1kO14k-0007fV-Jc; Thu, 01 Oct 2020 16:04:58 +0000
Received: by outflank-mailman (input) for mailman id 1415;
 Thu, 01 Oct 2020 16:04:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kO14j-0007fP-5U
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:04:57 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bb75349-7a6d-4c72-87eb-135e2454df83;
 Thu, 01 Oct 2020 16:04:55 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO14b-00024g-GH; Thu, 01 Oct 2020 16:04:49 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO14b-0007Cv-8l; Thu, 01 Oct 2020 16:04:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kO14j-0007fP-5U
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:04:57 +0000
X-Inumbo-ID: 1bb75349-7a6d-4c72-87eb-135e2454df83
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 1bb75349-7a6d-4c72-87eb-135e2454df83;
	Thu, 01 Oct 2020 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=0erPlQYdx/puuWFhuIBlj1yB5OY2G4NsMEejUtCMH5g=; b=e2y8bxHcemq8W/reZfDahj933f
	Y+XdwMfIO5RqOsq4my5I6mFljfu7rdqLkqaoautwJIF3yK7ATu+FmGOvCiGraZUKHqvzE2m3Z/hY1
	pffd+fRtZ0SGh46IH0Q/0DrVNLsngPQtZFVbC6zHSg4Aqyf0tr9KrVkeVrONhhDh+jXw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO14b-00024g-GH; Thu, 01 Oct 2020 16:04:49 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO14b-0007Cv-8l; Thu, 01 Oct 2020 16:04:49 +0000
Subject: Re: [PATCH] evtchn/Flask: pre-allocate node on send path
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e5d5dfee-aeee-ed3d-bcea-91e82198e04f@xen.org>
Date: Thu, 1 Oct 2020 17:04:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <f633e95e-11e7-ccfc-07ce-7cc817fcd7fe@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 24/09/2020 11:53, Jan Beulich wrote:
> xmalloc() & Co may not be called with IRQs off, or else check_lock()
> will have its assertion trigger about locks getting acquired
> inconsistently. Re-arranging the locking in evtchn_send() doesn't seem
> very reasonable, especially since the per-channel lock was introduced to
> avoid acquiring the per-domain event lock on the send paths. Issue a
> second call to xsm_evtchn_send() instead, before acquiring the lock, to
> give XSM / Flask a chance to pre-allocate whatever it may need.
> 
> As these nodes are used merely for caching earlier decisions' results,
> allocate just one node in AVC code despite two potentially being needed.
> Things will merely be not as performant if a second allocation was
> wanted, just like when the pre-allocation fails.
> 
> Fixes: c0ddc8634845 ("evtchn: convert per-channel lock to be IRQ-safe")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

As discussed on the community call with one comment below:

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> TBD: An even easier fix could be to simply guard xzalloc() by a
>       conditional checking local_irq_is_enabled(), but for a domain
>       sending only interdomain events this would mean AVC's node caching
>       would never take effect on the sending path, as allocation would
>       then always be avoided.
> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -723,6 +723,12 @@ int evtchn_send(struct domain *ld, unsig
>       if ( !port_is_valid(ld, lport) )
>           return -EINVAL;
>   
> +    /*
> +     * As the call further down needs to avoid allocations (due to running
> +     * with IRQs off), give XSM a chance to pre-allocate if needed.
> +     */
> +    xsm_evtchn_send(XSM_HOOK, ld, NULL);

I would suggest to add a comment on top of the evtchn_send callback in 
the XSM hook. This would be helpful for any developer of a new XSM policy.

Cheers,

-- 
Julien Grall

