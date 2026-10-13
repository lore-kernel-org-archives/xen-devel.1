Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E711ACC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:56:10 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448099.1664138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGer2-0000zb-Ue; Tue, 13 Oct 2026 15:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448099.1664138; Tue, 13 Oct 2026 15:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGer2-0000zU-RS; Tue, 13 Oct 2026 15:55:52 +0000
Received: by outflank-mailman (input) for mailman id 1448099;
 Tue, 13 Oct 2026 15:55:52 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGer2-0000zO-4k
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:55:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGer1-00DYXO-Hm
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:55:51 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace546a-e002-0a2a0a5209dd-0a2a450ca220-46
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:55:51 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5486-f479-0a2a450c0019-d15580acec26-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:55:51 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-8a83d2706fdso885077b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:55:51 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791906950; cv=none;
        d=google.com; s=arc-20260327;
        b=srQi02Z8KiK3lAYnnpE3Diq5RAwFxAi0b0zp+dYOwlOhUu/sdXzdDL7abBC9wU7Akj
         wuxqHPrFgtOygwXYE/9ZmLMa1Bl8GB7RoKRFYbSJV3X4yO43Dt/YQWQKwVumcAxwydhS
         ikqlEKkW0A70Imz7uivgE3wVaDMW4TKYgcJYJlP1isgdXBwavrNWl6DMy41qUktF2Rx4
         xWIPzc4mQUyDyuBtkGBvRcH0Jkdtcq/n4BWSf4Ya/7P8I36H7RZGsBEoccLN8PUt5ZWx
         hoYYc5uMYCg5QFTd9QYjeIiL4JEp1OU0B4cs5dpGnLEMEwgPZOnj3Ec5CxAtgV+NTYMR
         jhag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sTgxmuTcgGn5AYnFZDK43ztyH8Gx3aWrWj8nhRhWJTw=;
        fh=bpFCTF2CjiTLxWTYBhOv/HXVUp10iE4KIRBQOeOiWwI=;
        b=Q4ZYJgGITDSPpO6tcjN5fm1oX5C7pvLUov9tLyy/vGrDuiWEoPvwk36Q5l2ZvF/RmA
         jS92easqsaW4FSfEZhpkV5D7wRrfASTg1CcZfTxaabXZ5xDFjiQvokQpt2Q48nWJVNjz
         PqCncRRVHb4R225YLhetgTag5ikLQs3FugFs71wEKBrWR5kEgMLF4INwwLl4PGOxQbMj
         hQJ2OJ0JQOOgouw1L7g/0hfZqIw29596LPIjCo0JJ8a96hcSuxCQ9PN26x2sAQJX0Mmz
         u4FV+cljO+iVrFvP3Qc55+nECQdJNTETZ99C8bk4NP3/lRH4BHHvUQQqp6NE3mt+haJ5
         NU2A==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906950; x=1792511750; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTgxmuTcgGn5AYnFZDK43ztyH8Gx3aWrWj8nhRhWJTw=;
        b=Q8V6quUA7Jt+hPL19V5efiUc5p6v+eVcofVszh/hmH7rPTbrsJFvk3C0txx0M9PZgi
         p2ne7QB5d8BStngFCAmrCpjwZFspiq9kZAM4YaiCWvH2G1oBoy/BiKswwHNW/wF6B34k
         +OyhKS8vSiOzf6x3EMnnOmALdQNdbn7ns04B0KYunKNdx9KM+0KiiQ5QgdGY17Ejy9b1
         bMH2wj7PRPAGDviWJsBeU1tO1DOCTSSB/O5bqqWE9JKJS9hYW2mNByZlkmPxnlTI5/By
         YocYluvsMiIV3sX+TnX+nKu/jD87zbLnYRFvdTeojZTic7Yt1vxPIgdbd2GvhG3l/QBE
         yKJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906950; x=1792511750;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTgxmuTcgGn5AYnFZDK43ztyH8Gx3aWrWj8nhRhWJTw=;
        b=yHY5atSIVN1eVj4JJSbeAzsiTMHZ9S/yT/fEDss8dLaglNKFxupwbz1P2M2ppc14di
         OpZYQOWrNwDvxVdcx8XF1zejjqUT+BPaVQ+cx5IAnsWxzZx+I1xMPw5TZJsU/MfKY8yf
         Kv7Z4/4dmeUhhGy87Ef6McJXcqH4skzLBVcjmnuZMVBsZQWYBYOxF5K4WPLraxSI9q45
         sNlQDv6uczwlNVsv/joKcrv5GYZbUHCRRFfVED4vOBBxIB6iD6OwSZjQsqOIqTQifNZu
         jwuQUByCdJfO8YawexW4KHjuul/fubXl6fiulWA7Rq5jdyVj3SzOictQxo0GeNKxwj5e
         OKMw==
X-Forwarded-Encrypted: i=1; AKwUvBzyzRFsCBxdopV1qXrnZAtIaYO0aFHMsYLi47TR+dK9cnt+hw5/2qLtNwN1Co8MSllJrF2AEDeCIQw=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIP7ueLRiAjA+GbeJ4I5lf/qIoUf0l0cp85gClvTKoX1cYXr+yB
	ltLTdAW/GLCo3J5FERf2XwGAs8PForsFBAKFBTUEUeYCCIufm9CcD0QZFYlNQ5L3ZCN9ClaIhLd
	ZozNsauMDASnBnL+wvg/eRj4OvB2mCgqRDbNk1HC4tjrgEZEE0zAo5fw=
X-Gm-Gg: AYBFou08Sr0KEFgjTRAeqTaVhLxNOClya2Rf6WdDSK51Z435kesCoMvUatHD4IaPpTb
	7QBOBOFc74Bl+zpgXtXEYb3hJOsjqz3IMBPR4lavDIsVCW1ZrzAI7/buQpBOuLWSd6A/0ccjwaK
	svnhsewOweka1DVacPJ8YkkKbkbkPMauXrtSJDyROJT1R3zjfqLBtfISVgeHaSdwIALR7T7RVfK
	cFyMn3yZnXdaiXETot0DQRdFSCBZBJUOCDx5cYNwxMUgzzHyvbNg1loD2ikix2k+8kyhSYpnUHU
	F8BT9pPd1dUqmadalNgrbJJ7CfWNRQpK7paExa7o0P3j+l8DMUMUzoOpul++ql40qbgS0sTbIlX
	tI7PnpFOhYbMX0WiZtqhwenBQ+xwtcr4MLSwJHtM=
X-Received: by 2002:a05:690c:6601:b0:854:819:64c9 with SMTP id
 00721157ae682-8b07edb5ea4mr42017507b3.30.1791906949876; Tue, 13 Oct 2026
 08:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-8-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-8-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:55:38 +0100
X-Gm-Features: AclHuK9Q8ujVK1Qm61IAieZOwWt08FK4q6LtqNYYH834z9PQmll0ML6FC0JdYeA
Message-ID: <CAFEAcA-JeCRDSrRLhsuV1CGC3TnM13KLr0rYg1fR4-GY-b507g@mail.gmail.com>
Subject: Re: [PATCH 07/22] i8259_common.c: use i8259/i8259_common prefix for functions
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d25034/1791906951-76ADCA5B-1108CEC2/0/0
X-purgate-type: clean
X-purgate-size: 578

On Wed, 16 Sept 2026 at 11:51, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This ensures consistency with our normal QOM-based naming convention.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/isa/i8259_internal.h |  4 +--
>  hw/i386/kvm/i8259.c             |  4 +--
>  hw/intc/i8259.c                 |  4 +--
>  hw/intc/i8259_common.c          | 49 +++++++++++++++++----------------
>  4 files changed, 31 insertions(+), 30 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

