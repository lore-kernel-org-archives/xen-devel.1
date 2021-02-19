Return-Path: <SRS0=5oJc=HV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E806C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 13:44:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4164164ED6
	for <xen-devel@archiver.kernel.org>; Fri, 19 Feb 2021 13:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4164164ED6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.86883.163392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD655-0006Ga-AS; Fri, 19 Feb 2021 13:44:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86883.163392; Fri, 19 Feb 2021 13:44:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD655-0006GT-7W; Fri, 19 Feb 2021 13:44:27 +0000
Received: by outflank-mailman (input) for mailman id 86883;
 Fri, 19 Feb 2021 13:44:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD654-0006GO-HT
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 13:44:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 339e94c2-2e4a-45c7-83c4-2a25fa455593;
 Fri, 19 Feb 2021 13:44:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9808EAC6E;
 Fri, 19 Feb 2021 13:44:24 +0000 (UTC)
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
X-Inumbo-ID: 339e94c2-2e4a-45c7-83c4-2a25fa455593
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613742264; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+SP6WAoYFimwm4BW7FGybNQJGKcYzR4XHeUA/R4j+gI=;
	b=ZW+0TOsXH7jEUsZphbLahSRxJhKh+/r/nI/o5smRcuNifhuFrXo2Jmx3YWhopzrnSzhHYj
	RoGRof5xm6EescRxfG2K/6ZOt8fwI8zw2xyxhZn4TenY8RhQMwNuyFeLGtcQ6oYiVljOHS
	4DxqC0ChTPpolcR87HcQMTg4fncg/So=
Subject: Re: [PATCH HVM v4 1/1] hvm: refactor set param
To: Norbert Manthey <nmanthey@amazon.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <2633df5f-df68-4a16-bc5c-522b2a589b00@amazon.de>
 <20210218150158.28265-1-nmanthey@amazon.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d3a067d-3071-5c81-ee1f-0615f770c9fb@suse.com>
Date: Fri, 19 Feb 2021 14:44:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210218150158.28265-1-nmanthey@amazon.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.02.2021 16:01, Norbert Manthey wrote:
> To prevent leaking HVM params via L1TF and similar issues on a
> hyperthread pair, let's load values of domains only after performing all
> relevant checks, and blocking speculative execution.
> 
> For both get and set, the value of the index is already checked in the
> outer calling function. The block_speculation calls in hvmop_get_param
> and hvmop_set_param are removed, because is_hvm_domain already blocks
> speculation.
> 
> Furthermore, speculative barriers are re-arranged to make sure we do not
> allow guests running on co-located VCPUs to leak hvm parameter values of
> other domains.
> 
> To improve symmetry between the get and set operations, function
> hvmop_set_param is made static.
> 
> This is part of the speculative hardening effort.
> 
> Signed-off-by: Norbert Manthey <nmanthey@amazon.de>
> Reported-by: Hongyan Xia <hongyxia@amazon.co.uk>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

