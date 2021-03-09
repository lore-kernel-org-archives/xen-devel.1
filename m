Return-Path: <SRS0=FTcr=IH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A2E1C433DB
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 19:23:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F407A650D1
	for <xen-devel@archiver.kernel.org>; Tue,  9 Mar 2021 19:23:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F407A650D1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.95728.180714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJhwf-0006Zs-Bd; Tue, 09 Mar 2021 19:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95728.180714; Tue, 09 Mar 2021 19:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJhwf-0006Zl-8D; Tue, 09 Mar 2021 19:23:05 +0000
Received: by outflank-mailman (input) for mailman id 95728;
 Tue, 09 Mar 2021 19:23:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rN=IH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1lJhwd-0006Zf-MN
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 19:23:03 +0000
Received: from mail-wm1-f47.google.com (unknown [209.85.128.47])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4990a103-e548-464b-9d69-b2e458d5445b;
 Tue, 09 Mar 2021 19:23:03 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l22so3388792wme.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Mar 2021 11:23:03 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z21sm5431943wma.29.2021.03.09.11.23.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 11:23:01 -0800 (PST)
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
X-Inumbo-ID: 4990a103-e548-464b-9d69-b2e458d5445b
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=K0gLmVpC43ZgYdn9L7XeTYAkhhThRp0c7BhDPkH0sAQ=;
        b=ep709YUq9Zex++Ospm1QK4lfOB9lL0mTiizDddhMUzYB1295341AKc5YRL4NyJ1LAO
         dZIAw9wFlkWDmf7U+WSgJf4SMW1JPvewKMa6b8k7Ll8jcWZ+a/3ePSCCrI5rrIhd8YeV
         VVjuHo8YNPq9sDXlBtbt/SNhCUAbH/tI/m5o3TZnwriKcUTGD046UfxKvclz+o0WR0AY
         UiYXDRAfQ8WXCLzjG+vmlSjcWWrNJNiGBULiSHGfSPVG/wruv/yCEjCENqC8p0BIzuow
         SXzcO6o3Azx+0XJV+E9++9mVhBNyrnYT9WIFrpkZnxWIqnQn81DhNqgbLgkh2x2ovr5a
         QUhw==
X-Gm-Message-State: AOAM533I+EUpX/1jckD4gOJ0aCX9JcHIhDgMfl35r08y/WfallRJSLFs
	EooQZrwV63uGcNEaN/4o0gpl8Vhj0eM=
X-Google-Smtp-Source: ABdhPJxzgds6ljacsnE1/lwqq0403TEAi5krK6On3Pj7epUq3CW9aB9xEKtv/XEiSRlKt6eSt+QG4A==
X-Received: by 2002:a7b:ca50:: with SMTP id m16mr5608602wml.113.1615317782256;
        Tue, 09 Mar 2021 11:23:02 -0800 (PST)
Date: Tue, 9 Mar 2021 19:23:00 +0000
From: Wei Liu <wl@xen.org>
To: paul@xen.org, andyhsu@amazon.com
Cc: xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [PATCH 1/2] xen-netback: add module parameter to disable
 ctrl-ring
Message-ID: <20210309192300.drd4ktvbeaeauvja@liuwe-devbox-debian-v2>
References: <20210225122940.9310-1-andyhsu@amazon.com>
 <CEC939E8-3F18-46A0-B7B6-ECBE97678DAC@amazon.com>
 <33c5f0f0-0e6e-a42c-46a5-405000715c1c@xen.org>
 <20210309192122.ym7xwduz4ddauks5@liuwe-devbox-debian-v2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210309192122.ym7xwduz4ddauks5@liuwe-devbox-debian-v2>

+ the author

On Tue, Mar 09, 2021 at 07:21:22PM +0000, Wei Liu wrote:
> On Tue, Mar 09, 2021 at 02:34:56PM +0000, Paul Durrant wrote:
> > On 09/03/2021 14:10, Hsu, Chiahao wrote:
> > > ﻿On 25.02.21, 13:29, "Hsu, Chiahao" <andyhsu@amazon.com> wrote:
> > > 
> > >      In order to support live migration of guests between kernels
> > >      that do and do not support 'feature-ctrl-ring', we add a
> > >      module parameter that allows the feature to be disabled
> > >      at run time, instead of using hardcode value.
> > >      The default value is enable.
> > > 
> > >      Signed-off-by: ChiaHao Hsu <andyhsu@amazon.com>
> > 
> > You should directly CC maintainers, and also I don't see netdev in the To
> > list... Did you send it there? I suspect not, since I don't see 'net-next'
> > in the prefix.
> 
> I think it would be better to resend this series.
> 
> See Documentation/networking/netdev-FAQ.rst.
> 
> Wei.
> 
> > 
> >   Paul

