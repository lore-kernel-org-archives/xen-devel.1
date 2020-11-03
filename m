Return-Path: <SRS0=JyiM=EJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EB9C2D0A3
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 10:11:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CD86206B5
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2020 10:11:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xen.org header.i=@xen.org header.b="hvygHmXJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CD86206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.18171.43050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtHv-0000LK-T5; Tue, 03 Nov 2020 10:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18171.43050; Tue, 03 Nov 2020 10:11:39 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZtHv-0000LD-QE; Tue, 03 Nov 2020 10:11:39 +0000
Received: by outflank-mailman (input) for mailman id 18171;
 Tue, 03 Nov 2020 10:11:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RD1Y=EJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kZtHt-0000Ks-PI
 for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:11:37 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f73d4dfb-1def-4300-b6da-4f9a0286b198;
 Tue, 03 Nov 2020 10:11:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kZtHr-0007HG-Ul; Tue, 03 Nov 2020 10:11:35 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kZtHr-0003PE-K6; Tue, 03 Nov 2020 10:11:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=RD1Y=EJ=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kZtHt-0000Ks-PI
	for xen-devel@lists.xenproject.org; Tue, 03 Nov 2020 10:11:37 +0000
X-Inumbo-ID: f73d4dfb-1def-4300-b6da-4f9a0286b198
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f73d4dfb-1def-4300-b6da-4f9a0286b198;
	Tue, 03 Nov 2020 10:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4rLaVaOO907rpPajXsw1gY33QleW8696vrLdcGBlplU=; b=hvygHmXJDa7itQQl5lkKMggdEq
	XJ2CpbZArrExwnOphtq4WnJGWhWBS/prgo/3s6r6zkWLIX2Aperb9f4XK9gWGYN++X2YMsH1FwZBp
	VFPQgtf3e7v+S4XLkrBTSDcOK4hEbnQnR+qtZLfAK3MZ/4Ltj0Azenznqyza/gl0ndN4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kZtHr-0007HG-Ul; Tue, 03 Nov 2020 10:11:35 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kZtHr-0003PE-K6; Tue, 03 Nov 2020 10:11:35 +0000
Subject: Re: [PATCH v1 2/2] Define SOURCE_DATE_EPOCH based on git log
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Fr=c3=a9d=c3=a9ric_Pierret_=28fepitre=29?=
 <frederic.pierret@qubes-os.org>
References: <cover.1604156731.git.frederic.pierret@qubes-os.org>
 <8b0e8b8be9c77476ecc702a7c6216ba50659deec.1604156731.git.frederic.pierret@qubes-os.org>
 <396c2991-1a90-bc1a-70e7-eaaf62c309d8@xen.org>
 <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a855e71d-3610-0377-75e5-f08a02e96a25@xen.org>
Date: Tue, 3 Nov 2020 10:11:33 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <19a09f0e-c544-f122-b3af-881d132d7df9@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 03/11/2020 10:05, Jan Beulich wrote:
> On 03.11.2020 11:00, Julien Grall wrote:
>> Hi Frédéric,
>>
>> On 31/10/2020 15:14, Frédéric Pierret (fepitre) wrote:
>>> ---
>>>    xen/Makefile | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/xen/Makefile b/xen/Makefile
>>> index 30b1847515..4cc35556ef 100644
>>> --- a/xen/Makefile
>>> +++ b/xen/Makefile
>>> @@ -6,6 +6,8 @@ export XEN_EXTRAVERSION ?= -unstable$(XEN_VENDORVERSION)
>>>    export XEN_FULLVERSION   = $(XEN_VERSION).$(XEN_SUBVERSION)$(XEN_EXTRAVERSION)
>>>    -include xen-version
>>>    
>>> +export SOURCE_DATE_EPOCH	?= $(shell git log -1 --format=%ct 2>/dev/null)
>>
>> It is possible to download a tarball for Xen release (see [1]). They
>> don't contain the .git directory and therefore this command would fail.
>>
>> Should we fallback to "date" in this case?
> 
> Isn't this what already happens? The variable would be assigned
> an empty value in this case, wouldn't it?

My question was whether empty SOURCE_DATE_EPOCH is acceptable?

Looking at patch #1, the users of the variable will use "date" if it is 
empty. Why can't this behavior be common?

Cheers,

-- 
Julien Grall

