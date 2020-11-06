Return-Path: <SRS0=Kis3=EM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89924C2D0A3
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:57:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 189042067C
	for <xen-devel@archiver.kernel.org>; Fri,  6 Nov 2020 15:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 189042067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.20930.46992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kb47P-000459-LA; Fri, 06 Nov 2020 15:57:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20930.46992; Fri, 06 Nov 2020 15:57:39 +0000
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
	id 1kb47P-000452-Hz; Fri, 06 Nov 2020 15:57:39 +0000
Received: by outflank-mailman (input) for mailman id 20930;
 Fri, 06 Nov 2020 15:57:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kb47O-00044x-Gk
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:57:38 +0000
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 469502b1-834e-4723-b1b6-49b3829b54d9;
 Fri, 06 Nov 2020 15:57:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 23so1824847wrc.8
 for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 07:57:37 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u202sm2970776wmu.23.2020.11.06.07.57.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 07:57:36 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rw0I=EM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kb47O-00044x-Gk
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 15:57:38 +0000
X-Inumbo-ID: 469502b1-834e-4723-b1b6-49b3829b54d9
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 469502b1-834e-4723-b1b6-49b3829b54d9;
	Fri, 06 Nov 2020 15:57:37 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 23so1824847wrc.8
        for <xen-devel@lists.xenproject.org>; Fri, 06 Nov 2020 07:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=db7t4GL85dQVBPvR3s9QjpqawTtgAchhP4T6H6x/w0o=;
        b=hkWdthbCf0vkBv1zUwa+mupIUBzQqKLqmG/cZ6B/emk+Flf5Y69rCP1gsyOOLdqXRf
         /LB370TCWGXG+6bwyV6wcsvFWRfF1yyWAQaIX1eA1NzazQYHLTLViiqancxSURJs3kkz
         3HhpDLumF+/UKyVSBL2uFGUgr9qBRFUmr0Mzqbk9Ij2y/VTrewhTlNnD/V1r4Cbzjfow
         WjIuPE21NNA1uyeobtIFCdZkJS1dAW3RbALFKKyunL3cXB85c++xpugwgjesru8M+6y6
         Yczb6bCsNwKDPiqbPsH8EiLxno3tvZIAreTcS1r/OesIGSlp/hdi9EMn7dvGxOIm8F8N
         pYuA==
X-Gm-Message-State: AOAM533vDLdFgd/zqvqYnL09sGYwgowt8n+qZ+T+jc8vLP17DPrQENte
	4HE7ZEBWx1modfCzSeTO+DA=
X-Google-Smtp-Source: ABdhPJwOCSqwoW2/sdZ10gPFr75CUYKJmrnMNX+zzTlT44BCmWAo5hxUOA8//ufM2IHXVxZ+yMxXAQ==
X-Received: by 2002:a5d:6591:: with SMTP id q17mr3399090wru.173.1604678256917;
        Fri, 06 Nov 2020 07:57:36 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id u202sm2970776wmu.23.2020.11.06.07.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 07:57:36 -0800 (PST)
Date: Fri, 6 Nov 2020 15:57:34 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] tools/libs/light: correct bitmap operations
Message-ID: <20201106155734.kk5hga6wfczrma4v@liuwe-devbox-debian-v2>
References: <20201106140504.25488-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106140504.25488-1-jgross@suse.com>
User-Agent: NeoMutt/20180716

On Fri, Nov 06, 2020 at 03:05:04PM +0100, Juergen Gross wrote:
> Libxl bitmap operations for single bits (test, set, reset) take the bit
> number as a signed integer without testing the value to be larger than
> 0.
> 
> Correct that by adding the appropriate tests.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

