Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5FFCC6B19
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:23:39 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448165.1664228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfHi-00040e-VS; Tue, 13 Oct 2026 16:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448165.1664228; Tue, 13 Oct 2026 16:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGfHi-00040X-Sh; Tue, 13 Oct 2026 16:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1448165;
 Tue, 13 Oct 2026 16:23:25 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGfHh-00040R-BT
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:23:25 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGfHg-008ZOf-C6
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:23:24 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5af9-2eae-0a2a0a5409dd-0a2a4505a12e-8
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:23:24 +0200
Received: from [209.85.128.182] (helo=mail-yw1-f182.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5afb-4cb1-0a2a45050019-d15580b6d815-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:23:24 +0200
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-8b05bf699easo23469577b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:23:23 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791908602; cv=none;
        d=google.com; s=arc-20260327;
        b=rYCXK0WW4ZntzZT8ddwfpm3NP8hvFo8CypjaHbcQU+quFqP63BuoacHYmiSLTC50Nj
         vkzahpHUVGmI1o8pG2aCiCgD8q1NuToxvY5WOR/XtowOr6EIr47l5e7mpSG0wlbDw5Wk
         sYzBL5LYZ1jv2UTfeWyZHjacA3xs2an+v745J/KkgwTWLhkoFCq1l30fzJpCZE9kGPxV
         PExcxsA6T2j6yxZvJ3CbSJ+5zlSbqUONtbhdd3792P88I3EZfNDx6W/fVbMRTDUQcQE6
         8fq0LKE6f1MWYcKuWDSv993EYzKUdWXqqUxkwBrNE7AOWhsK0kfSkNAUIxtzn1yUhUTo
         kFfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0aU3xZ0O9qtDwjPihhb4Xe3w0i2uTKvAQPFqDUeHH/o=;
        fh=EPCCytDeP3vLQ7g2MfIU1KePKPlwz1O+yDAB06rI5ws=;
        b=EbwsBrFUWY7XrUoLvMd58Lw7ZYzC5YWQrg/qzVoWieXP0McpB0MMimKLADXI6WQncF
         QlZy+7y0hJ1N/oHDQQ2LurqJKX+j9tMTK54x0gK9E2DthEsVvBggJ0dt8mYKDDcYR1pZ
         sHBg9BEu3qRIGUA0qVZscOiZUA5KA17ooht9RL0qo4ol1MU6mAVDo4/Jlstw1AeKP0jW
         elgFNORy7JpCmPDXPzt3IQiaWoSZreobuejyoJcMS0BoZci2c6hHtnSQA0yddZl4pnS1
         sd8RcC9yfXbKYAZ/ajbbzyk5zDHSH9SscJmW0CEe2YTkaOPlPnauc9V/+cqJagVCjMui
         OCTg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791908602; x=1792513402; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0aU3xZ0O9qtDwjPihhb4Xe3w0i2uTKvAQPFqDUeHH/o=;
        b=hwcUntctFOa2h6wqomvRibUqPXytRFBuC0+eHBQYDDJLqrhFEk3MRPJPHt8tCwIo+f
         n3gyYtDKuK9CtEo6Fx32WFem7hZBrfNHdRSRR5y3uX87JixQTdpnpC6TxTfDL/evJo1G
         Pu9D5/HYR64vWaOCOGEzHBOZC30/rds9kCnCAJL1xTnRh+SRLAgWl08GVTP+LNdIUuGa
         rerzrCpRwkS5K5eVtKOA+Jb0vXr22jng/W6WNFArkFGLbONKTXQqUiAmknPFRpmS1ps0
         ZpJbyry1gWArPsh+ZWxo7PGp+Wtq05jXd1Av4OG1o6Oj70xouaecgof/40Fk/7/TrH+b
         x+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791908602; x=1792513402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0aU3xZ0O9qtDwjPihhb4Xe3w0i2uTKvAQPFqDUeHH/o=;
        b=M0Sg1ph8C0ylFVqhNcV1FC1+0WhbcDcnNBxwhkCAJHxo/Hhf8aXZDMqaU7Cxb5xObg
         9RFDk4vTrftT3g/OM58IPooIAHyCbwUUcgtpQfdEkiM1yBhLdSjy31J+ITP/w32FVhEM
         uHiNSH4VRqz0XrEwDVNjQxRS+J/V1Hv+I9xYWhOXlnmFFRch0xn0zJQs+nPlx3LFdNNx
         ugoF74LrJ0e8J+6AHYf/wcme/rWXj8f9UNb0L64vBdvWPGKIQhA5XCEXjHFgrSxnt/hF
         DG6DzWYsXLXgoLoKO04fQAWhAxiXTFl0F+IbwxoGRdeLzDsthgGSQOqEGeSQ90PtYdUW
         eI/w==
X-Forwarded-Encrypted: i=1; AKwUvBy+xoEq1Fq7RJtcCUb/+heJEixy/mBi+ZfBDJAOTXyF8JHyT64YBMSXirBneKc81rra5CPb2UDxTIQ=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLTr9SLlt9sQ+fVG8dDmGuPg9NG1IiCiA39odcKv4UWKUJy6qvr
	LyGE8pfWmm+W+rMPoRcTLNlZJDnQEcwoGyAF7K9wqFZscW+FwNHsxsHfvHGMzAbA+bgexderUuG
	IfpE+PpkIvW2NT39oJ4QetkEBTh7s1GtGRjRTnA+Q7Q==
X-Gm-Gg: AYBFou27wG/BurZ3QDGtzdWUra/bUQU+ZXgr/dDAaaM3qLNepdeMn/SMolSTvpBV9Zc
	QoRVI3yLCwezcSt9hYs4c2v9b6vw/Uj6wp2E4VpWh/el6iTzGpm2+3T0RwTJZWsdmZyySlcde46
	LuxFCW5imKe+d0uk0vYoJCmZdZXDzwnw7fbQP+dkEuKjNZA6cNReLl8I2VEpEQVvN3vw97lfLsC
	igKsrknkv0Krg1rC+esEVhViNjCrdMTYdJ4sW4SQK+UezfQTanlm2F1sEjr8Sr7DoV5Bj2fzgjl
	9Dgg088EGasH15Ir5omLipc3yhefmaE2j1v+TtYcmhFUMhjg3QnRsr0t2CfoDnmdwNJ6Uv1sKkH
	kx+/hlV0T3Qb6rs4r/gby7rxk6B0vmRWLb5+ytMg=
X-Received: by 2002:a05:690c:64c9:b0:873:5c6b:a303 with SMTP id
 00721157ae682-8b07ee3497fmr39132687b3.49.1791908601818; Tue, 13 Oct 2026
 09:23:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-20-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-20-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:23:08 +0100
X-Gm-Features: AclHuK-MjIAggBsDJMxmpzNkKaRTjLSJqxxUvhq9jeMG2XLDgmhSjMKS0aBvJ8k
Message-ID: <CAFEAcA91zCVb+ombgdcZOXVY7CVk1qXW__mbg=_G+Z2L6-Hytw@mail.gmail.com>
Subject: Re: [PATCH 19/22] i8259: move InterruptStatsProviderClass
 get_statistics() from i8259 to PIC
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c201ff/1791908604-72CB02A1-09D21F41/0/0
X-purgate-type: clean
X-purgate-size: 768

On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> The internal i8259 implementation has workaround logic for storing interrupt
> statistics since these are currently recorded at the PIC level (i.e. for all
> 16 interrupt lines) whilst being stored in the master i8259 device which only
> has 8 physical interrupt lines.
>
> Move the get_statistics() implementation from the individual i8259 device to
> the containing PIC device in preparation for removing this hack. Note that
> this has a visible change to the "info pic" HMP monitor output since the named
> device displayed by "info irq" is now the PIC and not the individual i8259:
>


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

