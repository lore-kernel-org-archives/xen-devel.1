Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75C2C04A68
	for <xen-devel@archiver.kernel.org>; Thu, 28 Jul 2022 14:45:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.376866.609917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4lk-0008RW-Sp; Thu, 28 Jul 2022 14:45:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 376866.609917; Thu, 28 Jul 2022 14:45:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oH4lk-0008RP-Q0; Thu, 28 Jul 2022 14:45:44 +0000
Received: by outflank-mailman (input) for mailman id 376866;
 Thu, 28 Jul 2022 14:45:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oH4li-0008Pm-Q7
 for xen-devel@lists.xenproject.org; Thu, 28 Jul 2022 14:45:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH4lf-0002lo-Jk; Thu, 28 Jul 2022 14:45:39 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.7.237.22])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oH4lf-0000fy-BQ; Thu, 28 Jul 2022 14:45:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=F4RkZYsg5KEbgHRUPq0SUii4Djdzt7wqKp/WoaBC7ec=; b=5Q/ea2QOl3phIcSnxkDxRL024O
	MnKR/1TE7sLWKHhcjrZxZBTw15iwkIsSRefgyeDqRkrvWDtNGh3o1WCLF88byltJt20AC7M8c5LQM
	0xwyL5Ku9Pui+3KpVPP7l9RVtyYVNmZ7TLrupLGh291L70CGROCetzm4BIJmyi/UC508=;
Message-ID: <893c3cb3-7366-d161-b2a0-9cf88765002d@xen.org>
Date: Thu, 28 Jul 2022 15:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH] xen/arm64: sysreg.h: Fix MISRA C 2012 Rule 20.7 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20220728134943.1185621-1-burzalodowa@gmail.com>
 <818c0331-ae00-d0f6-327f-56606514aaca@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <818c0331-ae00-d0f6-327f-56606514aaca@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/07/2022 15:17, Jan Beulich wrote:
> On 28.07.2022 15:49, Xenia Ragiadakou wrote:
>> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
>> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
>> @@ -461,7 +461,7 @@
>>   /* Access to system registers */
>>   
>>   #define WRITE_SYSREG64(v, name) do {                    \
>> -    uint64_t _r = v;                                    \
>> +    uint64_t _r = (v);                                              \
>>       asm volatile("msr "__stringify(name)", %0" : : "r" (_r));       \
> 
> Out of curiosity - why is the intermediate variable necessary?
> Can't v be used directly in the asm(), possibly with a suitable
> modifier added to %0 such that it'll always be x<N> (and not
> w<N>) which is used as the operand to "msr"?

It should be possible to use %x0. However, We may need to use (uint64_t)(v).

Linux seems to be use it, but IIRC they are not supported GCC versions 
as old as ours. So we would want to check when %x0 was introduced.

Cheers,

-- 
Julien Grall

