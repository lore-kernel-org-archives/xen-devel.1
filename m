Return-Path: <SRS0=65yj=HR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E909BC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 15:10:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2A0264DA8
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 15:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2A0264DA8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85270.159881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBfWD-0002E9-VV; Mon, 15 Feb 2021 15:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85270.159881; Mon, 15 Feb 2021 15:10:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBfWD-0002E2-S7; Mon, 15 Feb 2021 15:10:33 +0000
Received: by outflank-mailman (input) for mailman id 85270;
 Mon, 15 Feb 2021 15:10:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBfWD-0002Dx-F1
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 15:10:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBfWC-0008NR-Px; Mon, 15 Feb 2021 15:10:32 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBfWC-0007mx-H8; Mon, 15 Feb 2021 15:10:32 +0000
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
	bh=HBoxuV2cYZP+cucKP3j6vy3oNG8hP2mNkjtQxmf9GsM=; b=pNAuWUVYG0UD8P91nQFDviWDsf
	h4kS9UHRQUV+Q7rz93+4KL1OPs7Lbw0V5jywfhL4w3319mredSyj4ACAuHjNK9bhahEndCfi2xyJC
	eq4qNHMGAfKt2CXfpDDph7cU9wbZUmOKGwIP5BOI4nqZTAc3MxIjieEvuLfRVTfE/daA=;
Subject: Re: Boot time and 3 sec in warning_print
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Anders_T=c3=b6rnqvist?=
 <anders.tornqvist@codiax.se>
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
 <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
 <84a8cc60-e63d-24db-750c-39bb6049c045@xen.org>
 <29a1b91f-891c-2a9e-a5f0-b7b01296c880@suse.com>
 <e4c5e236-b801-27af-d519-204943aa32d4@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6c238a10-cf7e-527d-88ea-c1d730ad9e87@xen.org>
Date: Mon, 15 Feb 2021 15:10:30 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e4c5e236-b801-27af-d519-204943aa32d4@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 15/02/2021 15:00, Andrew Cooper wrote:
> On 15/02/2021 10:41, Jan Beulich wrote:
>> On 15.02.2021 11:35, Julien Grall wrote:
>>> On 15/02/2021 08:38, Jan Beulich wrote:
>>>> On 15.02.2021 09:13, Jürgen Groß wrote:
>>> What was just an "annoyance" for boot can now completely wreck your
>>> guests and system (not many software can tolerate large downtime).
>>>
>>> So I think we either want to drop the 3s pause completely or allow the
>>> user to decide whether he/she cares about it via a command line option.
>>>
>>> I am leaning towards the former at the moment.
>> I'm afraid I'm -2 towards complete removal. I'm at least -1 towards
>> shortening of the pause, as already indicated.
> 
> A 3s delay on boot doesn't even cause most people to notice.  The
> infrastructure has failed at its intended purpose.
> 
> Therefore, we should consider now to replace this largely-failed
> experiment with something better.
> 
> 
> Personally, I think ARM is abusing this in the first place.  Adding a 3
> second delay for someone who's explicitly chosen hmp_unsafe is petty.

For Arm, the original goal was to get all the important warning in a 
single place so they are easy to find.

The 3 seconds is unfortunately an unintended consequence of using 
warning_add().

> So is adding a 3 second delay for anyone who's explicitly chosen a
> non-default configuration.  In retrospect, I think the delay for hvm_fep
> is also wrong, especially as we also have a taint for it. >
> 
> The *only* way to make users deal with the warnings is to surface them
> very obviously in the UI they use to interact with their Xen system.
> That is XenCenter/XenOrchestra/virt-manager/etc, and possibly the SSH
> MOTD - not a logfile that approximately noone reads.
> 
> To make this happen, warnings need to be available somewhere which isn't
> the dmesg ring.  hypfs would be the obvious candidate at the moment.

Could we also taint Xen if there is a major warning?

Cheers,

-- 
Julien Grall

