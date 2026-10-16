Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD7ECC6B38
	for <xen-devel@archiver.kernel.org>; Fri, 16 Oct 2026 15:57:05 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1452312.1667136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkIj-00083g-4S; Fri, 16 Oct 2026 15:56:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1452312.1667136; Fri, 16 Oct 2026 15:56:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHkIj-00083X-1X; Fri, 16 Oct 2026 15:56:57 +0000
Received: by outflank-mailman (input) for mailman id 1452312;
 Fri, 16 Oct 2026 15:56:55 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <peter.maydell@linaro.org>) id 1xHkIh-00083J-9V
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 15:56:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHkIg-00Cr0W-Mi
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2026 17:56:54 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad2492f-2eae-0a2a0a5409dd-0a2a4507aaba-20
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:56:54 +0200
Received: from [209.85.128.176] (helo=mail-yw1-f176.google.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <peter.maydell@linaro.org>)
 id 6ad24945-b4ea-0a2a45070019-d15580b0cdf2-3
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 17:56:54 +0200
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-8ac4806e210so778437b3.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 Oct 2026 08:56:54 -0700 (PDT)
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
ARC-Seal: i=1; a=rsa-sha256; t=1792166213; cv=none;
        d=google.com; s=arc-20260327;
        b=PtnFFlmRV6kC5m1TQveNoflaOH4jrQUz2kF7+YmjkfpKUF1jlnq0SqqoXLrWw3spt9
         wZ9D9tY0rWxzfrNnwakzgqwdI4eSCr/Kn3CpkhxfCMWgdTjsL8++3kYeKof+DOX6ozsi
         KGSqKofVBKNNm6t3erOXklDmDW1Q4vC9a9g6NokD6VupSozZfVuOdDHNKdSbtToSKWiM
         3Jg9+RyGJGGeMdXqWAzlMHlGIE9QA5f56xhmAUFp1qPDo+8RWYVk4JSwYFOUuxAjKs8C
         ikECu0a3p80GQEFltgojPDEilxYmXKYN5gEV7al5EO1nwACezw2wHWDRVMPULnwi1jHP
         jTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1ExK9j+YPbSPC7sfcOHKaCgU0m9CHR8eATjYSF7jCME=;
        fh=uyndmGwmaAdwu6L4sh5AvRorg/U5mSgxfZGhdZs0s1k=;
        b=iYwC8qqQwV5vZcxXCIb95yyHrhs/cONoMf7PYOcFBCaMtnuchyOF4QXVk0CkFawjJQ
         uZPrIuLb7NKs9GSZiU+e+zbEqGxkblEXYNlYNwVI4A9rMAv3ONSqscnqnbR/0wNrt62r
         eVV2YEr21FayloI43R8d+v1StAn9j/T8BHTUB+O+k94A2d0+Pstqh2CVum+a7a1uhQYv
         omf3vsWTHIdLN5w4JmGpWVlyQa8LaSHQAfeUvsF2jGn9w7iIUdlvd0E1yFoKi2GzsfcR
         dBvX7sze0rrnuuTXGzpcbgCVz1XnqzRRKK82VHbtChH2otTKq/xmQZYz7c2sBpDJD3pq
         ZHRw==;
        darn=lists.xenproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792166213; x=1792771013; darn=lists.xenproject.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ExK9j+YPbSPC7sfcOHKaCgU0m9CHR8eATjYSF7jCME=;
        b=u3bymnjtkTFtcJkHhMRMIiClX9GkY98E7jHR+Ws36G1EHXpiJJu4zJiXiFFH4fIoaf
         F1AIlQa2Xznf6D6UNjSksUvq+SZvaY0Z7I0G1T+Y3j3Z/UfiCn4KM5tAliSZT64lBn6z
         MSUpp35yORwo0mWsAeXfJbulyx88UGieIoFuqaa/XMkiAH958LJbuJkiOpKq1gURLnss
         Kvt+k+tvwdiy8QN+bJDIJzWsb120YxEAM6qkDVgMT/89msZS+qS5TYLI3kTeeYjdB+lL
         tjbT+vJ66reLq4IyGExxGJUVXRkNtbwxt8ocMkDXIdygG8yx92eHXRKvTBhPTqpeOpHy
         4VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792166213; x=1792771013;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1ExK9j+YPbSPC7sfcOHKaCgU0m9CHR8eATjYSF7jCME=;
        b=MvC7fbUbKxP7f499A9fbqtcCrdIr405QxIy7+E/MbLjdHDzC/hV/0kwmieUwE3cjZK
         YyPajIH4R3FlTVE6hohHYW7dcBNKB4wJYCauqg/PjZJRp0W4hjwLgUaCaze0nL5hiH3V
         yKCdJPHSgGoOzbxaiWRBRwMTHXuoDOab6q8aKL85SqkBH14PIRDm4Qmy3D8LncHAyPwx
         BPm1K7pYHiwn8MilCWZ1vkRnKC60K2iIWoKRsggTsadOQng3XUOIZ3CBi0P9+AYLLlO9
         yOXbqYtlEcMnZtyiJ1MwDAUU7xiPlp467K7fJU9a8ql50QUhNtjRlVcH1YLqe8bIfJJB
         7kqg==
X-Forwarded-Encrypted: i=1; AKwUvBzCHoOhQjZuVUoYuafMfOdWK2uDwdsarXyrT7o/4v4/rH3i83zEOgTR5Yxmu0REe1OLbEVPjY/qSfg=@lists.xenproject.org
X-Gm-Message-State: AFq9FYKxCPEPhUMbJFQYpupwXeIG407DTaqmVI9eD3PqISOxM20Hm5R5
	Id5ybUcvxq72V2yKtv1Kwy+xmZKaPppaBueo4BSBo59OwzJ8lKhls5chrOo2oM4/vGwtrvPEwVe
	p+OQl+CZ9Aqwo2067cx3gCPdHt0jWazXdTCqLMzKc+Q==
X-Gm-Gg: AYBFou3DCFtZmMjZRCKMU5sNpyB3cnosGPk1Av7xg+ZFH6j8MUhgPiVmFrbRI4+STw2
	IP8PBFBmw6gogeAyXmez9TObTHOeY4n49Fmlsy8qC+gBUfFlcFJisoQcEBT7DPSfqlYfLJeDloa
	+7ZGxQEJBG+Civd0HgEFG5M4maXWjsB/ZjgdGz8UI0tIvkO5UchxDNW/lCw5qACSczsn9BH9mUz
	lnIttZM9rnVchu5KtBzRgHtgsqR3nWBE6SEL0j9i7rVt+U3ljbsnoXdWAz+dkKnqYoU2fNqPMPj
	OZ2chyQjOyN1PCaTm917ajQo7QkWCTJ7BPTrHbeWcOCg+AznCcOQPEwyQVUBWLfIFW6/phXHNm3
	+5Ezx8Sj2Ap/GZ1NwiFZ+1u5V1haGuDN6nqwxLXI=
X-Received: by 2002:a05:690c:4d84:b0:8b0:8a9c:fac9 with SMTP id
 00721157ae682-8b0f2170e34mr1719607b3.28.1792166212717; Fri, 16 Oct 2026
 08:56:52 -0700 (PDT)
MIME-Version: 1.0
References: <20261016142031.1204281-1-mark.caveayland@nutanix.com> <20261016142031.1204281-8-mark.caveayland@nutanix.com>
In-Reply-To: <20261016142031.1204281-8-mark.caveayland@nutanix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Oct 2026 16:56:40 +0100
X-Gm-Features: AclHuK-9UgEUXtFnqP-08vQxMx1ZvtOBwk6ctyE1fo2vDL4tPgeIs4fL_WXzcUE
Message-ID: <CAFEAcA8zkdHaSo-mO04gsvkrfAUFUAo=UVkiDKbd2XGwCMjw6w@mail.gmail.com>
Subject: Re: [PATCH v2 07/27] i8259.c: always use cs for I8259CommonState variables
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, mst@redhat.com, 
	sstabellini@kernel.org, anthony@xenproject.org, edgar.iglesias@gmail.com, 
	qemu-devel@nongnu.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
X-purgate-ID: tlsNG-ef75cf/1792166214-342F4AE4-63EDC793/0/0
X-purgate-type: clean
X-purgate-size: 497

On Fri, 16 Oct 2026 at 15:24, Mark Cave-Ayland
<mark.caveayland@nutanix.com> wrote:
>
> The use of consistent variable names makes it much easier to follow which
> fields are being accessed from I8259CommonState.
>
> Signed-off-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
> ---
>  hw/intc/i8259.c | 192 ++++++++++++++++++++++++------------------------
>  1 file changed, 96 insertions(+), 96 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

