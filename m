Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A6CCCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:55:44 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452296.1667119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkHH-0006vn-HZ; Fri, 16 Oct 2026 15:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452296.1667119; Fri, 16 Oct 2026 15:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkHH-0006vg-Dl; Fri, 16 Oct 2026 15:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1452296;
 Fri, 16 Oct 2026 15:55:26 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkHG-0006va-Np
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:55:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkHG-003OzI-4l
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:55:26 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad248ee-e002-0a2a0a5209dd-0a2a4504c7e4-0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:55:26 +0200
Received: from [209.85.128.177] (helo=mail-yw1-f177.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad248ed-b57f-0a2a45040019-d15580b1e494-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:55:25 +0200
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-8b06c0794cfso944527b3.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:55:25 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1792166124; cv=none;
        d=google.com; s=arc-20260327;
        b=TIiMO5lEN1dmHv0xtD+/ErNewTqPTOrt9/3Uc12JFxhsr41PnPMZqd8TawiLeIVaiR
         vGhTMOEPrsL8Pl7m5AsGQixphRYApKzxhx3Mk1XQVUbkoJEsSLWagXOVAgwEwexl9ehE
         eXrITCVEh01MJ4VJtpRFA1sy+FUzZd9qKvWIldRGC2xNH+SADMw04JuREqYhQug90v5e
         f/r5GT6p0P+Z3Pqs92x1q9SzFRGMeC6JMssbuiSJ31nyMnm1WgpgiXrrQSVtUjNexGi0
         B+X99dIk80ciXSbAAJ/I0QfQRTGtEEfVzTveTzwVSBgQQhbSJfLevUiBfMO5lgEmBHAY
         cZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Z0U9nhI3/BkU5LUuDW+0BzjA0KXxkCMgNCafRerAKsY=;
        fh=P2rKh5AIgZyvfPXtJpShNPlxk0/V+39xpTtioqp3ivQ=;
        b=HhPqckBE0y1QVv8WmFiYLJLUfojwu9iQYGs5SlzHlCCpSmf6tRjTI7HTnAy/KWThYk
         Oncw9ifVE22nInIE9kB4HPn55OFLhnuTTwiaIOn1P6cgGXfQe+hvxs4y5Bpg7DXGLYLl
         l2UlQgkEDVkB8wSaDvERY1+Uo/Z5t2P4kW0LfKebwW8Q+GkxeoXAK7xZEX86QmE4dip1
         U9WsmFk2c0KZANE0UyTo2PAuVrLLuOTRRApldmVUrgyz8NjS2E8N9Ss4KKym0qKVqNWj
         j5vDOdeSh4Txm29xHtlN34EWZCzmCoccCQbZeDS519+som1+kpmUMJ6SPnuSYhYY3EfW
         2Kpg==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166124; x=1792770924; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z0U9nhI3/BkU5LUuDW+0BzjA0KXxkCMgNCafRerAKsY=;
        b=PC2G9ePLcBnFaVaS1WgvgaKnG1epUCpjRGOWnznO5Av2tMiuVGeM/nsL2lyOT1BioF
         j4/px1c1DHcTBS7zSNz6z94Xz8WSLk62/7uEjehVQ/LOdKNK4iQb5WKiMC4BobATtJg1
         cq+6FdTbpNk+VW9QrAIAgXNsHihPakXYfAiwtYUu374nQGTPEKwjB9AiX0OzLmrXFHpq
         Sp59yHlUgZNiSF/jAfmKw4YYSrpjy+/NuWOO02jRoFR4ivBgT+UdRHO2lk++duyNmSEz
         zKEyCjHdfvzRq39qqF2EarUE1GuGTVqXMTFIZHoJkhpnfX3rEDMKqmFoT7pZYNgCuWG9
         3A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166124; x=1792770924;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z0U9nhI3/BkU5LUuDW+0BzjA0KXxkCMgNCafRerAKsY=;
        b=H3CpKXMQQMJxgbuNXMXMVZuDS5x9Oh1RBFmfgdpgqCYe/3qAmiDrrXFCJU+8cFtN9C
         rotSQUIbf4TMGgTGI8LSVydXRfyImV4sWiNYtVuUp7G8rh0CAgIkuNK21as3NdWPyUbd
         XnF1TTEctVUmxaYO52zGQmErup9/incnpFJhzua8XHmP8lvW4IDmFeyk/CK2yLYkgem1
         W5ajh1fpRMcUziVuiKQOI1AhXG/+13t3+N3Payi1cr2kSf/6WCXhqBBBhPLrGsXZ00qV
         qBje4uo6UPW5VNws4gjHZR56I4aVS5rvX+FxX8M17EPlbcynGg5mVBbMLPS+9s9PK7up
         OjFw==
X-Forwarded-Encrypted: i=1; AKwUvBxHv+iRsLJGzAkvo1fh/AfsXobAAktxURsXRmjxQWVW+gWtIOl9G5G3MnfknfReb+x042+6XfGKe6M=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKMMt9ZnwXmf1p9B+gyxqk35A89Wo0wVfqHG0JfDKJrjt8AR+oY
	dbRSgF5yiQJ80E0+DAvbvF/4qgUof1UI7D6F6oMyk1laLbeu6ffXAy4mddzuQCsefxAgCEyfkf/
	B/WgAmkyuOFf+EMW05rClwOOyPT2aA9K4r6ju4WoGjg==
X-Gm-Gg: AYBFou2T8AdSrqlTnA/xPT76jPHvRh7J8y+ffZQCDqvwSdRq5cTkZK2YRVPVCrh2HW1
	ZigpNHAuU7vqy2/5MAJlciRSovH0B8PD5Y6ChDw41AwHrXAfUJOCQ6Cam6MCigA+x6QV3rzAcJx
	xb+yoTOkvSy7N8Q6BhmGjcD4jZPbQatvxaeVkcjXfq0PTCzD7nMFakJ4BMBXZ/DQAs4aoBqnGOy
	BAw5O0cyDg/AXtMFCrrekopIfWDfc8+ZlGrwM2NcY3AiAT5/jpZCckH8i73k1i5gsa5crKe1jN4
	PMO0JY49pcVcTfYzK+eI+NhSh0/p2PgC2GmxTyt3zTElpB3V0gZZBv/gWO9KXu/Qxc4LOvkccrK
	wofTAvhFe/ptH9EuENNMc0uJsNvyi/9AXmx/ogp+G+a1zt7I2cfY=
X-Received: by 2002:a05:690c:fd2:b0:8b0:ccc3:27d2 with SMTP id
 00721157ae682-8b0f2176552mr1755087b3.29.1792166124207; Fri, 16 Oct 2026
 08:55:24 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-6-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-6-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 16:55:12 +0100
X-Gm-Features: AclHuK9skk_bQb3K0JVtLihI0jZXbPpRninwyZ9Z8NqEK-mnjl_NGcwhfVRtaZs
Message-ID: <CAFEAcA-uaJtM6vkkqacrT04CP5WK=78odLu=BHH_z3CuuWPk5A@mail.gmail.com>
Subject: Re: [PATCH v2 05/27] i8259.c: rename PICClass to I8259Class
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ebf023/1792166126-514D3B50-03CDE07D/0/0
X-purgate-type: clean
X-purgate-size: 330

On Fri, 16 Oct 2026 at 15:22, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This is in preparation for its use within a QOM type presenting a single
> emulated 8259 PIC.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

