Return-Path: <SRS0=BiGO=H3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE50C433E0
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 10:19:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC2E364F0C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Feb 2021 10:19:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC2E364F0C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89666.169073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFDk6-0006Io-Sf; Thu, 25 Feb 2021 10:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89666.169073; Thu, 25 Feb 2021 10:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFDk6-0006Ih-P8; Thu, 25 Feb 2021 10:19:34 +0000
Received: by outflank-mailman (input) for mailman id 89666;
 Thu, 25 Feb 2021 10:19:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qWJX=H3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lFDk4-0006Ic-Mf
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 10:19:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3e6e872-b892-4476-8c48-e108d6c3a3e8;
 Thu, 25 Feb 2021 10:19:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F038FAAAE;
 Thu, 25 Feb 2021 10:19:30 +0000 (UTC)
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
X-Inumbo-ID: a3e6e872-b892-4476-8c48-e108d6c3a3e8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614248371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m73X+LwRZuFfbm71MWvE8ALc2KkR1M0XHtMc333OiRA=;
	b=aNZnwRmvF75NwyPEf9JKvAL7kBFwlYCZV+kdpBliDxs1GNrPxdL0pCjuhh5RbV1YDj7ytY
	egbD+ldPOn4ecxP7AW9I9d5I73xSLpjCHD87xPRzWvScx/Rye6Fw3LmbqrcvoXBwRKaKNW
	Fy6gmBfZA9ACs0Y/0fGB5Pz2pxhXb9A=
Subject: Re: [PATCH 0/2] hvmloader: drop usage of system headers
To: Ian Jackson <iwj@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <35864c33-b375-a3c6-13bc-ad1e7d0773eb@citrix.com>
 <61932477-d44c-5592-da3f-b0b5ff5c6321@suse.com>
 <24631.29417.501638.284615@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b53d52ea-6fea-8f4d-3993-010ea796fbdc@suse.com>
Date: Thu, 25 Feb 2021 11:19:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24631.29417.501638.284615@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.02.2021 10:50, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 0/2] hvmloader: drop usage of system headers"):
>> On 24.02.2021 21:08, Andrew Cooper wrote:
>>> After some experimentation in the arch container
> ...
>>> while the freestanding form with `gcc -ffreestanding -m32 -E` is:
> ...
>>> # 34 "/usr/lib/gcc/x86_64-pc-linux-gnu/8.3.0/include/stdint-gcc.h" 3 4
>>> typedef signed char int8_t;
>>> ...
> 
> Um, but what size is size_t ?
> 
> In particular, note that that path contains nothing to do with 32-bit
> so I think it is probably the wrong bitness.

The path doesn't need to include anything bitness specific, when
the headers can deal with both flavors.

>> Why "more subtle"? All we're lacking is -ffreestanding. The
>> question is whether it is an acceptably risky thing to do at
>> this point in the release cycle to add the option.
> 
> If -ffreestanding DTRT then I think it's about as risky as the fix I
> already approved and we have merged...

It would do the right thing, except Roger found Alpine has another
anomaly undermining this (and breaking -ffreestanding itself).

As an aside I'm not sure what you refer to with "we have merged":
So far only patch 1 of this series (plus its fixup) has gone in.

Jan

