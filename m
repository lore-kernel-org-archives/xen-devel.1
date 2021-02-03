Return-Path: <SRS0=08Yz=HF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7A75C433DB
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 15:31:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 650A264F4D
	for <xen-devel@archiver.kernel.org>; Wed,  3 Feb 2021 15:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 650A264F4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.80954.148566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7K7b-0002dU-C1; Wed, 03 Feb 2021 15:31:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80954.148566; Wed, 03 Feb 2021 15:31:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7K7b-0002dN-8s; Wed, 03 Feb 2021 15:31:11 +0000
Received: by outflank-mailman (input) for mailman id 80954;
 Wed, 03 Feb 2021 15:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ulgz=HF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7K7Z-0002dI-S3
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 15:31:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1e336f85-fffd-4a54-af05-f1d98a279676;
 Wed, 03 Feb 2021 15:31:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFFD4B14C;
 Wed,  3 Feb 2021 15:31:07 +0000 (UTC)
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
X-Inumbo-ID: 1e336f85-fffd-4a54-af05-f1d98a279676
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612366267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hVz7R3R3FbScC3OBnxHSq/y6rko/K9bkHSZZKtpUDmI=;
	b=K0nUksY5+zdWXexcEY6vxVyfNLSXnNRwB4BHYzzqsjymV9uYawveuqrOK8F4l9Ip6iI0lA
	+VGhqy3PDfjsJhBGfi2IfZvnayy7XhKnHr/QW8x/f7bjuD2Lppi/MaLEp081w9DrIJ26XG
	RUZGH6Ld6JyOMhcgy0dW+0+VCggrRws=
Subject: Re: [PATCH] x86/string: correct memmove()'s forwarding to memcpy()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a23d148a-25d0-cc5b-6050-88345188ef5a@suse.com>
 <0d537de8-09f4-9971-466f-8bf42964171e@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1556e428-be59-2035-8406-a54576c4d41d@suse.com>
Date: Wed, 3 Feb 2021 16:31:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0d537de8-09f4-9971-466f-8bf42964171e@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.02.2021 16:01, Andrew Cooper wrote:
> On 03/02/2021 14:22, Jan Beulich wrote:
>> With memcpy() expanding to the compiler builtin, we may not hand it
>> overlapping source and destination. We strictly mean to forward to our
>> own implementation (a few lines up in the same source file).
>>
>> Fixes: 78825e1c60fa ("x86/string: Clean up x86/string.h")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I agree that the current logic is buggy, but I'm not sure this is an
> improvement.
> 
> You've switched from relying on GCC's builtin to operate forwards, to
> relying on Xen's implementation operating forwards.

Is there such a guarantee for the compiler builtin? If so - no
need for this patch indeed. But I couldn't find any doc saying
so.

> At the very least, can we get a code comment stating something like
> "depends on Xen's implementation operating forwards" ?

No problem at all.

>> ---
>> An alternative would be to "#undef memcpy" near the top of the file. But
>> I think the way it's done now is more explicit to the reader. An #undef
>> would be the only way if the macro was an object-like one.
> 
> I chose not to use undef's to avoid impacting the optimisation of other
> functions in this file.  I can't remember if this made a difference in
> practice.
> 
>> At least with gcc10 this does alter generated code: The builtin gets
>> expanded into a tail call, while after this change our memcpy() gets
>> inlined into memmove(). This would change again once we separate the 3
>> functions here into their own CUs for placing them in an archive.
> 
> As (perhaps) a tangent, how do we plan to provide x86-optimised versions
> in combination with the library work?

By specifying the per-arch lib.a first.

>  We're long overdue needing to
> refresh our fast-strings support to include fast rep-mov/stosb.

That's pretty much orthogonal to the code movement though.

Jan

