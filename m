Return-Path: <SRS0=BOky=EQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8D2C388F7
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 07:47:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E70720795
	for <xen-devel@archiver.kernel.org>; Tue, 10 Nov 2020 07:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="fTNc12UH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E70720795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.23059.49616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcOMu-0003H2-2T; Tue, 10 Nov 2020 07:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23059.49616; Tue, 10 Nov 2020 07:47:08 +0000
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
	id 1kcOMt-0003Gv-VZ; Tue, 10 Nov 2020 07:47:07 +0000
Received: by outflank-mailman (input) for mailman id 23059;
 Tue, 10 Nov 2020 07:47:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kcOMs-0003Gq-Q3
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 07:47:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae7978aa-92ac-41df-a13f-da2be41ea121;
 Tue, 10 Nov 2020 07:47:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E47F3ABD1;
 Tue, 10 Nov 2020 07:47:03 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xL7T=EQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kcOMs-0003Gq-Q3
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 07:47:06 +0000
X-Inumbo-ID: ae7978aa-92ac-41df-a13f-da2be41ea121
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ae7978aa-92ac-41df-a13f-da2be41ea121;
	Tue, 10 Nov 2020 07:47:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604994424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4grvy2Vd+XHhnHogizLT8Lx1VH01gIHDPhnAecCkrks=;
	b=fTNc12UHVdBYeUrKwnUK0ecM6ZU87oTpw3snqC/auXwDo5Wun5TfvO0qInzxH+htVXfK3E
	SJKev/f6nHsGfry4yf0wMnueXTEMVAg9StOQ9gX+3oJOVM88fRxwFGQTgjzaLwZ891WyW9
	/VhCLL6LcPKICFIAvIdStiuStPd/050=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E47F3ABD1;
	Tue, 10 Nov 2020 07:47:03 +0000 (UTC)
Subject: Re: Tools backport request for Xen 4.14
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, ba1020@protonmail.ch,
 Elliott Mitchell <ehem+xen@m5p.com>
References: <54fcf6ea-f400-c96a-cde6-4f55f909c2d6@xen.org>
 <20201009184930.GA65219@mattapan.m5p.com>
 <24489.33893.98470.334969@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b675d88-9586-e590-2ea4-18dfe931d638@suse.com>
Date: Tue, 10 Nov 2020 08:47:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <24489.33893.98470.334969@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09.11.2020 19:03, Ian Jackson wrote:
> Elliott Mitchell writes ("Re: Tools backport request for Xen 4.14"):
>> On Fri, Oct 09, 2020 at 06:47:22PM +0100, Julien Grall wrote:
>>> Would it be possible to consider backporting to 4.14 the following tools 
>>> commit:
>>>
>>> d25cc3ec93eb "libxl: workaround gcc 10.2 maybe-uninitialized warning"
>>>
>>> This would help to build Xen tools on Debian Testing with GCC 10. I 
>>> haven't build itself myself, so I can't promise this is only one :).
>>
>> >From Debian's repository:
>> https://salsa.debian.org/xen-team/debian-xen.git
>>
>> The master and knorrie/4.14 branches include that commit.  They will
>> hopefully soon include all the Debian-specific bits for cross-building
>> too.
> 
> I have now backported all of the GCC10 fixes to all the supported Xen
> branches (ie back to 4.12).

Just to clarify: 4.12 is only security supported at this point, from
all I can tell.

Jan

