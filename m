Return-Path: <SRS0=vb+Z=HG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CA4C433DB
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:01:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EE5464E7B
	for <xen-devel@archiver.kernel.org>; Thu,  4 Feb 2021 11:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EE5464E7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.81245.149741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cNs-00018t-G3; Thu, 04 Feb 2021 11:01:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81245.149741; Thu, 04 Feb 2021 11:01:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7cNs-00018m-D4; Thu, 04 Feb 2021 11:01:12 +0000
Received: by outflank-mailman (input) for mailman id 81245;
 Thu, 04 Feb 2021 11:01:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+S2h=HG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l7cNq-00018h-Kl
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 11:01:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be49a2b2-322a-44ea-a1de-e22ccb809cf5;
 Thu, 04 Feb 2021 11:01:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 94ADEAC9B;
 Thu,  4 Feb 2021 11:01:08 +0000 (UTC)
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
X-Inumbo-ID: be49a2b2-322a-44ea-a1de-e22ccb809cf5
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612436468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9uVSqE2MvanyRQzYU6IaJ1ukX503pWAsgJJOHHmEyHQ=;
	b=M11O/pbbF1963Exk5VjdtdP7Na3JVW0tOGzuAZQROSgIbwOfCTeyFyMY/ZcfpIaFxTYi3d
	He398sFlvb0LEaE1V2lDgYs6FX0nbqy7R3xTkOvsWSoBOloh2C1O03w0LHfyW9Elzu9on/
	cKB9mHK7B2nCObJvjH+2Aj3cbQCGgTw=
Subject: Re: [PATCH for-4.15] x86/efi: enable MS ABI attribute on clang
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20210203175805.86465-1-roger.pau@citrix.com>
 <a9d5f126-0b7c-6a8b-7ce9-736716e6e950@suse.com>
 <YBvRxYyWPMYBvGNr@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <617bbef5-5117-0b61-95a4-93a035f623f2@suse.com>
Date: Thu, 4 Feb 2021 12:01:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YBvRxYyWPMYBvGNr@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 04.02.2021 11:51, Roger Pau Monné wrote:
> On Thu, Feb 04, 2021 at 11:27:17AM +0100, Jan Beulich wrote:
>> On 03.02.2021 18:58, Roger Pau Monne wrote:
>>> --- a/xen/include/asm-x86/x86_64/efibind.h
>>> +++ b/xen/include/asm-x86/x86_64/efibind.h
>>> @@ -172,7 +172,7 @@ typedef uint64_t   UINTN;
>>>  #ifndef EFIAPI                  // Forces EFI calling conventions reguardless of compiler options
>>>      #ifdef _MSC_EXTENSIONS
>>>          #define EFIAPI __cdecl  // Force C calling convention for Microsoft C compiler
>>> -    #elif __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
>>> +    #elif __clang__ || __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 4)
>>>          #define EFIAPI __attribute__((__ms_abi__))  // Force Microsoft ABI
>>>      #else
>>>          #define EFIAPI          // Substitute expresion to force C calling convention
>>>
>>
>> So the problem is that some capable Clang versions set too low
>> a __GNUC_MINOR__ (I'm observing 2 alongside __GNUC__ being 4
>> on Clang5). The way the description and change are written
>> made me rather imply __GNUC__ to not be available at all,
>> which I then thought can't be the case because iirc we use it
>> elsewhere.
> 
> Yes, I also see 4.2 on Clang 11.
> 
> Do you want me to expand the description by adding:
> 
> "Add a specific Clang check because the GCC version reported by Clang
> is below the required 4.4 to use the __ms_abi__ attribute."

I guess adding this is easy enough when done while committing.
Thanks for the addition.

Jan

