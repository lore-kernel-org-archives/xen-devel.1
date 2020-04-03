Return-Path: <SRS0=kYra=5T=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD02CC43331
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 20:28:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 976EA206F5
	for <xen-devel@archiver.kernel.org>; Fri,  3 Apr 2020 20:28:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tWkO3c8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 976EA206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKSup-0003jB-6S; Fri, 03 Apr 2020 20:27:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dtYi=5T=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jKSuo-0003j6-HA
 for xen-devel@lists.xenproject.org; Fri, 03 Apr 2020 20:27:46 +0000
X-Inumbo-ID: 9386e898-75e9-11ea-b58d-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9386e898-75e9-11ea-b58d-bc764e2007e4;
 Fri, 03 Apr 2020 20:27:45 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m17so9992388wrw.11
 for <xen-devel@lists.xenproject.org>; Fri, 03 Apr 2020 13:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3f7O7KO2z8nLuddRofCnPl5Ys+mjQYLJubYsHBW4Xu0=;
 b=tWkO3c8PhW3yy15FmGmQPJkEDUSYID8aya5WfS0BXOhYubkubUGX+hk4PMQZB34jJy
 dkoCK+n2MQUMxHIt3iPVGUiSSYtrT0DAaLzKxVuQy2PFHkG4/oFmpNKBEb+IEFD8PHyR
 uhQYv1V/YHXoYOyEQtAUdQk6St2Mb4qZxPcabFqNEUQV+1HHhA1FebWR3mPu4KXeX1r7
 BU6rqZqRjOj7JamZXkrhCMgFrWRyMz/bau/Ulkgh3qDjS4jcsuw8Uzn3Dexat8D1fxJ9
 Pf9ftQ+0W4NT76NzSnkgyMIcOWd9rP8Ju244wt3jQ1xprdCDsBp8TmUVFrmviucIYS9E
 DzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3f7O7KO2z8nLuddRofCnPl5Ys+mjQYLJubYsHBW4Xu0=;
 b=QLIZWWw7uKjmmZGzTigpEihNk33mdAl0JqlJaqTG9gB6xiE6zOQi2ag6MQKr8S8UFv
 kXbc6IO9z1WftWHHEUXbZ4NMWNaMMSteOTJXsg+r7BHlogTNhysu34JLW30ciY2aW/Ac
 jVfMtrVGYf+0Ui71KjbSq7WWfcznZgSrlZ4unO/wHEDRc4hW1t+mp9j4/MLzFG+ko7L6
 QO39g1zZ3PtYKZ4JMfjlSfNEidy0K0s+1H5LU9ax5PtSI4Fwt1XP4Eo8D2cTPDVbZy5f
 aTE3eMq/GiuLIU3K3VInATZWfbY4WLWtJYdxCBmU8syfydPkiLacylcMdByCcVhBItF9
 6tQw==
X-Gm-Message-State: AGi0PuYhm8jdEogM9yYXq9WDGAiY6536M+iTDZPsX7qEfZZteffsSLqn
 BPrlGeYSrVmG3h/9tk6gp7oGoKzx0vekUnXsTuc=
X-Google-Smtp-Source: APiQypI3ApJibhyj0unGji4o4W6CZFDlASEbKdBrt50nWlxoQ/YdKnnKZbJba1lvnFlhxN6FXF70BGGeEgE5UtDvZPg=
X-Received: by 2002:adf:a4c9:: with SMTP id h9mr4714788wrb.426.1585945664772; 
 Fri, 03 Apr 2020 13:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Fri, 3 Apr 2020 21:27:33 +0100
Message-ID: <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, maz@kernel.org,
 George Dunlap <George.Dunlap@citrix.com>, Wei Xu <xuwei5@hisilicon.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 3 Apr 2020 at 20:41, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Thu, 2 Apr 2020, Julien Grall wrote:
> > As we discussed on Tuesday, the cost for other vCPUs is only going to be a
> > trap to the hypervisor and then back again. The cost is likely smaller than
> > receiving and forwarding an interrupt.
> >
> > You actually agreed on this analysis. So can you enlighten me as to why
> > receiving an interrupt is a not problem for latency but this is?
>
> My answer was that the difference is that an operating system can
> disable interrupts, but it cannot disable receiving this special IPI.

An OS can *only* disable its own interrupts, yet interrupts will still
be received by Xen even if the interrupts are masked at the processor
(e.g local_irq_disable()).

You would need to disable interrupts one by one as the GIC level (use
ICENABLER) in order to not receive any interrupts. Yet, Xen may still
receive interrupts for operational purposes (e.g serial, console,
maintainance IRQ...). So trap will happen.

But if your concern is to disturb a vCPU which has interrupts
disabled. Then there is way to mitigate this in an implementation, you
can easily know whether there are interrupts inflight at a given point
for a given vCPU. So you can avoid to IPI if you know there is no
interrupts potentially active.

This is why I clearly written the implementation I suggested was *not*
optimized in the same e-mail as where I made the proposal.

Cheers,

