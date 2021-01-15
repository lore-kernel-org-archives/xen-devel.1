Return-Path: <SRS0=GqSC=GS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A87C433E0
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 14:48:19 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FEDA23359
	for <xen-devel@archiver.kernel.org>; Fri, 15 Jan 2021 14:48:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FEDA23359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.68198.122058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QOY-00043c-Lw; Fri, 15 Jan 2021 14:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68198.122058; Fri, 15 Jan 2021 14:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0QOY-00043V-Il; Fri, 15 Jan 2021 14:48:10 +0000
Received: by outflank-mailman (input) for mailman id 68198;
 Fri, 15 Jan 2021 14:48:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XE9r=GS=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1l0QOX-00043P-NM
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 14:48:09 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d54dae21-09b4-4d1d-b3c3-97c4098e2170;
 Fri, 15 Jan 2021 14:48:08 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id 7so2300489wrz.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Jan 2021 06:48:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id t124sm12636120wmf.2.2021.01.15.06.48.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 06:48:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DCEE41FF7E;
 Fri, 15 Jan 2021 14:48:05 +0000 (GMT)
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
X-Inumbo-ID: d54dae21-09b4-4d1d-b3c3-97c4098e2170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=B3cfF6G3obrdA+qsX80wgLLhCOHCsTrVljEbELlPUMA=;
        b=XvYtPQcYYheZOC90GvU4XvA9epZe49RHdEUsZau0uRchhKeoa5uJVqJ5jjUDNL4JFH
         cL5o8fpY1sc7TMngnIPtB7I6JASv2q/hNcuTrwGMNg4HJwlwPmQ/oLhiTJ7+Mi58UvjI
         YHRCezOsSb0p1jRJpcUqVwuinvh/mvE2sJD2Vz2wYqwiH5aJkRsk0OKICd1g9rksAJMK
         kk/RjrC3R+QdkeiOpVzoUaR79TqIgCgoEbfPuHEGhxIFVrATj0tV5c8f9e/hbMhUSYj6
         PuqH2mAX8PPnEcTOUM7gh+UcwsAw2RXg/+S4mouGCJzNOtmXvSr+o010MBaQho48Humd
         KpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=B3cfF6G3obrdA+qsX80wgLLhCOHCsTrVljEbELlPUMA=;
        b=BcUc90rEBOIP/mzip7nSf2A0Y/iNil3EunUxHLGMAcUs1t2q3euoQFilwtLW2uQ7XN
         TY3ELCCvzu8z0VEY2xO2wA+QGxtL13oUqcZBbPVW9hw6WUd+yapl1qzwwzCHFuoxXLU+
         Yrh5ncwmpqTqAI/rvTWjFvwZNIDDPxlGrI42pmc8M1WR3L/8te8wk+D88jOJ39UX1ee9
         frYvokfpCx0EPIIgEKiambjrV+p/oxYaygfUthakhVQXi6n4H0z/whMq5zDl89RBHfNy
         HnBF9bMiw0gszWNYWr0KNTCFlIzgSPhuGlDu9zCwIzsfEmkkl5KwydHUyfV76DnnSBTa
         qABA==
X-Gm-Message-State: AOAM531AysflRtG6UqQ54PiFqOnrEZQjQ8YulqYxg0QqMxjEDdjQtHAV
	1ViAQsrLZm99501I5PX7jX7pDA==
X-Google-Smtp-Source: ABdhPJxIj3K0h+X5tYKoDSguv94hgVi5XXVubYjXL7RH8pNUZo0I/cPL5uxQA8X2VAMPF5WLHwKNcw==
X-Received: by 2002:a5d:660b:: with SMTP id n11mr13582218wru.407.1610722087917;
        Fri, 15 Jan 2021 06:48:07 -0800 (PST)
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-4-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
 <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH V4 03/24] x86/ioreq: Provide out-of-line wrapper for the
 handle_mmio()
Date: Fri, 15 Jan 2021 14:48:00 +0000
In-reply-to: <1610488352-18494-4-git-send-email-olekstysh@gmail.com>
Message-ID: <871reml0ii.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The IOREQ is about to be common feature and Arm will have its own
> implementation.
>
> But the name of the function is pretty generic and can be confusing
> on Arm (we already have a try_handle_mmio()).
>
> In order not to rename the function (which is used for a varying
> set of purposes on x86) globally and get non-confusing variant on Arm
> provide a wrapper arch_ioreq_complete_mmio() to be used on common
> and Arm code.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

