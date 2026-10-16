Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78138CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 16:05:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452356.1667189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkQY-0005jh-Tk; Fri, 16 Oct 2026 16:05:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452356.1667189; Fri, 16 Oct 2026 16:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkQY-0005ja-Qz; Fri, 16 Oct 2026 16:05:02 +0000
Received: by outflank-mailman (input) for mailman id 1452356;
 Fri, 16 Oct 2026 16:05:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkQX-0005io-1x
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 16:05:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkQW-0094WP-EW
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 18:05:00 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24b04-8faa-0a2a0a5109dd-0a2a450489ec-48
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:05:00 +0200
Received: from [209.85.128.182] (helo=mail-yw1-f182.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24b2b-b57f-0a2a45040019-d15580b6c59e-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 18:05:00 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-8b0d5ddafbcso759657b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 09:04:59 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1792166699; cv=none;
        d=google.com; s=arc-20260327;
        b=Ta62YgaI115eebM5lX/Qxg1120z8ao6tw4w/UTaNOA9UmiLhsiLnzROnaqLWYKtrIA
         5T/7gx6WAfKjGDU+TMWjh7eX1fMueoXrymEeCy6IS0Huiyo4lO94R6OUOKdOezh5XtsH
         LizHLNvdccxOWkNoDlgfbxSqiBHAW6bDjtS07m2/kr+bUY/NoUIlGYK0XINgwu5Kp8/g
         SV+ubAQgWI7DhlPx7SLVuGvOEMwjmx7toaMPy7zzWIgp5DJlBYNIR9O7ts6rw5VDWKFP
         6MJ+CnKoVCoR4Erecexndiny4kN/ifGFn4pyA+/64/V/2sPboqSbOfDGD7KsVGJgN+aQ
         cKrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oHZaaHBa8nXusX2kfKrl6y8KNB9X+UZvV+PXu8W417Y=;
        fh=TXQgLy/PlyK1OuK64RfFLmA4AMkVn8VTs4weE3CHUMw=;
        b=J3dXv7SFpw6PMOaiKxE2qeE4+psDijZ6mIkd2eYihF95bsPRVK5IQain6L/ogaUnNP
         ViIa0C6YCdHcMZmecpTl8G/23wjTRqkWdanWzfje202NqnOZjEo5I2leiE51cq/Gaap2
         s4wMJ42JBxt7u0AiiYgu4dHOz4skJx+bEbEUtJqlFr6UFJftksuWOD+hwy3wjowOTME2
         1ENSONdmLHfFmXavE6jXGgCNES4+/8MTyLHY5q3LKS9BneVlrOh+K2YSaLqZemsaNU4Q
         a15IA7Px/vfO8N0G7VVs+9AVRX9fY4AEJc9C/eT1NYAfERVu1GZsJO4F1a7QYgXtebW2
         L0GA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166699; x=1792771499; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHZaaHBa8nXusX2kfKrl6y8KNB9X+UZvV+PXu8W417Y=;
        b=tJzf9uAVd1bquP9MPxxIotz8a4zRmIsFgpECI99szQNzmjh8IOj2j7jGc9kKdlJS45
         QZeVsKHS9GR3hpqM0QLTeDW8dan9tJ4vIDRYI/HyYHljBTW7HXyPuxPVLCT9IcE9YbpA
         MT8QN0WHvUCLC4cKKHReQB1pBMNX9sx5f5H/PR6fjN3Eu61TeANUFfOsN9qM+WpmfKUq
         IyfGSskfKAheU8zUcN9RoJlnk+J7qMZfg8oozvQZJ/nsBqRByfTwMVfXzDdxwFzUv+C8
         C+7SUH0OTCBQVl9RYCloW8CcLKqbtrziCo0RJv1fK3gWs4Jy32lKOntPRi9EiVWnepEM
         bzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166699; x=1792771499;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oHZaaHBa8nXusX2kfKrl6y8KNB9X+UZvV+PXu8W417Y=;
        b=xZEHL7CpUgGTDCn1SP0iGDQg9ec9fPa8KjSUGbBdvN5s5xiz654wkmxK2w5mH2w4vY
         qwFBTjsy3mXhO5qrTGHjlmpRcnNHUGo7P8Enp9jw1V1grK5acQGZIltYhdXRUd+71S3x
         QMHRY0jCoQSOWwUYPYcY7VUl66w2KMf/da9W857sMCmjJk3DZo64WEJm4HLre6i9RoRt
         NP4TuHtfr3VKg9Mrs+9nYtyjoQzCD0+BNVWhrldqFlZGEqwlWHXbbvpXaYoRzHmYQq8Y
         KZlwE/Xy1HG9bF2WX3R8lv3dDzV86d21tZpmx3A5JCVablMQAmkfhfMZWirUPVegABB0
         iYNw==
X-Forwarded-Encrypted: i=1; AKwUvBx9LCdY9s3xYWAZHMcx9GZxzMOneZxqw9f68MSAqRey4uuNvZPTSYJKcU2AOaWNYQ3tD97seZKeDbA=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJ4ce2B1Qztw2cYXBoyrbDHY3gbzawu+3M4alHsq/EccdwuQP/6
	P/oX2km2r60/3sJbkxXqXHDUSk9mirAZd1Is3dSjKT6ubmCD/I/iJDVSNzYcY2vliblwFoW3fw+
	mdX13RR0AeBOnDSIe6vMvGZbmTj1VXcsRyNLmwdH3sw==
X-Gm-Gg: AYBFou2Q0c91BIwL+p6RFYnFjfoW2TuVzCN/B71qSmoVqmbMgacmXLyn0Z5CJCaaD9w
	K8Q4hf/If3vX4DQdg5MMGycwlJ9XbrMTVg8SIiXSY97VOFYRr3+NVU5l13ZnWe/OLl6TCHt10xz
	1SK2j/0Ypm3WRkr5TQlmtMwwM0IwYQCoGH3hXv8XAoZx+CLvu5sJKrhY+dUY8wFohDsuc/FZp4S
	qEgFXP/Su7xxOTJ4uAyd2vxXpmv1OO5TqFs0z7FVDzgpYCM+WsQcjQP9ZesA3aJ66tf/FK+wlgp
	nlD2OcJUPdZ+WKSWCsPxjRjBR/q2YTb7r+UrRC3WxVwUnDRwuiP/VBbB4zZlp1hcDIGJ2K6EyVg
	8jIq7i+8tsb6tBCzU7FC43hRKF13jTB9C51uUqugnfFg0z4RsG4g=
X-Received: by 2002:a05:690c:6f83:b0:8b0:e207:34b4 with SMTP id
 00721157ae682-8b0f21aeb87mr1772277b3.18.1792166698679; Fri, 16 Oct 2026
 09:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-20-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-20-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 17:04:46 +0100
X-Gm-Features: AclHuK85P2rMZqG6EDXy88iBDY0zAJ9NcmkQt_m8qD6NH9SZYu0OY-RxFihenIw
Message-ID: <CAFEAcA-JxCnmwSnMoEu2UWGX_wmoynMK7nC8OX85thxV=Dq-sg@mail.gmail.com>
Subject: Re: [PATCH v2 19/27] i8259.c: properly cascade secondary i8259 from
 primary i8259
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1792166700-53AC0B50-B199EAE3/0/0
X-purgate-type: clean
X-purgate-size: 2449

On Fri, 16 Oct 2026 at 15:24, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Currently the cascaded output from the secondary i8259 is returned directly in
> the pass_irqs[] array, instead of being connected to the relevant input of the
> primary i8259.
>
> This is a bug fix since in a cascaded configuration on real hardware it is
> possible (although unlikely) that the cascaded input from the secondary i8259
> can be masked on the primary i8259.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/i8259.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index bfe01067b7..5f90edbe60 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -519,7 +519,8 @@ static void i8259_pic_realize(DeviceState *dev, Error **errp)
>      }
>
>      /* Wire up secondary cascade */
> -    qdev_connect_gpio_out(sec_dev, 0, s->pass_irqs[2]);
> +    qdev_connect_gpio_out(sec_dev, 0,
> +                          qdev_get_gpio_in(pri_dev, 2));

Looking at this again, I'm not sure how this is a bugfix.
Quoting patch 18, this is the code at this point, just
for context:

+    for (i = 0; i < 8; i++) {
+        s->pass_irqs[i] = qdev_get_gpio_in(pri_dev, i);
+    }
+
+    qdev_connect_gpio_out(pri_dev, 0, &s->i8259_primary_out_irq);
+
+    /* Secondary */
+    sec_dev = DEVICE(&s->i8259[1]);
+    qdev_prop_set_uint32(sec_dev, "iobase", 0xa0);
+    qdev_prop_set_uint32(sec_dev, "elcr_addr", 0x4d1);
+    qdev_prop_set_uint8(sec_dev, "elcr_mask", 0xde);
+    if (!isa_realize_and_unref(ISA_DEVICE(sec_dev), s->isabus, errp)) {
+        return;
+    }
+
+    /* Wire up secondary cascade */
+    qdev_connect_gpio_out(sec_dev, 0, s->pass_irqs[2]);
+
+    for (i = 8; i < ISA_NUM_IRQS; i++) {
+        s->pass_irqs[i] = qdev_get_gpio_in(sec_dev, i - 8);
+    }

So before this patch, we connect sec_dev's gpio output 0 to
s->pass_irqs[2]. The loop earlier in the code set that up:
        s->pass_irqs[i] = qdev_get_gpio_in(pri_dev, i);

Now we have:

> +    qdev_connect_gpio_out(sec_dev, 0,
> +                          qdev_get_gpio_in(pri_dev, 2));

Isn't that exactly the same thing?

I think it is indeed a bit clearer to directly grab the
pri_dev input rather than pulling it back out of
pass_irqs[2], but I don't think there's any behaviour
change here.

thanks
-- PMM

