Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343D0CCA46C
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:58:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452327.1667162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkJr-0001Aj-Od; Fri, 16 Oct 2026 15:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452327.1667162; Fri, 16 Oct 2026 15:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkJr-0001Ab-Lx; Fri, 16 Oct 2026 15:58:07 +0000
Received: by outflank-mailman (input) for mailman id 1452327;
 Fri, 16 Oct 2026 15:58:06 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkJq-0001AH-Ct
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:58:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkJp-00CrAj-Q7
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:58:05 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad2490f-bab6-0a2a0a5309dd-0a2a450b9aec-48
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:58:05 +0200
Received: from [74.125.224.49] (helo=mail-yx1-f49.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad2498a-b7e8-0a2a450b0019-4a7de031cc04-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:58:03 +0200
Received: by mail-yx1-f49.google.com with SMTP id
 956f58d0204a3-6767d92cde6so195902d50.0
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:58:03 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1792166282; cv=none;
        d=google.com; s=arc-20260327;
        b=jC7DPn4O7DPjXgKCiMXmw6Yay7Fg6ys8DBAiHKWxL7NgfnHlCi2fxkBHdzPwj+N5Go
         gedClDbR4yeDuVJSDHU8d+uw4PgregnhNy5nHg48BOHKnl5xC36Amjld1RR1AkPcnXpF
         cZnpAMuq1MRLdftfLCOs/3mym7HEDZmyIvs2qcij/1uK38FRI/jW8DSII+5ezIkQzWH6
         x6wCkME7GCn+lUqAZBE51Jpb5IhE3u0Q5LnU1KU0Ze5+hOf1+fiJ4WRaJGJIQ4k+hVFn
         hn6aqNSNfkzA1ZgXl7QnM7yKe6Uws+Y5AjTQIGEvEOyhO7s2zmvpw6sY6OSaJbp162pQ
         ZivQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tzUyRwSvSTZpajfUFhAFqOVRPdXs1HJ0Bbm5LCt1+4M=;
        fh=4tquzMdfChB8RPcoYOfiXXoJPoYsnNaqVXKqxpaUGxM=;
        b=jOIUxR0s1INgbe6G133WqW4gshlMJvFNvggXVOyfM+WjwTZEg6IAtMu/lF2SYul8DF
         llYEXhSt/futiLSnrXaEk3kgHM0ZQv90Q4ghCpMh3r1QqSrUnHz1+LKvWPbg4aDFLaSN
         561DmXEFjCzSL8cw8XB68h2CZ1d+5PqdDviPRpMEQUVF5tYLK6d/TLOIMq6E+zS8aII5
         f0tnFGKpCqHRjJIIZzZLho/FGenDr64POOINuyHWAT/1zzV3G1vPMk9uICtNPNNVbxf2
         +glAz3VoZqevAZ6bh64nRPwT3oYsy+kG41NJMx1Oa4bG/T89mMVR1ZNJ0TtFXVp6Lz7V
         BUFA==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166282; x=1792771082; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzUyRwSvSTZpajfUFhAFqOVRPdXs1HJ0Bbm5LCt1+4M=;
        b=IUi2dLZ3mWOaO9roEE0TMihnUjJJ2prP8ceCtyUAWQHodVP4Bvw8AVVBDoMXMQAI17
         cq6jQdyknIY5MLZv71GwYdNzF8vFAmy6GrjqYSWS+JUHcgQ2kpT3JYW07B5NwQQgEeAb
         9fF9/F1Q/t3pXzmgzm0LcpRPdl07Q+OhiArnGfCW3879upEiv1S+9nTcfhXjFrZmi6sM
         xf05nuh+/Z/ai0FeZahr/q9MlSLJMoh3AdLJ7mXtue7K5JRJ3hHLAddus65VI7n/tKeb
         A/h6vpntiFVkCx75EN6/Nc04TjqxFKtnRY9oYLzzi4y9qjvYw9VDVQaiPh5nYz8/13bu
         NFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166282; x=1792771082;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tzUyRwSvSTZpajfUFhAFqOVRPdXs1HJ0Bbm5LCt1+4M=;
        b=IHeypOsvxMyy773PJ1OKog/A/GQeB7lFn7XlszIbNRMSTDJnl53d88SmeJggOLQCAb
         VwAqSJ5ZbdvEtTn9lJ5y+5dGg5z60nz5XjVtdoth76a8Ro3GWmAVn25r7AQHE0h4wwoH
         CmxyweP1CPKGW+wWZJBp/6QzOiqfP5AtRoIn5gxd2oJ2Ky2UotPFQmkxftyDsrs6AtcK
         ZSOoY0E1yNcboKxYHHDd6/Ch6KTMgU50am1t6eaNNV8gZsKXy7SS4AnroKdOeWngleSE
         Lt1hnmxkCvdhu9pdqMrcn+k7U2WPoNfogf1ppVSvqYpdSzfQWu8mRPizkd6JhjYr47FT
         GnTA==
X-Forwarded-Encrypted: i=1; AKwUvBzDyVfsDTgzHEbYXovUQyPPduOfESJS1zxI1rCsbXmSOFWGUxKm43xAn3d67YUfXBOi6V/MUPO5hks=@lists.xenproject.org
X-Gm-Message-State: AFq9FYLed0UEenYk1PBvxDu7wYlY2JtuH8hDWOC0jMHy5xToL9KKMtob
	XsfyuxcuKquMeKY3i0MJU4g60AVi7tB6+h814Ge6cYmysTGdjsegeXKlKJOO4eFSsNa04a+0efP
	++TqeOELLB6l6pA1ylWswPdPGqa5kTN/3QVUqcsmuz8W27K8J8Y701jc=
X-Gm-Gg: AYBFou0ktlR2sNYooNSkXJNpTyxDZgFAFdRGiNF79G/hGQxo0xIJo5yT2yENvTDamRD
	rpkLFCjAf/i1bntHTGAew98eF3Gl52uP82qxAzkkak1M7e/AdJKzPJ511EtDeri5iYlE+Zxzv3a
	AvjRsHiBdbkUBrmaA7+B9o8Hwtifxk3+2QY04osvLiIrdm/tLdLvyfY7igwdh2Y0/aCawT1v88n
	sbJtvqNx1NbpQh1Jh6s71u0Z0MhAoupb8q1s0Us+SOQjUCLyLdQOZgnf4EMdRksiw1GwoOZVl2p
	PDObpGiCZVfKKRHhAsVal5UYr4CloJ6XGvb1wXaCij13WtOgFCx4ysiG4s5lOM4sqCRREdZrW48
	02s4xVPR2JUWGYwNoiGc5MNOjySYZQYXXd0j/Xwc=
X-Received: by 2002:a05:690c:29b:b0:8b0:e680:6157 with SMTP id
 00721157ae682-8b0f21966dcmr1741227b3.39.1792166282248; Fri, 16 Oct 2026
 08:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-11-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-11-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 16:57:47 +0100
X-Gm-Features: AclHuK_Xg1yShmZzjS6zJOIF9yk2TdSWaMxrKLq6lygSMNlA25-z2dLMhnrPNhM
Message-ID: <CAFEAcA8iyerWJRZq-BTWBVKfmX9P=+Yn+QwOza=kNnSiE-DdgA@mail.gmail.com>
Subject: Re: [PATCH v2 10/27] kvm/i8259.c: always use cs for I8259CommonState variables
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-42698a/1792166283-1BCD79EA-ABA1FD7E/0/0
X-purgate-type: clean
X-purgate-size: 361

On Fri, 16 Oct 2026 at 15:23, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> The use of consistent variable names makes it much easier to follow which
> fields are being accessed from I8259CommonState.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

