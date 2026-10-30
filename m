Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C40E606A31A
	for <xen-devel@archiver.kernel.org>; Fri, 30 Oct 2026 04:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aE7hZyGR
Received: from list by lists.xenproject.org with outflank-mailman.1465404.1675986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMdsM-0001Nl-C9; Fri, 30 Oct 2026 04:05:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1465404.1675986; Fri, 30 Oct 2026 04:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xMdsM-0001Ne-9b; Fri, 30 Oct 2026 04:05:58 +0000
Received: by outflank-mailman (input) for mailman id 1465404;
 Fri, 30 Oct 2026 04:05:57 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <viresh.kumar@linaro.org>) id 1xMdsL-0001NY-CW
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 04:05:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xMdsK-007VzT-6t
 for xen-devel@lists.xenproject.org; Fri, 30 Oct 2026 05:05:56 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <viresh.kumar@linaro.org>)
 id 6ae41778-8faa-0a2a0a5109dd-0a2a4506c53c-30
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 05:05:56 +0100
Received: from [74.125.82.170] (helo=mail-dy1-f170.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <viresh.kumar@linaro.org>)
 id 6ae417a2-195a-0a2a45060019-4a7d52aadd35-3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Oct 2026 05:05:55 +0100
Received: by mail-dy1-f170.google.com with SMTP id
 5a478bee46e88-3514b90bb89so632141eec.1
 for <xen-devel@lists.xenproject.org>; Thu, 29 Oct 2026 21:05:55 -0700 (PDT)
Received: from localhost ([122.172.82.240]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36a4291e38fsm3512579eec.15.2026.10.29.21.05.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 21:05:52 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=linaro.org header.i="@linaro.org" header.h="In-Reply-To:Content-Disposition:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333154; x=1793937954; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=aE7hZyGRPIWP8axnGNKm268FSoukjppDardJF4xdB1P1Lf83Z26eHxbxN7oTtM4bTQ
         ct49w19ysE1NOEqDIjmUjnHQpzxkZ7u+IWM00sausfhuTMTrN1KDYWop5g/zFYJagNt5
         4o84TjCIiC3Rv4N9b7RmsKBQOvaVWAPz9Olo28/7//uY7KlZZ0pND1TaiGYF8xjnsj1u
         rKDV2DDVdNbTBuTfjpjCMly1ci4yOLkgKTvSTU5rBMLn1iW94q1DFVBI3Af5TaB0478O
         nSPJEZApwgz/6wbLes42edpj+0Y5am+0/BA5RG/JZBhcOglNUqVPWLGofavf4Tx9ePy/
         Kj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333154; x=1793937954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=ggcINP0jTTgyawM/ZQBAvW+QaaHxDhU+9aAQC5Vi6YCdGBDROW0cHh7ejscWyg+0HB
         or0CcgCtxRfPOnzTgdjiGLwC5IUj8iZhM4aWaPydbtKuyJfvSKsYbI8ar5ODusKhDOWU
         HQHuvSeNMALmPJvFIkzTWoD82Uban1Iqsn5NA0DSfOkZBolaqTspN4mcYOd8HYGWciyp
         thIBg/EfFI720h8eSjhVyeO8PTmsLHYgcvt3S96cvxD9/GJjwSnfKEzfa8WFzLZwHC8C
         fOuSLsBuK53okuaQ1wc5yv5xCv9dCrbIbVyThvMk2Ok8WRJOLaXwWMJPHYzJJMjLDq+t
         yEfA==
X-Forwarded-Encrypted: i=1; AKwUvBwQXno+YtYjMpfPqJ7xtm0eDZCZN4yPIduq814sGiog3wfOp0oqtqFsntf7OF0cer3sD1bKcOIuZkI=@lists.xenproject.org
X-Gm-Message-State: AFq9FYK9d0kjJ5xM1sthxXMTN6nlWgIsU+h/0a2PJoZIi7SHs1HwMaWV
	UvlBoohZQXkIMk7uzFoJhpSnAzPEhzh9oesh5pZr2+y2hNHvGx0oppNw4q8vPHrKaes=
X-Gm-Gg: AYBFou2+56nCeGZPsBjNePmUQLCzpXtWJd2tJ5tqfnuktKyisHzEj+Pdyb2vp2rNoe+
	jtvharjJOmMy0qNvn9kCyblPgZQY3iq5VaHM74hx4Csi/KT1dK6FoSv4TJDa2P/+W1dBDhBUild
	dU/+1nz27nNGElQaoe/LRQcIqy5IRDM3MNJghPicCemoe8dA90p443QCjeKsAJH6mZyr4rjhtJr
	xns2BnUcbWOWa00m1sl2jSgQBnl/zn0AOc+bVT88Hu1/iYFNT2y3mJXTCwgdkZIjQbicTZh+kP8
	EFtZhu/lX4IvqiUJpBBeW0i4XQUsiHFVyNpBCrQdLUR16cVrwlOlgqYgdtM8p7hGuKpBXyS63aW
	qJdDOHEMAe90VR8tpsVy8aGoRDGb5KdBrHjyKQlqc8UKFfO/4j9FWA+oQsxLhxgf2ZoGGdLzjq3
	oQPbDgpiBEOr6e0BeUMVB2vk5M0ZNptf0Cv1sLCN/Elacb55kcOQVJdmHYHa4UpnE1Cy9Tn0DbK
	BLEwYi1Zd8YwN33izlz9CrDFxWlDEA6vwGnDGQWsraRjqk0rlP4C82niNN+D6Rei2ZfwUUdlutF
	3J5kiAYw1PjgEM+TUHN4td3aT6d8jP0=
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr1772736eec.24.1793333153319;
        Thu, 29 Oct 2026 21:05:53 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:35:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
Message-ID: <auQXnep2xKpuNJOF@vireshk-B250M-D3H>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
 <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
 <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-purgate-ID: tlsNG-16d1c6/1793333156-FDC0F77B-07ED9456/0/0
X-purgate-type: clean
X-purgate-size: 293
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 28-10-26, 16:39, Rafael J. Wysocki (Intel) wrote:
> I'd expect the driver core to pick up the series as a whole then, so
> please feel free to add
> 
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

