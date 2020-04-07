Return-Path: <SRS0=FJpJ=5X=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50CADC2BB1D
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 09:07:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 278A6206F7
	for <xen-devel@archiver.kernel.org>; Tue,  7 Apr 2020 09:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 278A6206F7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLkBv-0007Dv-KH; Tue, 07 Apr 2020 09:06:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=71dA=5X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jLkBv-0007Dq-6t
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2020 09:06:43 +0000
X-Inumbo-ID: 18e4c1fa-78af-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18e4c1fa-78af-11ea-83d8-bc764e2007e4;
 Tue, 07 Apr 2020 09:06:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5EDCAC26;
 Tue,  7 Apr 2020 09:06:40 +0000 (UTC)
Subject: Re: [PATCH v2] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
To: Julien Grall <julien@xen.org>
References: <20200404130613.26428-1-julien@xen.org>
 <391ef401-b5d3-2f95-5fe3-c32f372dcc92@suse.com>
 <c3e3db55-46bf-8df9-a934-64543a23c80a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <814d1dba-980c-3436-842a-df504909e1f6@suse.com>
Date: Tue, 7 Apr 2020 11:06:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <c3e3db55-46bf-8df9-a934-64543a23c80a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.04.2020 11:01, Julien Grall wrote:
> Hi Jan,
> 
> On 06/04/2020 12:01, Jan Beulich wrote:
>> On 04.04.2020 15:06, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
>>> data to guest handle marked const.
>>>
>>> Thankfully, no users of the helper will do that. Rather than hoping this
>>> can be caught during review, harden copy_to_guest_offset() so the build
>>> will fail if such users are introduced.
>>>
>>> There is no easy way to check whether a const is NULL in C99. The
>>> approach used is to introduce an unused variable that is non-const and
>>> assign the handle. If the handle were const, this would fail at build
>>> because without an explicit cast, it is not possible to assign a const
>>> variable to a non-const variable.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> I'm not convinced it is a good idea to add (recurring) comments
>> like you do - there are more aspects of these macros that would
>> be worth commenting on, and commenting on some but not all may
>> give the wrong impression of all subtleties being covered (also
>> for others).
> 
> I thought you would say that, but I don't think I am the best
> person to describe all the other subtetly of the code. Yet I
> didn't want to not comment the oddity of using a maybe_unused
> variable.

Well, to me the "__maybe_unused" is telling enough.

>> In any event I'd like to ask that each header gain such a
>> comment only once, with the other being a tiny reference to the
>> one "complete" instance.
> 
> I am not entirely sure how this would look like. We would need
> to rely on _t having the same meaning across all the headers.
> This is quite easy to miss during review, so my preference
> still sticks to multiple comments.

Well, I did say "each header" exactly because of this.

> Although I can reduce the size of the comment to one on top
> of the definition of _t. Something like: "Check if the handler
> is not const".

Ah yes, that would seem better (with s/handler/handle/ of course).

Jan

