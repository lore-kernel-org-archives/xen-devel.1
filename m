Return-Path: <SRS0=P/U6=NP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE8E5C4338F
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 15:23:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B312C6103C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Aug 2021 15:23:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B312C6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.171603.313119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYGs-0000zR-If; Tue, 24 Aug 2021 15:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171603.313119; Tue, 24 Aug 2021 15:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIYGs-0000zK-Fm; Tue, 24 Aug 2021 15:23:26 +0000
Received: by outflank-mailman (input) for mailman id 171603;
 Tue, 24 Aug 2021 15:23:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIYGr-0000zE-0S
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 15:23:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIYGq-0006HP-5T; Tue, 24 Aug 2021 15:23:24 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIYGp-0007VJ-VZ; Tue, 24 Aug 2021 15:23:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9VlB5y6xDyVqAewaB2KIPKiblcWJEolFShIMoFNvjsA=; b=TD9qWuGehWhWTY1eUkz/7yaeQX
	HIwoJ7uN1W//3ciYZZFYY0bzV+ovC7XR6IRNSG24PQsfbFFlDactngRsOUvlGcKQZiml13i1zextK
	AoP54JMA7ufF+z0KnhkXOMFg9PTdRxVg/IZvnVUy2vTy/bzSIdkks8in5fwyciw4KJms=;
Subject: Re: [XEN PATCH v7 10/51] build,arm: move LDFLAGS change to arch.mk
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-11-anthony.perard@citrix.com>
 <b5c93c83-1d32-c71b-c4c5-36d2fc00dfa2@xen.org> <YSUJfGcyBXxPNg8B@perard>
From: Julien Grall <julien@xen.org>
Message-ID: <6ac5daae-c3ee-4854-1480-111a9378e7ab@xen.org>
Date: Tue, 24 Aug 2021 16:23:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YSUJfGcyBXxPNg8B@perard>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Anthony,

On 24/08/2021 16:00, Anthony PERARD wrote:
> On Tue, Aug 24, 2021 at 01:50:33PM +0100, Julien Grall wrote:
>> Hi Anthony,
>>
>> Can you explain why this is moved?
> 
> Well, it was in the wrong place, it is best to avoid making changes to
> XEN_CFLAGS or XEN_LDFLAGS in Makefile in subdirectories as those are
> exported variable and may not work as expected. They may or may not
> change *flags in subdirectories, or in the case of arch/*/Makefile, they
> might changes *flags in the other directories or not depending on
> whether one try to build "xen" or just "common/".
> 
> But more importantly, with patch
>      build: set ALL_OBJS to main Makefile; move prelink.o to main Makefile
> make isn't going to load arch/*/Makefile before building the rest of
> xen, and thus changes to XEN_LDFLAGS will only apply to arch/*/Makefile
> rather than for all objects. (XEN_LDFLAGS is used with all built_in.o
> and few other places like for libfdt-temp.o)

Thanks for the explanation. That makes sense.

> 
> If you want an explanation in the commit message, maybe this one will
> do:
>      Changes to XEN_LDFLAGS may or may not apply to targets in for
>      example "common/" depending on whether one runs `make` or `make
>      common/`.
> 
>      But arch.mk is loaded before doing any build, so changes to LDFLAGS
>      there mean that the value of XEN_LDFLAGS won't depends on the
>      initial target.

An explanation in the commit message would be useful. This one you 
provided looks good. So:

Acked-by: Julien Grall <jgrall@amazon.com>

Can it be merged before the previous patch? If so, I can update the 
commit message and commit it.

Cheers,

-- 
Julien Grall

