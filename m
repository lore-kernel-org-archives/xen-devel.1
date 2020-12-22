Return-Path: <SRS0=eaQF=F2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43238C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 07:50:31 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFB30225AB
	for <xen-devel@archiver.kernel.org>; Tue, 22 Dec 2020 07:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFB30225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.57660.100963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcQt-0003gF-UV; Tue, 22 Dec 2020 07:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57660.100963; Tue, 22 Dec 2020 07:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krcQt-0003g8-Pz; Tue, 22 Dec 2020 07:50:11 +0000
Received: by outflank-mailman (input) for mailman id 57660;
 Tue, 22 Dec 2020 07:50:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9/vU=F2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1krcQs-0003g2-5K
 for xen-devel@lists.xenproject.org; Tue, 22 Dec 2020 07:50:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12e7aba3-4278-413e-b663-91b8956623e3;
 Tue, 22 Dec 2020 07:50:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D7CBAD5C;
 Tue, 22 Dec 2020 07:50:08 +0000 (UTC)
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
X-Inumbo-ID: 12e7aba3-4278-413e-b663-91b8956623e3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608623408; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sEhkxx0qP1O3PJjv/Pls4ZqvC+Kqeb/UeF5x87ct/ZI=;
	b=keqtgod9xw/Lqu3/6i6y2tnOnlmISnl/R4UBADypf9EAYfqC2c/G9f+bVrFHArQjP/XQZm
	PohWHO26Sq34DJWPgrdcInOKMG9r8nLaPJnPiGReelzaadWFt8uEyIBieVhY9YfIa04CPA
	vNxkEBpcfCJd5XoKvKd8F8nix5Gom1s=
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
 <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
 <7edf2139-b63e-00c9-7172-524566f942ae@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <09fd7598-9899-9b4c-68ba-f90b3bc47d6f@suse.com>
Date: Tue, 22 Dec 2020 08:50:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <7edf2139-b63e-00c9-7172-524566f942ae@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.12.2020 19:45, Andrew Cooper wrote:
> On 21/12/2020 18:36, Julien Grall wrote:
>>> @@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
>>>       if ( init_status & INIT_watchdog )
>>>           watchdog_domain_destroy(d);
>>>   +    /* Must not hit a continuation in this context. */
>>> +    ASSERT(domain_teardown(d) == 0);
>> The ASSERT() will become a NOP in production build, so
>> domain_teardown_down() will not be called.
> 
> Urgh - its not really a nop, but it's evaluation isn't symmetric between
> debug and release builds.  I'll need an extra local variable.

Or use ASSERT_UNREACHABLE(). (I admit I don't really like the
resulting constructs, and would like to propose an alternative,
even if I fear it'll be controversial.)

>> However, I think it would be better if we pass an extra argument to
>> indicated wheter the code is allowed to preempt. This would make the
>> preemption check more obvious in evtchn_destroy() compare to the
>> current d->is_dying != DOMDYING_dead.
> 
> We can have a predicate if you'd prefer, but plumbing an extra parameter
> is wasteful, and can only cause confusion if it is out of sync with
> d->is_dying.

I agree here - it wasn't so long ago that event_channel.c gained
a DOMDYING_dead check, and I don't see why we shouldn't extend
this approach to here and elsewhere.

Jan

