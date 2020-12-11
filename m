Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C032C4167B
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 22:07:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E32DB23D50
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 22:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E32DB23D50
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50932.89801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knqZS-0006tZ-L9; Fri, 11 Dec 2020 22:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50932.89801; Fri, 11 Dec 2020 22:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knqZS-0006tQ-Gl; Fri, 11 Dec 2020 22:07:26 +0000
Received: by outflank-mailman (input) for mailman id 50932;
 Fri, 11 Dec 2020 22:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YvCS=FP=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knqZR-0006s6-K5
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 22:07:25 +0000
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c146a60-1cb4-4cb1-8ed7-f25d7d461d55;
 Fri, 11 Dec 2020 22:07:24 +0000 (UTC)
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
X-Inumbo-ID: 1c146a60-1cb4-4cb1-8ed7-f25d7d461d55
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607724443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uE5KR5qlfz+ztx9s8pbRCB1Be+kxvrwztlDzBEoJCeU=;
	b=upIVkJhj5g1RmAalIreFExmj0QWc7xxC7dfgYyTKQ7/s1CPaLrvswCn2cis9a5ELIHv+rz
	IPyhjuoIqfAMI+60hoe1U1U27IhweRJLvNYpN7cTAqQ0o0KlM2VdD+/ibGw4UCrbJtLWLY
	inuTJUAvrZhdYHuTfLNeogwgdoyl5SGN/dy3kNNRxVqcfza2kw+U/H2LlJBjtaANpZFTIZ
	ptr78MOU90DKS42tb76OuG8X418bmY7SaqmPbyqibyrcTnWO7/ljKjMmuQI0HfaTAZd7Ho
	gSP1o6so90u917yflugfQ7VOzMuRufMAcgTvFJSwBRyBFBjjIC3oXcfJ628ySQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607724443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uE5KR5qlfz+ztx9s8pbRCB1Be+kxvrwztlDzBEoJCeU=;
	b=6l4EGHeIGgEoz1BM8xIprj71LYQ/8TNyn+KsbwNoVJfPjiraGOnwYmma/niMdHbbcB5BbA
	SooB9xEZT4EUdpBw==
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Mark
 Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Pankaj Bharadiya
 <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, "open list\:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Jon Mason
 <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe
 <allenbh@gmail.com>, linux-ntb@googlegroups.com, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Michal Simek <michal.simek@xilinx.com>, linux-pci
 <linux-pci@vger.kernel.org>, Karthikeyan Mitran
 <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, Tariq
 Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, "open
 list\:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Subject: Re: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
In-Reply-To: <87h7osgifc.fsf@nanos.tec.linutronix.de>
References: <20201210192536.118432146@linutronix.de> <20201210194042.860029489@linutronix.de> <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com> <87h7osgifc.fsf@nanos.tec.linutronix.de>
Date: Fri, 11 Dec 2020 23:07:22 +0100
Message-ID: <87360cgfol.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Dec 11 2020 at 22:08, Thomas Gleixner wrote:

> On Fri, Dec 11 2020 at 19:53, Andy Shevchenko wrote:
>
>> On Thu, Dec 10, 2020 at 10:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>>>
>>> irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
>>> be exported. Move it into the core code which lifts another requirement for
>>> the export.
>>
>> ...
>>
>>> +       if (IS_ENABLED(CONFIG_LOCKDEP))
>>> +               __irq_set_lockdep_class(irq, lock_class, request_class);
>
> You are right. Let me fix that.

No. I have to correct myself. You're wrong.

The inline is evaluated in the compilation units which include that
header and because the function declaration is unconditional it is
happy.

Now the optimizer stage makes the whole thing a NOOP if CONFIG_LOCKDEP=n
and thereby drops the reference to the function which makes it not
required for linking.

So in the file where the function is implemented:

#ifdef CONFIG_LOCKDEP
void __irq_set_lockdep_class(....)
{
}
#endif

The whole block is either discarded because CONFIG_LOCKDEP is not
defined or compile if it is defined which makes it available for the
linker.

And in the latter case the optimizer keeps the call in the inline (it
optimizes the condition away because it's always true).

So in both cases the compiler and the linker are happy and everything
works as expected.

It would fail if the header file had the following:

#ifdef CONFIG_LOCKDEP
void __irq_set_lockdep_class(....);
#endif

Because then it would complain about the missing function prototype when
it evaluates the inline.

Thanks,

        tglx

