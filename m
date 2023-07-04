Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037F8EB64D9
	for <xen-devel@archiver.kernel.org>; Tue,  4 Jul 2023 17:58:18 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.558602.872844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkHi-0002S3-2t; Tue, 04 Jul 2023 17:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558602.872844; Tue, 04 Jul 2023 17:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkHh-0002Rw-VO; Tue, 04 Jul 2023 17:57:53 +0000
Received: by outflank-mailman (input) for mailman id 558602;
 Tue, 04 Jul 2023 17:57:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1/Zo=CW=linaro.org=peter.maydell@srs-se1.protection.inumbo.net>)
 id 1qGkHg-0002Rq-G8
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 17:57:52 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aff86c3-1a94-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 19:57:51 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51d9695ec29so5676780a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Jul 2023 10:57:51 -0700 (PDT)
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
X-Inumbo-ID: 4aff86c3-1a94-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688493471; x=1691085471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1I+xLxqpcwpQEj1PAi8T1l+y6v0OvsrHvpN+d3/7Ah8=;
        b=zEhlq1uOikgZZPpqfSX3RUp/JLFryJ5j12vPixlTa9VlCrBGZgWrvX3+NGHyYf0xy9
         ok17VW4ZSRvwogXoy7HZwGx1gEQHwGudp2NqNbbLIpZ6SRhlWjCWSnMjbwfJZeWeln9J
         drFJg7fuJmvBA5B9i8QHpO0oKzwtTuRPA3p8jGjid8tEsrcIILyS65UGhRemr8WayNML
         hMCRnEgkvtv+PEYQqiQxHmxwDC373pXS0XCJAxmrwn0AwMvV2H57nauIhR+hrZ7dU/+8
         /dbfQsQJq95GO6NDGZaNkDdVkMepJlDoltLKBs5AENv/t1moDYB0dr58jyMoOVGUgTKO
         AD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688493471; x=1691085471;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1I+xLxqpcwpQEj1PAi8T1l+y6v0OvsrHvpN+d3/7Ah8=;
        b=Emi3dcpDo4phzFomNRky32CaWm4BvWzKNLsSAjAmPnQIukggiI91Biagt159pqJVhv
         eQwaQzmCC2NRu6FKDTqrcwDKtJTbV6XN8/4jxG6nZA/uwoTygTeq3H3gvSGadG3qzhiY
         iao47dTkkkK90CiPlC5r28MfIl5atxEfkZpTLgUSdsFElSQVWFGRMGXT3Uug2fBwPLkh
         sLHPLXcEfDO3fgdxFLMpGM4BwHk1KZ1jXfoyigOkrv2El3BPBl6oks6OyYTM8joy6wlw
         lPm9D+aRPWepfiBn70i7oRbHjrEMTJkGGBWsXh+Oau5D+AhfR+51nf80Md0In/Errc6L
         Vr3g==
X-Gm-Message-State: ABy/qLbwX91YoxP0nS/QKzMnvyfaTkAGtgXiUZJzxgjtYOTFjaCfj+Lb
	3SMtOqS3Ysu8Ye1PHvy4u6UON3wMw7xxtoi4ISQOyQ==
X-Google-Smtp-Source: APBJJlGcs7caUQUsTleNGcLmtaux9I042ZlS9fWvoL40hBRfqnl4dt2f/GMcXSQ3ze27JqjnGyfbPHY71TEney6NKtc=
X-Received: by 2002:a05:6402:1253:b0:51e:126a:403a with SMTP id
 l19-20020a056402125300b0051e126a403amr3572849edw.13.1688493470741; Tue, 04
 Jul 2023 10:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230704171819.42564-1-anthony.perard@citrix.com>
In-Reply-To: <20230704171819.42564-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 18:57:39 +0100
Message-ID: <CAFEAcA_okj_rH3RR_a7BrOsxxEWBQGa7bGDXK1OrwCD9izVaDg@mail.gmail.com>
Subject: Re: [PATCH] xen-block: Avoid leaks on new error path
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Paul Durrant <paul@xen.org>, Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
	xen-devel@lists.xenproject.org, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jul 2023 at 18:19, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> From: Anthony PERARD <anthony.perard@citrix.com>
>
> Commit 189829399070 ("xen-block: Use specific blockdev driver")
> introduced a new error path, without taking care of allocated
> resources.
>
> So only allocate the qdicts after the error check, and free both
> `filename` and `driver` when we are about to return and thus taking
> care of both success and error path.
>
> Coverity only spotted the leak of qdicts (*_layer variables).
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Fixes: Coverity CID 1508722, 1398649
> Fixes: 189829399070 ("xen-block: Use specific blockdev driver")
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

