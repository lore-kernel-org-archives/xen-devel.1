Return-Path: <SRS0=Shbi=DH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23F5C4727C
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:07:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64432206FC
	for <xen-devel@archiver.kernel.org>; Wed, 30 Sep 2020 15:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64432206FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.798.2675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNdhV-0005eq-WA; Wed, 30 Sep 2020 15:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798.2675; Wed, 30 Sep 2020 15:07:25 +0000
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
	id 1kNdhV-0005ej-SW; Wed, 30 Sep 2020 15:07:25 +0000
Received: by outflank-mailman (input) for mailman id 798;
 Wed, 30 Sep 2020 15:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNdhU-0005ec-V0
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:07:24 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f848988d-5f87-403b-b703-23756b7fa878;
 Wed, 30 Sep 2020 15:07:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t10so2219517wrv.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:07:24 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id n2sm3535187wma.29.2020.09.30.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 08:07:22 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=SQnX=DH=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNdhU-0005ec-V0
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 15:07:24 +0000
X-Inumbo-ID: f848988d-5f87-403b-b703-23756b7fa878
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f848988d-5f87-403b-b703-23756b7fa878;
	Wed, 30 Sep 2020 15:07:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id t10so2219517wrv.1
        for <xen-devel@lists.xenproject.org>; Wed, 30 Sep 2020 08:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zX+0gDiv+zWIR4OM3+WUNP1LJZUSmGlF0Kcuxt8wA5g=;
        b=SEoryKRjH9NDREGLemMYCCp2aX1Dxk0pwKEFp7ANsMcwXluXh1LI4JkObhvEsCh6WP
         ljMaM5nvZYIDQ4CuL56lnSDXvKaDjPJwWpkwI5J+g/cKdNNBzV2MIiIayMF2KqE5uZBc
         ryu/XSEvQzjLnXXCAMy9AKR/rQUciAc6N/kEmC0X4zJjFrCqTiyCP5/aeJrnwy0/EmkE
         DSyjBMc+CfvQbfP4OcnaFs3w37XDQPGpVgcV/AtaPqyggccjbf/BhisUnbtlIZxZdebj
         E9SLX+hcJfKkRm0kiYjgLZxjyNVKqyrQBhWvuK/YMu7YTZ+JGNyLCNFcXgBJ/VkY1/EN
         rwag==
X-Gm-Message-State: AOAM532WeDWAlkJPR+ys62lmn0Otx/sGGbFTemUSPvcs0558ORza/WYh
	C9JE+2yrYBH5MogcqfkB1eY=
X-Google-Smtp-Source: ABdhPJy299kugT4JdOJUmcOF7fZLx3JASe1tZYxGzzk+Ht3eoP1RyA8SL6p51l9pnk/etlg2GFvQBA==
X-Received: by 2002:a5d:69cd:: with SMTP id s13mr3565527wrw.379.1601478443423;
        Wed, 30 Sep 2020 08:07:23 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id n2sm3535187wma.29.2020.09.30.08.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 08:07:22 -0700 (PDT)
Date: Wed, 30 Sep 2020 15:07:21 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools/libxc: report malloc errors in writev_exact
Message-ID: <20200930150721.dxq53w6kq44ptdwb@liuwe-devbox-debian-v2>
References: <20200923064840.13834-1-olaf@aepfle.de>
 <b8de1fc2-158c-e725-451a-4e2ce5ca3d2e@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8de1fc2-158c-e725-451a-4e2ce5ca3d2e@citrix.com>
User-Agent: NeoMutt/20180716

On Thu, Sep 24, 2020 at 09:21:10PM +0100, Andrew Cooper wrote:
> On 23/09/2020 07:48, Olaf Hering wrote:
> > The caller of writev_exact should be notified about malloc errors
> > when dealing with partial writes.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> 
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked + applied.

