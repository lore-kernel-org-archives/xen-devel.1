Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057DF606A319
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 16:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=erLoOGGb
Received: from list by lists.xenproject.org with outflank-mailman.1456065.1669650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCg7-0003xp-4R; Tue, 20 Oct 2026 16:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456065.1669650; Tue, 20 Oct 2026 16:27:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCg7-0003xi-1C; Tue, 20 Oct 2026 16:27:07 +0000
Received: by outflank-mailman (input) for mailman id 1456065;
 Tue, 20 Oct 2026 16:27:05 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xJCg5-0003xY-Ri
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 16:27:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJCg5-000naL-7i
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 18:27:05 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad79659-e002-0a2a0a5209dd-0a2a4504e962-0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:27:05 +0200
Received: from [209.85.128.170] (helo=mail-yw1-f170.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad79658-b57f-0a2a45040019-d15580aaa97d-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:27:04 +0200
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-8b0d91601bdso6799257b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:27:04 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792513623; cv=none;
        d=google.com; s=arc-20260327;
        b=aPfGZoiiqBuEtpHNX/pcZvFmX8zRJYny/B6heYqDPy7M4w5cHC+Ym60CdPb6nldd8+
         AtppYxXRSc/XSUL6XUOb6E7bW/9G5G93kMqtHZ98+nQO5JPmm8YuSjJU86LcYO8ujYpb
         9TPUzQB8QE7LF1XrgOqQ0IycL2g2/0AwVfCINvhZpAh8sA0JPbjeSX3AzQvUaiYDdOGS
         P+1zFiDzHI4UXqPL+e1qgdIOeMgPQs+bWHi3MJcyGTJMmF5Y42ZRi+sTu+Lg8/2T+Q6P
         sPHxRYcah6Zexc+3Vk5zm5/bDISYEo0GcpZjX+KyJ8GT96Ts3s9pidfaEoVoR41npU6m
         24hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ciUzy2+xlwruDHhswN3vsLK0iURu5Kl9UfgL5Gb+gTI=;
        fh=DA7+rEDi/jik/Jat4OYXFJ3IXVddQ4s9xwUieqyoZdE=;
        b=NAuVOj0VhE2MPqvj5G73igT5koSd2JfaaIZfxkliezRJNsTVxh2PPJYwqGBOxidx1f
         hFQssQncbw4/qS8Jc66PzpX3K72/JhNnNgTcOpHsq7nawVqyY5dC2p+KK0O3EkxkrUly
         cPl/efdXYTk/cf8QUDex4skr9ug4bmQ6ECIzEIc8TGu954qZLA7Sr6cSOPqZZA1gOXSO
         HTFHdGqA/FdEWkl9LeztmbMRhHrF/6EIaZH/yUN6PoIR9K5RvEZ2vFQQofXht5gqfW4e
         2AmUmOjUOKocWttfsVUEobqYanMvR3k2Cdj4OW3IsH0UJWbPgbD9Sx3mosHm1okYTjLL
         vH7g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792513623; x=1793118423; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ciUzy2+xlwruDHhswN3vsLK0iURu5Kl9UfgL5Gb+gTI=;
        b=erLoOGGbeqov4tjboAtSY6XHYini7pwZ7ojpHgIdRR0Ubbdm5Lp+C6I6SpBhaikWXz
         yQTDQLlAXfJSWBVvEyd5cw+zVGi3i72/M4c6GSzUsHpypHTxXoie1g4TtGOYExuktHt5
         wuucEr8UXgXi3QuYD+2X9qYlTlEA3Dhfz0AnzH7lT4Peraxej4MXMfptaD8FNOhAvcK3
         JcjLpWKaFhMNm0cCdRRlOYL61x9yIiuqYE3oBxR6NSftIH0IhdsU2giH3s1ZXJlJvMmB
         zWRqWh2wyEVibrVr2Rp/aTVAUuly11G60tLOXgOA0LEPvps6mJLv86122I+KTlh/uiX/
         xdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513623; x=1793118423;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ciUzy2+xlwruDHhswN3vsLK0iURu5Kl9UfgL5Gb+gTI=;
        b=hrkhoxpUULfFvIyZwXc6wLdyMNFFFQINr/E2KVd+SUhbOk6b+AljxuBtsyEdmC7aVZ
         56SETT6gi8dJw8gUVT9k27ygPtIpqWkAflsWRBhYI+8Er7pip2hIxQA6C/udUGwpm26K
         oD9KvNk2Y3+vAoHIN+GnrNycepo10AMNRWp786suywreiQVvS8wXLyMQBzBRBqtgRIy3
         zOQxiHAdLkoPT2Hn0zIyHE8d0v2rXs2JVXkx4GfyQrjQdbiEnPD8l6C+GxTZUhZEZIUD
         HTOm5HfcVTk+QjG+QweAkiRDYCkVScOeIy+s2bc4oy0McmkMl43ePIW0BUj/kdeBsjZ2
         IzfQ==
X-Forwarded-Encrypted: i=1; AKwUvBwDtfsPoQ00z1uMr8JAv33Z1zy/hoKbZ+71qFWqHuZ2RJ5qA3bCT/4IW2jm6wUZqSgdKdG2u+CiVjo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIhcaHAWEeAqPx2gOLZJxLaleVPVIqe2clDGssqDl4VVsFRxh1j
	0zCwS1nQQNqNWZmoV2ex1oiDjdfkmdbnYrTBAx63G1TAlTS6OnInzeevyls2HaVH7+4VKnPuqQo
	idncl7sYEYYVBZuyJBGaSuCO2xVpLECCv3QySVLT847/ahWQrwgY5304=
X-Gm-Gg: AYBFou1OfHw1BSTl6mn1xNB6Qw7TjbXr1V6Pi5IJM8D9y/vQSYFyzWAy9uq1eWtSffJ
	nmCMbrh8vmcHmGbfDdg7oYMlxowcPL9JWjrKe+r90HalOn7VwfPvOnlSU/w5dnyIAy80ln7Jc9+
	Vz+/SdR4Xe5IRwnc6CdQn5MFaKUJfN3rUzrBJFKgCzlD65SgbST86tITXcrJQXnX+yr0wUK49L7
	XeSuIl/osxesriipJ/bNGkyEwqbu3uSrLUtBTSWp0BdzpzS7AHjKtDd35ZBuoeULh9fivupMTRV
	/1sws/o6WzWoddifK02Dj9WK6Mkt6Abd3Qw0Yurf9fVw4226B57lSzefZeZwjhntR2aAUFPWIda
	6POKX2+Bc8t2zSFNowjUiZW5itBSJSCkiYEVVpg8m0ExYI/4YFQ==
X-Received: by 2002:a05:690c:288:b0:8a9:9f40:24b4 with SMTP id
 00721157ae682-8b11ffdcfd3mr9303527b3.15.1792513623300; Tue, 20 Oct 2026
 09:27:03 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com> <20261019120517.1448687-22-mark.caveayland@nutanix.com>
In-Reply-To: <20261019120517.1448687-22-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 17:26:51 +0100
X-Gm-Features: AclHuK_GG3xd3jb3G-pcWY9ph0D-7_Tu77TTN6sv2RLan-q546w3SCV2MEkiB-g
Message-ID: <CAFEAcA8sjxsGW2kdV-YcXs2h4-aKdSYC5a-kxGJ1nxKjwmWU0w@mail.gmail.com>
Subject: Re: [PATCH v3 21/28] kvm/i8259.c: introduce TYPE_KVM_I8259_PIC device
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1792513625-512DCB50-45E2A351/0/0
X-purgate-type: clean
X-purgate-size: 435
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 at 13:08, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This device represents the KVM in-kernel PIC for an x86 machine.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/i386/kvm/i8259.c | 91 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 88 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

