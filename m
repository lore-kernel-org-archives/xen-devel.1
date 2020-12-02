Return-Path: <SRS0=2fhb=FG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79642C64E7B
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 15:21:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0500C21D7A
	for <xen-devel@archiver.kernel.org>; Wed,  2 Dec 2020 15:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0500C21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.42826.77071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTwT-0007uF-8f; Wed, 02 Dec 2020 15:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42826.77071; Wed, 02 Dec 2020 15:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTwT-0007u8-5i; Wed, 02 Dec 2020 15:21:17 +0000
Received: by outflank-mailman (input) for mailman id 42826;
 Wed, 02 Dec 2020 15:21:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkTwR-0007u3-97
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 15:21:15 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaa56127-b1fc-41fe-b81e-faab051dc165;
 Wed, 02 Dec 2020 15:21:14 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 49DCAAB63;
 Wed,  2 Dec 2020 15:21:13 +0000 (UTC)
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
X-Inumbo-ID: aaa56127-b1fc-41fe-b81e-faab051dc165
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606922473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOGzPfbLwev74s99qMBx8ajs4GS/HCJf6Xwb4QVzdG4=;
	b=nasi7uLAcF+SsfKKfZgZjUjAgGV5SYf7Zk1BJFPDwGwMcIIluxlhFE1ScfgA8wYv35sPbm
	OdGMbWOwi8mrE8knygaNsB56bc3dHQS5CxTxCeAYYrn7/Y4gmaH5YN/+QXYrqICrssAeW6
	OuZ6qrelGTOqNLbylBY+yjVNkgljKKk=
Subject: Re: [PATCH] x86/IRQ: bump max number of guests for a shared IRQ to 31
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: andrew.cooper3@citrix.com, roger.pau@citrix.com, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <1606780777-30718-1-git-send-email-igor.druzhinin@citrix.com>
 <b98d3517-6c9d-6f40-6e28-cde142978143@suse.com>
 <3c9735ec-2b04-1ace-2adb-d72b32c4a5f9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <88019c81-1988-2512-282b-53b61adf09c6@suse.com>
Date: Wed, 2 Dec 2020 16:21:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <3c9735ec-2b04-1ace-2adb-d72b32c4a5f9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.12.2020 15:53, Igor Druzhinin wrote:
> On 02/12/2020 09:25, Jan Beulich wrote:
>> On 01.12.2020 00:59, Igor Druzhinin wrote:
>>> Current limit of 7 is too restrictive for modern systems where one GSI
>>> could be shared by potentially many PCI INTx sources where each of them
>>> corresponds to a device passed through to its own guest. Some systems do not
>>> apply due dilligence in swizzling INTx links in case e.g. INTA is declared as
>>> interrupt pin for the majority of PCI devices behind a single router,
>>> resulting in overuse of a GSI.
>>>
>>> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>> ---
>>>
>>> If people think that would make sense - I can rework the array to a list of
>>> domain pointers to avoid the limit.
>>
>> Not sure about this. What is the biggest number you've found on any
>> system? (I assume the chosen value of 31 has some headroom.)
> 
> The value 31 was taken as a practical maximum for one specific HP system
> if all of the PCI slots in all of its riser cards are occupied with GPUs.
> The value is obtained by reverse engineering their ACPI tables. Currently
> we're only concerned with number 8 (our graphics vendors do not recommend
> installing more cards than that) but it's a matter of time it will grow.
> I'm also not sure why this routing scheme was chosen in the first place:
> is it dictated by hardware restrictions or firmware engineers being lazy - 
> we're working with HP to determine it.

Thanks for the insight.

>> Instead I'm wondering whether this wouldn't better be a Kconfig
>> setting (or even command line controllable). There don't look to be
>> any restrictions on the precise value chosen (i.e. 2**n-1 like is
>> the case for old and new values here, for whatever reason), so a
>> simple permitted range of like 4...64 would seem fine to specify.
>> Whether the default then would want to be 8 (close to the current
>> 7) or higher (around the actually observed maximum) is a different
>> question.
> 
> I'm in favor of a command line argument here - it would be much less trouble
> if a higher limit was suddenly necessary in the field. The default IMO
> should definitely be higher than 8 - I'd stick with number 32 which to me
> should cover our real world scenarios and apply some headroom for the future.

Well, I'm concerned of the extra memory overhead. Every IRQ,
sharable or not, will get the extra slots allocated with the
current scheme. Perhaps a prereq change then would be to only
allocate multi-guest arrays for sharable IRQs, effectively
shrinking the overhead in particular for all MSI ones?

Jan

