Return-Path: <SRS0=B3Pa=KA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F47C433B4
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 14:24:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A06B61029
	for <xen-devel@archiver.kernel.org>; Wed,  5 May 2021 14:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A06B61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.123136.232274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIRc-0000LB-25; Wed, 05 May 2021 14:24:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123136.232274; Wed, 05 May 2021 14:24:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leIRb-0000L4-Ue; Wed, 05 May 2021 14:24:07 +0000
Received: by outflank-mailman (input) for mailman id 123136;
 Wed, 05 May 2021 14:24:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Xmi=KA=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1leIRa-0000Ky-4u
 for xen-devel@lists.xenproject.org; Wed, 05 May 2021 14:24:06 +0000
Received: from mail-wm1-f42.google.com (unknown [209.85.128.42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47108cb3-afec-4dab-81c0-00f7b1ce4645;
 Wed, 05 May 2021 14:24:05 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 k4-20020a7bc4040000b02901331d89fb83so1242983wmi.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 May 2021 07:24:05 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id e38sm5487639wmp.21.2021.05.05.07.24.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 07:24:04 -0700 (PDT)
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
X-Inumbo-ID: 47108cb3-afec-4dab-81c0-00f7b1ce4645
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HUzhYKg7fe9cN2Qz8J6SF3BSD6gGRYM+RnlLLEatD30=;
        b=neia8CoIyuqVzqsaD3Xn9fudDpQfZaaFxbjYNo5ptbR4ua3kM4Fk+eha1WXUChNxXC
         YbCBVKq7nmywKIv9MkfJfVR2hEUC9m0myy9Sm6wYgp574+fmu6Vzkjuh+b3bqpceNmOG
         dv87OFZyST1y2ehhBUkx2jXzA6kFaq8SSwxvqbJwe2sTEN3C2S3YSf1KwjfXRS8iEFbP
         QLqCH4+nXCRuMZexOwjEvpD3SxwXXiCHNTDeZeIObY8RuZ+B2IXPQLIWIWSuiJTpgnux
         bZFZi5rgtyBPgXfSkTgjG67wBSyOOl6qnif9yNFz0eaPas4LOYeolBmRKgheH5s4q0/E
         Mz8Q==
X-Gm-Message-State: AOAM532TVADp33Dh2+lezT2V8QqN6BE5/qGUKvel6Qd4NkyHlsxQzU/+
	9YWpjQNgN6C77iA2U1pDQlk=
X-Google-Smtp-Source: ABdhPJz2wJwGVi4NyRAUyiplFmsnWAV4oC5Mh5nwJsNh5thftlwU8tjvklfdjyWAw3UPTFJMFKenFA==
X-Received: by 2002:a1c:3d44:: with SMTP id k65mr3709951wma.121.1620224644429;
        Wed, 05 May 2021 07:24:04 -0700 (PDT)
Date: Wed, 5 May 2021 14:24:02 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>,
	Xen Development List <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH] automation: save xen config before building
Message-ID: <20210505142402.7zpvc76smuhbeo4y@liuwe-devbox-debian-v2>
References: <20210505114516.456201-1-wl@xen.org>
 <YJKOSW62716AdMoM@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YJKOSW62716AdMoM@Air-de-Roger>

On Wed, May 05, 2021 at 02:23:37PM +0200, Roger Pau Monné wrote:
> On Wed, May 05, 2021 at 11:45:16AM +0000, Wei Liu wrote:
> > It is reported that failed randconfig runs are missing the config file
> > which makes debugging impossible. Fix this by moving the line that
> > copies the config file before the build is executed.
> > 
> > Signed-off-by: Wei Liu <wl@xen.org>
> 
> Acked-by: Roger Pau Monné <roger.pau@citrix.com>

A patchew run shows this indeed fixes the issue. I've pushed this to
staging.

Wei.

> 
> Thanks!

