Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535B606A31F
	for <xen-devel@archiver.kernel.org>; Tue, 20 Oct 2026 16:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uo31CCkt
Received: from list by lists.xenproject.org with outflank-mailman.1456059.1669642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCf5-0003QH-Ot; Tue, 20 Oct 2026 16:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1456059.1669642; Tue, 20 Oct 2026 16:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xJCf5-0003QA-L0; Tue, 20 Oct 2026 16:26:03 +0000
Received: by outflank-mailman (input) for mailman id 1456059;
 Tue, 20 Oct 2026 16:26:02 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xJCf4-0003Q4-KU
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 16:26:02 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xJCf3-007Mu7-S0
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2026 18:26:02 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad7960c-bab6-0a2a0a5309dd-0a2a450ab9a4-22
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:26:01 +0200
Received: from [209.85.128.178] (helo=mail-yw1-f178.google.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad79618-f2d2-0a2a450a0019-d15580b2cda2-3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 18:26:01 +0200
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-8ac4806e210so23541957b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 20 Oct 2026 09:26:01 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version"
ARC-Seal: i=1; a=rsa-sha256; t=1792513560; cv=none;
        d=google.com; s=arc-20260327;
        b=DbsGmoIWSUO6o7eMJLLnSSqzuMDdiGjTV4BmXnFJLz0w8iVfbLCQO3m7+t446qFqz8
         gr55bJqs6EtVdntfjiKybiKgg3dQSibFRX0ehkxGPtY9Zkz26L5VlIPmO4tF7wFv0OYA
         pZg5kIlsI27CZG2r7CJVC6rkQhJmGUEXcUVr4VRCcmCSPFA/j6on3eMXzF/XEK95atau
         5J6k3oh9SNMRoqwy2AaDeRIwG9HFioAY/kvIpdK8WCJZot4PvvvuXIEZd9kdv9TD4m1k
         GkMUAMkVhMH2Q0b/mkUP5WNx23cZRgCxiAiIt5m5sdeLXh8C8OQFYSasO8HP0TPV/Egy
         CDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0H70iKzAA969SR73zPnNY9mwxeFlOcwPhNOOkWbaM+Q=;
        fh=+I4aGsXiB3sQBf47KFdt6yKgK2EgnhNS0hiinzB3+Z0=;
        b=Nk586DfRqxFIB1WJ837Ne96tR7sUTDB6pTBOrTCG/5yegYjliF1rv1yes1MfLcAdNJ
         BVH/qW0RU3hE/Vtq3dGN4+9EFcZSsrVJaEbxrlWmTKk0Vv2Bu0poqz6zPlC2LkY65dQv
         wS5qx8xv18FQCtvd2spqaZSzrqtWT8fkXyrENmGS+AbsgO3DTmqhHLQq7ocVdgQZlfyT
         9LnbcuxcZ3i5RqukBG3qamp0az8DiEJ+gKkTppv1w1NqzSYr1lJbRLeD0tYuSAwK4X9L
         FQa7Ffl4yEr8YD2n+5lpzWCY2OVaUkA/ze/znzvisGAWgKcWF+ZDzVmTZQt7FjokADu+
         rl1g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792513560; x=1793118360; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0H70iKzAA969SR73zPnNY9mwxeFlOcwPhNOOkWbaM+Q=;
        b=uo31CCkt0xHZHMt8X9mZpuBLBJLyLo3qKu4IaoPw8E4UHqdD7OhD7w6VqB9tzxJF5l
         aD4Pa0xSFc1F2eLJUyAtmfFTMcm7ubXiM7dl1t8BR+aF1SYHMkoolGkCvijnT5l7yYwY
         IHTRNr6V2ThJlwvVk3WHslJncir/3VXqFFIp2k7/KP4Wzx22F/YS6RLnI7+fUZ+0XIEz
         eD86bNNLWQkhZZYqQXt2fL1RsKWQBjg+b9mRfTObE+PlKjzM9/Mt8s7nzCrQCtgHtRkA
         Oa7GM/tstuLH0V+j4GBcyrzAnfs0GC1rzOo3AnAyZrOpBTrlN/CJF86o0D7djoksxyTz
         /ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513560; x=1793118360;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0H70iKzAA969SR73zPnNY9mwxeFlOcwPhNOOkWbaM+Q=;
        b=cKmv4h1zLgt/qhE818g7lt+tBjY4nq9XqhRkX8VusWcAhxlwV7RFCICrJSu5lJLkr0
         k9QrBPb9Sn313n4bSpGMCcTGP5TAqjSgOSrnYdYZeZ1oQeRiNdCj0CRLbUCEVG/CBJRX
         4hcpbu9VhUv7LKIC9sZlEQc4hLN9DauTxepveTIpOlNe51Hbf64NUHtPphaa1ti9TdH2
         a7y1gm9fAP3vI5dz9THGjuB0zfdjI5NUGd3Bz9PTm8UflbFiVc2/3UUgPkEbBvP8SCJK
         22GThWA9ia2/ZCbtSuuPVeztBLagvp5v6qpAhqDwdCU+cYjm5vk8KW4q1i7HGORbrFpu
         6bqw==
X-Forwarded-Encrypted: i=1; AKwUvBwYueJVzHkFDiMD/aespkXMHOoiu+yZqZ93CTYZafXWR7fpVlLbEEgtkseL/0/NLxwUrrwqDmcpVTs=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJaMgmvg0ofLAfPJapzk9JaXZBql8n3cH581+jVbbyt0VaKk2sf
	rvpWelB91AkBKzjbo6oZIs42IgyC2D1en44qEcrB0QYn/ukjjFY6pc2IA1LjaCa321jI8171qup
	Ol1hRpwK4UW+IR6AnL1fN5zSvlsVVHrl8UUrEMCviOA==
X-Gm-Gg: AYBFou3vvKbzWUV2ei7lQBmOvH0kP+QgjVsY0WDoLNcY0RyI5i9K/e2KpGVjCVLjrZV
	o7g5NDAd60LBOMmUdoY2mscA/zg0zxw8r+qu4RIwxuKxPqmTdhyyTlVn49qO4szrzNn8+dYVVYu
	879Di7pEQB5NIfCocSbimj8c8hqZgSaP5Wpmbb65pUwqlOKg7JpTeIHGYgbMeLv+9JNmO//qznP
	MXA99R4G4DnmRqCABgqq8xNPd41paiBvCOrPi5b16Ka58ZhaGZPzqFYYtvsGi2DlKgSDg7rpSfj
	M0HhFd+uWsq3cxyC4DHtQCxsafv+djvmdDPphNaRbABxFMDmlN4w3RaUBNMPMsdvATV4C3B3hQz
	uFfUO0Izj2sVj2sGCkemYCjmklb2NuvES8ND9mxM=
X-Received: by 2002:a05:690c:c4e9:b0:8a8:6a39:37e0 with SMTP id
 00721157ae682-8b0f21973f2mr38103367b3.42.1792513560025; Tue, 20 Oct 2026
 09:26:00 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019120517.1448687-1-mark.caveayland@nutanix.com> <20261019120517.1448687-21-mark.caveayland@nutanix.com>
In-Reply-To: <20261019120517.1448687-21-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Oct 2026 17:25:47 +0100
X-Gm-Features: AclHuK_WLO7-DtB7Su2eRjiC_GGoRME7VJlerd_B7UXaWvtf_V6xRSQGWvB8Jog
Message-ID: <CAFEAcA_2rmfbbgSu8VLxybD_y+u6Rmup3mCt_vnOWu4FRDLMEg@mail.gmail.com>
Subject: Re: [PATCH v3 20/28] i8259.c: properly cascade secondary i8259 from
 primary i8259
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-4011c0/1792513561-510C9CFC-48610D04/0/0
X-purgate-type: clean
X-purgate-size: 706
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 19 Oct 2026 at 13:07, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Currently the cascaded output from the secondary i8259 is returned directly in
> the pass_irqs[] array, instead of being connected to the relevant input of the
> primary i8259.
>
> This is a bug fix since in a cascaded configuration on real hardware it is
> possible (although unlikely) that the cascaded input from the secondary i8259
> can be masked on the primary i8259.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/i8259.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

