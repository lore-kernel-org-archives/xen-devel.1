Return-Path: <SRS0=trq0=HZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AA4C433E0
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 07:23:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D480C64E25
	for <xen-devel@archiver.kernel.org>; Tue, 23 Feb 2021 07:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D480C64E25
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.88587.166646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lES2n-0000Dc-4a; Tue, 23 Feb 2021 07:23:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88587.166646; Tue, 23 Feb 2021 07:23:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lES2n-0000DV-19; Tue, 23 Feb 2021 07:23:41 +0000
Received: by outflank-mailman (input) for mailman id 88587;
 Tue, 23 Feb 2021 07:23:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lES2l-0000DQ-Ay
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 07:23:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 079eb4b4-059e-4578-8041-ef481f304d37;
 Tue, 23 Feb 2021 07:23:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 87569ACBF;
 Tue, 23 Feb 2021 07:23:37 +0000 (UTC)
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
X-Inumbo-ID: 079eb4b4-059e-4578-8041-ef481f304d37
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614065017; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6cbhbTlOQ2V1rz/BldkIurA7ktZyiVuzBwIbKMcbcF0=;
	b=m+GeUblM9DPYo/7OGZBv25bfiX6kBjO1jh/ddaNBLvRgwQY0RH7gV6E67Ws1jez+SA1Oxm
	sOkHBtUDlx+Am6QbIduLf2RPuNPviCl6SOB5ThMHDH4g1YCRiAdc66CUfF0fvz/MUnUkrK
	/3aGjMGMyt2vvauwcOH1/6q0Z8mz/Js=
Subject: Re: [PATCH] firmware: don't build hvmloader if it is not needed
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 cardoe@cardoe.com, andrew.cooper3@citrix.com, wl@xen.org,
 iwj@xenproject.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210213020540.27894-1-sstabellini@kernel.org>
 <20210213135056.GA6191@mail-itl>
 <4d9200cd-bd4b-e429-5c96-7a4399bb00b4@suse.com>
 <alpine.DEB.2.21.2102161016000.3234@sstabellini-ThinkPad-T480s>
 <5a574326-9560-e771-b84f-9d4f348b7f5f@suse.com>
 <alpine.DEB.2.21.2102171529460.3234@sstabellini-ThinkPad-T480s>
 <416e26b7-0e24-a9ee-6f9a-732f77f7e0cc@suse.com>
 <alpine.DEB.2.21.2102181737310.3234@sstabellini-ThinkPad-T480s>
 <3723a430-e7de-017a-294f-4c3fdb35da51@suse.com>
 <alpine.DEB.2.21.2102221453080.3234@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4654a547-0d07-6a90-7e92-7a5403ec6a63@suse.com>
Date: Tue, 23 Feb 2021 08:23:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2102221453080.3234@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.02.2021 00:05, Stefano Stabellini wrote:
> On Fri, 19 Feb 2021, Jan Beulich wrote:
>> On 19.02.2021 02:42, Stefano Stabellini wrote:
>>> --- a/tools/configure.ac
>>> +++ b/tools/configure.ac
>>> @@ -307,6 +307,10 @@ AC_ARG_VAR([AWK], [Path to awk tool])
>>>  
>>>  # Checks for programs.
>>>  AC_PROG_CC
>>> +AC_LANG(C)
>>> +AC_LANG_CONFTEST([AC_LANG_SOURCE([[int main() { return 0;}]])])
>>> +AS_IF([gcc -m32 conftest.c -o - 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(hvmloader build disabled as the compiler cannot build 32bit binaries)])
>>> +AC_SUBST(hvmloader)
>>
>> I'm puzzled: "gcc -m32" looked to work fine on its own. I suppose
>> the above fails at the linking stage, but that's not what we care
>> about (we don't link with any system libraries). Instead, as said,
>> you want to check "gcc -m32 -c" produces correct code, in
>> particular with sizeof(uint64_t) being 8. Of course all of this
>> would be easier if their headers at least caused some form of
>> error, instead of silently causing bad code to be generated.
>>
>> The way you do it, someone simply not having 32-bit C libraries
>> installed would then also have hvmloader build disabled, even if
>> their compiler and headers are fine to use.
> 
> I realize that technically this test is probing for something different:
> the ability to build and link a trivial 32-bit userspace program, rather
> than a specific check about sizeof(uint64_t). However, I thought that if
> this test failed we didn't want to continue anyway.
> 
> If you say that hvmloader doesn't link against any system libraries,
> then in theory the hvmloader build could succeed even if this test
> failed. Hence, we need to change strategy.
> 
> What do you think of something like this?
> 
> AC_LANG_CONFTEST([AC_LANG_SOURCE([[#include <assert.h>
> #include <stdint.h>
> int main() { assert(sizeof(uint64_t) == 8); return 0;}]])])
> AS_IF([gcc -m32 conftest.c -o conftest 2>/dev/null], [hvmloader=y], [AC_MSG_WARN(XXX)])

The assert() would trigger at runtime only, so you'd also need to
invoke the program, wouldn't you?

> Do you have any better ideas?

An open-coded BUILD_BUG_ON()-like test would allow noticing the issue
already at compile time.

Jan

