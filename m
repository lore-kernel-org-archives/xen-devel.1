Return-Path: <SRS0=CtBx=E7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1516BC56201
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 09:20:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ABCB208CA
	for <xen-devel@archiver.kernel.org>; Wed, 25 Nov 2020 09:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="u0QweprM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ABCB208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.37488.69872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khqyE-0007B2-HA; Wed, 25 Nov 2020 09:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37488.69872; Wed, 25 Nov 2020 09:20:14 +0000
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
	id 1khqyE-0007Av-DQ; Wed, 25 Nov 2020 09:20:14 +0000
Received: by outflank-mailman (input) for mailman id 37488;
 Wed, 25 Nov 2020 09:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khqyC-0007Aq-TI
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 09:20:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 68ccaf5a-02b7-4f78-98a4-8f75bac2bbb3;
 Wed, 25 Nov 2020 09:20:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EF8D8AC65;
 Wed, 25 Nov 2020 09:20:10 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dO0Y=E7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khqyC-0007Aq-TI
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 09:20:12 +0000
X-Inumbo-ID: 68ccaf5a-02b7-4f78-98a4-8f75bac2bbb3
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 68ccaf5a-02b7-4f78-98a4-8f75bac2bbb3;
	Wed, 25 Nov 2020 09:20:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606296011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WKtefuZNEFSpvl4zth8rv/GE2eTSZH3Uh3HETRcwyKo=;
	b=u0QweprMcC8ZIbp4NCB6GGEOQwZZEPsogUGRVgdGvZWZprFhJ4cX3jdjVj5ZlGZuBNjyrX
	nfEnpge+QTKK1vHbTmPkRsuqiDKOpF8uWPpUY/xUAOFoxw9JhI7DoO/ye92xp/N2c59c5m
	Jn4yOJRMX1/0wMwFhNzTAvH85OGbPo8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF8D8AC65;
	Wed, 25 Nov 2020 09:20:10 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] domctl: introduce a new domain create flag,
 XEN_DOMCTL_CDF_disable_fifo, ...
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Eslam Elnikety <elnikety@amazon.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201124191751.11472-1-paul@xen.org>
 <20201124191751.11472-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <444917ac-f2aa-5544-8f6c-097e7f57c98c@suse.com>
Date: Wed, 25 Nov 2020 10:20:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124191751.11472-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 20:17, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ...to control the visibility of the FIFO event channel operations
> (EVTCHNOP_init_control, EVTCHNOP_expand_array, and EVTCHNOP_set_priority) to
> the guest.
> 
> These operations were added to the public header in commit d2d50c2f308f
> ("evtchn: add FIFO-based event channel ABI") and the first implementation
> appeared in the two subsequent commits: edc8872aeb4a ("evtchn: implement
> EVTCHNOP_set_priority and add the set_priority hook") and 88910061ec61
> ("evtchn: add FIFO-based event channel hypercalls and port ops"). Prior to
> that, a guest issuing those operations would receive a return value of
> -ENOSYS (not implemented) from Xen. Guests aware of the FIFO operations but
> running on an older (pre-4.4) Xen would fall back to using the 2-level event
> channel interface upon seeing this return value.
> 
> Unfortunately the uncontrolable appearance of these new operations in Xen 4.4
> onwards has implications for hibernation of some Linux guests. During resume
> from hibernation, there are two kernels involved: the "boot" kernel and the
> "resume" kernel. The guest boot kernel may default to use FIFO operations and
> instruct Xen via EVTCHNOP_init_control to switch from 2-level to FIFO. On the
> other hand, the resume kernel keeps assuming 2-level, because it was hibernated
> on a version of Xen that did not support the FIFO operations.

And the alternative of the boot kernel issuing EVTCHNOP_reset has
other unwanted consequences. Maybe worth mentioning here, as
otherwise this would look like the obvious way to return to 2-level
mode?

Also, why can't the boot kernel be instructed to avoid engaging
FIFO mode?

> To maintain compatibility it is necessary to make Xen behave as it did
> before the new operations were added and hence the code in this patch ensures
> that, if XEN_DOMCTL_CDF_disable_fifo is set, the FIFO event channel operations
> will again result in -ENOSYS being returned to the guest.

Are there indeed dependencies on the precise return value anywhere?
If so, the generally inappropriate use (do_event_channel_op()'s
default case really would also need switching) would want a brief
comment, so it'll be understood by readers that this isn't code to
derive other code from. If not, -EPERM or -EACCES perhaps?

Also, now that we gain a runtime control, do we perhaps also want a
build time one?

> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Signed-off-by: Eslam Elnikety <elnikety@amazon.com>

Are this order as well as the From: tag above correct? Or
alternatively, are there actually any pieces left at all from
Eslam's earlier patch?

> v4:
>  - New in v4

(Just as an aside: That's quite interesting for a previously
standalone patch. I guess that patch was really split, considering
you've retained Eslam's S-o-b? But perhaps there are different ways
to look at things ...)

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -70,9 +70,11 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_iommu          (1U<<_XEN_DOMCTL_CDF_iommu)
>  #define _XEN_DOMCTL_CDF_nested_virt   6
>  #define XEN_DOMCTL_CDF_nested_virt    (1U << _XEN_DOMCTL_CDF_nested_virt)
> +#define _XEN_DOMCTL_CDF_disable_fifo  7
> +#define XEN_DOMCTL_CDF_disable_fifo   (1U << _XEN_DOMCTL_CDF_disable_fifo)

Despite getting longish, I think this needs "evtchn" somewhere in
the name. To keep size bounded, maybe XEN_DOMCTL_CDF_no_fifo_evtchn?

>  /* Max XEN_DOMCTL_CDF_* constant.  Used for ABI checking. */
> -#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_nested_virt
> +#define XEN_DOMCTL_CDF_MAX XEN_DOMCTL_CDF_disable_fifo

While not directly related to this patch, I'm puzzled by the
presence of this constant: I've not been able to find any use of
it. In particular you did have a need to modify
sanitise_domain_config().

Jan

