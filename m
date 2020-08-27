Return-Path: <SRS0=HZRB=CF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0713EC433DF
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 11:36:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6B5F22B40
	for <xen-devel@archiver.kernel.org>; Thu, 27 Aug 2020 11:36:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6B5F22B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBGCd-0004wj-Iy; Thu, 27 Aug 2020 11:36:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cFEh=CF=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kBGCc-0004wZ-IW
 for xen-devel@lists.xenproject.org; Thu, 27 Aug 2020 11:36:22 +0000
X-Inumbo-ID: 8b890e0c-984f-475e-9e7e-9d0712cffcd1
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b890e0c-984f-475e-9e7e-9d0712cffcd1;
 Thu, 27 Aug 2020 11:36:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id q9so2646866wmj.2
 for <xen-devel@lists.xenproject.org>; Thu, 27 Aug 2020 04:36:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pDG5YeHPkMnXIBkYRQfpihIJ9m+lEeFRGGjWrs72sQU=;
 b=dmVGEu5i76p3IyY1ODQJDkY1BzHqzBQmDR26WAjJZfB5Wd55Ie8s16pZLaBf5+lYiv
 cJLkcGD57/+63PpoqcnhYSHI8CmJKWZqomQL9B9dJknKQc+ZjzcCur4SWix1hY2QirH8
 IxBMRqeGGZJc7GixAPCslAjIL9kFhH7cX+sIno6bPkyNswOJ5ulfI4DRjr0HYmKLaOB9
 +Y2qK3P5CAFdvaClNOdtWZEkuATYRA+Y9tZ7dkFnIzZKA9zrbNIJm4CP5d3/e9F09/L/
 8JmIwFpsaSAomthr0ZOUqEGxsktq7ubxmWjaAoD7WHxk0ukVtQzNofs4+RhUuxvk4dCo
 l+JQ==
X-Gm-Message-State: AOAM5315QPyC3H++0pjjahP42pFe74KComXImVrQriLw3oiQuDYhtOPV
 QZHpIjim8/UjiGqtjtQM92o=
X-Google-Smtp-Source: ABdhPJzsNgIjR+gc5kVdw7f0u3wceVdHeUJ0GWl92yL/AC4hxBrl+cHpeHp3WCCgsd2qZIAjGALmrA==
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr11361322wma.0.1598528181041; 
 Thu, 27 Aug 2020 04:36:21 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id u205sm4849977wmu.6.2020.08.27.04.36.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 04:36:20 -0700 (PDT)
Date: Thu, 27 Aug 2020 11:36:19 +0000
From: Wei Liu <wl@xen.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 30/38] tools: split libxenstat into new
 tools/libs/stat directory
Message-ID: <20200827113619.s67adbkqiu6cy3yi@liuwe-devbox-debian-v2>
References: <20200823093519.18386-1-jgross@suse.com>
 <20200823093519.18386-31-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823093519.18386-31-jgross@suse.com>
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

On Sun, Aug 23, 2020 at 11:35:11AM +0200, Juergen Gross wrote:
> There is no reason why libxenstat is not placed in the tools/libs
> directory.
> 
> At the same time move xenstat.h to a dedicated include directory
> in tools/libs/stat in order to follow the same pattern as the other
> libraries in tools/libs.
> 
> As now xentop is the only left directory in xenstat move it directly
> under tools and get rid of tools/xenstat.
> 
> Fix some missing prototype errors (add one prototype and make two
> functions static).
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Wei Liu <wl@xen.org>

