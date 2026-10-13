Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F6ECC6B1A
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:19:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448158.1664220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfDK-0001k9-Ff; Tue, 13 Oct 2026 16:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448158.1664220; Tue, 13 Oct 2026 16:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfDK-0001k2-Bk; Tue, 13 Oct 2026 16:18:54 +0000
Received: by outflank-mailman (input) for mailman id 1448158;
 Tue, 13 Oct 2026 16:18:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGfDJ-0001ju-46
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:18:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGfDI-00Dynw-HC
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:18:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace59d8-bab6-0a2a0a5309dd-0a2a4504c65c-40
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:18:52 +0200
Received: from [209.85.128.176] (helo=mail-yw1-f176.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace59eb-b57f-0a2a45040019-d15580b0b8eb-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:18:52 +0200
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-8ad98c3fb15so24732427b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:18:52 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791908331; cv=none;
        d=google.com; s=arc-20260327;
        b=fe9kZjPuCY0UfDjK/wNzCko0DXjyV27uG6t0b3Xmqm4gT5NYIu4wo85C/M4oSkJpq0
         K7SM2A3KGHk4/Itj2XTj+POwwtexrNs8D/KGFTgrvSjNvfV82BKYvN4ivSg9+7Ld3Iiq
         b7e/dnmtiBzV40MmlLbT1/YjQKk0Xthh//9VwKYnMcx4uBO/yPFC7Krb0drAbzFy89/g
         g+fBbO6NA7hHXBTKj8CuTJzdrYyMnQmxq/FpJ+aDhthY0TeIC8sQzqoqMVfupz5tbtJ3
         95qdO/yneZS6Qhz3EZ63GDdOvkvXudO/ZGVp47DOT8hl8G/rwnY8h7aRmn+QIdIVgQIL
         nVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uSFyrq7MF/+dr64UynPLy/FZzbgropuXsz8I5b5n0xU=;
        fh=VwtwRxvmUGcZ/TBb85CG3vKSYMtkrE5D9a3D4QmDid8=;
        b=d1thSJROmq01LiwHHHbt3zryrNL8E8nie+QQ9pDzU0uegdVY3msQfVL0Dx6DXiMI9k
         f9t16+B2Zr1DMGb0CKu3TVlD2BTsACkvNDuYcgXPEcbebr/bVEPXbQQjmDHn3TtZbN6i
         xELd0ZQnReZZN4M6KmtjqvArU0qRBD8lgAHzaKmcOlb5/eF5zriPTYBt5Iiz7aRkl46a
         /KHgUMQyrHFXcOd5aOG4mbYuG4OIhlsDRD3r6jF0ji3rdqOgW3OgzCNdAaSKmKugMkRU
         qvv0Is6CxkWo4p8yte/QTL1w8LUd8J/RB9X08OLaT2jkoy2sDPuCOhLg8sWJ56wAWTfr
         LjWQ==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791908331; x=1792513131; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSFyrq7MF/+dr64UynPLy/FZzbgropuXsz8I5b5n0xU=;
        b=tC90V3WlLwYeJeJWJ02q+Nuy64TRoUgIfN3bliC0LJFbUQPzjftRdyfpf8Gf8ptv6g
         csUGKddNlNAJ3l7jZXLzT0UJ21KTwIxrGx5MnVxVuJi7rmJFvlgUGVGTlXT5TlgaMHOb
         +T3NI1U3kc2E7V6+zGKBF+E9xp+mdDqVGsm41rk9DOjokMuT/MH16Bv2+8GmEKW1RhnM
         7IHAfTvELZ3hFaIVbCAJQp+vslHKmNlRecDUO3IHmwDbcLk7WrlOzCnl1z9rgStqSs9q
         QTCk7d/g6GGxwM+Vi7H4wHy/CC5umP6PYfIJH7cowPpDGTR4y9r8bt5hMZWCPoIb5Of/
         wrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908331; x=1792513131;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uSFyrq7MF/+dr64UynPLy/FZzbgropuXsz8I5b5n0xU=;
        b=ixh+DTgR15QO3McDwxp6MfMUGLnR5Ru9cksaoCm/FGWbvrkZBpCP3rZNPUxxh09Qd5
         k5I19EwGFew8CUaTgAgK9qPS2ROawWOmHtYVt33k+RCquEBssse+JC1aWQ6k1eG/m9Ca
         MdTor2RIQ1oYpDSwNH5r/6STDX0iF/AsjI0bdcnzNXiiZ7D5YIPUtbLAQ2+QDhZ9FhKs
         CuSHIINkV26F/bYmX3uYKjD2ESnWzZFwkGFRBrkA9OAhpUh75QboVGCjBPoLrobox839
         0wlYntcAUgL/FzV95kGYSkn54R8uzxygITEEcCpWCJTZHBkduwdHmyHlvZb/GLNNkMaW
         oXrw==
X-Forwarded-Encrypted: i=1; AKwUvBzVxFLHVkaYs+1OCbLFIYuSa+2N4ONTvWBDfKc94TPi2h40/GPdw09Nghnz/juJOkYZFwXfUBSxoJc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIzWFV61tIzkJYLY3/HWhJ0elIeT7rI7DL3S+lx6rz+HJPG9DyN
	MBK7TRKQyiElRX9c0ZmA0Tm9JVQtXt1uXIBrBxEOa+f1yVrYUIFRhAhF+LYQqla7kX2I/PW3pPm
	bxq0NtbO0wKqb/i+k8vSA83FQ3O+qp5Xi5DijBr3euQ==
X-Gm-Gg: AYBFou36io+MklXo7rQmdMmtiyEv1jP5R8bv7Z3q5BIanwQ48LCK5Hzi0iEvkwVi/ka
	0Zf/mCgMQMP+bcPdrlgcOICwGU3s6YuDPhRknFsjOyFOFBYNbQLhH0CvBSuh8XfCtSH3XKWtQMh
	wi9dxZtMJbcg4Gh/tNBkx7hinPYzpnUM1SulI6i8BmHbO4ybalk3KkVXgLHA/h9b0xYDWElmjmT
	ZlhwriZ0s3cxUsumE815yTZevgptDNqd8l8iB4j5A7jVI9jlHuVEd6kQjXoSe+Ot3cv6XR10wTq
	EoW0V+AjkOfzc+0pS3gZCy5OeSxaPOwQSY0dJpt9z3cvS7ntXSh9hdygXPiI2srr9rFuU2duQax
	bRlsUwdXiYUyC5Zb874PcFIbVuZeUiHJZ3dAPZf0=
X-Received: by 2002:a05:690c:dc7:b0:8b0:ad5b:d485 with SMTP id
 00721157ae682-8b0ad5be51emr22293767b3.41.1791908330676; Tue, 13 Oct 2026
 09:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-15-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-15-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:18:38 +0100
X-Gm-Features: AclHuK9Uj62eefTNn2tV-70nIiu-sZcGTBekM1cKcu4c-u_DW2QPHqh2o45UiIc
Message-ID: <CAFEAcA_fv66MxW4QKHjUypSwTZL=LK6YVLgNvoMH83ivn=EMbQ@mail.gmail.com>
Subject: Re: [PATCH 14/22] i8259.c: properly cascade secondary i8259 from
 primary i8259
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1791908332-520D5B50-D0870180/0/0
X-purgate-type: clean
X-purgate-size: 1000

On Wed, 16 Sept 2026 at 11:49, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Currently the cascaded output from the secondary i8259 is returned directly in
> the pass_irqs[] array, instead of being connected to the relevant input of the
> primary i8259.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/i8259.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index fcc94e12f8..964ceb04b2 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -501,7 +501,8 @@ static void i8259_pic_realize(DeviceState *dev, Error **errp)
>      }
>
>      /* Wire up secondary cascade */
> -    qdev_connect_gpio_out(sec_dev, 0, s->pass_irqs[2]);
> +    qdev_connect_gpio_out(sec_dev, 0,
> +                          qdev_get_gpio_in(pri_dev, 2));

We just added this line in the previous patch, so we might as well
squash this change into the previous one I think.

-- PMM

