Return-Path: <SRS0=UfNL=D5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B583CC4363A
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 08:29:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E895221EB
	for <xen-devel@archiver.kernel.org>; Thu, 22 Oct 2020 08:28:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bXrR6ECZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E895221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.10261.27220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVVxp-0004Bu-PX; Thu, 22 Oct 2020 08:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10261.27220; Thu, 22 Oct 2020 08:28:49 +0000
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
	id 1kVVxp-0004Bn-MT; Thu, 22 Oct 2020 08:28:49 +0000
Received: by outflank-mailman (input) for mailman id 10261;
 Thu, 22 Oct 2020 08:28:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kVVxo-0004Bf-50
 for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:28:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f1ba4936-d556-4d11-b86f-072ff46a46ff;
 Thu, 22 Oct 2020 08:28:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 531E4AFA8;
 Thu, 22 Oct 2020 08:28:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=dfvK=D5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kVVxo-0004Bf-50
	for xen-devel@lists.xenproject.org; Thu, 22 Oct 2020 08:28:48 +0000
X-Inumbo-ID: f1ba4936-d556-4d11-b86f-072ff46a46ff
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f1ba4936-d556-4d11-b86f-072ff46a46ff;
	Thu, 22 Oct 2020 08:28:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603355326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ak4XkyQcVmIRaA1l0Rz4F8yZmad7xR9rPkb2Zs/I4w=;
	b=bXrR6ECZL37VdSqI0vbVU00hc8qxobp23r7xk9scCpOzO847J+xYSponAUnuU1AAaIy92H
	dWF/+ipteKPoLAHbzcWOadipU+15mcv73HClKvqBGugMCUoNjgWhxr2WMrxem55T6urPTr
	a95IHGfvdlCLfbV6wKdta6PHMmDYrAw=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 531E4AFA8;
	Thu, 22 Oct 2020 08:28:46 +0000 (UTC)
Subject: Re: [PATCH 4/5] xen/events: unmask a fifo event channel only if it
 was masked
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20201022074214.21693-1-jgross@suse.com>
 <20201022074214.21693-5-jgross@suse.com>
 <e6dcce7e-acfb-0ca1-8ff1-e303932bc3c5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <72cb09c0-4fc7-f02e-c1fb-314e5add381f@suse.com>
Date: Thu, 22 Oct 2020 10:28:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <e6dcce7e-acfb-0ca1-8ff1-e303932bc3c5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22.10.20 09:55, Jan Beulich wrote:
> On 22.10.2020 09:42, Juergen Gross wrote:
>> --- a/drivers/xen/events/events_fifo.c
>> +++ b/drivers/xen/events/events_fifo.c
>> @@ -236,6 +236,9 @@ static bool clear_masked_cond(volatile event_word_t *word)
>>   
>>   	w = *word;
>>   
>> +	if (!(w & (1 << EVTCHN_FIFO_MASKED)))
>> +		return true;
> 
> Maybe better move this ...
> 
>>   	do {
>>   		if (w & (1 << EVTCHN_FIFO_PENDING))
>>   			return false;
>>
> 
> ... into the loop, above this check?

Yes, that should be better.


Juergen


