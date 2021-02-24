Return-Path: <SRS0=y6zA=H2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CB5C433DB
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 13:13:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF8564E02
	for <xen-devel@archiver.kernel.org>; Wed, 24 Feb 2021 13:13:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF8564E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.89341.168178 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEtyZ-0000j2-3o; Wed, 24 Feb 2021 13:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89341.168178; Wed, 24 Feb 2021 13:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEtyZ-0000iv-0f; Wed, 24 Feb 2021 13:13:11 +0000
Received: by outflank-mailman (input) for mailman id 89341;
 Wed, 24 Feb 2021 13:13:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F+xl=H2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lEtyY-0000iq-48
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 13:13:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1077222e-611f-430c-9288-03a61bfc8036;
 Wed, 24 Feb 2021 13:13:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87C7FAD5C;
 Wed, 24 Feb 2021 13:13:08 +0000 (UTC)
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
X-Inumbo-ID: 1077222e-611f-430c-9288-03a61bfc8036
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614172388; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzb7zSTkowCxI+A5AcIjZbqI8LQRoZv21PHhkyOy+/M=;
	b=deHDvbcZE1DNpf5pi8HxCDboxPF+Gdj/1ZZunK0juw//Ohs57+Rvyg8Ud4dV7DYbZoJpwq
	4MbAOnvi4tncxtWDBhyCMHbjjBOOVbqrlDDSdMBKmxhMQ/xT7doLk7qSBo5mYibye4kIIv
	W/tEPQl6AAm38O5pm233Gk/tAj4i3B4=
Subject: Re: [PATCH 2/2] hvmloader: do not include system headers for type
 declarations
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210224102641.89455-1-roger.pau@citrix.com>
 <20210224102641.89455-3-roger.pau@citrix.com>
 <fb677f29-2b21-aaf1-1127-6774fb8e91e9@suse.com>
 <YDY+tvs9Llf5K8Da@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f9f7fc3-110b-f73e-20b5-c0ef311c458c@suse.com>
Date: Wed, 24 Feb 2021 14:13:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDY+tvs9Llf5K8Da@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 24.02.2021 13:01, Roger Pau Monné wrote:
> On Wed, Feb 24, 2021 at 11:51:39AM +0100, Jan Beulich wrote:
>> On 24.02.2021 11:26, Roger Pau Monne wrote:
>>> --- /dev/null
>>> +++ b/tools/firmware/hvmloader/types.h
>>> @@ -0,0 +1,47 @@
>>> +#ifndef _HVMLOADER_TYPES_H_
>>> +#define _HVMLOADER_TYPES_H_
>>> +
>>> +typedef unsigned char uint8_t;
>>> +typedef signed char int8_t;
>>> +
>>> +typedef unsigned short uint16_t;
>>> +typedef signed short int16_t;
>>> +
>>> +typedef unsigned int uint32_t;
>>> +typedef signed int int32_t;
>>> +
>>> +typedef unsigned long long uint64_t;
>>> +typedef signed long long int64_t;
>>
>> I wonder if we weren't better of not making assumptions on
>> short / int / long long, and instead use
>> __attribute__((__mode__(...))) or, if available, the compiler
>> provided __{,U}INT*_TYPE__.
> 
> Oh, didn't know about all this fancy stuff.
> 
> Clang doens't seem to support the same mode attributes, for example
> QImode is unknown, and that's just on one version of clang that I
> happened to test on.

Oh, these modes have been available even in gcc 3.x. I thought
Clang was claiming to be 4.4(?) compatible.

> Using __{,U}INT*_TYPE__ does seem to be supported on the clang version
> I've tested with, so that might be an option if it's supported
> everywhere we care about. If we still need to keep the current typedef
> chunk for fallback purposes then I see no real usefulness of using
> __{,U}INT*_TYPE__.

Fair point. And they're available from 4.5 onwards only. So
just __SIZE_TYPE__ has been available for long enough. As said
in reply to Ian I think we at least want to use that one (and
I guess in the hypervisor we may want to drop the fallback).

Jan

