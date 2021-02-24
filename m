Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E686C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 11:13:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C51E264E83
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 11:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C51E264E83
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89270.168036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEs6v-000513-On; Wed, 24 Feb 2021 11:13:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89270.168036; Wed, 24 Feb 2021 11:13:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEs6v-00050w-Lb; Wed, 24 Feb 2021 11:13:41 +0000
Received: by outflank-mailman (input) for mailman id 89270;
 Wed, 24 Feb 2021 11:13:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEs6t-00050r-QA
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 11:13:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5b5dbc4d-3514-436c-978b-5f2e3512683d;
 Wed, 24 Feb 2021 11:13:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 017D7ADF0;
 Wed, 24 Feb 2021 11:13:38 +0000 (UTC)
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
X-Inumbo-ID: 5b5dbc4d-3514-436c-978b-5f2e3512683d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614165218; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KVtRyWlNUTJ6sD30gcEEEJyG/aGwIaj9/tz5k+zVB4o=;
	b=bKP2ap80OjqOSblZVfzc7nX+BO6zQbNEWsreU0QPE0xngWDnvW2/BxHbm4vqJ0x/D7XDBG
	ITwzPS4JuCu78dK7jnOAL0fzOGmqFbOFoc73iy/exhAPShRfVNSCuLiZ5s6HNh831A0Qz8
	HdVu1q/sDbCOaiWmAsBg7/3CGFrgnqg=
Subject: Re: [PATCH v2 0/8] x86/PV: avoid speculation abuse through guest
 accessors
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <b466a19e-e547-3c7c-e39b-1a4c848a053a@suse.com>
 <24623.56913.290437.499946@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce93bd48-7ef3-cdb1-9429-ccd894895e9e@suse.com>
Date: Wed, 24 Feb 2021 12:13:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24623.56913.290437.499946@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.02.2021 16:50, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH v2 0/8] x86/PV: avoid speculation abuse through guest accessors"):
>> Re-sending primarily for the purpose of getting a release ack, an
>> explicit release nak, or an indication of there not being a need,
>> all for at least the first three patches here (which are otherwise
>> ready to go in). I've dropped the shadow part of the series from
>> this re-submission, because it has all got reviewed by Tim already
>> and is intended for 4.16 only anyway. I'm re-including the follow
>> up patches getting the code base in consistent shape again, as I
>> continue to think this consistency goal is at least worth a
>> consideration towards a freeze exception.
>>
>> 1: split __{get,put}_user() into "guest" and "unsafe" variants
>> 2: split __copy_{from,to}_user() into "guest" and "unsafe" variants
>> 3: PV: harden guest memory accesses against speculative abuse
> 
> These three:
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> On the grounds that this is probably severe enough to be a blocking
> issue for 4.15.
> 
>> 4: rename {get,put}_user() to {get,put}_guest()
>> 5: gdbsx: convert "user" to "guest" accesses
>> 6: rename copy_{from,to}_user() to copy_{from,to}_guest_pv()
>> 7: move stac()/clac() from {get,put}_unsafe_asm() ...
>> 8: PV: use get_unsafe() instead of copy_from_unsafe()
> 
> These have not got a maintainer review yet.  To grant a release-ack
> I'd like an explanation of the downsides and upsides of taking this
> series in 4.15 ?
> 
> You say "consistency" but in practical terms, what will happen if the
> code is not "conxistent" in this sense ?
> 
> I'd also like to hear from aother hypervisor maintainer.

Meanwhile they have been reviewed by Roger. Are you willing to
give them, perhaps with the exception of 7, a release ack as
well?

Jan

