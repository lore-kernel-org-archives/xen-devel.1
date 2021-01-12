Return-Path: <SRS0=tjso=GP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EE7DC433DB
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 08:16:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A7F22D2C
	for <xen-devel@archiver.kernel.org>; Tue, 12 Jan 2021 08:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0A7F22D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.65517.116091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzEqG-0003yU-RE; Tue, 12 Jan 2021 08:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65517.116091; Tue, 12 Jan 2021 08:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzEqG-0003yN-O4; Tue, 12 Jan 2021 08:15:52 +0000
Received: by outflank-mailman (input) for mailman id 65517;
 Tue, 12 Jan 2021 08:15:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5SK+=GP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzEqF-0003yI-Qw
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 08:15:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee41851b-40f5-4dea-9c22-9234ed863497;
 Tue, 12 Jan 2021 08:15:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B8D3AC8F;
 Tue, 12 Jan 2021 08:15:50 +0000 (UTC)
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
X-Inumbo-ID: ee41851b-40f5-4dea-9c22-9234ed863497
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610439350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zII9M9QSufcz4S6YwYSd3FgIAsBw1zJ2xqw/D6Glj+Q=;
	b=ig91B1eRFdaAZoOjiPdu02jbl6ydblLe2lu7Z7oqHkzoWYNMXdikExZPGyk0zSIa1GbQiC
	emJO1hDkcMRKSLA5tFaf/jNi8N0yGhcqOKdTset4kxwxk49tPjm00sM0IJq4IrZf54846Y
	EY/t0rvCFP9iwGrD4988q+OHmt6wGUE=
Subject: Re: [PATCH v2 02/11] xen/gnttab: Rework resource acquisition
To: Andrew Cooper <amc96@cam.ac.uk>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?=
 <michal.leszczynski@cert.pl>, Hubert Jasudowicz <hubert.jasudowicz@cert.pl>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <20200922182444.12350-1-andrew.cooper3@citrix.com>
 <20200922182444.12350-3-andrew.cooper3@citrix.com>
 <538236fd-af25-9e35-8f44-3125fe71e4bd@suse.com>
 <a2c77b68-5434-836d-40e4-40fb037617d5@cam.ac.uk>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ee919a3-87db-a0b0-2637-319c0ea237c8@suse.com>
Date: Tue, 12 Jan 2021 09:15:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <a2c77b68-5434-836d-40e4-40fb037617d5@cam.ac.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.01.2021 22:22, Andrew Cooper wrote:
> On 25/09/2020 14:17, Jan Beulich wrote:
>> On 22.09.2020 20:24, Andrew Cooper wrote:
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
>>> +    if ( !nr_frames )
>>> +        return -EINVAL;
>> I continue to object to this becoming an error.
> 
> It's not a path any legitimate caller will ever exercise.  POSIX defines
> any mmap() of zero length to be an error, and I completely agree.
> 
> The problem isn't, per say, with accepting bogus arguments.  It is the
> quantity of additional complexity in the hypervisor required to support
> accepting the bogus input cleanly.

Is there any, besides s/-EINVAL/0/ for the line above?

> There are exactly 2 cases where 0 might be found here.  Either the
> caller passed it in directly (and bypassed the POSIX check which would
> reject the attempt), or some part of multi-layer continuation handling
> went wrong on the previous iteration.
> 
> For this hypercall (by the end of the series), _acquire_resource()
> returning 0 is specifically treated as an error so we don't livelock in
> 32-chunking loop until some other preemption kicks in.
> 
> In this case, the check isn't actually necessary because it is (will be)
> guarded higher up the call chain in a more general way, but I'm not
> interested in adding unnecessary extra complexity (to area I've had to
> rewrite from scratch to remove the bugs) simply to support a
> non-existent usecase.

In a couple of cases you've been calling out the principle of least
surprise. This holds for the entirety of batched (in whatever form)
hypercalls then as well. Either zero elements means "no-op"
everywhere, or it gets treated as an error everywhere. Anything
else is inconsistent and hence possibly surprising.

To be clear - if others agree with your view, I'm not meaning to
NAK the change in this form. But I'm also not going to knowingly
ack introduction of inconsistencies.

Jan

