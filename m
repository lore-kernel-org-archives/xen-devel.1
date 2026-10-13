Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C188CC6B0E
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 16:00:41 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448120.1664174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGevR-0004iq-2z; Tue, 13 Oct 2026 16:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448120.1664174; Tue, 13 Oct 2026 16:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGevQ-0004ij-W8; Tue, 13 Oct 2026 16:00:24 +0000
Received: by outflank-mailman (input) for mailman id 1448120;
 Tue, 13 Oct 2026 16:00:24 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGevQ-0004iZ-JY
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 16:00:24 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGevP-000yhe-WB
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 18:00:24 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5591-2eae-0a2a0a5409dd-0a2a4508d520-30
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:00:23 +0200
Received: from [209.85.128.169] (helo=mail-yw1-f169.google.com)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5596-f659-0a2a45080019-d15580a9ec40-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 18:00:23 +0200
Received: by mail-yw1-f169.google.com with SMTP id
 00721157ae682-8a83d2706fdso947947b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 09:00:23 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791907222; cv=none;
        d=google.com; s=arc-20260327;
        b=I3H1Wor1ScfVnfbtbPTFbqNxq+ao8dKTHEMW2AhIm29E7qVQl1sSbrjpFPKi31j41n
         vfT0fJDOPRrItVXwL/7yDGLWTI0Yf6h1E8tOz/t6pT7YYDecEtAuVMnkQa29meZh262f
         DVvQSh1cDiXKkwl3DADsrcKcpFeBAuSzwU/uht8Xb3bM1m8/drq3utzKNknNOoYxkbUw
         N8fWgT9S7tfP6/m3gta1N7KIwriTPGu12umTOTCJwjqmMlWITWtsDCGNLlXbajA5n7L2
         OXRgk5V8XapjAY3HD43w05NmI2NAfbgQE0epWwLuECXmm8pRIIdeqizUxWkZu/52YXVc
         +pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xMzfDdWo0ZbobwvhYL+QfEr7jkf7L5HHwABc9Q/vj60=;
        fh=UfaV0313vnAlL0q1w8uoJRrumOziW5kRMpDHlk9MDXs=;
        b=kW+vFkPg6S3rSmuZq850TiX045uP6kDr2fKZ8xFSswwZwieOk7H8qyQ5tEEdUuPrEF
         Nf83K9owBBCWoejWz5dSZYr6UzMEz1wvhxo9HjsviKoeFQtXtH/8TuGC0FYoc68WtazF
         tAvAx5GEJgH2PiUxUzH/CcOfNpRrvTpenb3f+vWsJ0WArTx36G7iqpn+e0FG0TpxcWjI
         tUbqnbfJJO402RU5V09Am96Nb4CDdT87Kb1FPGDf9PxBx4INf3KPZiWL+wRbyF2NDg7r
         pr7NEFIZB/FVi8tkrIHL95zJzlEsTuB0pcH0h7R1y87xw3p6DVd0B2PlDjuwjLRIFsAG
         YlLg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791907222; x=1792512022; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xMzfDdWo0ZbobwvhYL+QfEr7jkf7L5HHwABc9Q/vj60=;
        b=oYOb1l+BeCmkM7eq0f8ES/yYBdMh00JEl3Ut9+BhX6+V0lSFStcGM09QIYjVTXh7Ag
         dxC2/ib4RYGevcUUJko/Wx1Rj33mv9CeixZHtrM8J3Joob+7jitCrv6X5um3H5xp9Ekh
         m4LpmkkXhHyDXYtl7WAFY5U+2LYnOdNjJGJnM1d1SQhul10IxL7pvVTinUM3Cv8byW6W
         3EBj78GNF7dtnAZ75iY2N/wNX9EDg8EHt1pejUzGNANJtt+U4pR4Mom/VDRAMAAGdlGc
         FWpWYWlNmjuCAfugCptCtZprtF4bZEIbZAtvDj6oc4Knp/6hWrCc7DxFni7SbcUyQuMK
         sXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791907222; x=1792512022;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xMzfDdWo0ZbobwvhYL+QfEr7jkf7L5HHwABc9Q/vj60=;
        b=mexvlotHfPPsUu36ybJT+KqpWexk4KlL9s/xVNuQTlPkzmh6Qq1DKV95TKOuRsXpFr
         m3drYXwsnM8xr79Oc4gugn12wiU6kmGx0zt2AXP7fSZGT+bp8ueaX4K3t1gQ1BW7lOMj
         SAdjbAt73wA3/9F3/ORnKF/9GdAx+U1q6TTJ6EF07apTJpATKZPzu3ZJVhNkiSDCn9BH
         ZSJ8bIgxLuKIiDPIr9YzUguHEV6MO0hWD+PqsE+TSTZf5+G+ctDjMj/ToE9Wqt4Soc0L
         86pmSPAx79TS22uS29YrDK+oWnGmYktx9x1nKnOUToj3LcvNuSizK/Xuw64x9qCrCpOf
         +MLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbQr3lyPXLZwZr/OE20FGwVdt2ZwDhVxGdWyBuzEUbB7kFj3i46ynbUZfwq64K6CpkHXOCO9xPJlg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYI/lRzi7CWSpc3reaPPsAFRXfOJNieafSZSHNy3t+zqrpNc0ffp
	wlP/yQLH1Jzv3vhkWVNReG2oX6A07gjpk6iN2Pdv6WAn9vjNpFAW5RfRj5GRTW0wMxWouRPFdsN
	Ir4bRz2W/TSFHj5ADpyC5KR0oU4j/2tAblIrNX7JoPw==
X-Gm-Gg: AYBFou3MPsLkZJCcUALiS9viddY+zc5op8Dg2tNCUOLLAp9l1ieRHfo1K1KIuXIkpH3
	KgS4lU6CMKsTQol5cDOIjDM6lkaytO1iDmFDtlxAOsHcuoQE2dzaCSDhwgYG/WvfAJBwBrZ+ODg
	v9cVRGGWY6Ow7Z8o5zc9UTutTmwoAefE7AusxMDx9UNqRMYyi7skWQni1QPBaoq1M10BQ23Cp4M
	vrRS59aeqthEQr5SwpzrhqTypC57wRI8npQh9lUig57S8ArS1g+FlclzJiBSlq7Cq82np0ciTie
	1Xv+ldD2JEUQJRMyPa/U+8ilgUJE8SupU2V06wgxgvElglL5r5Tjja/yw1ULwKH3zkl0WrMVARc
	lMezP0+ubpncaLNu5mnZ7PZKcWOTTDyrg+oTw+l8=
X-Received: by 2002:a05:690c:288:b0:8b0:9e24:4005 with SMTP id
 00721157ae682-8b09e245129mr22462247b3.48.1791907221988; Tue, 13 Oct 2026
 09:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-12-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-12-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:00:07 +0100
X-Gm-Features: AclHuK_b1CfMObf1rI66LJo21oLhOivp2sgnhibZnkzpTZtnhEkqg-xP9NavG9E
Message-ID: <CAFEAcA9nfB5ajh1L==G2dSD=0vZY4ZyZSr77rt3OUAH_CCLBkg@mail.gmail.com>
Subject: Re: [PATCH 11/22] i8259.c: convert to use DEFINE_TYPES() macro
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-c1860d/1791907223-CDD4887B-BC3244B3/0/0
X-purgate-type: clean
X-purgate-size: 333

On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/i8259.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

