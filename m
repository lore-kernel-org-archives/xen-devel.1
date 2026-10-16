Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615DBCCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:57:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452314.1667145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkJ7-0008UW-By; Fri, 16 Oct 2026 15:57:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452314.1667145; Fri, 16 Oct 2026 15:57:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkJ7-0008UP-86; Fri, 16 Oct 2026 15:57:21 +0000
Received: by outflank-mailman (input) for mailman id 1452314;
 Fri, 16 Oct 2026 15:57:19 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkJ5-0008TC-KC
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:57:19 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkJ5-001vOS-10
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:57:19 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24950-8faa-0a2a0a5109dd-0a2a4501c174-14
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:57:19 +0200
Received: from [209.85.128.174] (helo=mail-yw1-f174.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad2495d-5984-0a2a45010019-d15580aebd92-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:57:18 +0200
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-8b0db268bd8so407037b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:57:18 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1792166237; cv=none;
        d=google.com; s=arc-20260327;
        b=ByhnVHo6RJyEr9Q3/HZjvjRaXPK7cF471cZU6JwAZKJqC6t8BEdqxE7HuaIbKpvR9j
         Qa6UT8Ni8S2BaSBEp9rXJQIx2el/AFDEwvwSYnwTQp+K5X+qM6VpUgqlg8jZYC1qucdc
         t4u45DyCpYWPRtjm6K+fSwlsYwU1HD4I/Gg7Kw47jam7IlgjcYjjtvKNK1uzq8nqfijq
         pglo8W94nt1kYP18dtc6EuGjY3wKksK8tXDpSCev1YyGm1FC1HG0UUSt22zc87QvqlTi
         Sza9SHX9IXXeWQ3YW5lElTairmRtR23vm1NtBa5EUstPoSlj+KTBMzgfaxuM9/vRMoCN
         2nNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Bv0jhAStudRjf0YN2Dnq1S4McAGYgpTwxwO1ue/HiM=;
        fh=c9o3ZVmwF0GyGlsp/xqDB+LUjxAd1O5pECNg9OnTtzk=;
        b=W7wmvzxZD8I+QF12G5YSC6S/g+UqdKkT72J6BorY6qH9xJVo4oa2FHlKFcfNU/Fsf6
         1MmaL1HEqb/WXkTLPdgvwydPjCbrXcb9aT8TdqcVq1cGXDIZ2L3wZyCnu6dNaMgIn3qr
         UqSY8yiLoaUE8oBen5KUJkrN+5ql6y1CfHlSpjUB6CVxYVRslJ1UxEcIDheh4zxKaUKe
         0ZcN1MsM72L/1drTB9NHBgQ0COemBaMOd8fIyZGv095kVEOEmWGXyORf5baYtedndc5H
         Jj3W5th5qvSHpSu/N/qxjAMUgsz+2pGNnAVy0eM7fYsAlJ6Rk4O0HmN6T9q3lNj8of7+
         MlUA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166237; x=1792771037; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Bv0jhAStudRjf0YN2Dnq1S4McAGYgpTwxwO1ue/HiM=;
        b=daaTAKEzwRTaVjyNzgTFVO2vuvvrPgtTcYFryaVyR+XktouQIm4AN3oeZUQn2NJn9D
         OH5OYFDFV8uBcHjt94cpXfsoFLxiR+dJdS74lSpTtv8B9214auvmycHYhcBV2PVLyIWQ
         XAcSGkH6byinDTgtzEodLnubslL97Wy90aC9GjtMyZFMqKGbk/8PXU5aOps3OVUxTBIe
         e8s7mJTQDR8VbP6eIHY5iAOJkeXuD0lMi92BnmHcBFKfeO10qaPuWxbhwGu0+AOy1E1K
         3yRKk/6tCPfIdbpcGrs8FjTNWnNR7xyy2oeeWj5UUHMgib6U5tZGlIkbY3l+ro3HqGba
         PYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166237; x=1792771037;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0Bv0jhAStudRjf0YN2Dnq1S4McAGYgpTwxwO1ue/HiM=;
        b=0XvrS+ScQt88YG8ZdbJY8pEugtPU58SdJR4tppccRBWC2tIYL1R/1WFs7j0b8Nf52d
         8BddIQauFMXNVFkgosuz1y6YNpjpgy90sJVJTbO01iOKNF/2mYEDhLbdJUnm1FMpxb05
         +n6FFwJ8vSREdu4bA8Fbe9412J7XNQqNTprr8Hq9l+dfQrCFocNUHAa7GzZqGemXPD5m
         K3HTuzoSyB7MaLwB2tUmau+GlDxIkRdFdvJAIMNQdyaPBDkWX6Fo8Hssa2Dnsbl5EtIP
         T/f7PrDcZGM8fnYn7ZpMOM9JWga3vVEFyS/sjxWqbJ37ZxZU5yXKaQFWGO/aKVNDufSu
         iqPg==
X-Forwarded-Encrypted: i=1; AKwUvBzdrHHKWeqUgfxLlI/9dP1lmOlzpv5aDqRWbE7C02BuKAI8X3gpdNV0+wfA8DCxs/1VfL1DO4R8NWo=@lists.xenproject.org
X-Gm-Message-State: AFq9FYIduTdz7cHc4neaW1+BqZLJX6urnxX+BjWn2+kBy/7pR76PrfdU
	hyapxtPGRoT7j/u72YJNEkmJDYYnPaXO/EYQjwlhnowH+mLAnPiiySYY28vQtSIszp9Nk2/4QMu
	cH6VI6MwsaYYwaAHNMHMGPEnO819mUO8rNbs3HGmx+A==
X-Gm-Gg: AYBFou2kDXsKp/AlW9htlGYQWGi9nvoVwc018BnJ5Oj2aAFolM1bAlHiNqhUKPcUyKP
	fWGdMRpEQisokz45h5RQqJAcb3NMQ2Q0EJZRoUkcxfei4rcK6p/Qm0Ti0ad199ftUpGYkZ49CA+
	vcs5D5jXGO9bM19T4AjXu17boupHWzqUxH6kug5mDkcJIzA4s9qg+3FBLmCLuLzJyGiVCgotBfV
	KP7mNyWHZM2lQMbdMosnG/5Hu6A8vaKjlJChHdv88GEukJRYrthBQ31Dg4edRr/ItkQRoBkLmCo
	PHN5Cktl/IPFGMP7C5tMiOUTkTy/UTCrW8Ak0TfVYh3IQ9/1nxuoqDqVLSbUGRHrprcr1noUwsk
	7k4gJNxDo1L3D9QCjOA3Vpp0rnoViWez9Wpqrz+E=
X-Received: by 2002:a05:690c:47ca:b0:882:31:3af9 with SMTP id
 00721157ae682-8b0f2056721mr1329977b3.9.1792166237384; Fri, 16 Oct 2026
 08:57:17 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-9-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-9-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 16:57:05 +0100
X-Gm-Features: AclHuK9_tRimGSW5gwJJGSJpXxB0ZYcFgojChYR8ldRgcNm1LmSPVOQJU6cjInU
Message-ID: <CAFEAcA8Yoi-8KEX7ZfKckcG0m=WtKaSwJ8tzJ0K8-ubd6t61YA@mail.gmail.com>
Subject: Re: [PATCH v2 08/27] kvm/i8259.c: rename KVMPICClass to KVMI8259Class
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-d62444/1792166238-BE27A757-8E16AF46/0/0
X-purgate-type: clean
X-purgate-size: 428

On Fri, 16 Oct 2026 at 15:22, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> This is in preparation for its use within a QOM type presenting a single
> KVM 8259 PIC.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/i386/kvm/i8259.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

