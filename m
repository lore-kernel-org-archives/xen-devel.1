Return-Path: <SRS0=5QKt=ID=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAA5C433DB
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 13:48:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 751E364FF0
	for <xen-devel@archiver.kernel.org>; Fri,  5 Mar 2021 13:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 751E364FF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.93720.176870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAon-00010o-23; Fri, 05 Mar 2021 13:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 93720.176870; Fri, 05 Mar 2021 13:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lIAom-00010h-VI; Fri, 05 Mar 2021 13:48:36 +0000
Received: by outflank-mailman (input) for mailman id 93720;
 Fri, 05 Mar 2021 13:48:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lIAom-00010a-06
 for xen-devel@lists.xenproject.org; Fri, 05 Mar 2021 13:48:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIAok-00078z-6V; Fri, 05 Mar 2021 13:48:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lIAoj-0003W0-UY; Fri, 05 Mar 2021 13:48:34 +0000
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
	bh=dv+N6RdVDmczLpfjevY38fA9Jc+MVb2JB6pD52FpeZA=; b=WXNBY/AykSxch9tSX774p6J27/
	pyfxfWMuRqn5GS5u8aWsTjNHW5cjs8OzTmy/b1HfVfN7OpqiGnT1r4ezXNFAhwzw3F6hgp1XJG3zK
	hNpoZNwQcH2tlij+4TG+Z3dF3d8JY64gIgXpAA7rhpjvVlzHnP1ITlylxVFJkrb5bKtk=;
Subject: Re: [PATCH for-4.15 2/2] tools/xenstore: Check the format printf for
 xprintf() and barf{,_perror}()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>
Cc: raphning@amazon.co.uk, iwj@xenproject.org,
 Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210305124003.13582-1-julien@xen.org>
 <20210305124003.13582-3-julien@xen.org>
 <0994b7a0-c537-b312-b134-caf54c79c87f@suse.com>
 <74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7eb12174-3268-ccdb-df9c-c4fe23d3a332@xen.org>
Date: Fri, 5 Mar 2021 13:48:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <74568cd7-143b-48ad-b9be-bf4229655376@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 05/03/2021 13:45, Jan Beulich wrote:
> On 05.03.2021 14:01, Jürgen Groß wrote:
>> On 05.03.21 13:40, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>> --- a/tools/xenstore/utils.h
>>> +++ b/tools/xenstore/utils.h
>>> @@ -29,10 +29,12 @@ const char *dump_state_align(FILE *fp);
>>>    
>>>    #define PRINTF_ATTRIBUTE(a1, a2) __attribute__((format (printf, a1, a2)))
>>>    
>>> -void barf(const char *fmt, ...) __attribute__((noreturn));
>>> -void barf_perror(const char *fmt, ...) __attribute__((noreturn));
>>> +#define __noreturn __attribute__((noreturn))
>>>    
>>> -extern void (*xprintf)(const char *fmt, ...);
>>> +void barf(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>>> +void barf_perror(const char *fmt, ...) __noreturn PRINTF_ATTRIBUTE(1, 2);
>>> +
>>> +extern void (*xprintf)(const char *fmt, ...) PRINTF_ATTRIBUTE(1, 2);
>>
>> ... the extern here would be dropped.
> 
> But this isn't a function declaration, but that of a data object.
> With the extern dropped, a common symbol will appear in every CU.

Urgh, you are right. Actually, the extern was added recently by Anthony:

dacdbf7088d6a3705a9831e73991c2b14c519a65 ("tools/xenstore: mark variable 
in header as extern")

I completely forgot it despite I needed to backport the patch to our 
downstream Xen.

Cheers,

-- 
Julien Grall

