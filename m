Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517BAC83F37
	for <xen-devel@archiver.kernel.org>; Thu, 31 Aug 2023 19:50:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.594074.927264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnfv-0005Bp-0b; Thu, 31 Aug 2023 19:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594074.927264; Thu, 31 Aug 2023 19:49:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnfu-0005Bi-Te; Thu, 31 Aug 2023 19:49:54 +0000
Received: by outflank-mailman (input) for mailman id 594074;
 Thu, 31 Aug 2023 19:49:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z9zM=EQ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qbnft-0005Bc-Si
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 19:49:53 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b65d879-4837-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 21:49:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F18868285624;
 Thu, 31 Aug 2023 14:49:48 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4ZOCd8slDnMp; Thu, 31 Aug 2023 14:49:48 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id EB6798285635;
 Thu, 31 Aug 2023 14:49:47 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 4CHshZjnMg4m; Thu, 31 Aug 2023 14:49:47 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 835F48285624;
 Thu, 31 Aug 2023 14:49:47 -0500 (CDT)
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
X-Inumbo-ID: 8b65d879-4837-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com EB6798285635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693511388; bh=X395NFwsoxwfQtGIXHCF/XLCrk20LM846z6XYvJlR78=;
	h=Message-ID:Date:MIME-Version:From:To;
	b=t3LY2itVOKwSZl1/PkAPQ8+jQaHQlwjpnsS5j+wLb9djcnqK1ZSkiQpgT4sSkHtuv
	 p1n0g6S17dWtka5H17qk0j7a8ixX7d2byc6s1yKuTWNeoRQxaBnSp0FsnZwougmXSX
	 chGo+RjMubFusaPsWQ9HRJayjCICKUXNDxrE4s/I=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <711b7458-b914-522d-d05f-c61d670b254d@raptorengineering.com>
Date: Thu, 31 Aug 2023 14:49:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 3/8] xen/ppc: Implement atomic.h
Content-Language: en-US
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1692816595.git.sanastasio@raptorengineering.com>
 <6d97bdeb1c114026105e72c6ee6e1b024565bf95.1692816595.git.sanastasio@raptorengineering.com>
 <257cd320-fe81-f1be-f3e5-ef43e539660a@suse.com>
 <80aa376b-137d-b799-cc3e-4e080abc2500@raptorengineering.com>
In-Reply-To: <80aa376b-137d-b799-cc3e-4e080abc2500@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/31/23 12:47 PM, Shawn Anastasio wrote:
> On 8/29/23 8:43 AM, Jan Beulich wrote:
>> On 23.08.2023 22:07, Shawn Anastasio wrote:
>>> +#define read_atomic(p)                                                         \
>>> +    ({                                                                         \
>>> +        union {                                                                \
>>> +            typeof(*(p)) val;                                                  \
>>> +            char c[0];                                                         \
>>
>> Using [0] here is likely to set us up for compiler complaints ...
>>
> 
> AIUI zero-length members are explicitly permitted as a GNU extension,
> but their usage here wasn't an explicit choice on my part as this macro
> was inherited from arm's atomic.h. See below.
> 
>>> +        } x_;                                                                  \
>>> +        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
>>
>> ... here. Can't this simply be c[sizeof(*(val))]? And do you need
>> a union here in the first place, when read_atomic() takes void* as
>> its 2nd parameter?
>>
> 
> Yes, I should have taken a closer look at this before importing it from
> arm. The type punning does seem entirely redundant given that
> read_atomic_size takes a void* -- I'm not sure why it was written this
> way to begin with.
> 
> In any case, I'll do away with the unnecessary union.

Quick follow up -- I think I now understand why it was written this way.
Callers are allowed to pass const pointers to read_atomic, but if the
macro just declared a local variable using typeof(*(p)), the resulting
variable would keep the const qualifier and thus be unpassable to
read_atomic_size.

It also appears that using standard C flexible array members inside of
unions isn't permitted, but the GNU 0-length array construct is. Of
course, declaring c's length as sizeof(*(p)) as you suggested works too.

As for getting rid of the union entirely then, it still ensures that
that the resulting variable has the correct alignment. We could
alternatively add an __aligned(__alignof__(*(p))) or similar to a bare
array declaration to achieve the same effect.

I think for now, I'll just leave it as-is with the union but replace the
0-length array with an array of the correct size.

Thanks,
Shawn

