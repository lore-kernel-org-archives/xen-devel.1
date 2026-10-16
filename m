Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB90CC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:17:46 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452381.1667209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkce-0002PX-AH; Fri, 16 Oct 2026 16:17:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452381.1667209; Fri, 16 Oct 2026 16:17:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkce-0002PQ-5P; Fri, 16 Oct 2026 16:17:32 +0000
Received: by outflank-mailman (input) for mailman id 1452381;
 Fri, 16 Oct 2026 16:17:31 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkcd-0002PK-1v
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:17:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkcc-003SLK-Ex
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:17:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24e0d-8faa-0a2a0a5109dd-0a2a4504e58c-10
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:17:30 +0200
Received: from [209.85.128.171] (helo=mail-yw1-f171.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24e19-b57f-0a2a45040019-d15580abed34-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:17:30 +0200
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-8871ada1a26so856637b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 09:17:30 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792167449; cv=none;
        d=google.com; s=arc-20260327;
        b=gQGV/E1r3AYtIYLL6gUbd9bNdlCrAigUDwDh9P2oXLAOrmG+/CoYiF8sZQ1JJ5CrKc
         4HXu9L69+LGfBIC7TX1PbiJf7RThvllC2XBYnD6BlqF5T3YJVFsM/NtlgTMoDwPuwD3O
         KUzHJZBHtWGBOVHQ0DYAmw4wGUUwFAO/dM1f5auPP0GHIknFyYudYqCoUBUPMjT6pQv+
         Fjuv29mJgcHiWglyRXt/r9Q20TpJXk7B9MxNEIHFEQlKqrfJ1yqJ4o+Wc8f0i05mUiji
         Vz9yl5ruccLLe24PqN+M6pfyrX0MU3qpifdwx6DVohxYLXvpFfrX6h5XElR5p6BQ7DQE
         teVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=luEslXfElde2BGY9lnddmW44YWpRHQM8vQe1gybMur8=;
        fh=lcCc1/hRSstSjLJ5ejY26T3rBtTsYFltMb5RQzuuAm8=;
        b=Z9Se7BNMox7kcmL8Ox3EQ3sE789yDg8upgvlvkgvDr8tlXR2EHYeQNW3pN+zGMXV8o
         tDYBaybjGh/FZ/pN9WE4DSSGnAGYItIu2rGx30ETXuN0heH2+8L6NLuZt4cA2ZDSFdqF
         Ane8cfXSavioGoBrZZv60WxDxKxj+Kd0HWY1ccVwRYojQOlOP+JDz4OEdscla4QUEuvj
         6C+yxSXJcxJv1xT0hN5OCRtXGDFJByWyccf+skGds4IDYRCFBdygzRDqTCl2V9FItgal
         8arQvM6H9d1qxYzXf5c8ChhkDWxA0mFPgAO/8DCiwC2Pss+8UDD9KfJs1Cl14UI0OSuY
         viYw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792167449; x=1792772249; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luEslXfElde2BGY9lnddmW44YWpRHQM8vQe1gybMur8=;
        b=n/uCSYZaD487bE3En94EPyYufBalIq4HkDceQuVMX+6LO4urbrOCd8e7JyTFJg4eSF
         1U+XCDD2xhQ5YZfK8ET+h1xlF9kynZVIQgtKHOouvzZaEDyVJmXyTFGd/V3Wwl5eKHvo
         edBsvOMPOAfsHXfJjQ65vhM+0g2rKawyOcuuAyk4qp9tC7vmnd6kdt8aq8+VDLHg1VhD
         Fm2vjoN4W3x/nqgQEWcVyEaSmV1x4fHk6OL1WM9LT8oA+8htse5DTl8AcTCRFSvIzQjH
         pKkulp59XVrABCGkbw3Lq6UVFxb6JltILVYKrzRNUDjDwvx0eJMDFj8w/dvvreyUvbzJ
         cF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792167449; x=1792772249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=luEslXfElde2BGY9lnddmW44YWpRHQM8vQe1gybMur8=;
        b=IzVFHrNNWgbvpVLqfXkdyvzDdnxSztAXViIk+pWcNWf5L9FakUGZccOALnXeXv2Eik
         N3qOlvLZEaqzfn46gnU4ypWLr0JpW0MXQ8gE/eWOgp+qO76GGZVL+woYYq6hwxmZL2m5
         GpIWzTVWKyl6ED9wcaKeEVnhXhm/X2OPc/StLYSG0psIogRggabGdaFsUbyL5Fky/JDI
         XHvMylaa1YhDhJYMEKVGL7KSZvJQnN9qV8OOhGrQmLS3cC/BpuxAIo6CX7b2Eo5Byf3U
         1aaxdCjNgOc+wUIAhsZvMQy8Evt4Q7rAf38azzwPD01O/wrZHnSX02/Nxbqx0N3y4HiG
         k2Ow==
X-Forwarded-Encrypted: i=1; AKwUvBwcsM6PTuuHxUBZF8QLQiyUmZBDVaV3NHwQkGFWYx//QzG0+ot2pxM9eYbgvyJJOLHlRCOrFz4uGn8=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLAVPH3r2wwZ6YD34APZUWt2BIQLUyaUPqOxZ/Mii1nhMVwUzmx
	MiCQ517Hmp2jhe/4gwIkNk/SCGwl1P8v4NQzOWFGPAGDNdeGtOApIQe5c6FiMR3i5Fcy+O617q3
	j8hUdrgXovlTJ+AikaWhnUZ65HYQ73eZ46fMENYip1Q==
X-Gm-Gg: AYBFou0tV5kKJl1x+5XogilpSvPSYGAYKTirV1SfyJiDGf4RLKewvWe6T9Wf6uP+yOU
	7Rstda21hHkKsDgD14nSOHd9DU+8wt9K7ILGopplAmFSzfVWrdwoGecV4GK4beWFL94PCswYsyd
	sSFuQehIRcpfoQuJl7ncuqDu8zC1jZVoyOSGZhkU+uWz6L7ZxGDTRmX10QKIKRNcl9ViLDCxHnX
	HhgbJ6W1ZG04dr8a0XsqMJUYa8ktCjXIU7alpBHBFxDj3rNTxR+dL1hBB00/CSI6N+g82kpvelx
	mKYcZpp7GQLTE0J/FCFlNeLtjO8Ti9FpBj7PyOygEUqXUOLNd8lU+HzCZPq6g/bKlGzUDJcfMTi
	NtIrFnI08BkV3ueaaO2xa6W/K4n3S9lTTDxGYpeyh
X-Received: by 2002:a05:690c:7107:b0:8b0:e1c8:a47b with SMTP id
 00721157ae682-8b0f1f1b000mr1901217b3.0.1792167448757; Fri, 16 Oct 2026
 09:17:28 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-19-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-19-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 17:17:15 +0100
X-Gm-Features: AclHuK_dauIe-u55ng8KEFu7scxmNaDRrnhTUewCfR-gyxlxpOSMZ0p1OkE_lQU
Message-ID: <CAFEAcA-bEvYdgzoqAsop7XU+aii+78R3WpwqmU_M_2dZXqA0kA@mail.gmail.com>
Subject: Re: [PATCH v2 18/27] i8259.c: introduce TYPE_I8259_PIC device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1792167450-C1CD7B50-5E0136F8/0/0
X-purgate-type: clean
X-purgate-size: 1870

On Fri, 16 Oct 2026 at 15:23, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This device represents a PIC for an x86 machine consisting of 2 cascaded i8259
> devices wired accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

> +static void i8259_pic_init(Object *obj)
> +{
> +    I8259PICState *s = I8259_PIC(obj);
> +
> +    object_initialize_child(obj, "primary", &s->i8259[0], TYPE_I8259);
> +    object_initialize_child(obj, "secondary", &s->i8259[1], TYPE_I8259);
> +
> +    qemu_init_irq(&s->i8259_primary_out_irq, i8259_primary_out_irq, s, 1);
> +
> +    qdev_init_gpio_in(DEVICE(obj), i8259_pic_set_irq, ISA_NUM_IRQS);
> +    qdev_init_gpio_out(DEVICE(obj), &s->pic_out_irq, 1);
> +}
> +
> +static void i8259_pic_realize(DeviceState *dev, Error **errp)
> +{
> +    I8259PICState *s = I8259_PIC(dev);
> +    DeviceState *pri_dev, *sec_dev;
> +    int i;
> +
> +    /* Primary */
> +    pri_dev = DEVICE(&s->i8259[0]);
> +    qdev_prop_set_uint32(pri_dev, "iobase", 0x20);
> +    qdev_prop_set_uint32(pri_dev, "elcr_addr", 0x4d0);
> +    qdev_prop_set_uint8(pri_dev, "elcr_mask", 0xf8);
> +    qdev_prop_set_bit(pri_dev, "master", 1);
> +    if (!isa_realize_and_unref(ISA_DEVICE(pri_dev), s->isabus, errp)) {
> +        return;
> +    }

I'm not sure the _and_unref version is what we want here. The
documentation for qdev_realize_and_unref says:

 * If you are embedding the device into some other QOM device and
 * initialized it via some variant on object_initialize_child() then
 * do not use this function, because that family of functions arrange
 * for the only reference to the child device to be held by the parent
 * via the child<> property, and so the reference-count-drop done here
 * would be incorrect. For that use case you want qdev_realize().

thanks
-- PMM

