Return-Path: <SRS0=v1SG=HA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5086C433DB
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 10:02:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DC264E33
	for <xen-devel@archiver.kernel.org>; Fri, 29 Jan 2021 10:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41DC264E33
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.77867.141329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QbF-0002Wl-LR; Fri, 29 Jan 2021 10:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77867.141329; Fri, 29 Jan 2021 10:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5QbF-0002We-I8; Fri, 29 Jan 2021 10:01:57 +0000
Received: by outflank-mailman (input) for mailman id 77867;
 Fri, 29 Jan 2021 10:01:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mmvf=HA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l5QbE-0002WZ-UQ
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:01:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15d548ab-b737-4488-9017-858e13acc1c0;
 Fri, 29 Jan 2021 10:01:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2867EAD78;
 Fri, 29 Jan 2021 10:01:54 +0000 (UTC)
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
X-Inumbo-ID: 15d548ab-b737-4488-9017-858e13acc1c0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611914514; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dp3CgaJvJ8+dPu2moc0b5hNY4EwxN00pJ3Dqmf+AjN8=;
	b=gL9UWlwQqZCaIr+CEZv0rmY6NKLf/2RkTazyD8ejsFqi/GFqemDDgcgRAJC+ETorQjybgJ
	EGLtjzXjGpPyUJMa5RorEg+Y/4/8a8O0LuDfCFgS79ROEpeK5ToglVbNDi3v3I87SNIhQW
	h+/7YyRtw2dIbCsvKOQkiNFiCV7ZIUk=
Subject: Re: [PATCH] xen/memory: Reject out-of-range resource 'frame' values
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210128160616.17608-1-andrew.cooper3@citrix.com>
 <9879dc3b-5c00-b9d4-c74f-51177580ae7d@suse.com>
 <c31e3d04-6c01-95fd-af51-bbcbf0f450d3@citrix.com>
 <73e7ec42-12be-5b03-7c91-14e3132d3324@suse.com>
 <0c574f20-9d92-ba86-37fc-eaa72c3e3d16@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <38e6a495-5573-5eeb-acdf-e11211dab73b@suse.com>
Date: Fri, 29 Jan 2021 11:01:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <0c574f20-9d92-ba86-37fc-eaa72c3e3d16@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.01.2021 10:47, Andrew Cooper wrote:
> On 29/01/2021 09:40, Jan Beulich wrote:
>> On 29.01.2021 10:32, Andrew Cooper wrote:
>>> What's the likelihood that you'll choose to backport this?
>> Didn't consider this aspect yet. I think I wouldn't have picked
>> it without anyone asking for it to be backported.
>>
>>>   I can extend it if needs be.
>> Well, if that deletion of code gets committed in time, then of
>> course there's no real need to fiddle with it here.
> 
> This specific patch fixes a real bug on arm32 which will cause unsigned
> long + unsigned int to truncate together and permit certain values.

Why Arm32 only? Looking at current staging, there's no overflow
check at all on the grant part of the path. A suitably large
64-bit "frame" will allow the same behavior on 64-bit (wrapping
around through zero), afaict.

Jan

