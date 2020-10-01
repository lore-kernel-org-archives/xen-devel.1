Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6393BC4727F
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 11:09:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F2502087D
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 11:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2502087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1212.4077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwSY-0002k5-Qi; Thu, 01 Oct 2020 11:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212.4077; Thu, 01 Oct 2020 11:09:14 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwSY-0002jy-NY; Thu, 01 Oct 2020 11:09:14 +0000
Received: by outflank-mailman (input) for mailman id 1212;
 Thu, 01 Oct 2020 11:09:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNwSX-0002jt-GP
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:09:13 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fc8a135-3b0e-45df-acdc-e2f0ec0d9e73;
 Thu, 01 Oct 2020 11:09:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w5so5181897wrp.8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 04:09:12 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id y6sm8582534wrn.41.2020.10.01.04.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 04:09:10 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNwSX-0002jt-GP
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 11:09:13 +0000
X-Inumbo-ID: 6fc8a135-3b0e-45df-acdc-e2f0ec0d9e73
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 6fc8a135-3b0e-45df-acdc-e2f0ec0d9e73;
	Thu, 01 Oct 2020 11:09:12 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w5so5181897wrp.8
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 04:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=BBC6qGccP+Ahz8ySynzSc+nxZwUQo0EtEHZiNRfDzg4=;
        b=DvHd+EydUN4HcA9VhOp7x4jyIgS/I/H9Qz7bhSI++HcfM57mmC7XmsK5kzdO54Aij5
         urlEBGKSJe0UojNTCAvLGlzIQt5KPMIAaIEOeWkXOd+gvSVpNLGGASDsFXDyeDc6FrKp
         sXqwhiazQDnb7PqZXYR0rwY4qEHPfPi0BJUBtB9a/BQOPBqw7Z/59dUGIzwhw0aZseX2
         VIgSzyWIFGHf1yLV4aFZHxaJbXIFBAMJO5bVxzOP+41mcEfNyczogojIaHDKx05XGfO4
         /DtHE9KBPZ7aPY9WUGJN2EmVnvxkZL2vH8lkHaKto0WmYjfMgFwzAX1LnY76ZuPfqlK9
         8luQ==
X-Gm-Message-State: AOAM532f4bLkGNFAr8IAW7mmwYknmxEZOOapECsUv6DIVJIreDbcLcvv
	AWutb6ZHS+VhoxZvy4oV100=
X-Google-Smtp-Source: ABdhPJyHKjMmpiHBTt9+mp8HApLeCYs+jv/ifZ3LgII3as7ROD0o41hOyAp+hdwQS7zpglzwALhBAg==
X-Received: by 2002:adf:f903:: with SMTP id b3mr8580081wrr.142.1601550551801;
        Thu, 01 Oct 2020 04:09:11 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id y6sm8582534wrn.41.2020.10.01.04.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 04:09:10 -0700 (PDT)
Date: Thu, 1 Oct 2020 11:09:09 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 0/3] Fix and cleanup xenguest.h
Message-ID: <20201001110909.hcmtwajognnegkqf@liuwe-devbox-debian-v2>
References: <20200925062031.12200-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925062031.12200-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Fri, Sep 25, 2020 at 08:20:28AM +0200, Juergen Gross wrote:
> This series fixes builds of libxenguest users outside the Xen build
> system and it cleans up the xenguest.h header merging xenctrl_dom.h
> into it.
> 
> Juergen Gross (3):
>   tools/libs: merge xenctrl_dom.h into xenguest.h
>   tools/libxenguest: make xc_dom_loader interface private to libxenguest
>   tools/lixenguest: hide struct elf_dom_parms layout from users

Acked-by: Wei Liu <wl@xen.org>

