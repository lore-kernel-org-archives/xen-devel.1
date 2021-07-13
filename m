Return-Path: <SRS0=JVsS=MF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D4E2C07E95
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 14:33:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43DCD610CB
	for <xen-devel@archiver.kernel.org>; Tue, 13 Jul 2021 14:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43DCD610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.155425.286921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JTf-0006Aw-2e; Tue, 13 Jul 2021 14:33:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155425.286921; Tue, 13 Jul 2021 14:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3JTe-0006An-Vm; Tue, 13 Jul 2021 14:33:38 +0000
Received: by outflank-mailman (input) for mailman id 155425;
 Tue, 13 Jul 2021 14:33:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3JTd-0006AD-LK
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:33:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3JTZ-0007DW-MG; Tue, 13 Jul 2021 14:33:33 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3JTZ-00053a-FV; Tue, 13 Jul 2021 14:33:33 +0000
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
	bh=Z1OgfnxVesMF5jM15whSji2FNIAfCZyjuJZmhA6cW7U=; b=kt9OT7fRiKNg2pET5jmjgl4uqu
	A93hc6zicJNRXGt3R/C8EPWJ7/efPsoR406ZivdMO44YG5z3yYIRW3VjPbEKtDfyHzpKlh6HSWtew
	crPaZTt1E1fnWLeQ3ZakleHDOWdJsZo8LKshPqhAE2U2bx8NYXGY7V0Nz3cMHI9Kwoqg=;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>, Juergen Gross <jgross@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <ce9e3ba3-7e1a-b592-7e9a-e35099c8d483@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b27990f4-ac98-8221-ddb8-fa4699a0d43b@xen.org>
Date: Tue, 13 Jul 2021 15:33:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ce9e3ba3-7e1a-b592-7e9a-e35099c8d483@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 13/07/2021 15:23, Jan Beulich wrote:
> On 13.07.2021 16:19, Julien Grall wrote:
>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>> And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.
>>>
>>> Even that doesn't seem right to me, at least in principle. There shouldn't
>>> be a build time setting when it may vary at runtime. IOW on Arm I think a
>>> runtime query to the hypervisor would be needed instead.
>>
>> Yes, we want to be able to use the same userspace/OS without rebuilding
>> to a specific hypervisor page size.
>>
>>> And thinking
>>> even more generally, perhaps there could also be mixed (base) page sizes
>>> in use at run time, so it may need to be a bit mask which gets returned.
>>
>> I am not sure to understand this. Are you saying the hypervisor may use
>> at the same time different page size?
> 
> I think so, yes. And I further think the hypervisor could even allow its
> guests to do so.

This is already the case on Arm. We need to differentiate between the 
page size used by the guest and the one used by Xen for the stage-2 page 
table (what you call EPT on x86).

In this case, we are talking about the page size used by the hypervisor 
to configure the stage-2 page table

> There would be a distinction between the granularity at
> which RAM gets allocated and the granularity at which page mappings (RAM
> or other) can be established. Which yields an environment which I'd say
> has no clear "system page size".

I don't quite understand why you would allocate and etablish the memory 
with a different page size in the hypervisor. Can you give an example?

Cheers,

-- 
Julien Grall

