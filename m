Return-Path: <SRS0=soTB=JS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4186FC433B4
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 10:25:08 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D023661445
	for <xen-devel@archiver.kernel.org>; Wed, 21 Apr 2021 10:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D023661445
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.114376.217963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA2T-0000m4-N1; Wed, 21 Apr 2021 10:24:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114376.217963; Wed, 21 Apr 2021 10:24:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZA2T-0000lx-KE; Wed, 21 Apr 2021 10:24:57 +0000
Received: by outflank-mailman (input) for mailman id 114376;
 Wed, 21 Apr 2021 10:24:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7+nN=JS=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lZA2S-0000ls-Dr
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 10:24:56 +0000
Received: from mail-wr1-f48.google.com (unknown [209.85.221.48])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87b3a3ea-f47e-49a6-a244-57f150d5389e;
 Wed, 21 Apr 2021 10:24:55 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id r7so28782961wrm.1
 for <xen-devel@lists.xenproject.org>; Wed, 21 Apr 2021 03:24:55 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h2sm2078415wmc.24.2021.04.21.03.24.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 03:24:54 -0700 (PDT)
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
X-Inumbo-ID: 87b3a3ea-f47e-49a6-a244-57f150d5389e
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PjjvP2H3md8cM1wGnHzgsiM758OzjGyEE68/hcUYLzk=;
        b=WX4yIfYWog3nWRdHENQxUiwXl38ovkKwYhO/0lRMF0OkRxP1sMvD1uaLsUmrvlpge4
         0vs2u4D4glH3/m32gmeG8vbkaLAmbieREAA4Tiy/pLKMAHKWzcgfhIRw9kSGVzEOl1af
         V2KlXq653E5007aofcp22O1H+fz0rJXsSWzjJ4JotzpXDxde7b8M4i2QDKkXSkuEb1yJ
         Aonb/5y6LsROkAKaCk/GUkkHh1L4I2usC0Lp3IuY9cTBfMr/EK3rUSX+pp/zZinTAcgR
         TKVPZDY5Y47H+lygj31fxLHMS5hCw05BSUx++wOLp1z4EmnmCfRt8IiQkF7isSB9gnt0
         yiCA==
X-Gm-Message-State: AOAM5305yy6MMhaaSmSgfhw1FlxlaeVeaAZyQ2N2paYlBytRVPeAEgbK
	f3L74zCXbVDQkOKfVC6Tl58=
X-Google-Smtp-Source: ABdhPJwe6ud32p04NsH+pX7gE9ozIXO/qHiC87HKEdEQODjY02ILjCijU9y6tSmUTlK+UGpjSThsdw==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr25719750wrc.282.1619000695121;
        Wed, 21 Apr 2021 03:24:55 -0700 (PDT)
Date: Wed, 21 Apr 2021 10:24:53 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3] tools: create libxensaverestore
Message-ID: <20210421102453.r2oa7o7zqtzkvilv@liuwe-devbox-debian-v2>
References: <20210413172028.29373-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210413172028.29373-1-olaf@aepfle.de>

On Tue, Apr 13, 2021 at 07:20:27PM +0200, Olaf Hering wrote:
> Move all save/restore related code from libxenguest.so into a separate
> library libxensaverestore.so. The only consumer is libxl-save-helper.
> There is no need to have the moved code mapped all the time in binaries
> where libxenguest.so is used.

Good idea. Please address Jan and Juergen's comment regarding the
prefix.

Wei.

