Return-Path: <SRS0=iyTO=JM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0AA8C433ED
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 14:32:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 516DC611CD
	for <xen-devel@archiver.kernel.org>; Thu, 15 Apr 2021 14:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 516DC611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.111301.212861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX32L-0001Lo-NI; Thu, 15 Apr 2021 14:32:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111301.212861; Thu, 15 Apr 2021 14:32:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX32L-0001Lh-KK; Thu, 15 Apr 2021 14:32:05 +0000
Received: by outflank-mailman (input) for mailman id 111301;
 Thu, 15 Apr 2021 14:32:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lX32J-0001Lc-I1
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:32:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f18d728-6f08-4b9e-91b7-b73037d5d50e;
 Thu, 15 Apr 2021 14:32:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6C7ADB08C;
 Thu, 15 Apr 2021 14:32:01 +0000 (UTC)
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
X-Inumbo-ID: 5f18d728-6f08-4b9e-91b7-b73037d5d50e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618497121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HV5IjmRketPtETJcxwA0VcHFqdedR5sscSBS5gWQYbk=;
	b=dG9+dEg76iBlZFhVK1L4Ppbc9NfV6pYt7oDBVEmvp73OCj7rHlYj/2mILAlWCgzwCPTIiN
	MRFF5Y372QMtBZzlalb5IFaGlOseq2CQs330/VVBlqSj4JC1NGO4FKjg2NJQkRx+vzBr9U
	eLXSaNP7S5ngZhxVlFYdRTN8LmbRf1A=
Subject: Re: [PATCH v3 14/15] xen/decompress: drop STATIC and INIT
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <b9410d49-8767-a6f2-ccbe-c94e451c60ba@suse.com>
 <e36f9026-edb6-5eb3-fdb2-cd00750b3ee7@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <39c092fe-052c-5900-74ef-310e0ae15453@suse.com>
Date: Thu, 15 Apr 2021 16:32:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <e36f9026-edb6-5eb3-fdb2-cd00750b3ee7@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 16:21, Julien Grall wrote:
> On 26/01/2021 09:53, Jan Beulich wrote:
>> All users have been removed in earlier changes.
> 
> This is not entirely correct given there is a still a user of...
> 
>>
>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v3: New.
>>
>> --- a/xen/arch/arm/efi/efi-dom0.c
>> +++ b/xen/arch/arm/efi/efi-dom0.c
>> @@ -28,7 +28,7 @@
>>   #include <asm/setup.h>
>>   #include <asm/acpi.h>
>>   #include "../../../common/decompress.h"
>> -#define XZ_EXTERN STATIC
>> +#define XZ_EXTERN static
> 
> STATIC here. So maybe you want to say "all but one users"?

Sigh. Of course I re-word this. But does it really matter? The
more that the thing here is more of an abuse than a proper use
anyway? I didn't create this hackery ... In fact this odd use
is why I made this a separate patch in the first place.

> Also, for consistency, I think you want to either remove INITDATA here 
> or remove INIT in the patch that drop the last user.

See my other reply - what matters, I think, is a consistent
end result. I would really like to ask that I be left with some
room on how precisely to get there.

Jan

