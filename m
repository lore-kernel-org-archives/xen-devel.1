Return-Path: <SRS0=Z24W=FP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C86FC4361B
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 17:53:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D127922CF8
	for <xen-devel@archiver.kernel.org>; Fri, 11 Dec 2020 17:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D127922CF8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.50804.89570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knmbq-0005wO-54; Fri, 11 Dec 2020 17:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50804.89570; Fri, 11 Dec 2020 17:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knmbq-0005wH-1X; Fri, 11 Dec 2020 17:53:38 +0000
Received: by outflank-mailman (input) for mailman id 50804;
 Fri, 11 Dec 2020 17:53:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pcPH=FP=gmail.com=andy.shevchenko@srs-us1.protection.inumbo.net>)
 id 1knmbo-0005wB-Ux
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 17:53:37 +0000
Received: from mail-pj1-x1036.google.com (unknown [2607:f8b0:4864:20::1036])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b274a65-555a-4fa5-ac9d-4c4b3e6705a4;
 Fri, 11 Dec 2020 17:53:36 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id p21so2119767pjv.0
 for <xen-devel@lists.xenproject.org>; Fri, 11 Dec 2020 09:53:36 -0800 (PST)
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
X-Inumbo-ID: 2b274a65-555a-4fa5-ac9d-4c4b3e6705a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qJMuReBBloytY5lBy9ILiGRjMb37kF5Bm1u/sykMtGI=;
        b=pbcP9ZyMd8cecm/Ac29HxHof8LYE8oIxJsfNxtiP4g+O1ufaXL9wqRka/RSo4Tovrl
         0+y5AKL9oCVabUsoTOFqz/Yq9QfdTj0Typ4F+2X8XEQKxDDPDKl8NptHh9zo30qru18d
         QGlaxM7GEPdID0olwlCiRofo+G16Jl5uy1wTEIGaTXATmtYB0SKJ7RfAvwDsjDcWrkzF
         kKjuZM4tWxnD1BBGBwlxpereCqs+GnyIsKzQ1aCY79/NwQxDiafuQ2m4U5xGO28vG9vA
         fsrh/72iZb6gHAJp4ifwj1MfQl9QfYGQYjUntoAEcq5P8hce+uphA5O/Y7Ku0HiAUL7i
         H9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJMuReBBloytY5lBy9ILiGRjMb37kF5Bm1u/sykMtGI=;
        b=gHjtm7ourVH/5zKhY2xJDu0dY80OVAqDX/i9YdJ0xO5wFAgcshKvFLuvQUqlAxIIrk
         SvxyOd5ECNJLIiUB31TN5ehZhync2uFs2ziWEpCOHhncNW/w0mT42LuzO6ZivIX6GlL0
         f8CcCjSylZA9nSxUN1EcFuzXCG0DTi7OnEirqiw/GB5hBMavJWDhTLPFHZW2ryrrsDzv
         llSNbxEHCUtAHYpUnwguGnMlhqIjmsC1B0vjFIYEbUx3GhM733N9reE5EGRrMHVFofdG
         yGRaNjobpk7IFeQAf4I6x1LcLBIc+mURdvLZ2+ZgOmV4Rskn14+nBww68nU86AtaSXZe
         xjSQ==
X-Gm-Message-State: AOAM530jOFKnjnW2MU8NI5vYyy/eBFles/fH+1CJm5mDk3rVustnSjlQ
	e/c7XyBFiENX5Sd4oJ8ZMXA6JWsLZS1qE2mKRwA=
X-Google-Smtp-Source: ABdhPJzHUDKz30vqqKYAobJsngcYE8DjK4RijmUtwtDAm93E/clqz0VBoWDrwvzZzwrJPWtEJfA5ahq579HFtI6a1+g=
X-Received: by 2002:a17:90a:34cb:: with SMTP id m11mr14313128pjf.181.1607709215341;
 Fri, 11 Dec 2020 09:53:35 -0800 (PST)
MIME-Version: 1.0
References: <20201210192536.118432146@linutronix.de> <20201210194042.860029489@linutronix.de>
In-Reply-To: <20201210194042.860029489@linutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 11 Dec 2020 19:53:07 +0200
Message-ID: <CAHp75Vc-2OjE2uwvNRiyLMQ8GSN3P7SehKD-yf229_7ocaktiw@mail.gmail.com>
Subject: Re: [patch 03/30] genirq: Move irq_set_lockdep_class() to core
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Marc Zyngier <maz@kernel.org>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	afzal mohammed <afzal.mohd.ma@gmail.com>, linux-parisc@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>, 
	Chris Wilson <chris@chris-wilson.co.uk>, Wambui Karuga <wambui.karugax@gmail.com>, 
	intel-gfx <intel-gfx@lists.freedesktop.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, 
	Jon Mason <jdmason@kudzu.us>, Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>, 
	linux-ntb@googlegroups.com, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Michal Simek <michal.simek@xilinx.com>, linux-pci <linux-pci@vger.kernel.org>, 
	Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, 
	Tariq Toukan <tariqt@nvidia.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, netdev <netdev@vger.kernel.org>, 
	"open list:HFI1 DRIVER" <linux-rdma@vger.kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 10, 2020 at 10:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> irq_set_lockdep_class() is used from modules and requires irq_to_desc() to
> be exported. Move it into the core code which lifts another requirement for
> the export.

...

> +       if (IS_ENABLED(CONFIG_LOCKDEP))
> +               __irq_set_lockdep_class(irq, lock_class, request_class);

Maybe I missed something, but even if the compiler does not warn the
use of if IS_ENABLED() with complimentary #ifdef seems inconsistent.

> +#ifdef CONFIG_LOCKDEP
...
> +EXPORT_SYMBOL_GPL(irq_set_lockdep_class);
> +#endif


-- 
With Best Regards,
Andy Shevchenko

