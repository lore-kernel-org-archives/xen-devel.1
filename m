Return-Path: <SRS0=Ywvf=BA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F06DC433E0
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 00:08:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D16F2080D
	for <xen-devel@archiver.kernel.org>; Tue, 21 Jul 2020 00:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOZdVsUj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D16F2080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxfow-0007re-J2; Tue, 21 Jul 2020 00:07:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ynct=BA=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1jxfov-0007rZ-Ls
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 00:07:45 +0000
X-Inumbo-ID: 336759b4-cae6-11ea-84d6-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 336759b4-cae6-11ea-84d6-bc764e2007e4;
 Tue, 21 Jul 2020 00:07:44 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id b11so8265586lfe.10
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 17:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bsRCsxPKxqmfoZl2ZkEOgQ+GHjuR5idgvQo41XSoLas=;
 b=HOZdVsUjVcmbXCkvbbIt9xkgdZ4I032/VDgaNgJ3yuYJzrToV/UQuL72mnxw0d1vy0
 BITS3v1ooyzwWGfTXqhg1wX16OwdXFvU62wcRwAYCWauF1balW68/HPL1GiB+a1tjttA
 RVPF9Q8/rboWNKugvBV045KWrFCBu2ffOlTi2Ib5BBAjklIdVjy/onSLKW1oCgi2RDPA
 Zc7agrVQFi9YUvbXq4PDmHZwjCycop7rbPx9dkN0ojIi1cP/Pp9KCSwkmIwJlrZ/iW60
 RC/mifOrnGZaJWZSUvWeu3ZPsfFps9Sq7eX81aTlvtsXDSu0IGAidNe4CLv9LDo7tAEE
 IYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bsRCsxPKxqmfoZl2ZkEOgQ+GHjuR5idgvQo41XSoLas=;
 b=k3omFUXTlak2r2VVAmloB0/wZhNYl0pVeKY8YTBHVshcfDoHIGvt3NjXGAwpK7lZ8z
 k1VxQBsGxY0r1e1LziHAv3lpxwaXZorSEjjxeHmaLxdK9Wug7/DFvC7YpziSRRH/XL8f
 ovVxNb2V5dtmKQODWRzrqs77+Fi7iBdfxF4QU109usKPzt5JfxlRnkkKndOm171WeqTV
 FWujQjADDdofgvakNhHyxMIe94N+etQdxwNtkTA/gakl/eSZW1nasfSfqMJ6ePdcPgxo
 TsYzQ12/w2aWVRqDjoqmXL9/RCIpZtuOqhpl6+0yjde2jfFIwxZAJpttNDl1RYvMKnIl
 WIBg==
X-Gm-Message-State: AOAM5324EKLG8itKMJ5gVC56MXVAijJSGDTe1krzPmcmw3igsgHN1OJM
 uMJffW6YxVsSrT/vfDCg3wfN9/0JsdHLn4RUijyjPE21
X-Google-Smtp-Source: ABdhPJywF2VBX4oNr4SDVyY5a3PAhQgTrqr84xlouybBfbOD5nQyhzuw9s+XGlohrthmEtcvvNvktMYyRvauDlVEYaY=
X-Received: by 2002:ac2:4422:: with SMTP id w2mr11880421lfl.152.1595290063120; 
 Mon, 20 Jul 2020 17:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
In-Reply-To: <d406ae82e0cdde2dc33a92d2685ffb77bacab7ee.1595289055.git.rosbrookn@ainfosec.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Mon, 20 Jul 2020 20:07:31 -0400
Message-ID: <CAEBZRSffdZUWweDvZ9ZDMiemO4BGj10M4rj2Qmz3yFkgQhrn+g@mail.gmail.com>
Subject: Re: [PATCH for-4.14] golang/xenlight: fix code generation for python
 2.6
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> Before python 2.7, str.format() calls required that the format fields
> were explicitly enumerated, e.g.:
>
>   '{0} {1}'.format(foo, bar)
>
>   vs.
>
>   '{} {}'.format(foo, bar)
>
> Currently, gengotypes.py uses the latter pattern everywhere, which means
> the Go bindings do not build on python 2.6. Use the 2.6 syntax for
> format() in order to support python 2.6 for now.
>
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>

I should add that I tested this with CONTAINER=centos6
./automation/scripts/containerize for python 2.6, and on my ubuntu
system with both python 2.7 and 3.6.

-NR

