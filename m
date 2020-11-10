Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40FCC388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 12:12:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6745020665
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 12:12:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ieXVHdl+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6745020665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23315.49983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcSVi-0004Hp-6x; Tue, 10 Nov 2020 12:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23315.49983; Tue, 10 Nov 2020 12:12:30 +0000
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
	id 1kcSVi-0004Hi-3F; Tue, 10 Nov 2020 12:12:30 +0000
Received: by outflank-mailman (input) for mailman id 23315;
 Tue, 10 Nov 2020 12:12:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcSVh-0004Hd-3O
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 12:12:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5458695e-253b-42aa-9abd-e47c127b6146;
 Tue, 10 Nov 2020 12:12:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2BBA4ABCC;
 Tue, 10 Nov 2020 12:12:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcSVh-0004Hd-3O
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 12:12:29 +0000
X-Inumbo-ID: 5458695e-253b-42aa-9abd-e47c127b6146
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5458695e-253b-42aa-9abd-e47c127b6146;
	Tue, 10 Nov 2020 12:12:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605010347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0YfaoJeSASk43AydLI7V2l3mT3osg6VPabsZj92csws=;
	b=ieXVHdl+U0MiIDOAQBIlAqWzbq4T2QMuaLCXgqyJkB6mE528pY0KDi9Cog/3+xw49PqsUv
	yLnsl3GhffmaOEBlCi+dq0B63DrR8GtXIDCQP372QMPMt0nzMgpxo8poz+13V4HZKN9RC1
	2UWfhGLd3Jqc8TEkPD7t8jTwDQUqyPY=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2BBA4ABCC;
	Tue, 10 Nov 2020 12:12:27 +0000 (UTC)
Subject: Re: [PATCH v2] x86/msr: fix handling of MSR_IA32_PERF_{STATUS/CTL}
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20201109173819.7817-1-andrew.cooper3@citrix.com>
 <681e03f5-86fd-43bb-5347-c526def9ffcb@suse.com>
 <083f46c0-07fb-7b22-4e49-d2a0df87164c@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60ac8b66-7d36-0c4e-85c4-f2d867201fd5@suse.com>
Date: Tue, 10 Nov 2020 13:12:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <083f46c0-07fb-7b22-4e49-d2a0df87164c@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.11.2020 11:32, Andrew Cooper wrote:
> On 10/11/2020 08:03, Jan Beulich wrote:
>> On 09.11.2020 18:38, Andrew Cooper wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -1069,6 +1069,23 @@ extern enum cpufreq_controller {
>>>      FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
>>>  } cpufreq_controller;
>>>  
>>> +static always_inline bool is_cpufreq_controller(const struct domain *d)
>>> +{
>>> +    /*
>>> +     * A PV dom0 can be nominated as the cpufreq controller, instead of using
>>> +     * Xen's cpufreq driver, at which point dom0 gets direct access to certain
>>> +     * MSRs.
>>> +     *
>>> +     * This interface only works when dom0 is identity pinned and has the same
>>> +     * number of vCPUs as pCPUs on the system.
>>> +     *
>>> +     * It would be far better to paravirtualise the interface.
>>> +     */
>>> +    return (IS_ENABLED(CONFIG_PV) &&
>>> +            (cpufreq_controller == FREQCTL_dom0_kernel) &&
>>> +            is_pv_domain(d) && is_hardware_domain(d));
>>> +}
>> IS_ENABLED(CONFIG_PV) is already part of is_pv_domain() and hence
>> imo shouldn't be used explicitly here.
> 
> Ah yes.  Will drop.
> 
>> Also, this being an x86 concept, is it really a good idea to put
>> in xen/sched.h? I guess this builds on Arm just because of DCE
>> from the IS_ENABLED(CONFIG_PV) (where afaict the one in
>> is_pv_domain() will still do). (But yes, I do realize that
>> cpufreq_controller itself gets declared in this file, so maybe
>> better to do some subsequent cleanup.)
> 
> I can't spot anywhere obviously better for it to live.  We don't have a
> common cpufreq.h,

Not the most obvious place for it to live at, but
xen/include/acpi/cpufreq/cpufreq.h ?

Jan

