Return-Path: <SRS0=3ye+=63=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28FD5C2D0FA
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 13:35:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0396A221FE
	for <xen-devel@archiver.kernel.org>; Wed, 13 May 2020 13:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0396A221FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYrXW-0005gJ-JN; Wed, 13 May 2020 13:35:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dqM3=63=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jYrXV-0005gE-Qp
 for xen-devel@lists.xenproject.org; Wed, 13 May 2020 13:35:13 +0000
X-Inumbo-ID: 915b0e24-951e-11ea-a377-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 915b0e24-951e-11ea-a377-12813bfff9fa;
 Wed, 13 May 2020 13:35:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 126CCB004;
 Wed, 13 May 2020 13:35:13 +0000 (UTC)
Subject: Re: [PATCH v8 12/12] x86/HVM: don't needlessly intercept
 APERF/MPERF/TSC MSR reads
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <60cc730f-2a1c-d7a6-74fe-64f3c9308831@suse.com>
 <e92b6c1a-b2c3-13e7-116c-4772c851dd0b@suse.com>
 <81cc74ce-0a53-d5cd-3513-af3af6382815@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <05203042-662c-3dc4-15e6-bc45587fbeec@suse.com>
Date: Wed, 13 May 2020 15:35:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <81cc74ce-0a53-d5cd-3513-af3af6382815@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 23:04, Andrew Cooper wrote:
> On 05/05/2020 09:20, Jan Beulich wrote:
>> If the hardware can handle accesses, we should allow it to do so. This
>> way we can expose EFRO to HVM guests,
> 
> I'm reminded now of the conversation I'm sure we've had before, although
> I have a feeling it was on IRC.
> 
> APERF/MPERF (including the EFRO interface on AMD) are free running
> counters but only in C0.  The raw values are not synchronised across
> threads.
> 
> A vCPU which gets rescheduled has a 50% chance of finding the one or
> both values going backwards, and a 100% chance of totally bogus calculation.
> 
> There is no point exposing APERF/MPERF to guests.  It can only be used
> safely in hypervisor context, on AMD hardware with a CLGI/STGI region,
> or on Intel hardware in an NMI handler if you trust that a machine check
> isn't going to ruin your day.
> 
> VMs have no way of achieving the sampling requirements, and has a fair
> chance of getting a plausible-but-wrong answer.
> 
> The only possibility to do this safely is on a VM which is pinned to
> pCPU for its lifetime, but even I'm unconvinced of the correctness.
> 
> I don't think we should be exposing this functionality to guests at all,
> although I might be persuaded if someone wanting to use it in a VM can
> provide a concrete justification of why the above problems won't get in
> their way.

Am I getting it right then that here you're reverting what you've said
on patch 10: "I'm tempted to suggest that we offer EFRO on Intel ..."?
And hence your request is to drop both that and this patch?

Jan

