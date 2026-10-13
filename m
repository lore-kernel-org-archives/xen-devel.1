Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66724CC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:42:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448060.1664066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGedy-0005Lu-Oo; Tue, 13 Oct 2026 15:42:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448060.1664066; Tue, 13 Oct 2026 15:42:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGedy-0005Ln-MM; Tue, 13 Oct 2026 15:42:22 +0000
Received: by outflank-mailman (input) for mailman id 1448060;
 Tue, 13 Oct 2026 15:42:21 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGedx-0005KM-Jl
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:42:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGedx-001hrE-0e
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:42:21 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace514d-bab6-0a2a0a5309dd-0a2a4503a784-12
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:42:20 +0200
Received: from [209.85.128.179] (helo=mail-yw1-f179.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace515b-fae8-0a2a45030019-d15580b3d5f9-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:42:20 +0200
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-888cbacf70eso36769887b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:42:20 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791906139; cv=none;
        d=google.com; s=arc-20260327;
        b=JKXaZ3pR9xxQAnZ93xSHXgVNLyvzrzQnM6ErjCFwjw+SELYtjxJdeL2cCTTMlpyJTy
         x1x8p1YWxBp0MMU7/xFy45dBtHoG1Wbx0z9Ym5Bu2rIUI0wF3BsXL7+3Esiq0bnxBqJY
         LC25xUO/yFiqyzTpROC6M48x6mtTDr6rSWz4yDDLyd8UA+9959iV9jB1NC4nD/yozUSO
         0HGZGROtpvUMYjSRNE/k8y0KSGc4cx4bt8zpPzOcLAhhvsJWnqJa5jwWQi8ibLpOBWtI
         wkcaMHfaYOQTvrvQ97SzMIfGEM+Z8JZzlmfcak1zmZjLdJL0qMXIoVZgaP0JQ7EuvcZ9
         w0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rm0LyYlJ+YzNGdvtjIb3BVxriPsy574YHZ4IY77q+sA=;
        fh=1z0eNiLUr5Ed0zexgTkBekzCx/6ZMToTOzssRSDUExM=;
        b=QKiL4G+7c+1D8lK1PQDj1ddc9rUrstXQUhepq9dtW+m9H15YUva0VJMx+2nzKoCPLq
         mrg09AZwpFe1J+5nbPS51RqPNYgiZYnRJxcLjYzhMd/JZKOLyXFk74y4IgFU5hY9Ix3r
         1ZXuD+xW1iB6w5cfpmYbpobBzPtF0uvdsLynKJU45C2Cf6iuSjvfYa+TcuvEL/reNuxF
         +yn1ZnqVvEsGfazWeKYEvjsPAhHAO8VT2vjj9zgkh7iw2ZlWtzTgAD1LffRejYGX1JSa
         N872R3bgHa1O1Cu+3FGKNe4mV9X7BW/3uuBmi3YvmknPBjd03QwYdB2iLgJRCVMQSytr
         +Rkg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906139; x=1792510939; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rm0LyYlJ+YzNGdvtjIb3BVxriPsy574YHZ4IY77q+sA=;
        b=CWpslIwxz/9jQtgmekiwyYup3MDVLtwLjbhpkUtilcXW177k/Hd/GbK0feRKKo/R3+
         xJzvOX7j6ufii0gbYxC3lL61NpWHqTcd05JyAvpD0OgjGBhYWTbL+9dIm41jGYCaRdq9
         imOJ5G9LhEQTFddEAlxy9HqCpzlfv3Nkpn40HC2vC+lnvM2MjOkq/7/8/nIHelta3FQZ
         t0gr+642QB7yFuR4IgJGo9hQusrlqVrBP/B8eDBuMAcdAodKxlJ9o/EV8nPTHPQsxP5A
         HzrlnUIl46NgcoOVS5PqDjdMVJOZ4tO1igWOcTynH3F2COn88XpYTm2SD3OxFOEERZAk
         NQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906139; x=1792510939;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rm0LyYlJ+YzNGdvtjIb3BVxriPsy574YHZ4IY77q+sA=;
        b=YDe4OHIRX/SffYO2e01QdM0wBbj9bR5P6ka9VNDKK7WRTIW4ntkmZBHUyqC2ntca/9
         ARWUVBzdKTs1B4FxKwgzMMhqCbqn9F/FxSuohqDvf9lgHw2foOl62XCuSeFt/BO3YAfk
         X2ahUEBjpSnE5nOrNr4S2ckGy6CZ+yFpj8bXJmUmi4uYFzOqv6EyC+XaB1KZCaLDKv1w
         VWdB80ihmHLYwwh3GGqaQ4DVPCm3zguszVnyjdHrOGAvRhYs+W9+uIH54Xdk9bCfynZK
         iZy01bNzOSdbLtqtLHlvEDQpwkmU7mpTyGdwBzkY0tZKZoNzw5UiV5ge4wUm7flSdYuN
         CIgA==
X-Forwarded-Encrypted: i=1; AKwUvBy/Xyh0PF5m4amMisK13j/ui/da73km7ELgE1oimxJ/e/etcfrNESqfrUoo64Yb5QhXLfgwfjxipTI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYJN4rAsodki8jCNHPNl5e3ZPXDmhZQu6zwpV2rbZFj9XmMthnhZ
	OcUVa/WShdP4Z0ypxqSFinkKV6ieNQFvpElGyyH6S8XjMDD/DTOVrQRCwr2C58DtUwR31ZjTF/r
	MZMPtB7iGLXmTMwYmoG60WjxTn2+aDseuJtcmA82Zfw==
X-Gm-Gg: AYBFou2SOObp0uzIjk+xbqSO4y9lAAnLKAwXOdnAxC7mu2/SM9r6Y2npy0XOEJncrku
	c3bD+x4Y1QfFLCsjjAz5vqKkSlJJ2DUw7A8t4zf7+zz7nNfzAVZbmP/fbqchJ2Siw52IFSoaNlB
	wUJmFsUKuSvxhw5h1PsxHe54I4UWVQ5bJxvQpT5/mIGuJPGG/4dp/zgGzeR5aUTZXexqHQHV1zN
	+aVICp8mizDCLez+sKpzfbjMpeeT7rbIuw5UnarkZ9gflZUn7VTRk2LEkTB740PhGN6KMG6ZBBn
	deuCu3ggUuvKW50NF8tcCI3LOSSD46r4EWwqsZl0I0HGLzjXE9FuEhUKonLcXSJTjZwXFGDymow
	7oEFhg6KJp33GcDbtGskATWrw98O1slvwkw8SrH4=
X-Received: by 2002:a05:690c:3685:b0:87a:c454:6d67 with SMTP id
 00721157ae682-8b07ee526b0mr38663537b3.52.1791906139243; Tue, 13 Oct 2026
 08:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-5-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-5-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:42:07 +0100
X-Gm-Features: AclHuK9bqSLzLVQB4VCGAk6mL6XXtifWp7anaSaKyJr9Tn_7wu7r2UfWe3SiG8s
Message-ID: <CAFEAcA_NVw4_xPfb7aTXoNxgC+N+D7arQ7X+7vAokNuZxd4p9g@mail.gmail.com>
Subject: Re: [PATCH 04/22] i8259_internal.h: rename PICCommonClass to I8259CommonClass
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-33051d/1791906140-6F4C74E9-423DB5A6/0/0
X-purgate-type: clean
X-purgate-size: 470

On Wed, 16 Sept 2026 at 11:50, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/isa/i8259_internal.h | 4 ++--
>  hw/i386/kvm/i8259.c             | 4 ++--
>  hw/intc/i8259.c                 | 2 +-
>  hw/intc/i8259_common.c          | 6 +++---
>  4 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

