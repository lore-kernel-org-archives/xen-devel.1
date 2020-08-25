Return-Path: <SRS0=XBNZ=CD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6EBC433DF
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 15:25:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FCEB20786
	for <xen-devel@archiver.kernel.org>; Tue, 25 Aug 2020 15:25:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iIVCOMdB";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fvX+yFvs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FCEB20786
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAapF-00085q-J7; Tue, 25 Aug 2020 15:25:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixcz=CD=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAapE-00085l-R6
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 15:25:28 +0000
X-Inumbo-ID: eff5730b-f87b-4043-81e7-bee135baa8e3
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eff5730b-f87b-4043-81e7-bee135baa8e3;
 Tue, 25 Aug 2020 15:25:27 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598369126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAump9L0LM6bJcSU7K51HCc/4/nx2NUvs/nMFC8fAoI=;
 b=iIVCOMdB9YLLRkw6woY3g270WXgQxEdxkShajzznnvUFeM+ajn1ICA9VgSf2sjfhOy1/aH
 NzT3gZL7wQXldhx9K073ykAv3Wb7sXPphzCm9kMO3SfGv6L8Vs2i2fp8zQNsFon+RVDyj8
 jjCWIm0SFHjjAU8hbJscrOv16Ka/B9sfvEMRJxWzMQtqFRPjHa7pf/Bowq6upsdc/UPTNe
 IHrpfq3zBDLe6nxxRzS5OV4Xdw5OZX/jdQRmOPwy1J0RgvW3oFRwIBp0cNRkVrXeV2fWZl
 X/LtjzHlkojohJFRuf6qBiKFaCOSIa3rsXQ61bQMxNQaT3OQEBPjACAPNMFTtg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598369126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAump9L0LM6bJcSU7K51HCc/4/nx2NUvs/nMFC8fAoI=;
 b=fvX+yFvs42lpxH0z2dBFAN5Yh2RS7EDQV+nzx1Bme+X14FyneOzVV0qM8LqcuV4cA/sK6d
 H2iabTe1VcvQXBDw==
To: Christoph Hellwig <hch@infradead.org>
Cc: mingo@redhat.com, bp@alien8.de, hpa@zytor.com, x86@kernel.org,
 boris.ostrovsky@oracle.com, jgross@suse.com, linux-pm@vger.kernel.org,
 linux-mm@kvack.org, kamatam@amazon.com, sstabellini@kernel.org,
 konrad.wilk@oracle.com, roger.pau@citrix.com, axboe@kernel.dk,
 davem@davemloft.net, rjw@rjwysocki.net, len.brown@intel.com, pavel@ucw.cz,
 peterz@infradead.org, eduval@amazon.com, sblbir@amazon.com,
 anchalag@amazon.com, xen-devel@lists.xenproject.org, vkuznets@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk,
 benh@kernel.crashing.org
Subject: Re: [PATCH v3 05/11] genirq: Shutdown irq chips in suspend/resume
 during hibernation
In-Reply-To: <20200825132002.GA25009@infradead.org>
References: <cover.1598042152.git.anchalag@amazon.com>
 <d9bcd552c946ac56f3f17cc0c1be57247d4a3004.1598042152.git.anchalag@amazon.com>
 <87h7svqzxm.fsf@nanos.tec.linutronix.de>
 <20200825132002.GA25009@infradead.org>
Date: Tue, 25 Aug 2020 17:25:26 +0200
Message-ID: <87imd6ycgp.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Aug 25 2020 at 14:20, Christoph Hellwig wrote:
> On Sat, Aug 22, 2020 at 02:36:37AM +0200, Thomas Gleixner wrote:
>> From: Thomas Gleixner <tglx@linutronix.de>
>> 
>> followed by an empty new line before the actual changelog text
>> starts. That way the attribution of the patch when applying it will be
>> correct.
>
> The way he sent it attribution will be correct as he managed to get his
> MTU to send out the mail claiming to be from you.

Which is even worse as that spammed my inbox with mail delivery rejects
for SPF and whatever violations. And those came mostly from Amazon
servers which sent out that wrong stuff in the first place ....

> But yes, it needs the second From line, _and_ the first from line
> needs to be fixed to be from him.

Thanks,

        tglx

