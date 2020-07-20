Return-Path: <SRS0=X+fC=A7=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2848C433E1
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 08:47:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B5B2176B
	for <xen-devel@archiver.kernel.org>; Mon, 20 Jul 2020 08:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1B5B2176B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxRSf-0000Cj-0g; Mon, 20 Jul 2020 08:47:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WIjz=A7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jxRSd-0000CU-MR
 for xen-devel@lists.xenproject.org; Mon, 20 Jul 2020 08:47:47 +0000
X-Inumbo-ID: ae851bda-ca65-11ea-98f2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae851bda-ca65-11ea-98f2-12813bfff9fa;
 Mon, 20 Jul 2020 08:47:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 72FE2ADC2;
 Mon, 20 Jul 2020 08:47:51 +0000 (UTC)
Subject: Re: Advice for implementing MSI-X support on NetBSD Xen 4.11?
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?B?SmFyb23DrXIgRG9sZcSNZWs=?= <jaromir.dolecek@gmail.com>
References: <CAMnsW5542gmBLpKBsW5pnm=2VXmaDVHzg=OXXvBdu1BsYLdDvQ@mail.gmail.com>
 <20200720070010.GC7191@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a389f69-2c6b-e564-c6b5-c8f09ed66de0@suse.com>
Date: Mon, 20 Jul 2020 10:47:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720070010.GC7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.07.2020 09:00, Roger Pau Monné wrote:
> On Sun, Jul 19, 2020 at 05:54:28PM +0200, Jaromír Doleček wrote:
>> I've implemented support for using MSI under NetBSD Dom0 with 4.11.
>> This works well.
>>
>> I have some trouble now with getting MSI-X work under Xen.
>> PHYSDEVOP_map_pirq hypercall succeeds just as well as for MSI, but
>> interrupts don't seem to get delivered.
> 
> How are you filling physdev_map_pirq for MSI-X?
> 
> You need to set entry_nr and table_base.
> 
>> MSI-X interrupts work with NetBSD for the same devices when booted
>> natively, without Xen.
>>
>> Can you give me some advice on where to start looking to get this
>> working? Is there perhaps something special to be done within the PCI
>> subsystem to allow Xen to take over?
> 
> Are you enabling the capability and unmasking the interrupt in the
> MSI-X table?
> 
> IIRC the OS also needs to unmask the entry in the MSI-X table in MMIO
> space, as done natively.

Is this effort for PV or PVH? If the former, I don't think Dom0 is
supposed to write directly to any of these structures. This is all
intended to be hypercall based, despite us intercepting and trying
to emulate direct accesses.

Jaromír - are you making use of PHYSDEVOP_prepare_msix?

Jan

