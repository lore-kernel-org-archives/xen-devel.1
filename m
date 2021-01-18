Return-Path: <SRS0=uD1c=GV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8CBC433DB
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 10:23:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E3222228
	for <xen-devel@archiver.kernel.org>; Mon, 18 Jan 2021 10:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E3222228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.69544.124534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Rh5-0003rb-SO; Mon, 18 Jan 2021 10:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69544.124534; Mon, 18 Jan 2021 10:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1Rh5-0003rU-O6; Mon, 18 Jan 2021 10:23:31 +0000
Received: by outflank-mailman (input) for mailman id 69544;
 Mon, 18 Jan 2021 10:23:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1WU=GV=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1l1Rh4-0003rP-E3
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 10:23:30 +0000
Received: from mail-wr1-x42f.google.com (unknown [2a00:1450:4864:20::42f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bdfd8873-b3bb-4aae-9d27-92effe3042f1;
 Mon, 18 Jan 2021 10:23:29 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l12so10667150wry.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 02:23:29 -0800 (PST)
Received: from CBGR90WXYV0 (host86-183-162-242.range86-183.btcentralplus.com.
 [86.183.162.242])
 by smtp.gmail.com with ESMTPSA id g18sm22818378wrw.61.2021.01.18.02.23.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 18 Jan 2021 02:23:28 -0800 (PST)
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
X-Inumbo-ID: bdfd8873-b3bb-4aae-9d27-92effe3042f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:thread-index
         :content-language;
        bh=Wkh3LJJdDpBb9FpTgsGivgFpuvS31ivBEhDVP/QqE1U=;
        b=cfskU2QccMxIE7E3YCqLpP9HfOljSt3qj4U8rA2/DvJuwRH0uLIRNoKZFyoydDJxb3
         iMLgf7KdpATb3kV0aWhQjpwwrVrjiZYcuJ1yd+KfTO1EbrgeuBDpb3MAYT5+jOAdhbCx
         +WjbXX7Pfzlp2D40l47aRbmSJBd7mWfQ3CodskGYPqyi5OKCdtHx0kPkv2/BRZM3Ky0f
         Bp/2wtsH+RoJcjTxovx0xG7AVcDatej2uq6XJfXW1Zc10PJlDSvZCJWAMnqBA+gexyPp
         lqTU2zcWOiLEXYzlMO9LjvRGQzZZppgkxoMWfvBGPJ6rDMw5JxW3Z11k6v6R27dcGBb+
         Co+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
         :subject:date:message-id:mime-version:content-transfer-encoding
         :thread-index:content-language;
        bh=Wkh3LJJdDpBb9FpTgsGivgFpuvS31ivBEhDVP/QqE1U=;
        b=szrJ6AsELBi4zymeMblCdl4r0cq9tWczfE4U/LATyvMto07kFgJITqAdbZVAvxngG2
         gQv9B1/LFuuQP1QZxVC+NI0hw6I2aBODmueIXBDz87w3je0GFHQADyTvNSyK1IXAe+p1
         X4nUx000CEq4dgn+LGP1gbIx3EEj9GD+u97D1Fj98Jzy3ULp5Vsrm9SM3tK+HzOnUxA+
         l5slZuf7As58zzw4HAJG4ZDmL3mXPWMasOAt5mbqTHqOXRNx1QEJ7+pKgbWEsP8BM1hR
         q9jkUyTcZdp7ekoRcJ2Ac2EI7TOMzWgPMzfNNpFi6ygwwRQPmRRfy3J970bhe0X7orEd
         9hwA==
X-Gm-Message-State: AOAM533yBC7zZUpLozF7a8LETPe8lurSnqGnXU+NxJ1LyJPZwUb9NJ/O
	Vw8pSYHdl243rKU4OUDglIM=
X-Google-Smtp-Source: ABdhPJz4pBprE1sjkEB7N3wOGk41tnY0K/iSQ1zbjsX2ZEsthLnS4/YW1dzAmC+ap81N3DMGE2G6/w==
X-Received: by 2002:adf:82c8:: with SMTP id 66mr24923808wrc.420.1610965408983;
        Mon, 18 Jan 2021 02:23:28 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
Reply-To: <paul@xen.org>
To: "'Oleksandr Tyshchenko'" <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
Cc: "'Oleksandr Tyshchenko'" <oleksandr_tyshchenko@epam.com>,
	"'Stefano Stabellini'" <sstabellini@kernel.org>,
	"'Julien Grall'" <julien@xen.org>,
	"'Volodymyr Babchuk'" <Volodymyr_Babchuk@epam.com>,
	"'Julien Grall'" <julien.grall@arm.com>
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com> <1610488352-18494-18-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1610488352-18494-18-git-send-email-olekstysh@gmail.com>
Subject: RE: [PATCH V4 17/24] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Mon, 18 Jan 2021 10:23:27 -0000
Message-ID: <00d101d6ed83$f6604010$e320c030$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQJtR7ihpnpDvKGK8VeC26+r2ffFKQHvCu69qPD9H1A=
Content-Language: en-gb

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Oleksandr Tyshchenko
> Sent: 12 January 2021 21:52
> To: xen-devel@lists.xenproject.org
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano Stabellini <sstabellini@kernel.org>;
> Julien Grall <julien@xen.org>; Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>; Paul Durrant
> <paul@xen.org>; Julien Grall <julien.grall@arm.com>
> Subject: [PATCH V4 17/24] xen/ioreq: Introduce domain_has_ioreq_server()
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch introduces a helper the main purpose of which is to check
> if a domain is using IOREQ server(s).
> 
> On Arm the current benefit is to avoid calling vcpu_ioreq_handle_completion()
> (which implies iterating over all possible IOREQ servers anyway)
> on every return in leave_hypervisor_to_guest() if there is no active
> servers for the particular domain.
> Also this helper will be used by one of the subsequent patches on Arm.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>
> 

Reviewed-by: Paul Durrant <paul@xen.org>


