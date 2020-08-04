Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 778BEC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 13:53:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D7ED2086A
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 13:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=xen.org header.i=@xen.org header.b="ml8AtgUU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D7ED2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2xNB-0001h7-V7; Tue, 04 Aug 2020 13:52:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KvlI=BO=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k2xNA-0001h0-FM
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 13:52:56 +0000
X-Inumbo-ID: 27aa72e7-1a80-4003-b49f-1967c04e64d5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27aa72e7-1a80-4003-b49f-1967c04e64d5;
 Tue, 04 Aug 2020 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ihO59wyAX8zkLS1CY3TtNPmuystf+aQGxWecJuP6eM=; b=ml8AtgUUu4GlCZpsftB6HeKtql
 Fgw05jiBmxFS4XfSh0GXD0m2zuOk+zRLiusaIfA0S2rY7OnaH+Hp2oeSXA0kfw5ZFNFSn7OADhkFY
 WeB6caaV8vukH53cgwoxxP9fODpkHW9nweihEED/AOlwDcI3Ju4MXAD4vG/c+VfHhdTo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k2xN1-0008KJ-64; Tue, 04 Aug 2020 13:52:47 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k2xN0-0004Ao-RL; Tue, 04 Aug 2020 13:52:46 +0000
Subject: Re: [RFC PATCH V1 01/12] hvm/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>, paul@xen.org,
 xen-devel@lists.xenproject.org
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-2-git-send-email-olekstysh@gmail.com>
 <000c01d66a33$2bd56510$83802f30$@xen.org>
 <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f0c32cfe-5c33-30ae-b08a-3d72e935745a@xen.org>
Date: Tue, 4 Aug 2020 14:52:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9f83a7ed-ca97-449f-c7b9-a1140644abe9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: 'Kevin Tian' <kevin.tian@intel.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Jun Nakajima' <jun.nakajima@intel.com>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Tim Deegan' <tim@xen.org>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Julien Grall' <julien.grall@arm.com>, 'Jan Beulich' <jbeulich@suse.com>,
 =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 04/08/2020 12:10, Oleksandr wrote:
> On 04.08.20 10:45, Paul Durrant wrote:
>>> +static inline bool hvm_ioreq_needs_completion(const ioreq_t *ioreq)
>>> +{
>>> +    return ioreq->state == STATE_IOREQ_READY &&
>>> +           !ioreq->data_is_ptr &&
>>> +           (ioreq->type != IOREQ_TYPE_PIO || ioreq->dir != 
>>> IOREQ_WRITE);
>>> +}
>> I don't think having this in common code is correct. The short-cut of 
>> not completing PIO reads seems somewhat x86 specific. 

Hmmm, looking at the code, I think it doesn't wait for PIO writes to 
complete (not read). Did I miss anything?

> Does ARM even 
>> have the concept of PIO?
> 
> I am not 100% sure here, but it seems that doesn't have.

Technically, the PIOs exist on Arm, however they are accessed the same 
way as MMIO and will have a dedicated area defined by the HW.

AFAICT, on Arm64, they are only used for PCI IO Bar.

Now the question is whether we want to expose them to the Device 
Emulator as PIO or MMIO access. From a generic PoV, a DM shouldn't have 
to care about the architecture used. It should just be able to request a 
given IOport region.

So it may make sense to differentiate them in the common ioreq code as well.

I had a quick look at QEMU and wasn't able to tell if PIOs and MMIOs 
address space are different on Arm as well. Paul, Stefano, do you know 
what they are doing?

Cheers,

-- 
Julien Grall

