Return-Path: <SRS0=fV0s=IG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9896CC433DB
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 13:24:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B50651C2
	for <xen-devel@archiver.kernel.org>; Mon,  8 Mar 2021 13:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B50651C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.94932.178935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFsR-0003ps-1L; Mon, 08 Mar 2021 13:24:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94932.178935; Mon, 08 Mar 2021 13:24:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJFsQ-0003pl-Sa; Mon, 08 Mar 2021 13:24:50 +0000
Received: by outflank-mailman (input) for mailman id 94932;
 Mon, 08 Mar 2021 13:24:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mI6H=IG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJFsQ-0003pg-Ba
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 13:24:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b4efad2-a0e9-48d9-998f-7444ebc1648b;
 Mon, 08 Mar 2021 13:24:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 957A1AD73;
 Mon,  8 Mar 2021 13:24:48 +0000 (UTC)
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
X-Inumbo-ID: 8b4efad2-a0e9-48d9-998f-7444ebc1648b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615209888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9p5xIm5R9zqwqOHfpVsXywQIbZY9ZXyY+OGp2hOFeXI=;
	b=C+HTwTIGr9rBR8jAFSHZlA1acpcdxJ679Ko+jJgYbWmtw3c/RpSpDZyD5DAGaYcr8c87EK
	cS4rMn/0/dAQ/4yPwXrhPBGj40wKU17YKi5ohALiGqaNIdeVHiwngerwCUIdhMOkqyroic
	cRxrHl5cNAtsIDsxLgP4eEJGKXT4gfQ=
Subject: Re: [PATCH v2 2/2][4.15] x86/AMD: expose HWCR.TscFreqSel to guests
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f5f17207-b601-2909-8a5c-55276e734272@suse.com>
 <c91b190a-aaa1-d3b8-10eb-d8da7ad1f834@suse.com>
 <d4e927da-97ee-d4ca-2407-03793f2f4c24@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ea2aab4a-a6a1-6ea5-baef-294e0039e1b3@suse.com>
Date: Mon, 8 Mar 2021 14:24:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <d4e927da-97ee-d4ca-2407-03793f2f4c24@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.03.2021 13:41, Andrew Cooper wrote:
> On 05/03/2021 09:50, Jan Beulich wrote:
>> Linux has been warning ("firmware bug") about this bit being clear for a
>> long time. While writable in older hardware it has been readonly on more
>> than just most recent hardware. For simplicitly report it always set (if
>> anything we may want to log the issue ourselves if it turns out to be
>> clear on older hardware).
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I realise Linux is complaining, but simply setting the bit isn't a fix.
> 
> This needs corresponding updates in the ACPI tables, as well as Pstate
> MSRs, or Linux will derive a false relationship between the TSC rate and
> wallclock.

I guess I don't follow: AMD's doc is very clear: BIOSes ought to set the
bit. It not being set is more likely a mistake than an indication of
other pieces (MSRs, ACPI tables) reflecting this unintended state. Plus
isn't what you say true also if Linux sees the bit wrongly clear (which
would be the case prior to this patch)? Are you suggesting we should
revert behavior here all the way to letting the hardware bit shine
through again (for Dom0; for DomU neither other MSRs nor ACPI tables
are possibly aware of this bit's state)?

Jan

