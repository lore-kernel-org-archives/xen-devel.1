Return-Path: <SRS0=FMYz=GX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E798C433E0
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 08:58:25 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94BB022C9E
	for <xen-devel@archiver.kernel.org>; Wed, 20 Jan 2021 08:58:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 94BB022C9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.71267.127491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29Jb-0004OR-L9; Wed, 20 Jan 2021 08:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71267.127491; Wed, 20 Jan 2021 08:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l29Jb-0004OK-GQ; Wed, 20 Jan 2021 08:58:11 +0000
Received: by outflank-mailman (input) for mailman id 71267;
 Wed, 20 Jan 2021 08:58:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+JE=GX=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1l29Ja-0004OD-3Y
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 08:58:10 +0000
Received: from mail-ed1-x52c.google.com (unknown [2a00:1450:4864:20::52c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d6e14322-65b3-4b49-8fcf-f332a4f9bd05;
 Wed, 20 Jan 2021 08:58:09 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id p22so24784748edu.11
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 00:58:09 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g3sm706363eds.69.2021.01.20.00.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 00:58:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B05F71FF7E;
 Wed, 20 Jan 2021 08:58:06 +0000 (GMT)
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
X-Inumbo-ID: d6e14322-65b3-4b49-8fcf-f332a4f9bd05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=xCfjxRHj2l0UtB6lgF/Auvl9WXGe9+9jxTMj/nvJ+S4=;
        b=FVNcYZ/Yg53zkbI8EHv3i5WM/iyjAjRs008sdlM3drnyNThSWYxJN87Dxp1wgw45dS
         L+oXDf5H7LpukQgfXUo7ru3feHrW5SkXx8eAuY85o6i9cwdHSjQWwxyeGyaLogmOThux
         thk+WKhDscL1JOvR2c1+6gB2bdOpcJndtRSQguacDyknLMdFGtJ/hv4iOz8LJUPfHeSS
         JnBNbQus9erSqLdhr6LRIi7ib9Gf4w6zM7axf610sda/pOC8kNGilxCklkJsBhKQ7vAq
         SmEn/un+4Lg9SacBO0Lv38eiUk0UTC813v4DuWbs4u+o7UlB0HKHCriBY1hT+LOShx1u
         X4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=xCfjxRHj2l0UtB6lgF/Auvl9WXGe9+9jxTMj/nvJ+S4=;
        b=AF6pDYStQXk+5V5n2nnl/QcP3oCVSs6oaxB02bX+Yf4K8Vl21kmPeu3HMNorSlGQK2
         df21FF7mfLDFYEgqIxUJNYEO5y/ovBfeIFfdRIhHgrxUJJNtN8szoPstoy4sVABwVXlX
         6zERRK1yJUjAz7bBRfrOiboLaYu+CO3F2YOyFzGtM6TzgtGdZR3u15r/ZzycSlq4vYBD
         FnLQiEg2SL8PAUQnaN+0Cdi1Lk+AytcX45irox3FPgEdNrQhOMQvaLvG7RaJT7wOL2k/
         O+lIR53RzL3jWyE1Kj3urgJv8b8YQ6Sq/F1meU8EvePp49ARlfJoiXMKNNBki7roHVde
         xCXg==
X-Gm-Message-State: AOAM531qu6uFeL5h+7eRJ7AbMYSIZsmQHwInlTjJDkhp/6ISHWNco9YY
	sqDm2z3BEekBnAntqyocId7Cng==
X-Google-Smtp-Source: ABdhPJxC2tyZtPSIWD4HYhMNck03nNxILKOVwM6qEtEnnfnatYT8UN2kC8tit8WFI4FWtrGPPSZuzg==
X-Received: by 2002:a50:b742:: with SMTP id g60mr6390873ede.113.1611133088628;
        Wed, 20 Jan 2021 00:58:08 -0800 (PST)
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-8-git-send-email-olekstysh@gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Paul Durrant
 <paul@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei
 Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH V4 07/24] xen/ioreq: Make x86's
 hvm_ioreq_(page/vcpu/server) structs common
Date: Wed, 20 Jan 2021 08:58:01 +0000
In-reply-to: <1610488352-18494-8-git-send-email-olekstysh@gmail.com>
Message-ID: <87pn20t275.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Oleksandr Tyshchenko <olekstysh@gmail.com> writes:

> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> The IOREQ is a common feature now and these structs will be used
> on Arm as is. Move them to xen/ioreq.h and remove "hvm" prefixes.
>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

