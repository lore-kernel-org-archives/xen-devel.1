Return-Path: <SRS0=Mbyf=GH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71785C433DB
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 13:44:03 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37A0E207B1
	for <xen-devel@archiver.kernel.org>; Mon,  4 Jan 2021 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37A0E207B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.61214.107499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQ9D-0002y1-Lp; Mon, 04 Jan 2021 13:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61214.107499; Mon, 04 Jan 2021 13:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwQ9D-0002xu-Ii; Mon, 04 Jan 2021 13:43:47 +0000
Received: by outflank-mailman (input) for mailman id 61214;
 Mon, 04 Jan 2021 13:43:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwQ9C-0002xp-4a
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 13:43:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6e4af2d-1b1b-483a-9060-8c1f0e59c0f7;
 Mon, 04 Jan 2021 13:43:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6422CAD4E;
 Mon,  4 Jan 2021 13:43:44 +0000 (UTC)
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
X-Inumbo-ID: e6e4af2d-1b1b-483a-9060-8c1f0e59c0f7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609767824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DqqtnVoQDkogX9jxo3IPHyO3S4Q/syaq5rJIMQYZCXM=;
	b=m+hxYoLfdCLeGXddbebXyWx/bs1XAPXftSVZ49hu2rvloelqzQ2NALCNQqvyCEsd/zE9UI
	Dg7wggkEbuSRs/2nsEl/pdQ30UGku9UoA/PP1KILOfq+WvqIJIKmQkkvnn0T43+htCNQ7b
	joFsi9WPoAryrXXjxIrWi6ZV07PEyp8=
Subject: Re: [PATCH] x86/CPUID: suppress IOMMU related hypervisor leaf data
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <c640463a-d088-aaf5-0c3c-d82b1c98ee4f@suse.com>
 <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cb289033-9e7c-b51e-dd02-5c6d05285a8c@suse.com>
Date: Mon, 4 Jan 2021 14:43:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201228105400.dzkyrgyvkjuevzsj@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.12.2020 11:54, Roger Pau Monné wrote:
> On Mon, Nov 09, 2020 at 11:54:09AM +0100, Jan Beulich wrote:
>> Now that the IOMMU for guests can't be enabled "on demand" anymore,
>> there's also no reason to expose the related CPUID bit "just in case".
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> I'm not sure this is helpful from a guest PoV.
> 
> How does the guest know whether it has pass through devices, and thus
> whether it needs to check if this flag is present or not in order to
> safely pass foreign mapped pages (or grants) to the underlying devices?
> 
> Ie: prior to this change I would just check whether the flag is
> present in CPUID to know whether FreeBSD needs to use a bounce buffer
> in blkback and netback when running as a domU. If this is now
> conditionally set only when the IOMMU is enabled for the guest I
> also need to figure a way to know whether the domU has any passed
> through device or not, which doesn't seem trivial.

I'm afraid I don't understand your concern and/or description of
the scenario. Prior to the change, the bit was set unconditionally.
To me, _that_ was making the bit useless - no point in checking
something which is always set anyway (leaving aside old Xen
versions). I also don't follow how presence / absence of a passed
through device mattering (or not) would have changed with this
patch.

Jan

