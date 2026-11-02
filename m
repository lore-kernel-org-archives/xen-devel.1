Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2B2606A324
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 03:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vTrPRGb+
Received: from list by lists.xenproject.org with outflank-mailman.1467644.1676709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNiO7-0007KL-Dq; Mon, 02 Nov 2026 03:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1467644.1676709; Mon, 02 Nov 2026 03:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNiO7-0007KE-At; Mon, 02 Nov 2026 03:07:11 +0000
Received: by outflank-mailman (input) for mailman id 1467644;
 Mon, 02 Nov 2026 03:07:09 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <luoyonggang@gmail.com>) id 1xNiO5-0007K8-MN
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 03:07:09 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNiO5-005dSL-3Q
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 04:07:09 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae7fe4b-8faa-0a2a0a5109dd-0a2a450beace-8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 04:07:09 +0100
Received: from [209.85.208.43] (helo=mail-ed1-f43.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <luoyonggang@gmail.com>)
 id 6ae7fe5d-b7e8-0a2a450b0019-d155d02becef-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 04:07:09 +0100
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-6b1ec41d8e9so2645845a12.0
 for <xen-devel@lists.xenproject.org>; Sun, 01 Nov 2026 19:07:09 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1793588828; cv=none;
        d=google.com; s=arc-20260327;
        b=FBhl7bJf8G1pvU4BSXgo7PWDqxB3y0yxk0zlyBEY8751wdjoOuUx0YEBXfAMBDH3Gz
         bYOZc7OzJTaI+lWPoI5Z5lyj9yIkzV1CAD1b8yBPH6WLfIi4+zUNX4ks+2hdlefAdPXt
         UepXdxEt+IrS+F2QAqyxMO6qN633pVbrxYAhuLMnJOnYCmS1b1q4B6+I3Fa8wKWtZWwh
         NzimjRf2/AO9Y19FJZ8yS1XOAKPB0iJknL8Sfz5EEZuofDjh1hkSLqsK5/DhFQVTJ2iJ
         XOy65fxBn9ZgOqLTbCiWk1+S9+1he3+mMYl5lW1Deqb+Gdd110xCtMO8vDf/sM8bl4tc
         mUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
        fh=hV+1kDS0gEwBl16sDak6TksCXOTz7tCyjbRnw66lSDM=;
        b=J//weP2h+vtfAvPtKINcpzkwfwwXe8SLVCmeqFF/AZyEa2L6P3mQ9DDgoRpb1JfrDR
         TVd4uJsOaabhfWZiflrYVPRRi3RZcYb7Yc8OYe8f8aeej0JQSwyicyTzRjyccifXlZvy
         g3VAkPiH5dR7AcCG4N6oT3LSkCk/R3+t3MMSMy7g0YIJk50UJmgEaGfkYg0IJiKw7D/q
         89AezprBhaVE9m88pXP1SjxMludb5XYal1zTpoVOqPvrO70yegA5PFxMjNX4jMWyAFSn
         2zAOb6uQlCPjGqhmZcB0tZ5jN58qYGAA+Exfqfczf5k+63yTVpHr+nt9rGA1Gtzbqu6D
         niTw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793588828; x=1794193628; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
        b=vTrPRGb+YgfuD/4/kU8QiQoEWJmYGHXesakHrhHY/ah7n5/1n0WCJJeQLIoN0fjLjL
         jd4NCzENrBJaGZSw3m1vvYnXgbDnnjhq7waGNNJF0svoo9F6D7gldDD+6GuwCtTFRNGo
         vtG6FtW2l4iYKiBz5uCGlAHOyua0S0D/zSXgHy7ZVMvOHvk3P8NqV0WGGfafZ3gDZazT
         Yuf/CTJ5lb4GQrg3TiuBjXOGNlKHGztKbFvybHcS7OctjSS/QrFoqP9K2dFPZ4UYcuht
         BXv6A9adwR6Gyx5mdA7aoT0awZMQ0J9fHRHpNn8uaPE2WxuzgWml3lrWIV4GEu/kUF45
         1tHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793588828; x=1794193628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ysznio8LIhbrNhMwmFi6gLvF+hQtGM6cCyNInXytu+8=;
        b=dIN0XNYPqR8cau1VxK62ZtsDJTEXs4x1hg5MMWU1EbsqImI6yomgSUFyramWzNnxOx
         EtR1NcmlVkaBQ2YsrxxeRKySGMDx6GKXZ4WsA5F63tmrLSuwewnh3UHl0Q1EPUMB1Wz7
         USDoIENa96QXYF8UUzD0BX8IS/7Dk7qf33IFqPM1/FjfgFYrEKJd0vb3Erggl8fdNtPj
         eAjWQNDAmnJNSTiaAwfJIFP4/1mA3XEtV/fcBiG2bEMQRsfUVF2tp6jl051GoWnNJi9I
         c7t3d33rpvLbMkmF1TTSaYwUEzh7X0gOx38Q7kC/9HaswjwYDb0fnqp2AJy7+Ww1A9hd
         k2rA==
X-Forwarded-Encrypted: i=1; AKwUvBxpx5K/OPUtzhmrpxHkxaya6wyIJO1iHbxEf+1lgdJ8hBAJyhf0JU1+An+7dfwnCeIEOxxVCsjMeLQ=@lists.xenproject.org
X-Gm-Message-State: APuU4Z++0xCibKXJhg9cA9gDCN8UZh6+rNllNho6h3qetrGW+SIpXSBP
	hkSQ6uILsL8YBUHX9VeftOGbQUpW8r85gF1GOCedhQ5ObPz/UHm3SFpJ5u7F6E+Ax7v2qYFdpCM
	Y7eAfVBiV3B5RrfJakr/lOX2/fkVqIjg=
X-Gm-Gg: AYBFou0P+Rvx26bPbFiGvCRz8KiVHH9Usbdh8eU5JJgEXOH/fawU10B9fsC1JrsA7UI
	PCUM31LnMpGXGFgnvIvlsEFYJHzQlDpZ82MGs9o/gcKYHeybriP8nv0kcywK/pFI+PxIiEhJY0D
	a5KgHYPEHClyfPZRfPxPcTGy3wDrbqvxFu3fVcxRGhRivQBvC0zXGCJkqP85kxlytM4uzB5i4EA
	uBIoycJWbZR6J0aUjd3N9u0fahHDqL6AwShHGt+pe6vaFy4lkomQ9e899gfmUWagGULRwheLOPp
	0WUxVp+u7qzJk75gJsdlepPRZy1XYPMOfkjuB7YaxKmNHObZkNDdE8o71ZxgySYN2V8NMvlclCG
	ow5cvwaktUdq169iIgbQvB9W0Pyqt+x0cO6Dv
X-Received: by 2002:a05:6402:1cc4:b0:6b1:c774:58c0 with SMTP id
 4fb4d7f45d1cf-6b4d4d812f1mr6163810a12.31.1793588828434; Sun, 01 Nov 2026
 19:07:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030151539.1872-1-luoyonggang@gmail.com> <d1db54c6-b802-676a-7779-0c2c63f5f807@eik.bme.hu>
 <aa70e94c-d9a8-41c9-850f-7ded87f7f327@oss.qualcomm.com> <ba106173-fca3-6019-3028-122831887921@eik.bme.hu>
 <CAE2XoE9cR_X0kkDfGTU4Mt_5Hc3WZ8K5rghw2AeL4Vh=eugGag@mail.gmail.com>
 <bf45a858-db07-de03-70ea-ca0061d7a5d1@eik.bme.hu> <CAE2XoE9_b5UiE2+BXFRqB3RPv=M+8jr1HQy7rEFVEb6w1DdoGg@mail.gmail.com>
 <a479df5b-721d-c357-5c69-c3760a73e521@eik.bme.hu> <CAE2XoE-2w3A4=BeskGgp7NYUtkRVNkNufu4SZjW_OQ-KAQZvhg@mail.gmail.com>
 <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
In-Reply-To: <6efa9f73-75dd-efd0-3fd9-6b2654b69737@eik.bme.hu>
Reply-To: luoyonggang@gmail.com
From: Yonggang Luo <luoyonggang@gmail.com>
Date: Mon, 2 Nov 2026 11:06:55 +0800
X-Gm-Features: AclHuK8P8SDKQOupp80GFDOIHp3NTFl6EuHgXjfpXxX0vFgO-CLq7hQlTWSRT8g
Message-ID: <CAE2XoE_Nf0bpoyYuW9G_OWAx1J83iANRf_=2vr4G_BqgRZThPw@mail.gmail.com>
Subject: Re: [PATCH 00/15] hw: expand DEFINE_MACHINE to explicit TypeInfo registration
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org, 
	Anthony PERARD <anthony@xenproject.org>, Felipe Balbi <balbi@kernel.org>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Philippe Mathieu-Daude <philmd@mailo.com>, 
	Antony Pavlov <antonynpavlov@gmail.com>, 
	Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Max Filippov <jcmvbkbc@gmail.com>, Niek Linnenbank <nieklinnenbank@gmail.com>, 
	xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org, 
	Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-ppc@nongnu.org, 
	Alexandre Iooss <erdnaxe@crans.org>, Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Strahinja Jankovic <strahinja.p.jankovic@gmail.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
	Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Yoshinori Sato <yoshinori.sato@nifty.com>, 
	Frederic Konrad <konrad.frederic@yahoo.fr>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Peter Maydell <peter.maydell@linaro.org>, Chao Liu <chao.liu@processmission.com>, 
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>, Alistair Francis <alistair@alistair23.me>, 
	Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>, 
	Gaurav Sharma <gaurav.sharma_7@nxp.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Alistair Francis <alistair.francis@wdc.com>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-42698a/1793588829-19EC69EA-5F3636A6/0/0
X-purgate-type: clean
X-purgate-size: 500
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 2, 2026 at 4:57=E2=80=AFAM BALATON Zoltan <balaton@eik.bme.hu> =
wrote:
>
>
> Is this conversion needed for all machines using all DEFINE_MACHINE
> variants or only some of them? If the latter why not convert those to

The is_avaiable add/remove no need all machines, only a small number of mac=
hines
need touch DEFINE_MACHINE, I'll do(expand) them when needed.

--=20
         =E6=AD=A4=E8=87=B4
=E7=A4=BC
=E7=BD=97=E5=8B=87=E5=88=9A
Yours
    sincerely,
Yonggang Luo

