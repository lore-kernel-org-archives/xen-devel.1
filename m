Return-Path: <SRS0=HZRB=CF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92D82C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 11:47:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D68322BF3
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 11:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D68322BF3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGNG-00062A-SC; Thu, 27 Aug 2020 11:47:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGNG-000625-Bb
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:47:22 +0000
X-Inumbo-ID: 881e9c35-6058-4463-bf8c-438621bd21a5
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 881e9c35-6058-4463-bf8c-438621bd21a5;
 Thu, 27 Aug 2020 11:47:21 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x9so4831445wmi.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BRWPV1JL9dW6AdNfj0kRpyVxsVpqwuTDR/DMgZLYRyM=;
 b=Tih2SRKiMjNhgo1jlxA2gpjGZqOTX5H0it7Zc0S9uTWY7UEJgH5IonTGJnY3mOJJFv
 PQu0Q9SoN6sGGt52Uqe9NGvKUJ/ZgHO29rk6XD/1ble3Ed59MYsiAF77YY8GZ3IGeZ8i
 PGEarR8Gdp9w4bEpDDAUVJ5t/dQmNN+i5kDId8pwkTvWOO7X1T2gqBuxlZEtywerB9Hb
 puCm7wJlmEy8tHun9SxS4Bh9eZRm0x++DJ1LTbjqKAMbt+6cxdCMRMFUxVGBByiclMQX
 Ik4wLU0OhPHx1/mhyYaiUPn6FeauwhIlwD55owBmWyS+H6yitdAKWqHxiifnyLe546Qs
 9Pog==
X-Gm-Message-State: AOAM533n5Rkh7QHDrEwUGvucL4BsS+TTod4iJA5/7bmbhvPw/7zuAQnI
 UsnOhXTrK2AUccQbfNlmS8Q=
X-Google-Smtp-Source: ABdhPJxAkrE8WTj8nTodNT+lfCA3uMpcugjW3x2psMhJeGPNAdKi/CcUq9e3uz12SsQyOx3JEAirjw==
X-Received: by 2002:a1c:c910:: with SMTP id f16mr11310428wmb.82.1598528840685; 
 Thu, 27 Aug 2020 04:47:20 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id m1sm4098053wmc.28.2020.08.27.04.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:47:20 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:47:18 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 32/38] tools/libxl: don't include libxl_osdeps.h from
 libxlutil sources
Message-ID: <20200827114718.pfcwlcfahcivim2w@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-33-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-33-jgross@suse.com>
User-Agent: NeoMutt/20180716
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sun, Aug 23, 2020 at 11:35:13AM +0200, Juergen Gross wrote:
> There is no need for the sources of libxlutil to include libxl_osdeps.h
> as the only dependency is the leading
> 
> #define _GNU_SOURCE
> 
> in libxl_osdeps.h. So replace including libxl_osdeps.h by the needed
> define.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

Note to self: may need to commit changes to flex/bison generated files.

