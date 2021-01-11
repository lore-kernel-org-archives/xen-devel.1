Return-Path: <SRS0=O81L=GO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF33DC433E0
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 07:44:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A2CB206E9
	for <xen-devel@archiver.kernel.org>; Mon, 11 Jan 2021 07:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A2CB206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.64614.114165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyrsG-0008U6-G4; Mon, 11 Jan 2021 07:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 64614.114165; Mon, 11 Jan 2021 07:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kyrsG-0008Tz-DA; Mon, 11 Jan 2021 07:44:24 +0000
Received: by outflank-mailman (input) for mailman id 64614;
 Mon, 11 Jan 2021 07:44:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ekcf=GO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kyrsF-0008Tt-4m
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 07:44:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 439c5a90-9a09-481a-b24b-7ff0cea100e2;
 Mon, 11 Jan 2021 07:44:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5530EAD18;
 Mon, 11 Jan 2021 07:44:21 +0000 (UTC)
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
X-Inumbo-ID: 439c5a90-9a09-481a-b24b-7ff0cea100e2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610351061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rWjhUjePIu6mKZ98pTUzEkg1uC99SEMp4iLWbDQ02Es=;
	b=kl46S267X+0Q1e7zFU/IsSQ/nRgfmmt5mUjY/xFW1S3SK3BFVyuCiWlAfI/Gf6vMdRbvGX
	1i+/tLKSYRmr1MvMA8exeGvatPJ8yMqwUlfT0roTmDWpzTr2TE5BIFWxu3S/AdCQF0DlQ+
	ehp2+it48Rdzc1exC29EJpE0XdJkjAQ=
Subject: Re: [PATCH 2/4] x86: Introduce MSR_UNHANDLED
To: boris.ostrovsky@oracle.com, andrew.cooper3@citrix.com
Cc: iwj@xenproject.org, wl@xen.org, anthony.perard@citrix.com,
 roger.pau@citrix.com, jun.nakajima@intel.com, kevin.tian@intel.com,
 boris.ostrvsky@oracle.com, xen-devel@lists.xenproject.org
References: <1610051698-23675-1-git-send-email-boris.ostrovsky@oracle.com>
 <1610051698-23675-3-git-send-email-boris.ostrovsky@oracle.com>
 <63813bfa-28d9-c590-1aeb-afbd4fc2b6b2@suse.com>
 <5c6fbbd5-5de0-8e4b-f4b0-ca05e73be26d@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1e0609d6-a7e3-036b-02b1-296e87af16d2@suse.com>
Date: Mon, 11 Jan 2021 08:44:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <5c6fbbd5-5de0-8e4b-f4b0-ca05e73be26d@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08.01.2021 21:31, boris.ostrovsky@oracle.com wrote:
> On 1/8/21 9:55 AM, Jan Beulich wrote:
>> On 07.01.2021 21:34, Boris Ostrovsky wrote:
>>> + *  0 = return #GP, warning emitted
>>> + *  1 = read as 0, writes are dropped, no warning
>>> + *  2 = read as 0, writes are dropped, warning emitted
>>> + */
>>> +#define MSR_UNHANDLED_NEVER     0
>>> +#define MSR_UNHANDLED_SILENT    1
>>> +#define MSR_UNHANDLED_VERBOSE   2
>>> +
>>> +/* MSR that is not explicitly processed by emulation */
>>> +#define MSR_UNHANDLED -1
>> Not sure about this choice: I'd consider an MSR index in the Xen
>> range more safe to use, not the least because this value
>> effectively becomes part of the migration ABI. Or if you use one
>> outside, then maybe a less prominent one than 0xffffffff (I
>> guess -1, irrespective of the missing parentheses, isn't
>> appropriate to use here).
> 
> 
> All MSRs in Xen range are currently handled (although most return
> an exception). I can reserve the last one (0x400002ff) if you feel
> it's more appropriate.

I do, yes, but I'd prefer to also have Andrew's general view here.
Difficulty is his email delivery issue, so I don't know how soon
we could hope for a reply.

Jan

