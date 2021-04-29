Return-Path: <SRS0=6BBm=J2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D3DC433B4
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 13:52:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43D3D61107
	for <xen-devel@archiver.kernel.org>; Thu, 29 Apr 2021 13:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43D3D61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.120044.226982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc74u-0005a9-BH; Thu, 29 Apr 2021 13:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 120044.226982; Thu, 29 Apr 2021 13:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc74u-0005a2-80; Thu, 29 Apr 2021 13:51:40 +0000
Received: by outflank-mailman (input) for mailman id 120044;
 Thu, 29 Apr 2021 13:51:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc74s-0005Zx-Oi
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:51:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e3c0f7cb-8acd-4291-a432-2f9babb62434;
 Thu, 29 Apr 2021 13:51:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B5C86AF3B;
 Thu, 29 Apr 2021 13:51:36 +0000 (UTC)
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
X-Inumbo-ID: e3c0f7cb-8acd-4291-a432-2f9babb62434
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619704296; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X0Qb7HReSrvAVRt2FzgRgMXEnfz9Tn2WlratBNNPF8U=;
	b=gWJEtliq/0vouE93eqkZaIOT8xqSLfCTxyQ1S3sfje3CQwdPdZDpl0a45kOX2z0KoszaJM
	O0OQthHIcRY7CaITXzwvYztKZdOZ8yBrw9HW/hmOaHiMTRnc937KagBR/YRTDitsG5NjmP
	1vQiF/omMYWfXXj/GYjP7k3O5BmVyNI=
Subject: Re: [PATCH v4 3/3] x86/time: avoid reading the platform timer in
 rendezvous functions
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <d929903c-0e7a-adb9-3317-b66782f13b36@suse.com>
 <bdf9640d-3c70-461f-6680-9ce883c19719@suse.com>
 <YIqsMi4kyf3Xohmc@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5bb44cdc-0ec8-e62b-315b-08e99baebf22@suse.com>
Date: Thu, 29 Apr 2021 15:51:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIqsMi4kyf3Xohmc@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.04.2021 14:53, Roger Pau Monné wrote:
> On Thu, Apr 01, 2021 at 11:55:10AM +0200, Jan Beulich wrote:
>> Reading the platform timer isn't cheap, so we'd better avoid it when the
>> resulting value is of no interest to anyone.
>>
>> The consumer of master_stime, obtained by
>> time_calibration_{std,tsc}_rendezvous() and propagated through
>> this_cpu(cpu_calibration), is local_time_calibration(). With
>> CONSTANT_TSC the latter function uses an early exit path, which doesn't
>> explicitly use the field. While this_cpu(cpu_calibration) (including the
>> master_stime field) gets propagated to this_cpu(cpu_time).stamp on that
>> path, both structures' fields get consumed only by the !CONSTANT_TSC
>> logic of the function.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks.

> Albeit as said on my other email I would prefer performance related
> changes like this one to be accompanied with some proof that they
> actually make a difference, or else we risk making the code more
> complicated for no concrete benefit.

I'm not sure that's always sensible or useful. Removing an operation
that may take hundreds of clocks is surely not going to make things
worse performance-wise. Whether it's measurable in any way with
real world workloads is hard to predict. Micro-measurement, as
expected, shows an improvement.

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -52,6 +52,7 @@ unsigned long pit0_ticks;
>>  struct cpu_time_stamp {
>>      u64 local_tsc;
>>      s_time_t local_stime;
>> +    /* Next field unconditionally valid only when !CONSTANT_TSC. */
> 
> Could you also mention this is only true for the cpu_time_stamp that's
> used in cpu_calibration?
> 
> For ap_bringup_ref master_stime is valid regardless of CONSTANT_TSC.

Well, that's precisely why I put "unconditionally" there. I'm not
convinced it's helpful to point out ap_bringup_ref in particular,
as the comment would then likely not get updated when yet another
instance appears which sets the field in all cases. If you have a
suggestion on how to word this better without mentioning particular
instances of the struct, I'll be happy to consider taking that.

Jan

