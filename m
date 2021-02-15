Return-Path: <SRS0=65yj=HR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EB7C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 12:29:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BBF464DC3
	for <xen-devel@archiver.kernel.org>; Mon, 15 Feb 2021 12:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BBF464DC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.85222.159781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBd0B-0003kj-KQ; Mon, 15 Feb 2021 12:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85222.159781; Mon, 15 Feb 2021 12:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBd0B-0003kc-HK; Mon, 15 Feb 2021 12:29:19 +0000
Received: by outflank-mailman (input) for mailman id 85222;
 Mon, 15 Feb 2021 12:29:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lBd09-0003kX-TO
 for xen-devel@lists.xenproject.org; Mon, 15 Feb 2021 12:29:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01a0a0ac-0f89-48cc-a5b6-3903e03c6696;
 Mon, 15 Feb 2021 12:29:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82473B0BE;
 Mon, 15 Feb 2021 12:29:14 +0000 (UTC)
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
X-Inumbo-ID: 01a0a0ac-0f89-48cc-a5b6-3903e03c6696
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613392154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=woplbVM4gqPTxKjJtko/zRXKYmPCYa5pT66zZOsos7g=;
	b=nMQASbnoOX854rzI5E48XQlHkouFK6UWUbIb1IsOP29b8VT4IV0vHuFsuyU+uWZpsRZABr
	dG/2iw0bGsUHPEjParHD5y6nLe8I+gYuFdppvKEY2T62PRk2AqkZABRdk9QMwAlrvumO4/
	K8TWbSw/0yDHw9I7DojlUggmu++IweQ=
Subject: Re: Boot time and 3 sec in warning_print
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, =?UTF-8?Q?Anders_T=c3=b6rnqvist?=
 <anders.tornqvist@codiax.se>
References: <fcc14668-b07d-aec8-1587-bc2d7add84da@codiax.se>
 <4f256544-7e1a-1a65-4942-04b3bc00e373@suse.com>
 <d9d4ebf7-09b3-29f2-1359-cd9db73f9c94@suse.com>
 <84a8cc60-e63d-24db-750c-39bb6049c045@xen.org>
 <29a1b91f-891c-2a9e-a5f0-b7b01296c880@suse.com>
 <677c66e0-6f06-569c-7447-d3bd07dcda81@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6c850ae1-62a9-4adb-fb94-ed90ee1780ff@suse.com>
Date: Mon, 15 Feb 2021 13:29:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <677c66e0-6f06-569c-7447-d3bd07dcda81@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.02.2021 11:50, Julien Grall wrote:
> Hi Jan,
> 
> On 15/02/2021 10:41, Jan Beulich wrote:
>> On 15.02.2021 11:35, Julien Grall wrote:
>>> On 15/02/2021 08:38, Jan Beulich wrote:
>>>> On 15.02.2021 09:13, Jürgen Groß wrote:
>>>>> On 15.02.21 08:37, Anders Törnqvist wrote:
>>>>>> I would like to shorten the boot time in our system if possible.
>>>>>>
>>>>>> In xen/common/warning.c there is warning_print() which contains a 3
>>>>>> seconds loop that calls  process_pending_softirqs().
>>>>>>
>>>>>> What would the potential problems be if that loop is radically shortened?
>>>>>
>>>>> A user might not notice the warning(s) printed.
>>>>>
>>>>> But I can see your point. I think adding a boot option for setting
>>>>> another timeout value (e.g. 0) would do the job without compromising
>>>>> the default case.
>>>>
>>>> I don't think I agree - the solution to this is to eliminate the
>>>> reason leading to the warning.
>>>   >
>>>> The delay is intentionally this way
>>>> to annoy the admin and force them to take measures.
>>> Given they are warning, an admin may have assessed them and considered
>>> there is no remediation necessary.
>>>
>>> We encountered the same problem with LiveUpdate. If you happen to have a
>>> warning (e.g. sync_console for debugging), then you are adding 3s in
>>> your downtime (this can more than double-up the actual one).
>>
>> One very explicitly should not run with sync_console in production.
> 
> I knew it would be misinterpreted ;). I agree that sync_console must not 
> be used in production.
> 
> I gave the example of sync_console because this is something impacting 
> debugging of LiveUpdate. If you have a console issue and need to add 
> sync_console, then you may end up to wreck completely your platform when 
> LiveUpdating.
> 
> Without the 3s delay, then you have a chance to LiveUpdate and figure 
> out the problem.

I'm afraid I don't see how LU comes into the picture here: We're
talking about a boot time delay. The delay doesn't recur at any
point at runtime.

Jan

