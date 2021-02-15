Return-Path: <SRS0=65yj=HR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F1E5C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 10:05:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D881360C41
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 10:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D881360C41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85119.159607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBakq-0006w2-DP; Mon, 15 Feb 2021 10:05:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85119.159607; Mon, 15 Feb 2021 10:05:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBakq-0006vv-AQ; Mon, 15 Feb 2021 10:05:20 +0000
Received: by outflank-mailman (input) for mailman id 85119;
 Mon, 15 Feb 2021 10:05:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBako-0006vq-LA
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 10:05:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBakn-0003ND-T6; Mon, 15 Feb 2021 10:05:17 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBakn-000782-MZ; Mon, 15 Feb 2021 10:05:17 +0000
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
	bh=Z8fhdcbp2lZw6hOwH1OSTqhEgUBoiEhtwEp5Y62NxBc=; b=gdAdCAZ6R/gYeOOEA2Wq7hPiGS
	s9hUVlHzIf1gi1VDr6u5cm8TtygPsXwAyaix8j4x5O39se/3wgOQsMZWJ3jFDc1BpOPr2jZuTlSMt
	NnexzPLxZ8s/icqNCI/s6uSVlTuWdB/JYrFx5Lly9JM8agmzjazGc6kZMHvgX6nMPYv8=;
Subject: Re: Boot time and 3 sec in warning_print
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>
Cc: xen-devel@lists.xenproject.org
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
 <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
 <2668f69a-2150-afbe-2cae-69c79a2d63d8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <9f9d7e52-00e9-796b-fa6f-f6df04015773@xen.org>
Date: Mon, 15 Feb 2021 10:05:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2668f69a-2150-afbe-2cae-69c79a2d63d8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 15/02/2021 08:51, Jürgen Groß wrote:
> On 15.02.21 09:38, Jan Beulich wrote:
>> On 15.02.2021 09:13, Jürgen Groß wrote:
>>> On 15.02.21 08:37, Anders Törnqvist wrote:
>>>> I would like to shorten the boot time in our system if possible.
>>>>
>>>> In xen/common/warning.c there is warning_print() which contains a 3
>>>> seconds loop that calls  process_pending_softirqs().
>>>>
>>>> What would the potential problems be if that loop is radically 
>>>> shortened?
>>>
>>> A user might not notice the warning(s) printed.
>>>
>>> But I can see your point. I think adding a boot option for setting
>>> another timeout value (e.g. 0) would do the job without compromising
>>> the default case.
>>
>> I don't think I agree - the solution to this is to eliminate the
>> reason leading to the warning. The delay is intentionally this way
>> to annoy the admin and force them to take measures.
> 
> OTOH there are some warnings which can't be dealt with via boot
> parameters or which can be solved by other means, e.g
Both of the warning can be removed...

> "WARNING: SILO mode is not enabled.\n"
> "It has implications on the security of the system,\n"
> "unless the communications have been forbidden between\n"
> "untrusted domains.\n"

The default Arm config will use SILO mode. You would have needed to 
tweak your .config in order to get this message.

There are current discussion to allow again FLASK on Armv8.1+ platform 
(see [1]).

> 
> "WARNING: HMP COMPUTING HAS BEEN ENABLED.\n"
> "It has implications on the security and stability of the system,\n"
> "unless the cpu affinity of all domains is specified.\n"

This is printed if the admin add "hmp-unsafe=yes" on the command line.

Cheers,

[1]
https://lore.kernel.org/xen-devel/20201111215203.80336-1-ash.j.wilding@gmail.com/

-- 
Julien Grall

