Return-Path: <SRS0=HZRB=CF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7764C433E1
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 10:22:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECB22075B
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 10:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AECB22075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBF37-0004gK-W1; Thu, 27 Aug 2020 10:22:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBF36-0004gD-NB
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 10:22:28 +0000
X-Inumbo-ID: 7c9ba543-3183-4f7a-a6af-ea4886720408
Received: from mail-wr1-f68.google.com (unknown [209.85.221.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c9ba543-3183-4f7a-a6af-ea4886720408;
 Thu, 27 Aug 2020 10:22:26 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id h15so4813234wrt.12
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 03:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1yIE/pyTMzE/IZOI/QQ+VbTxGY9AzIoLVhMHRZ32tv4=;
 b=SsI6t/PWS5RCeDa6d9tKtVveJK2cQ3W6HitZdQ5vcGBneZp7/ACdlg+mk9O9JNu7ER
 OFH1SRYv/in4wTTjN98J9lSkCDU6/AsclmxajtnAxK9NKZf0pZyqpajlhZb0UMYMfC6E
 v7bRquf+SwvHkqMfwevGHfUBsUPljHammErcD//217+Hshb2CCwmQ1maSBfCryAZnpQ9
 g7x5cSlRcOnWZWT6C6eA2V2gjwDmxR4t8L+yw6Yscb7Ly2e1rvPjOdNXiai6EoIGOVfL
 2HG+UKlhvVKnlKy6PiVVwAV8JDsvey9gYSDr7xmeGeyLBECUbjwkK+pxFt5GfM+X3Ndy
 zupg==
X-Gm-Message-State: AOAM531R8z8nthJZ7k3Rpe0PWxPclA56nVC2MyhmBTNFkzQN6xykEGFd
 6NvXY3LnV2ewk/CL1g75UWY=
X-Google-Smtp-Source: ABdhPJztZFo0rQwx8lmYOJbt9ojelu6QDU/ob1HplLD+FSUAj4E3mRQvQ8fMXsdMVFdqK/qVAuc6sA==
X-Received: by 2002:adf:ec48:: with SMTP id w8mr15336699wrn.339.1598523745523; 
 Thu, 27 Aug 2020 03:22:25 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id r3sm4574487wro.1.2020.08.27.03.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 03:22:25 -0700 (PDT)
Date: Thu, 27 Aug 2020 10:22:23 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 05/38] tools: define ROUNDUP() in
 tools/include/xen-tools/libs.h
Message-ID: <20200827102223.ynkhdeyq5jlrfxvc@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-6-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:34:46AM +0200, Juergen Gross wrote:
> Today there are multiple copies of the ROUNDUP() macro in various
> sources and headers. Define it once in tools/include/xen-tools/libs.h.
> 
> Using xen-tools/libs.h enables removing copies of MIN() and MAX(), too.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

