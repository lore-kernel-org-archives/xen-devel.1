Return-Path: <SRS0=a+y6=DG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24983C4346E
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 09:36:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8299020757
	for <xen-devel@archiver.kernel.org>; Tue, 29 Sep 2020 09:36:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="qMnpbUKJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8299020757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNC39-000660-Ew; Tue, 29 Sep 2020 09:35:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNC38-00065v-2P
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 09:35:54 +0000
X-Inumbo-ID: f770dc16-282a-46c0-a47e-a7fffa4d0c38
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f770dc16-282a-46c0-a47e-a7fffa4d0c38;
 Tue, 29 Sep 2020 09:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=fUlsGIAQne1xm/sKhJJtJPZN5WrKFbcAOJaYZdHrvhA=; b=qMnpbUKJFqvQqBHPEsM5ITuMlQ
 pk9jF4LQ7J1ZSi/XqoIRYyQfFx0YiS4I/MUrM0igsSEluj8DPWlGiqyQDKNS5/R+G1XGzG3f0Odc2
 NodOb1UEjQSgQ6FHy0QvOOjBzwP30AA1s2RRs51Fzq1PkvSEVciX99NpjR7FfanWcZ9E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNC32-0006LR-FN; Tue, 29 Sep 2020 09:35:48 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNC32-0002wx-7Z; Tue, 29 Sep 2020 09:35:48 +0000
Subject: Re: [PATCH 02/12] evtchn: avoid race in get_xen_consumer()
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <b8f87009-ba1a-dfaf-e130-03c5500f76c4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <38d270d3-2e3a-b3bb-3da2-4ea6fc6550f1@xen.org>
Date: Tue, 29 Sep 2020 10:35:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <b8f87009-ba1a-dfaf-e130-03c5500f76c4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 28/09/2020 11:56, Jan Beulich wrote:
> There's no global lock around the updating of this global piece of data.
> Make use of cmpxchg() to avoid two entities racing with their updates.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: Initially I used cmpxchgptr() here, until realizing Arm doesn't
>       have it. It's slightly more type-safe than cmpxchg() (requiring
>       all arguments to actually be pointers), so I now wonder whether Arm
>       should gain it (perhaps simply by moving the x86 implementation to
>       xen/lib.h), or whether we should purge it from x86 as being
>       pointless.

I would be happy with an implementation of cmpxchgptr() in xen/lib.h.

> 
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -57,7 +57,8 @@
>    * with a pointer, we stash them dynamically in a small lookup array which
>    * can be indexed by a small integer.
>    */
> -static xen_event_channel_notification_t xen_consumers[NR_XEN_CONSUMERS];
> +static xen_event_channel_notification_t __read_mostly
> +    xen_consumers[NR_XEN_CONSUMERS];

This doesn't seem directly related to the changes below. Can you explain 
it in the commit message?

>   
>   /* Default notification action: wake up from wait_on_xen_event_channel(). */
>   static void default_xen_notification_fn(struct vcpu *v, unsigned int port)
> @@ -81,7 +82,7 @@ static uint8_t get_xen_consumer(xen_even
>       for ( i = 0; i < ARRAY_SIZE(xen_consumers); i++ )
>       {
>           if ( xen_consumers[i] == NULL )
> -            xen_consumers[i] = fn;
> +            (void)cmpxchg(&xen_consumers[i], NULL, fn);

This wants an explanation in the code. Maybe:

"As there is no global lock, the cmpxchg() will prevent race between two 
callers."

>           if ( xen_consumers[i] == fn )
>               break;
>       }
> 

Cheers,

-- 
Julien Grall

