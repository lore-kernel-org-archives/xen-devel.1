Return-Path: <SRS0=Yd2Y=E2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271DAC56202
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 10:09:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3C22222A
	for <xen-devel@archiver.kernel.org>; Fri, 20 Nov 2020 10:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="ASbNbfEj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A3C22222A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.31920.62721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg3Lj-0000i9-6b; Fri, 20 Nov 2020 10:09:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31920.62721; Fri, 20 Nov 2020 10:09:03 +0000
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
	id 1kg3Lj-0000i2-3k; Fri, 20 Nov 2020 10:09:03 +0000
Received: by outflank-mailman (input) for mailman id 31920;
 Fri, 20 Nov 2020 10:09:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kg3Lh-0000hx-FR
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:09:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 147d43fd-7334-4820-a187-120702d09170;
 Fri, 20 Nov 2020 10:08:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6ABBAE78;
 Fri, 20 Nov 2020 10:08:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xyTX=E2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kg3Lh-0000hx-FR
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 10:09:01 +0000
X-Inumbo-ID: 147d43fd-7334-4820-a187-120702d09170
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 147d43fd-7334-4820-a187-120702d09170;
	Fri, 20 Nov 2020 10:08:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605866938; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hf+ygfDKUNsG8QRruMSF4Vyc8o9h0epff8MdNWveAQ=;
	b=ASbNbfEjL+a3mYs5HZ9Y27uJfJ5EAq/CYcZfEDXqmTozEkWZNqwXtGHRZo769gAHE+pNzB
	H7Y81hEUk6Yaby8WxWm70RDMfVHA1nc89cJNqH5C8FFnr2qZu+QI3cY2d4ZpTi7dwvc2RQ
	Pa6z0LxAPg1Cgtu1ciKEZBbcaOGGiQM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B6ABBAE78;
	Fri, 20 Nov 2020 10:08:58 +0000 (UTC)
Subject: Re: [PATCH v2] xen: EXPERT clean-up and introduce UNSUPPORTED
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, Bertrand.Marquis@arm.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 george.dunlap@citrix.com, iwj@xenproject.org, julien@xen.org, wl@xen.org,
 xen-devel@lists.xenproject.org
References: <20201118005051.26115-1-sstabellini@kernel.org>
 <eb6b32c3-c7e2-1e36-f492-0c00cc170ce2@suse.com>
 <alpine.DEB.2.21.2011181241310.11739@sstabellini-ThinkPad-T480s>
 <3e8c03eb-ee3f-4439-90c2-acf340c7d8e7@suse.com>
 <alpine.DEB.2.21.2011191310210.11739@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8ff723d7-00e2-be35-48b0-dc4b932d35cc@suse.com>
Date: Fri, 20 Nov 2020 11:08:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011191310210.11739@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.11.2020 22:40, Stefano Stabellini wrote:
> On Thu, 19 Nov 2020, Jan Beulich wrote:
>> On 18.11.2020 22:00, Stefano Stabellini wrote:
>>> On Wed, 18 Nov 2020, Jan Beulich wrote:
>>>> On 18.11.2020 01:50, Stefano Stabellini wrote:
>>>>> 1) It is not obvious that "Configure standard Xen features (expert
>>>>> users)" is actually the famous EXPERT we keep talking about on xen-devel
>>>>
>>>> Which can be addressed by simply changing the one prompt line.
>>>>
>>>>> 2) It is not obvious when we need to enable EXPERT to get a specific
>>>>> feature
>>>>>
>>>>> In particular if you want to enable ACPI support so that you can boot
>>>>> Xen on an ACPI platform, you have to enable EXPERT first. But searching
>>>>> through the kconfig menu it is really not clear (type '/' and "ACPI"):
>>>>> nothing in the description tells you that you need to enable EXPERT to
>>>>> get the option.
>>>>
>>>> And what causes this to be different once you switch to UNSUPPORTED?
>>>
>>> Two things: firstly, it doesn't and shouldn't take an expert to enable
>>> ACPI support, even if ACPI support is experimental. So calling it
>>> UNSUPPORTED helps a lot. This is particularly relevant to the ARM Kconfig
>>> options changed by this patch. Secondly, this patch is adding
>>> "(UNSUPPORTED)" in the oneline prompt so that it becomes easy to match
>>> it with the option you need to enable.
>>
>> There's redundancy here then, which I think is in almost all cases
>> better to avoid. That's first and foremost because the two places
>> can go out of sync. Therefore, if the primary thing is to help
>> "make menuconfig" (which I admit I don't normally use, as it's
>> nothing that gets invoked implicitly by the build process afaict,
>> i.e. one has to actively invoke it), perhaps we should enhance
>> kconfig to attach at least a pre-determined subset of labels to
>> the prompts automatically?
>>
>> And second, also in reply to what you've been saying further down,
>> perhaps we would better go with a hierarchy of controls here, e.g.
>> EXPERT -> EXPERIMENTAL -> UNSUPPORTED?
> 
> Both these are good ideas worth discussing; somebody else made a similar
> suggestion some time back. I was already thinking this could be a great
> candidate for one of the first "working groups" as defined by George
> during the last community call because the topic is not purely
> technical: a working group could help getting alignment and make
> progress faster. We can propose it to George when he is back.
> 
> However, I don't think we need the working group to make progress on
> this limited patch that only addresses the lowest hanging fruit.
> 
> I'd like to suggest to make progress on this patch in its current form,
> and in parallel start a longer term discussion on how to do something
> like you suggested above.

Okay, I guess I can accept this. So FAOD I'm not objecting to the
change (with some suitable adjustments, as discussed), but I'm
then also not going to be the one to ack it. Nevertheless I'd like
to point out that doing such a partial solution may end up adding
confusion rather than reducing it. Much depends on how exactly
consumers interpret what we hand to them.

Jan

