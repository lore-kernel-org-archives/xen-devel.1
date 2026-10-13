Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECC7CC6B16
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:42:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448056.1664057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGedW-0004wt-Ib; Tue, 13 Oct 2026 15:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448056.1664057; Tue, 13 Oct 2026 15:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGedW-0004wm-FF; Tue, 13 Oct 2026 15:41:54 +0000
Received: by outflank-mailman (input) for mailman id 1448056;
 Tue, 13 Oct 2026 15:41:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGedV-0004wR-5p
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:41:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGedU-00Dt7I-BY
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:41:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5140-8faa-0a2a0a5109dd-0a2a45099946-0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:41:52 +0200
Received: from [74.125.224.42] (helo=mail-yx1-f42.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace513f-be1a-0a2a45090019-4a7de02ad886-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:41:52 +0200
Received: by mail-yx1-f42.google.com with SMTP id
 956f58d0204a3-679334baa1fso2484681d50.2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:41:51 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791906111; cv=none;
        d=google.com; s=arc-20260327;
        b=XwbcBF1Bws5FjXCER3tsRaCyHIft3F0RKHimi9hz9k+RrcMSKg6t7b/sGXYHL/9jd2
         jTC8pLXvG+JNOgufjln7CwX/b/O/fb+Z6YMcyjqmHn9oXCaxR29uZdNj9sTAEEOkSgvE
         DAiftet27bNDVxRkmJjGP3Rv75AkFHE/xSbLRCAHmczBi3ezRSK92XTcLyN8poPaUNVg
         lXhiXVqvmQopsn6kN4B3eBt1UmZuiC9YermmNYizjusoj2Ik196BI6hVYZD58phPtyDU
         UtZhZlMnMboKJxb8hF6beSExdN0a9O8Y+BG9Uz1M68zoWVm7GdcYvl6sKurElS4lSnJW
         cvVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/y32TPfvpVgGIoKvh7+P09B6jQ5P/y+ctFLf2J9HI1g=;
        fh=lXrDPzAEzj0Gw8S2EQqZ7WoXPo/Bne6vsqMMHnhZ57w=;
        b=TL+si3Di72tZNt1Xn6PSNR2t2/PIe2+1b4d8KzxLtLSw89fLYsTG0GxueGDQyVnFym
         4H3l0FKnvK2BlseEVs0J1mxTwVZZUm/Bw4+Z8P86NL7YOsOoTRCi0kaD5cnEb4vTndLu
         jQFDNgkVxspG22YVHneXyHvb3V0ZFBAbfUBK9GDR7juVQOVa79nkutp1H+iJpYMZ76G4
         h5XXL2uzqOKs97agXhfAaCcX4ApCTIJ1/X2I+KkY2tcuGsypYQ6yizPDTx5Q2L6witNu
         P2vRBIn4OW1k5Y6P8mroJNT0hXa5HjzPTug9x9PJSD6MnXX1Q67XDRz2lORjDDKs4qHV
         7B2w==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906111; x=1792510911; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/y32TPfvpVgGIoKvh7+P09B6jQ5P/y+ctFLf2J9HI1g=;
        b=lLIIjwL14tLNcLCyuQBKZmfPtVkin4WaVM59X22yiU8a9rd4muWmE5MBiR7Nqj/rSc
         OMlrRMQNzTe0rO6jf8v5gzoeNjxWgxYgnMqDx/14J0v8XDre5YdqUNE3chHtvqiYSqcC
         cbl8agZrnPL77aCQPN2kb7fMw+5nWTPtTCmNMWp0E3wOq83lcdl6W9Vbmkg9wKpOuCYV
         S1XG2q3iBNIppxjRQW+YOx6/NNwHBblIDs3qRlQaB+fB5/VWnybZZ4acclrcb4hrur9U
         5va8Hr7HeE7Jsnz2DFZ524k0YhzCLLYrlu3tA7+y/hwNx+lg1hS0r4RFSTU6TubTTlww
         JSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906111; x=1792510911;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/y32TPfvpVgGIoKvh7+P09B6jQ5P/y+ctFLf2J9HI1g=;
        b=IWI8i81nVJ1/wp6gS7gkf8arW50TBIAqt21grMv9GSKM4GvpwFNZ0gSNX2SjkNw8La
         c+iWkOblCLoawBftmneyifzam7yenO8RJoOq3Ru9yfDHjQHbs9XadRE+8c5d0KbEUSmq
         N6R8/CpQppFDh3mOSEHooRt4Q76oYk4ZV+CjZA2BWnUL4TPCtE5cj6GSfJbW/RdfTE/7
         Ph4FpGdwLEFWphXm9RurQSMWV3m5KLFSwkwldiy+vJzX6+idMiZ0MiW/9Pkmev8Tz+lU
         BfPYbvRmoEjpYHKQWze54tKXmU+OkBCouAZgVrMhhgYyPzb2abiEZxHMVZeI95Vm2XtB
         aUoQ==
X-Forwarded-Encrypted: i=1; AKwUvByTBjkl2JDzDXmE0VOJar17r66+2qTD31ji2xSoM5Pu0KNqAwZbd2ZIk7HtoOYwNIZhh6u5defMShs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKIsClldoUtQ4ykneC1B70hJqa2guKODgfpd+luTRKZcj5pyNSQ
	aU6YvFWIukW4Lgyr3PAMjfKIRNlVLZlB3sIrOlQKF5KvYUNLbpsWb0s4neNTJrmR0DnxtpiXSmk
	2I+O4lRrlrqmf7oLm1+pLWE+oZGlBUNqHQy6bKWHP7A==
X-Gm-Gg: AYBFou0gQrYce6exmTtpCpK4q+Jt0GXtVtFsWG/1khG1VcaE4zUnrgeMsXBhPbmjuKN
	OoEKn/OuTxtIhhsMO1KYAcuxU/B8hpkQRJvfJKNB+lw0vlMhQmhGPqq2Krp4diGhkU8o+z4TCMw
	MaX1LxWPII2gjq+biqXcaRlFstsh02L6ajSozOIItLfs/4NYsuZCd92+Vewei//7cF89lCjVzfo
	ldgXohJjIOsytQIXYT8kz1tYxQ2eIjJM4PPoEe78c85Zy4SogrY+EJiOEe0lWS40Aluor3edM5N
	r2UQMKvYzPL46Tfs/wQTDkNzbRSNmtT478kEqDzxoEcenqObt296HWzjRJPHKvj+p1f5yVTpY1W
	YxiOj4YccH5Wa8K2Ss26SypZ/WzzQ4bhRuoe7+oo=
X-Received: by 2002:a05:690e:148b:b0:672:99e0:ebfe with SMTP id
 956f58d0204a3-67936346e62mr3002172d50.150.1791906110511; Tue, 13 Oct 2026
 08:41:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-3-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-3-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:41:36 +0100
X-Gm-Features: AclHuK__b2UbCjZFZDrffJnvH_-1ukAWp5TaM48C8WqZ5JfCRPxpvF1PnMp4eNs
Message-ID: <CAFEAcA8M6tO1-xnC5SD4gheqfVney3vy7Z5xj_164=NPRvu5UA@mail.gmail.com>
Subject: Re: [PATCH 02/22] i8259_internal.h: rename TYPE_I8259_COMMON to i8259-common
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-bad1c0/1791906112-BD6C2034-FB1F0002/0/0
X-purgate-type: clean
X-purgate-size: 555

On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This is to emphasise that child types of PIC_COMMON are all instances of an
> an 8259 PIC.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/isa/i8259_internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(I checked that we don't use the typename in a vmstate struct
name, so renaming won't accidentally break migration compat)

thanks
-- PMM

