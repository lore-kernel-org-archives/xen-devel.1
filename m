Return-Path: <SRS0=tjso=GP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06845C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 08:23:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 886C222D2C
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 08:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 886C222D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65523.116103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzExJ-0004vi-Mm; Tue, 12 Jan 2021 08:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65523.116103; Tue, 12 Jan 2021 08:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzExJ-0004vb-Jq; Tue, 12 Jan 2021 08:23:09 +0000
Received: by outflank-mailman (input) for mailman id 65523;
 Tue, 12 Jan 2021 08:23:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzExI-0004vW-QT
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 08:23:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc69257b-c6e6-4764-b146-e8fa50bd035d;
 Tue, 12 Jan 2021 08:23:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8839BAB92;
 Tue, 12 Jan 2021 08:23:06 +0000 (UTC)
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
X-Inumbo-ID: bc69257b-c6e6-4764-b146-e8fa50bd035d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610439786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a34Q1WgdjaP4QeGfzlWX8WNqakxdyUzzaghRNANCFcE=;
	b=cyAlvUW795eRsiOTEFuNtfPwfIp6/TxZnX4reWtJk0dvf7jBuLxhqqVpKNV7lP5uI/H17x
	fnfLBMJ3qVdJ6+jPU68YMdtWml6L0H9xYslG1uU0nwlmmxkmwGZD1fSA0P6iT9acs3GPyk
	PimiVU1/Fl222J7JIYMDRVEEGNkT/hQ=
Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien@xen.org>,
 =?UTF-8?B?J01pY2hhxYIgTGVzemN6ecWEc2tpJw==?= <michal.leszczynski@cert.pl>,
 'Hubert Jasudowicz' <hubert.jasudowicz@cert.pl>,
 'Tamas K Lengyel' <tamas@tklengyel.com>,
 'Xen-devel' <xen-devel@lists.xenproject.org>, paul@xen.org
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
 <001601d69258$4d6a7c90$e83f75b0$@xen.org>
 <835893e1-fcd0-efa1-86ce-02af70dd1101@cam.ac.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eb3bf50-d1dc-e010-16d0-261f7562a140@suse.com>
Date: Tue, 12 Jan 2021 09:23:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <835893e1-fcd0-efa1-86ce-02af70dd1101@cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 22:22, Andrew Cooper wrote:
> On 24/09/2020 10:51, Paul Durrant wrote:
>>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>>> index a5d3ed8bda..912f07be47 100644
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4013,6 +4013,81 @@ static int gnttab_get_shared_frame_mfn(struct domain *d,
>>>      return 0;
>>>  }
>>>
>>> +int gnttab_acquire_resource(
>>> +    struct domain *d, unsigned int id, unsigned long frame,
>>> +    unsigned int nr_frames, xen_pfn_t mfn_list[])
>>> +{
>>> +    struct grant_table *gt = d->grant_table;
>>> +    unsigned int i = nr_frames, tot_frames;
>>> +    mfn_t tmp;
>>> +    void **vaddrs = NULL;
>>> +    int rc;
>>> +
>>> +    /* Input sanity. */
>> Nit: inconsistency with full stops on single line comments.
> 
> The whole point of relaxing the style was because feedback over minutia
> such as this was deemed detrimental to the community.
> 
> If I ever see feedback like this, I will commit commit the patch there
> and then.  This is the only way upstream Xen is going to turn into a
> less toxic environment for contributors.

Paul had clearly marked this as "nit". ./CODING_STYLE explicitly
allows omission as well as presence of a full stop here. So while
I agree with you that you'd be okay ignoring such a remark, I
also agree with Paul giving the remark if he's found a nearby
comment using the opposite variant. Besides relaxing requirements
where sensible, at least local consistency also helps avoid such
comments (now or for future contributors).

Jan

