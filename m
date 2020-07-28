Return-Path: <SRS0=jQwh=BH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C267FC433F1
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 19:18:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0560207F5
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2020 19:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0560207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0V7G-0005rS-SC; Tue, 28 Jul 2020 19:18:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qgq5=BH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k0V7F-0005rN-MB
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 19:18:21 +0000
X-Inumbo-ID: 185f6824-d107-11ea-a92c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 185f6824-d107-11ea-a92c-12813bfff9fa;
 Tue, 28 Jul 2020 19:18:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ED9ADAD5B;
 Tue, 28 Jul 2020 19:18:29 +0000 (UTC)
Subject: Re: [PATCH 1/4] x86: replace __ASM_{CL,ST}AC
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <58b9211a-f6dd-85da-d0bd-c927ac537a5d@suse.com>
 <fc8e042e-fef8-ac38-34d8-16b13e4b0135@suse.com>
 <ea6eeb6d-7af2-97cb-4c11-6e0a81755961@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9083209c-a5b5-2238-0453-31a730705365@suse.com>
Date: Tue, 28 Jul 2020 21:18:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ea6eeb6d-7af2-97cb-4c11-6e0a81755961@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.07.2020 15:55, Andrew Cooper wrote:
> On 15/07/2020 11:48, Jan Beulich wrote:
>> --- a/xen/arch/x86/arch.mk
>> +++ b/xen/arch/x86/arch.mk
>> @@ -20,6 +20,7 @@ $(call as-option-add,CFLAGS,CC,"rdrand %
>>   $(call as-option-add,CFLAGS,CC,"rdfsbase %rax",-DHAVE_AS_FSGSBASE)
>>   $(call as-option-add,CFLAGS,CC,"xsaveopt (%rax)",-DHAVE_AS_XSAVEOPT)
>>   $(call as-option-add,CFLAGS,CC,"rdseed %eax",-DHAVE_AS_RDSEED)
>> +$(call as-option-add,CFLAGS,CC,"clac",-DHAVE_AS_CLAC_STAC)
> 
> Kconfig please, rather than extending this legacy section.

Did you forget for a moment that we're still to discuss this use of
Kconfig before we extend it to further instances? I'm pretty sure I
gave an ack to one of the respective changes of yours only on the
condition that we'd sort out whether this is indeed the way forward,
without a preset outcome (and without reasoning like "let's do it
because Linux does so").

> That said, surely stac/clac support is old enough for us to start using
> unconditionally?

Can't check right now, but I'm sure I wouldn't have introduced the
construct if we could rely on all supported tool chains to have
support for them.

> Could we see about sorting a reasonable minimum toolchain version,
> before we churn all the logic to deal with obsolete toolchains?

Who's "we" here? I see you keep proposing this every once in a
while, but I don't see who's going to do the work. The main reason
why, while I agree we should bump the base line, I don't see myself
do this is because I don't see any even just half way clear
criteria by which to decide what the new level is supposed to be.
Once again I don't think "let's follow what Linux does" is a
suitable approach.

Additionally I fear that with raising the tool chain base line,
people may start considering to raise other minimum versions.
While I'm personally quite fine building my own binutils and gcc
(and maybe a few other pieces), I don't fancy having to rebuild,
say, coreutils just to be able to build Xen.

Maybe a topic for the next community call, which isn't too far
out?

Jan

