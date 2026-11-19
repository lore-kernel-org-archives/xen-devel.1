Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88432606A324
	for <xen-devel@archiver.kernel.org>; Thu, 19 Nov 2026 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Dq7BGhI9
Received: from list by lists.xenproject.org with outflank-mailman.1496049.1694677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTzXf-0005VM-FD; Thu, 19 Nov 2026 10:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1496049.1694677; Thu, 19 Nov 2026 10:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xTzXf-0005VF-Aq; Thu, 19 Nov 2026 10:38:59 +0000
Received: by outflank-mailman (input) for mailman id 1496049;
 Thu, 19 Nov 2026 10:38:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xTzXe-0005V9-4i
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 10:38:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xTzXd-004QnY-9b
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2026 11:38:57 +0100
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afed1b8-8faa-0a2a0a5109dd-0a2a450593dc-22
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:38:57 +0100
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <oleksii.kurochko@gmail.com>)
 id 6afed1c1-4cb1-0a2a45050019-d1558029c01c-3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 11:38:57 +0100
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4a5b2be99a8so19812115e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2026 02:38:57 -0800 (PST)
Received: from ?IPV6:2a01:cb15:80c6:e800:d2ca:523:c712:18a6?
 (2a01cb1580c6e800d2ca0523c71218a6.ipv6.abo.wanadoo.fr.
 [2a01:cb15:80c6:e800:d2ca:523:c712:18a6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb85343645sm29255005e9.5.2026.11.19.02.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2026 02:38:56 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20260707 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Content-Language:References:Cc:To:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795084737; x=1795689537; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyhL8BmgSkRQ7xCL3UryP+683vAcaTMpEhEbhp0zBxo=;
        b=Dq7BGhI9as8HRhFqSSar3ZSUGcfSNH3Q2gLz7HbkEGQvxYipX4awc5NVj2dluLTTMR
         GeWgqWyIQinJjggfY3eTjFf8JP2G07nrSAqca6gjgb/Ke+xwJcmQbCjAhSbxwT+GdYQD
         l5lsgtsG+QGPIdoYIJjIcBoKzLLPuTHJrAE5aVHb0Oo9lgxRkMT0DGmD5EuOCFfOcOmk
         BMIct3EcuB+gnq1DDOd3QRgoeS4YCVUDpN6x7XWsqqZC9+dlYSewYu0EBxDZ3tgMn//I
         S24L1ICwUTq6S5zHfbV4TG07D16tJyc4ckUxCzS75kTQgzRumhcHiKdlTc7uOxNslhcC
         xoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084737; x=1795689537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyhL8BmgSkRQ7xCL3UryP+683vAcaTMpEhEbhp0zBxo=;
        b=SJdadEXoH1YL4V91/lSy3OOmlWNh0ehAFKUmxMuOBJkv2Z1avcgzP7wnIIdnJ6PWvm
         Xa+XtfHM/FaCDubiMPdT8UyuAu3wud6uxNa14OxEy+AZsoQnaQSnid12G232XDX1kW83
         MGbh8rMQlZjKQctDol6gQcBN1EVJ2OEdECEBdc9XBTPRMzmpo+YTokUEmEJBdBrqLzg+
         h3HreL4KLutXSDry4jOkpkHM6R5NF72cgJrt3I2SeNIAkxRaNCxQo55Fv/CQvNJcJHBX
         hDmAw0i70RKIMyoY6lUk9/ogDDiZmqntmk0nAZ2yXdHFzFNZhrj5JEGDgUz4/T4JaplN
         aBcg==
X-Gm-Message-State: APuU4Z9qhbCjctvLEyGn2DG54k0OWu34BXq+qNE+xq+ywIskfJk0/adS
	XwPxwmaV8Gg0td59s4e6h3vzjIrBPj//Hk7+xJ9jwYSwzsrPqVwUtKdu
X-Gm-Gg: AYBFou045Tvv/1qH/EgAA9HNTSCk4BbH97VWWJle+COGhmaokdricP+tefrWicAxkLQ
	In70UxCJuuNtIl3avSDY61w2MRMBMP1dmlfrJeOx7MyTfILh4BeI18mNXzT8aV0Per7JZqMuNzm
	lfAZcy4WOIpW1M+02LQjIbqkxggJi46kxm1S7xDC7N2Fkw2QIjBiIb67AFNCOyTc5eItSZM0BBn
	mI6bSSN9A4Q9S/i7+8y6CBtBxH+/u9J2TaKk76MRQ6f7IJb3VX1GqgJPYXYONWZ4wEW6n+eqHIs
	DSnnOaOeo19Vnp95PpOfuybGWTfWWiC/ER6rBkSKDCj9LMsnw10qDE0LZ+RJxivghVLR8bjajMA
	NlZO0xmRg1z/5LymCfMUbvVXSGvtQmN9O1YWMdzrAyC40zBTi6Lp0xdzKIcF/3vJ8JWumG7iFSE
	J4kIssBpB/1HHY/EMyxHrX7zzcAFxrmLA2Wu03fu5UJxMd4/Pmlx4FDzjOga0FJwYP6sZa42XXt
	auw1eZiyy8ZDkJZXMgdIBRGvTm5TStHEF31ByR5YNcbm6hmQ0BrEMFqlVD+bG/+CwcOiCmYhbjs
	onoDfbS0wnP2JhuVTMPT0bt8Lw9FrHZmGS2tQv1oddJw3J6bd7zDjk6520OKTPdR/slllsQ7WT2
	GthLb3JE6ud1ofcdH8ZIzg/zYFbxPKzZWVauialAgGv2CglsSbKTbzpJRBhc9VCg3nmiJ3qEyL9
	H+5saXP5V/ZC81Lf0V
X-Received: by 2002:a05:600c:524d:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4bb7da46d69mr102168965e9.32.1795084736757;
        Thu, 19 Nov 2026 02:38:56 -0800 (PST)
Message-ID: <f179676f-57ac-4393-8384-116590e7885c@gmail.com>
Date: Thu, 19 Nov 2026 11:38:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] CI: add a Debian 13 riscv64 QTB container
To: Hiago De Franco <hfranco@baylibre.com>,
 Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Zhang Zheng <zhangzheng@iscas.ac.cn>
References: <1793714671.8631fc262581453bbf619ec5b2062170.1a1a1b9ce9c000403d@vates.tech/T/#u>
 <1793714905.8631fc262581453bbf619ec5b2062170.1a1a1bd621c000403d@vates.tech>
 <k4hxivkhib6yi7onicgs4ws2earwcawmds3bmp5nefjrw525qo@w6wxrkpdhoru>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <k4hxivkhib6yi7onicgs4ws2earwcawmds3bmp5nefjrw525qo@w6wxrkpdhoru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1795084737-24D1E2A1-9F2AE43E/10/73395122804
X-purgate-type: spam
X-purgate-size: 1511
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/18/26 10:49 PM, Hiago De Franco wrote:
> Hi Baptiste,
> 
> On Tue, Nov 03, 2026 at 03:08:09PM +0100, Baptiste Le Duc wrote:
>> The riscv64 QTB tests use QTB (QEMU Test Bench) Python package. QTB is part
>> of AMD's work on the 'safety' branch [1] of their QEMU fork and is not
>> upstream in QEMU yet. The tests also need pytest and qemu-system-riscv64.
>>
>> Add debian:13-riscv64-qtb, a Debian Trixie container with those packages
>> and the QTB package installed from the python/ directory of AMD's QEMU
>> fork, at the commit pinned by QEMU_REPO/QEMU_COMMIT. Make it available to
>> containerize script as trixie-riscv64-qtb.
>>
>> QTB depends on pexpect, ptyprocess, pygdbmi and qemu.qmp. Rather than
>> fetching them from PyPI, install them from the wheels vendored in the
>> python/wheels/ directory of the same fork commit, with pip --no-index.
>>
>> [1] https://gitlab.com/xen-project/people/amd/qemu/-/tree/safety?ref_type=heads
>>
>> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
>> Assisted-by: Claude:claude-opus-5-5
> 
> Not sure if the above tag is needed by Xen, since this is not needed
> anymore on Linux kernel, I was wondering if this is still needed here as
> well. If it is, please ignore this comment :)
> 
According to docs/process/sending-patches.pandoc [1] "### Assisted-by:" 
at least nice to (even it is mentioned should) be added.

[1] 
https://xenbits.xen.org/docs/unstable/process/sending-patches.html#assisted-by

~ Oleksii

