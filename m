Return-Path: <SRS0=IsAa=DW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B89DC433E7
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 04:18:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E7422210
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2020 04:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bFQC5sMJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E7422210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.7088.18563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSui3-0003v3-85; Thu, 15 Oct 2020 04:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7088.18563; Thu, 15 Oct 2020 04:17:47 +0000
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
	id 1kSui3-0003uw-45; Thu, 15 Oct 2020 04:17:47 +0000
Received: by outflank-mailman (input) for mailman id 7088;
 Thu, 15 Oct 2020 04:17:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kSui1-0003ur-IB
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 04:17:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9e90c91-f300-4327-8099-bffc4a6d124a;
 Thu, 15 Oct 2020 04:17:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 74764AAC6;
 Thu, 15 Oct 2020 04:17:43 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kSui1-0003ur-IB
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 04:17:45 +0000
X-Inumbo-ID: c9e90c91-f300-4327-8099-bffc4a6d124a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c9e90c91-f300-4327-8099-bffc4a6d124a;
	Thu, 15 Oct 2020 04:17:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602735463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d6XREWJTbrLTiRCRnFwa8v4t3eXIsRm14t3UfLvWp/M=;
	b=bFQC5sMJl2mNtSu//V/l7bE4DIH+yfzMeMg8rDNbECmZwgNjb4MPNlVlPuWs31Qkz5JZdv
	HdLJ0MQ98nbi88Ca3xJ8wWGAUTmrdfq2fosmWvuTZx/PDbQSIrKZ58w/1ogwxxLka9vLtm
	c/Ba6cn2x7AMn2R8EoxiYZD+HUya3Og=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 74764AAC6;
	Thu, 15 Oct 2020 04:17:43 +0000 (UTC)
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201014153150.83875-1-jandryuk@gmail.com>
 <77e8bf3b-6172-2900-dd5e-9d059a410b0e@suse.com>
 <CAKf6xptqRKJ87KiJ52MpYR50RNgDEqqA5RsqXphQ1NUeVZgb=Q@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <03a9d7c8-61fe-a83f-93b3-55d38d070b0b@suse.com>
Date: Thu, 15 Oct 2020 06:17:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xptqRKJ87KiJ52MpYR50RNgDEqqA5RsqXphQ1NUeVZgb=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.10.20 18:27, Jason Andryuk wrote:
> On Wed, Oct 14, 2020 at 12:12 PM Jürgen Groß <jgross@suse.com> wrote:
>>
>> On 14.10.20 17:31, Jason Andryuk wrote:
>>> Linux kernels only have an ENTRY elfnote when built with CONFIG_PV.  A
>>
>> This wrong. Have a look into arch/x86/platform/pvh/head.S
> 
> That is XEN_ELFNOTE_PHYS32_ENTRY, which is different from
> XEN_ELFNOTE_ENTRY in arch/x86/xen/xen-head.S:
> #ifdef CONFIG_XEN_PV
>          ELFNOTE(Xen, XEN_ELFNOTE_ENTRY,          _ASM_PTR startup_xen)
> #endif

Oh, sorry, I shouldn't have answered when being in a hurry.

I misunderstood the purpose of the patch.


Sorry for the noise,

Juergen


