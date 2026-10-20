Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB2606A320
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 16:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=J3O80Haf
Received: from list by lists.xenproject.org with outflank-mailman.1456055.1669631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCeS-00033T-FA; Tue, 20 Oct 2026 16:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456055.1669631; Tue, 20 Oct 2026 16:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCeS-00033L-CM; Tue, 20 Oct 2026 16:25:24 +0000
Received: by outflank-mailman (input) for mailman id 1456055;
 Tue, 20 Oct 2026 16:25:23 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xJCeR-00033C-0d
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 16:25:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJCeP-005Bng-VC
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 18:25:21 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad795cf-2eae-0a2a0a5409dd-0a2a4504cd84-48
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:25:21 +0200
Received: from [209.85.128.181] (helo=mail-yw1-f181.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad795f0-b57f-0a2a45040019-d15580b5c835-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:25:21 +0200
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-8b0a28a720aso28825877b3.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:25:21 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792513520; cv=none;
        d=google.com; s=arc-20260327;
        b=V0qjYftyTzP0LwTptOO8VLmrhVHFM+iLa8EDmZaKZcPhia35fcVAvYvfMJOoEHRhWZ
         UVFne4TQNYgnbYl1VsqZ6Mr8/WK9GjTd67NaT0w3kFGm0v7X53r6AQ3s17Yk1Y6OSkEI
         DSOOxbE8PlgnmsxFGyRuGLP1NaxOzZW10UoamSMmI0h1AZclNsXKEKB56/XJyTYVp0M2
         nDv0itgKzD6fcvkOAJDuaggdH+NHeKC41Ki2VZGDbMQs+WM4F64CHX9jC99Zru/M67T1
         1CgTetRcOE0y3hwHQ4L7tcdFecTBgYqLrKCJ6s5dgEhj1HD6W47xVn2MisxPsMrlco+2
         DFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFyRHRWDimKsIXLTtocAbmFsZAPHL360YzlKcMjZ5HQ=;
        fh=Sor44lcO/HuxlF0plnZ84yfSXOxLUpVnOB7003u1YV8=;
        b=lbgH8ps7MCYtjXbBG5tQ6fz82bWwLt9cpF6EUZdwmTcbhGOnDNi4RzS6BURH/XB/rg
         bl8kYemgGu1YVpnTLrSh5UMmbm2I3bQfMYXv6fmB97a4gUPxGAAoG/UaPGVyIQ0rIAcA
         ZVE/XJYP8L0x5CbkkWgWozqMmahHKqN+pBH8rInKts7L1yCvFsuFbX3u/KM5c6na1S7P
         Y5FtlTh4X7SAm39WT0MIvYMFYkC833bDugEf/iaB7SlorYrY6nA16yA/J0QMTZ9jZzez
         NfFC/sxeT0gUq28OttrGl2G/vqOS2BN9BNuVjkbuBAaUKe6QrzyJUKEHLj3AtG4lsBg2
         AL5Q==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792513520; x=1793118320; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFyRHRWDimKsIXLTtocAbmFsZAPHL360YzlKcMjZ5HQ=;
        b=J3O80HafeNKfJ4kw2zCBdyOtjg/wLQg29mvHcxWi9qkwOg0vlApJ++xHaCZ+IjXQx5
         FsFD53j24WqCt3NMQbxe2hEijVxIuXcLCiypHrxGAdzfRq99ZGR8ZY1vrye59Ne4dZIe
         s8zQ3M3li9+j2k6huJHIYHDP5OCpvA8W4J7JV1YePc3y4It4dZjBnUvjru9F8dxhYZLc
         nH0jb54ufovCcssisaOcrCFCM9bX6Tp4fkrfjeOp0Ra/mFor6wTNazKs7E1CWFGhxnZt
         rMvrmoovJN+5FI8Y1EHTHP3Xca2llXlsDwTgnqrenMHtqYSVmxQbAWgDFZ/EkjnXCsT8
         NiUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513520; x=1793118320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFyRHRWDimKsIXLTtocAbmFsZAPHL360YzlKcMjZ5HQ=;
        b=zDPfI7ZJpBePyVBikUd2Orj3OxYsX02YFVQYK10GYVovv6cHytShsAQhayOQk7OEdp
         xwGDa5V/9LF5lJQwqBPChODOQ3cxVo7l8qSgOfvLpzL3S/jIMXPuyxhp2fRK3Hu3rJyo
         2M2EK5DvdCUAyfP507DKdSSztwtzxvGjBnqWU6r7Mbrs/AFn1pfAjyQcQOAjF6zn5/qc
         71wJFFG78N11zHoNUcwGA07nD786HStg7mxW02zx/X/FogRIlWBvqirDripn1MF5V/AD
         T/Nwjdyje+z8HvHVirfjDqbIpJP+eWfc9uYlQ3oVo0Kz5Dac++hBe4xsR+6/B9RE6vhP
         JRAA==
X-Forwarded-Encrypted: i=1; AKwUvBxUQvjvPhaIIu1GFLuEpV5+C9+ud7B1izFJVDtGM+ql0VV359a2mZE2PABO9zabtkFZXHzms46UzUc=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKlSbpoLWsyTq8vLlkcU4+C896ki1RMQPJIGriYbJj0p0OkVviQ
	8JQodliuMlt0SqH3rcDH+dTZiM9Dp/IHe0NKNLd4jRab3j6SAUYcnSuy2lI6fVx9HIerMsiNuFh
	0rfZ8QVjQOnDwGs101wZNbJ51Myi6+XAztu99J4g9vw==
X-Gm-Gg: AYBFou3jxNa48MQTcoxbgycA0Oq/dEMav9q0tv34D/5EdBNPogRoemtHDxY6wXGDZW3
	5mKtJ65rPcI3tMW/8drpoI58QqhskICp632zRh6tV9rZFAid4vG8XYjSO3aiuw6NX2PAki9f72P
	Qz4iCJUQR5dUv2LIi6j6/YnZdGdcnmAdGtKBxUXb6P/hxHe9VFKfTCxhb0AGenj72qgEbASuAXN
	HP0ncfIXRlBPVvm9PVFxrfDB5VhLo6nHCAP96ZDrumj+jCsHwL7pxkr/qzARuxz/FCG7IvpTe0n
	rQuNgwYft+IXwCCXwubndhlSrusG9Chq3G9Ogicbf5cwmAHNU1XW4LEwv/IpSvi9KJam92faEgB
	6htSDCHf0RwG9toqpcbpCuPo0iiVyQLdVdh3U1Sano9saOpppgA==
X-Received: by 2002:a05:690c:f04:b0:8b0:89ea:6aca with SMTP id
 00721157ae682-8b0f205b7c7mr41948537b3.6.1792513520046; Tue, 20 Oct 2026
 09:25:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com> <20261019120517.1448687-20-mark.caveayland@nutanix.com>
In-Reply-To: <20261019120517.1448687-20-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 17:25:08 +0100
X-Gm-Features: AclHuK81FSUXc_eOw_N_QDMC3HNYDg2Uzn43k6DU9fOUomcs44mfgMQdEdvyF6E
Message-ID: <CAFEAcA-wt-N1OJvEKLVOBRUX3grzSLHAN_SuntdPkTcSUXChwg@mail.gmail.com>
Subject: Re: [PATCH v3 19/28] i8259.c: introduce TYPE_I8259_PIC device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1792513521-587C6B50-88F6F1BC/0/0
X-purgate-type: clean
X-purgate-size: 351
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 at 13:07, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This device represents a PIC for an x86 machine consisting of 2 cascaded i8259
> devices wired accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

