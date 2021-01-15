Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C70AC433DB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 16:26:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29CA2238EB
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 16:26:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29CA2238EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68424.122523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Rvb-0001oZ-Kw; Fri, 15 Jan 2021 16:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68424.122523; Fri, 15 Jan 2021 16:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Rvb-0001oS-Hs; Fri, 15 Jan 2021 16:26:23 +0000
Received: by outflank-mailman (input) for mailman id 68424;
 Fri, 15 Jan 2021 16:26:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Rva-0001oN-JC
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 16:26:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65e156ae-0077-49c6-b457-a1b51dfada14;
 Fri, 15 Jan 2021 16:26:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A3670B940;
 Fri, 15 Jan 2021 16:26:19 +0000 (UTC)
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
X-Inumbo-ID: 65e156ae-0077-49c6-b457-a1b51dfada14
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610727980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SIdTDljgKl3Zo6YfLpctNIJgzBSlYimOoMRsOnceHMU=;
	b=ZmxA/n/UPBpbIv371220ugZ+TsjGx3btxqOrpart2Qae/DfNoi/XiyYAtNVlQCorSy+NKL
	5gmZOCBXVWF7ZBmA3i5+JdGygG1w7i9g1fWgz8efPG9MKA82A/iUF1hrD3/mVRQK8Wy8d4
	L0/kBncFHII0fvoKajcjphw31HtBiz0=
Subject: Re: [PATCH v3 1/7] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
 <julien@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210112194841.1537-1-andrew.cooper3@citrix.com>
 <20210112194841.1537-2-andrew.cooper3@citrix.com>
 <ef50aefb-8171-6864-3286-29df1eb25201@suse.com>
 <f35145e3-2553-e03b-122f-87d52c6bc9fd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7695c88b-0c25-1a1e-19d5-e0a81f2288b2@suse.com>
Date: Fri, 15 Jan 2021 17:26:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <f35145e3-2553-e03b-122f-87d52c6bc9fd@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.01.2021 17:03, Andrew Cooper wrote:
> On 15/01/2021 11:43, Jan Beulich wrote:
>>> +    mfn_t tmp;
>>> +    void **vaddrs;
>>> +    int rc;
>>> +
>>> +    /* Overflow checks */
>>> +    if ( frame + nr_frames < frame )
>>> +        return -EINVAL;
>>> +
>>> +    tot_frames = frame + nr_frames;
>>> +    if ( tot_frames != frame + nr_frames )
>>> +        return -EINVAL;
>> Can't these two be folded into
>>
>>     unsigned int tot_frames = frame + nr_frames;
>>
>>     if ( tot_frames < frame )
>>         return -EINVAL;
>>
>> ? Both truncation and wrapping look to be taken care of this
>> way.
> 
> Not when frame is a multiple of 4G (or fractionally over, I think).

How that? In this case any unsigned int value will be less than
frame.

Jan

