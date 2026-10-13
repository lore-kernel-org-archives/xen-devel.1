Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC03CC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:00:09 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448116.1664166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGev2-0002tc-QH; Tue, 13 Oct 2026 16:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448116.1664166; Tue, 13 Oct 2026 16:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGev2-0002tV-L7; Tue, 13 Oct 2026 16:00:00 +0000
Received: by outflank-mailman (input) for mailman id 1448116;
 Tue, 13 Oct 2026 15:59:59 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGev1-0002tH-6J
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:59:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGev0-00AIb8-JL
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:59:58 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5556-8faa-0a2a0a5109dd-0a2a450ad9aa-18
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:59:58 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace557d-f2d2-0a2a450a0019-d15580aca418-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:59:58 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8ac8a2ac52bso31826237b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:59:58 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791907197; cv=none;
        d=google.com; s=arc-20260327;
        b=jm/3FKAaE73Tx3V8Yi7gqDpBT3Y46x3dPKAjBejyf29th2G3KzQzg9w32UNFrx1LiB
         5RV83kA7ZmEP3pJwglzZeWcQIerdc2jHPOPxk/TBs/aH7/seBe84ElF2s5FZ12MO9haf
         lwT0Tf0QI03vDM/54Uz+HC+vSb3DIc9sau+8aw1AhzzY2l1ikcG2CKcC9G8jPlSt4KCv
         tY1Tmo1PgQ3JUoccdDJgr2GUybPUUYuJPWu42L/J/FNUEIupqyy4/eQlUcHBxCHGO/hw
         ie92tS6i/Qf/MViBC1XGTEclJ0oG2eIp3UKcWN3dcnlGTwXOGqafDB5tMi/ELGNQWscD
         4Tkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zdyX4MUR5OiHaBAfMH/AdP6QjGz5HJgdPnXErxafrT4=;
        fh=EceZd/VnO6gjtEVcql+ldXI3bOs/YoD+sPeIV2aI29Y=;
        b=QX4IWduaY55wKJcEBmrdTdsUf3tZ/Fm5zq26QTq/xsBqI5vRKx3FhdE8tcZHZ0WpEe
         8T+35yfROCJmm2SWYb4BAwILFgJUjL7xeFrLNHfHhW+PSztMQkTdem3uOBwuf4Neq4QE
         gV1n7SJtBO9wc3nF/kfXavDhIPFIqV40TAw2Wh1CZBYPAt5b9iuJ4dU7z2cVR1cGz26Y
         EvMYUIHPGRNQNGgft3CkGXUG1iJutajTsxJ5Wf5cS645+JHJb/BB5fNuO2bWW1j0fSn5
         6ZAT0fAR9IYxVQATsRdWzGR1joaiWGlJF/TOMUr+SrfypEe3Wm6RhOqwkwaTmvnsuveC
         8Y3g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791907197; x=1792511997; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zdyX4MUR5OiHaBAfMH/AdP6QjGz5HJgdPnXErxafrT4=;
        b=xeqzkb9QhzoNNJiWMJY+qIZKXj1XOxaEgBY7FO2wbCKKTApYQKhAPhNuT3btvUNVpm
         BIsXlD9/0GBljSaiRj/3AUMeQ1zQue+cyGiRQdmFSjXFp+GUy4s6U0wMU8CrgI7PHzQt
         11RlpyXIXXbwyAG7muB6FUWbZeIjaIxjij0+RNf2A6WFDNVnXFQAgntEbvQk513FeDsB
         xMd1TD50rMi4tHRZ898m8C30FSNeLAcBenwfiM0RXmJaO3oja91IWXwKcP2gcxvSROIN
         Qf1NhknNHsba/0ke5t1KtseeIqtaR2Xbx8MCwWDpLUCcgqflMVMg5OE90GEPYEXXANDj
         3Y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907197; x=1792511997;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zdyX4MUR5OiHaBAfMH/AdP6QjGz5HJgdPnXErxafrT4=;
        b=K/FZixi5zrIPpEHlt3yxrs0lFEzA66l6YNh39j7bFhR5vXLqGF0RxD+jK4pv6mpOow
         NPiiod7XjKSU3CbCHWB60FEmI0S23pKjr7ueFjmiF0UPYqnBcaLcyBdtkbzT46B7Nk/B
         Bl9tIPk6Hx+eIqdUROrjNo6hRFz56Sqh0j46KmlX2YKbOL2HgZe1oSOzsrD2DOeEQo04
         nxda+3OYcQ/rbIIF+DskrNMEi+5KI9bmY+1KYGnAEjR3Uo9BvdeqbG4w/euF0leMCkQ5
         87B4dOf6vsgSiKjHotQOeaFCrnLZRRTisXJMpQZfuJdpeSg0hh5m3ABtF++o6pJ3/zkj
         xuRQ==
X-Forwarded-Encrypted: i=1; AKwUvBywTvh9TzHyE8+6OszVlE74s9HQSqa56n0p8WsKpMFJg1I3Lw2fx6xcpEoYlykoHYFQSnrI+Ca0K5o=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLNV7QmGchrVVLHTLMZdCBfkasSOBA5T7zQ6rrSF5qooyUYKG0R
	8ZW0a+ukQanfZe/I5Gc0kQ/2ADKe7R1rG0YDYsqOSQU1RENwpKClB3IY4fSstOhAj7dqgodRMPG
	wjCqrqTG2f4I1yZbqRVBXd2teeKLCQX27bB/lQ3zTcA==
X-Gm-Gg: AYBFou0NRQpUr9KafISNa2IpHwNPLZ4OdWyQ+MHvqWKyfI4HXwWLHBQ1dsWOJJul64Y
	Ddb2cYi/yMdQvhEY9w99Z84uKDt8ehY/sXZQDi4EcSAWMB/bEj4xY+IBTSAS/0m5lrWv3iJ112k
	Rr2xyWkEJD+YUCGSf5GGuBDvNvDStBIU8omy3cN4ePYpGuUX+4DjElxkkJPwklx26q7jWrhLihr
	NGSuS4JdymKSkzZYZQH0GyzAHubTP0pk6tQ576K4BYq8Rv7S38sCIgTRh6ulzAkrIDPoEGfBriA
	f6i1H2yvzd2tNWbb0RS0RpWgKecikGcTqN0BsDhQdzAeOsc0ZmWj2d09XmI5seGXFizPQa9I3zh
	bZeUhsVde+Er90xDVNA/4buUxiLl/hn9lzikKWuM=
X-Received: by 2002:a05:690c:9e:b0:8a9:a1e9:2665 with SMTP id
 00721157ae682-8b07d3c4195mr46197787b3.6.1791907194410; Tue, 13 Oct 2026
 08:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-11-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-11-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:59:42 +0100
X-Gm-Features: AclHuK9me7UkpYql-63m348NYt-T3nReypZ14DzPdifhqRdkrWKep_ta3klwqT8
Message-ID: <CAFEAcA8uN6r19nQpR4okcVGWgHXxOu=BLfvSTmF4_Je94RkYBQ@mail.gmail.com>
Subject: Re: [PATCH 10/22] i8259_common.c: convert to use DEFINE_TYPES() macro
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1791907198-593C4CFC-F50D824E/0/0
X-purgate-type: clean
X-purgate-size: 353

On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/i8259_common.c | 29 +++++++++++++----------------
>  1 file changed, 13 insertions(+), 16 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

