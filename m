Return-Path: <SRS0=WHN/=I6=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E276BC433ED
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 15:30:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD656136B
	for <xen-devel@archiver.kernel.org>; Thu,  1 Apr 2021 15:30:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CD656136B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.104617.200317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzGZ-00035x-NV; Thu, 01 Apr 2021 15:29:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104617.200317; Thu, 01 Apr 2021 15:29:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzGZ-00035q-KT; Thu, 01 Apr 2021 15:29:51 +0000
Received: by outflank-mailman (input) for mailman id 104617;
 Thu, 01 Apr 2021 15:29:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRzGY-00035l-4P
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 15:29:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c554a93-b1e4-4b28-8bb5-04480519cf49;
 Thu, 01 Apr 2021 15:29:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AA1DB134;
 Thu,  1 Apr 2021 15:29:48 +0000 (UTC)
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
X-Inumbo-ID: 3c554a93-b1e4-4b28-8bb5-04480519cf49
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617290988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OCvwoiBCyqyqKnKXHA4+IbDKdMQAdVKqAzcU+8F6908=;
	b=HJS5m5NDhHCQw4nP8ANEVkz0pIjRo05BddJ4ImBMmq36CQbVw/MbR+OJfdThgcxQRGgnP9
	HeD7imCmVvlSenUvoKnt4M4lZ4aQ+RM3lPX1VkX0wt+WTIHKmGgrc9sBubkOeLYKaNQO4x
	o02sVmnZ3tiGWfX/qR0mU0lAahYCC+U=
Subject: Re: [PATCH] build: centralize / unify asm-offsets generation
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <fa340caa-4ee1-a302-fbf1-1df400493d6b@suse.com>
 <089e3ff0-5633-02b4-baac-328ea8618469@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7977e181-a2d4-42ac-2294-34a49f6812c3@suse.com>
Date: Thu, 1 Apr 2021 17:29:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <089e3ff0-5633-02b4-baac-328ea8618469@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2021 17:05, Julien Grall wrote:
> On 01/04/2021 09:33, Jan Beulich wrote:
>> --- a/xen/arch/arm/Makefile
>> +++ b/xen/arch/arm/Makefile
>> @@ -131,8 +131,8 @@ $(TARGET)-syms: prelink.o xen.lds
>>   		>$(@D)/$(@F).map
>>   	rm -f $(@D)/.$(@F).[0-9]*
>>   
>> -asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>> -	$(CC) $(filter-out -flto,$(c_flags)) -S -o $@ $<
>> +.PHONY: include
>> +include:
> 
>  From a generic PoV, this target is meant to generate arch-specific 
> include. Is that correct?

Yes, like is happening on x86 already.

Jan

