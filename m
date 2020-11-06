Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A332DC2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 16:23:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3BCAC2151B
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 16:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3BCAC2151B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20966.47081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb4Vn-0007qS-ED; Fri, 06 Nov 2020 16:22:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20966.47081; Fri, 06 Nov 2020 16:22:51 +0000
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
	id 1kb4Vn-0007pr-BI; Fri, 06 Nov 2020 16:22:51 +0000
Received: by outflank-mailman (input) for mailman id 20966;
 Fri, 06 Nov 2020 16:22:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kb4Vl-0007pZ-QG
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 16:22:49 +0000
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5bef956-f499-4854-80e9-a767dea7f57c;
 Fri, 06 Nov 2020 16:22:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 10so1227524wml.2
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 08:22:48 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id q7sm2156341wrg.95.2020.11.06.08.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:22:47 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kb4Vl-0007pZ-QG
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 16:22:49 +0000
X-Inumbo-ID: a5bef956-f499-4854-80e9-a767dea7f57c
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a5bef956-f499-4854-80e9-a767dea7f57c;
	Fri, 06 Nov 2020 16:22:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 10so1227524wml.2
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 08:22:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KG2zUBmP7kZXhXDNWYXvcoA06zpbsQshPoKcnzmqQRc=;
        b=TFAdEYGNza0esXidyXMUcff/KLc82Oj/mH5NGvy6vFoDkWKGw/KT5UHfN95oq+5Qws
         dx9M1G2el7f6Xy0+d7V72RPOFJnQGJ1f6riWjIeTYVFbV0AQSdF4GoULGopWBeB7sOwF
         iVG5ZvG62thLF7idxOI2knUSvFHi6rVHrLlgrKWaIAlBjKSjq5fr+o9XaD/lpjzGNhOs
         n+pcr8v4SzCAEFNVhKhmc6TSlWD0Pf+3bHT9DaZgwLraPOqDBfnZQeH/07NGPwCX0ZkV
         AT80/zy1vCD8uCABHG1nzwVrLsDh7+j3EsdHCJ0MFzkmeyODW9GRR6s3JuenzwTYwV0S
         ewgg==
X-Gm-Message-State: AOAM531jfpiQDjQz5IUnPuqb6yHepbAkYz1B2XvP7mlIIqYwG9geM8bs
	RwEUmJDUCQl+T/YXCslkjYE=
X-Google-Smtp-Source: ABdhPJwJWPI1M4JHxT5nzYrE0pPJbNbkhTX/x0v/qvfL3kWLS8SQd/HUc1M5Dl/05wptqSIPC2FG1Q==
X-Received: by 2002:a7b:cb46:: with SMTP id v6mr384280wmj.146.1604679767955;
        Fri, 06 Nov 2020 08:22:47 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id q7sm2156341wrg.95.2020.11.06.08.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 08:22:47 -0800 (PST)
Date: Fri, 6 Nov 2020 16:22:46 +0000
From: Wei Liu <wl@xen.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v1] tools: add readv_exact to xenctrl
Message-ID: <20201106162246.vmehbvecfqu4ewta@liuwe-devbox-debian-v2>
References: <20201028144151.2766-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201028144151.2766-1-olaf@aepfle.de>
User-Agent: NeoMutt/20180716

On Wed, Oct 28, 2020 at 03:41:51PM +0100, Olaf Hering wrote:
> Read a batch of iovec's.
> 
> In the common case of short reads, finish individual iov's with read_exact.
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>

I see your series, so I will drop this one and go over that series
instead.

Wei.

