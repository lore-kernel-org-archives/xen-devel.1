Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7714BC433FE
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 12:37:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BD9423D5A
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 12:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BD9423D5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50522.89202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knhfe-0004xi-Lk; Fri, 11 Dec 2020 12:37:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50522.89202; Fri, 11 Dec 2020 12:37:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knhfe-0004xb-IZ; Fri, 11 Dec 2020 12:37:14 +0000
Received: by outflank-mailman (input) for mailman id 50522;
 Fri, 11 Dec 2020 12:37:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YvCS=FP=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knhfd-0004xW-3y
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 12:37:13 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a214fe2f-cfd5-4381-a1b4-7a7728f98cc4;
 Fri, 11 Dec 2020 12:37:12 +0000 (UTC)
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
X-Inumbo-ID: a214fe2f-cfd5-4381-a1b4-7a7728f98cc4
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607690230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeKMIUUY7UN7nseclqb6capkWQKCLYLlFPvEsM/avAA=;
	b=3520JJ+cuub+0iUSOK2WXjhkvCbFqeJNnWTo2fJ47aLTUyErKzNfEkULJPsX3Qa7RkBVwA
	4q6jw5fcFuYyZr/ciqFHaAnQVfC1Alp3kCIzCyANWRIH5wkikSXOxsM9LH0a3lH+xiAa45
	f0/UcyAfqGDvjb7eJDdGBHj9hJNdTg1RDGpqvbSImr23oJWz9hqAB7upD/U8t27689mDeg
	F/Tz1FEjoqnkk1C0t4mKGVaykVWwH0Pu53ShxAoYAYxl3sBd5Q86Au5G3wKiLThho8mDJo
	PrspxrgGCxFQ2+rt5HHBAUWr3eImu1NL/lsNiVCRl0iT/SNo3u6jwsn7CYROBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607690230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeKMIUUY7UN7nseclqb6capkWQKCLYLlFPvEsM/avAA=;
	b=BclOyliY9++BXeKdFZCu5z1BEMLnNc8fqr8CcstXRZSRH4lrLjensrS/wg9nxh2q1FTvD5
	HDIGPJaNNIgQp/DQ==
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 boris.ostrovsky@oracle.com, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens
 <hca@linux.ibm.com>, linux-s390@vger.kernel.org, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Pankaj
 Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, Chris Wilson
 <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko
 Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Lee Jones
 <lee.jones@linaro.org>, Jon Mason <jdmason@kudzu.us>, Dave Jiang
 <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Michal
 Simek <michal.simek@xilinx.com>, linux-pci@vger.kernel.org, Karthikeyan
 Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang
 <Zhiqiang.Hou@nxp.com>, Tariq Toukan <tariqt@nvidia.com>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Saeed Mahameed
 <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Subject: Re: [patch 27/30] xen/events: Only force affinity mask for percpu interrupts
In-Reply-To: <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
References: <20201210192536.118432146@linutronix.de> <20201210194045.250321315@linutronix.de> <7f7af60f-567f-cdef-f8db-8062a44758ce@oracle.com> <2164a0ce-0e0d-c7dc-ac97-87c8f384ad82@suse.com>
Date: Fri, 11 Dec 2020 13:37:10 +0100
Message-ID: <871rfwiknd.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 11 2020 at 13:10, J=C3=BCrgen Gro=C3=9F wrote:
> On 11.12.20 00:20, boris.ostrovsky@oracle.com wrote:
>>=20
>> On 12/10/20 2:26 PM, Thomas Gleixner wrote:
>>> All event channel setups bind the interrupt on CPU0 or the target CPU f=
or
>>> percpu interrupts and overwrite the affinity mask with the corresponding
>>> cpumask. That does not make sense.
>>>
>>> The XEN implementation of irqchip::irq_set_affinity() already picks a
>>> single target CPU out of the affinity mask and the actual target is sto=
red
>>> in the effective CPU mask, so destroying the user chosen affinity mask
>>> which might contain more than one CPU is wrong.
>>>
>>> Change the implementation so that the channel is bound to CPU0 at the X=
EN
>>> level and leave the affinity mask alone. At startup of the interrupt
>>> affinity will be assigned out of the affinity mask and the XEN binding =
will
>>> be updated.
>>=20
>>=20
>> If that's the case then I wonder whether we need this call at all and in=
stead bind at startup time.
>
> After some discussion with Thomas on IRC and xen-devel archaeology the
> result is: this will be needed especially for systems running on a
> single vcpu (e.g. small guests), as the .irq_set_affinity() callback
> won't be called in this case when starting the irq.

That's right, but not limited to ARM. The same problem exists on x86 UP.
So yes, the call makes sense, but the changelog is not really useful.
Let me add a comment to this.

Thanks,

        tglx

