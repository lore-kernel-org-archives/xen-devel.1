Return-Path: <SRS0=IV2x=DI=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41774C4727C
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:54:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4508207DE
	for <xen-devel@archiver.kernel.org>; Thu,  1 Oct 2020 10:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4508207DE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1188.3957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNwES-0000ZK-RZ; Thu, 01 Oct 2020 10:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188.3957; Thu, 01 Oct 2020 10:54:40 +0000
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
	id 1kNwES-0000ZD-Nx; Thu, 01 Oct 2020 10:54:40 +0000
Received: by outflank-mailman (input) for mailman id 1188;
 Thu, 01 Oct 2020 10:54:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kNwER-0000Z6-2W
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:54:39 +0000
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9867bb9-4b91-42f9-8fe4-ef94a6c609e1;
 Thu, 01 Oct 2020 10:54:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d4so2400725wmd.5
 for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:54:37 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u17sm9484415wri.45.2020.10.01.03.54.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 03:54:36 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Tj+q=DI=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kNwER-0000Z6-2W
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 10:54:39 +0000
X-Inumbo-ID: b9867bb9-4b91-42f9-8fe4-ef94a6c609e1
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id b9867bb9-4b91-42f9-8fe4-ef94a6c609e1;
	Thu, 01 Oct 2020 10:54:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d4so2400725wmd.5
        for <xen-devel@lists.xenproject.org>; Thu, 01 Oct 2020 03:54:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XzwOsbTGpM4SQ7tKKfoY0aledk1mN59a58RYZaRsyCw=;
        b=GRpazTvMpbqIBKvdbRFeo7BLnfoOmpf31OtfJVkx23UncxzCMBm0l+ZU7ns9IJDkBB
         jwo7Z2V3dDJLNJGn5CHpOjNPK6xiGCC6o6U18omxIU8bArhBTmP042xGTEPK35pNBRz9
         BpmhLmkVmBKSoBa6DjwjnvHnvL8QXZHr1xxH2GNQyPxSFEwdR/Nt726oZNCqqEga6sjy
         h92QtjMhXW9PaPJtJVFQlOV0wL5SsrjgT/Bq4Zt5RBjGcEmQxqwRldIP0dgcR+SOWVvd
         7r7FJe+vLREptHW7BV1eWxtwGfVm3zoPXMc6QU0bDqC2t9wzgdsn/28ae1COtYAfv4SG
         94Zg==
X-Gm-Message-State: AOAM530Q98yqWbNABBPjj2R/i3ayssbPf07BfFL8jj8Zjto8fR4RsDxX
	EmBk4liGIUKGrhBPVIyShxg=
X-Google-Smtp-Source: ABdhPJxlem8yu9aucJ6sD2dvviDiI2124AYmP+mYc9avuuKlntDd7L1OFtC9OidoW4uLFeDvjuy7Ng==
X-Received: by 2002:a7b:c103:: with SMTP id w3mr7661286wmi.24.1601549676510;
        Thu, 01 Oct 2020 03:54:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id u17sm9484415wri.45.2020.10.01.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2020 03:54:36 -0700 (PDT)
Date: Thu, 1 Oct 2020 10:54:34 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/8] tools/libxl: Simplify DOMCTL_CDF_ flags handling in
 libxl__domain_make()
Message-ID: <20201001105434.j2x4ephrfq23p6il@liuwe-devbox-debian-v2>
References: <20200930134248.4918-1-andrew.cooper3@citrix.com>
 <20200930134248.4918-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930134248.4918-2-andrew.cooper3@citrix.com>
User-Agent: NeoMutt/20180716

On Wed, Sep 30, 2020 at 02:42:41PM +0100, Andrew Cooper wrote:
> The use of the ternary operator serves only to obfuscate the code.  Rewrite it
> in more simple terms, avoiding the need to conditionally OR zero into the
> flags.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Wei Liu <wl@xen.org>

