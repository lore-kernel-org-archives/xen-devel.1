Return-Path: <SRS0=BMSw=HM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF6EC433DB
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 17:04:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 296A864E02
	for <xen-devel@archiver.kernel.org>; Wed, 10 Feb 2021 17:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 296A864E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.83671.156316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9suF-00039A-8v; Wed, 10 Feb 2021 17:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83671.156316; Wed, 10 Feb 2021 17:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9suF-000392-5k; Wed, 10 Feb 2021 17:03:59 +0000
Received: by outflank-mailman (input) for mailman id 83671;
 Wed, 10 Feb 2021 17:03:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jO30=HM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l9suD-00038x-AL
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 17:03:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77678fe8-8068-410c-9e22-03e0a340576e;
 Wed, 10 Feb 2021 17:03:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A28ADB03A;
 Wed, 10 Feb 2021 17:03:55 +0000 (UTC)
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
X-Inumbo-ID: 77678fe8-8068-410c-9e22-03e0a340576e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612976635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KDV7ZGWbjJ9DTIyUn+4dStievokp69P2suXiHdXyUjk=;
	b=Sbh8eXgmg0ys/X12SnaQBbu1evAj3G1FBso4x5jPvgK5Oq0D1+QLrtgsn5/GTO+YxGZ6Kv
	kr6SBqX8/ZU7ASQyYvyeE3v2h1RaG1TmEpWzdb8vmakgNVT/BqEWvTHxEY9HNH3I1FMJoC
	1u8kKVbAER0B1F4mNHBrrzfd/G2UAHE=
Subject: Re: [PATCH] VMX: use a single, global APIC access page
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1b6a411b-84e7-bfb1-647e-511a13df838c@suse.com>
 <3c7a4cff-3f11-22e1-ed46-e76f62cc08f4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e86499f9-8849-1d52-06b0-5cce224f4319@suse.com>
Date: Wed, 10 Feb 2021 18:03:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3c7a4cff-3f11-22e1-ed46-e76f62cc08f4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.02.2021 18:00, Andrew Cooper wrote:
> On 10/02/2021 16:48, Jan Beulich wrote:
>> The address of this page is used by the CPU only to recognize when to
>> instead access the virtual APIC page instead. No accesses would ever go
>> to this page. It only needs to be present in the (CPU) page tables so
>> that address translation will produce its address as result for
>> respective accesses.
>>
>> By making this page global, we also eliminate the need to refcount it,
>> or to assign it to any domain in the first place.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> How certain are you about this?

The documentation (I'm inclined to say: unexpectedly) is very
clear about this; I don't think it had been this clear back at
the time. I'm hoping for Kevin to shout if he's aware of issues
here.

I've also gone through many of our emulation code paths (I
think I caught all relevant ones), and found them all having
suitable guards in place. (This process was why took until the
evening to have a patch ready.)

Jan

