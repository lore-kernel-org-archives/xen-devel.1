Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBEDCC6B12
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 15:41:04 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1448050.1664049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeca-0004Na-9H; Tue, 13 Oct 2026 15:40:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1448050.1664049; Tue, 13 Oct 2026 15:40:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGeca-0004NO-5V; Tue, 13 Oct 2026 15:40:56 +0000
Received: by outflank-mailman (input) for mailman id 1448050;
 Tue, 13 Oct 2026 15:40:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xGecZ-0004N7-EA
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 15:40:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGecY-00DVoj-RI
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2026 17:40:54 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5105-bab6-0a2a0a5309dd-0a2a4501cb40-2
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:40:54 +0200
Received: from [209.85.128.172] (helo=mail-yw1-f172.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ace5105-5984-0a2a45010019-d15580acc418-3
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 17:40:54 +0200
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-885cf67963eso24236967b3.0
 for <xen-devel@lists.xenproject.org>; Tue, 13 Oct 2026 08:40:54 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1791906053; cv=none;
        d=google.com; s=arc-20260327;
        b=qE3QfvjlupPJLD9azoSmCBQMMiXRgdDvryL6FbHKEVwGJHv+fbodAxoYiGN6Cximgo
         mxDrIdXRxiTG4J6g0K8oc7I8g/6qbhKtOWW13uQSMbHfl74rrY3a0jos1+PniJwdldnd
         46COmwYIFnyxnMP42ueCplv1u2JNfB7MSw43NSQ6TzAxGF1w42g51X9XL7wZ4rQJjyUz
         0NM3c+sG1D8tQkHBXzJ8BvT4KvarL2nHh3qwOg3R4y5MP7XR7ReaZE3376kmRTWzd3Ib
         kQ5FwxI+plvJii6ThGIZSovLaHKrNLTWqUxwD6PL9iQph0Skz7aMLH3TlE2HWg28oUbn
         JpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Xl4zRxtbD4rZ1QPQ9stJXKNnuMepND9L/DXbpKoF8Eg=;
        fh=fgQKDctxAI5TI6zXWYRConjB89fdqUcvPsob07+javM=;
        b=boBTgFZJvo0VtFtXmE+nkO2EvzcenmzDet9i+68BxQ+aqjhlKgqckL6TsAnaorVlWn
         JdteeQQ1bnIU2SNILzo5c5VIjnHRJwXph5CLczRMJyCrqi/2wyVDXNgaJ4cYk2irFJN9
         /CsgPBt5uqwyGfY+N3efihdaYdo2893dlViNqj01Wmm7a4HOhmWLS3hnpUGSq7mA5F1p
         JFyvkuP8k5QyfaBHN/QI5b9i7vOR/P5hh89IcJiTNC8vXwGv1WKd4I6dTyqQh3d8HOhL
         QVBBxszYwqpotpZlCOYee7S1BvywXW7UL16abVdbgUk+mEbLG9iyCaRdE3/O7g7JUIn9
         rc4g==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791906053; x=1792510853; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xl4zRxtbD4rZ1QPQ9stJXKNnuMepND9L/DXbpKoF8Eg=;
        b=CjVAqVjTE1FGtkOEvdEyaWlJUkMxC8B4IJTPoiFKX0wzLO4pMipKSm1GmiiWwha3Ma
         M8nB7fNiBg7ImuOACF4A5eGyw1FZ/oS4gKpS9TWdXkKVu6CMpUP50RBV7Dtal/C9bxFc
         Kzo9RUucCka2WHqv5sAuR2BDieYc8yvN6Zi1fLqFiIfIWt6r16l/qnFxaaR8/mKSzTUD
         NYOxDFkrNqSSBO38IH0qiz/P+w9vj2wBfBGwF+cFxVXlAsXzH2hqO+CcfWOxWbLwlyUa
         SD0C1KdxjQXT7rRVUDW/b8DuuLKzeq8EvTA2Rn9iGSKipxOpBNJAZO5r8bvX9W9OdrtR
         WmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906053; x=1792510853;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Xl4zRxtbD4rZ1QPQ9stJXKNnuMepND9L/DXbpKoF8Eg=;
        b=wstv/rVZs9NOMv4SmdM/PObwQW4TijxLaULmmI4MrcLCr4vfpJx0UqwUF87VjQwFQq
         zpvThxkGcO1QNhCGQb7YrKNtw8xTkJSgAswJqX8VEZ5Ls+88oqpZRY7XB58VhnvLa72J
         4GsHy+nhg8f1B1/a0tVcJKtwHyo5z2u6b/lZZa/KxD1ozs1eATHnV0K0Ua9OIF4mnrHj
         ULHSYOKr1TlsQEUzZs5MINbdgIc/bOEue22jSEXEQ+HPYkmYjI3tLdz1CmtP+HRDMfQq
         sRq0BX+9SjGj9JKCettHH2yOkJB9Rk/YI+Jm2Mo0Ck/A1gZ7/YcFIwtl/P7NlTZXkwUv
         XEvQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7T82A8TFLoVUR3yVsixz6dl7aXkXqUI9b0Qi0ZfvGXOJcF0V4uHVr29Raf1OGqBMmmZph4bKr3Zo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKdzi8ebX+99gM7VQIt3UUdmOzdIjyKBH134No1uCZttwpubSyR
	rscCk8vXAcWBwB2j1xM+ws3N2EblqdZA3+g7V0X1FeVaotHNLR9/hwucmYOGfjXEImWwyAVs5zs
	BjPq3rnYa7kH+Ai0lj1IMtS38G5QBU/LrLFmCK3Al2Q==
X-Gm-Gg: AYBFou06NXKNCSqNKcpRBd0TujoBSXu3La3bHQRGD4sQGr3pTatc/G+GIXBu7gCHcB5
	9sUwYaiFdwawmPqZgFM4kdbqIO/gJ3Ap0+NOfyc3qVaaj8kN5sjsIvUCVj8tz1hQgCOuvopHgyc
	x478tZA379F/jYAK0qEecIgbySga4ZmPs2c8thPc9tzKW6vRvnwQhXfYkQMEwOhX1Y/k9xXRCqz
	HnqC74WwbAXNB1ozjIDuxCQs9dhZ1v2Txt5L9xD0r6kIWDvgg0Ivl12HbtSKdkez8ZOWf5zIjvt
	OdP4RCJDDYvv7el1yGL8oM53bSWJsrtE6/naWOgXOmsfCrC8ot3/xXQZUosgcGECJkdB6xuGRHD
	2/0AbQ3rBaW6saetjOSidOdEI8o+9W320Gco/hbk=
X-Received: by 2002:a05:690c:e145:b0:8a8:7fda:15db with SMTP id
 00721157ae682-8b07edb0b40mr36974837b3.22.1791906053032; Tue, 13 Oct 2026
 08:40:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260916104435.600211-1-mark.caveayland@nutanix.com> <20260916104435.600211-4-mark.caveayland@nutanix.com>
In-Reply-To: <20260916104435.600211-4-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 16:40:40 +0100
X-Gm-Features: AclHuK8SESetnPbkPIzW7fzFCm5Cs0Lztvlg79zYn30l_K_hxeD1jY48AGkU2b4
Message-ID: <CAFEAcA-7Y5AErqcOajBVjPSZywrvmCc8Ok792U8vBD9ZZfZzTw@mail.gmail.com>
Subject: Re: [PATCH 03/22] i8259_internal.h: rename PICCommonState to I8259CommonState
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1791906054-1D272757-849B1037/0/0
X-purgate-type: clean
X-purgate-size: 574

On Wed, 16 Sept 2026 at 11:47, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  include/hw/intc/i8259.h         |  8 ++---
>  include/hw/isa/i8259_internal.h | 10 +++---
>  hw/i386/kvm/i8259.c             | 10 +++---
>  hw/intc/i8259.c                 | 34 +++++++++----------
>  hw/intc/i8259_common.c          | 58 ++++++++++++++++-----------------
>  5 files changed, 60 insertions(+), 60 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

