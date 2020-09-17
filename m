Return-Path: <SRS0=nCK6=C2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD80C43461
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2020 16:52:13 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C328820708
	for <xen-devel@archiver.kernel.org>; Thu, 17 Sep 2020 16:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C328820708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIx8a-0002EN-09; Thu, 17 Sep 2020 16:52:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W15F=C2=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kIx8Y-0002EI-Gu
 for xen-devel@lists.xenproject.org; Thu, 17 Sep 2020 16:51:58 +0000
X-Inumbo-ID: 0393fca5-2807-48ea-a925-686c0cb284a7
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0393fca5-2807-48ea-a925-686c0cb284a7;
 Thu, 17 Sep 2020 16:51:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z1so2834161wrt.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Sep 2020 09:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=eXcDwJPBDpoezB52ag3t50IXYqmvWIP0A8WCfYktBYY=;
 b=Ozwukfxks8giK/lOPIMXUm2m/iNcZmB2eiGHOGMPKvjrtnbFsBSOkcGWXu3Jdmq8w6
 3BO8vK5OVyA5rXvWD8CqJ5mKnYEyT21zXV1alU4mm2j8/GziCj787L6dlDgmUHDQfBNP
 Lojy99aWTjb2vWWdqVanB3FHaSQFrOwhHJG3eZ0xX+DTNqljifQ989W11iE+B1WkV/U/
 wXowUQfWhm5lfwmEA3Mu3e3TklfGgYLM5MU71UAFF+DyZrmWWSU1c4qeD46L6onAmyPy
 OPej87I9Ik5bCHb4Of6+zbkni0kynCiM8ZsnQq0ib2Be5MDHgjoxiv5mYrd0NRgGdMvV
 h15g==
X-Gm-Message-State: AOAM533m53W8rdy7TecYNbEGb/MsHM+8NIvxW5JKnnM/v6UAyGloOqmN
 /Ek82aI6ZUqbnR+6XdkVlPw=
X-Google-Smtp-Source: ABdhPJyyQNqkIAxHmjGCvQinO4VoJJ0VIe1uU+0PzlPXcnXzChcqtRSUrdp5a5QS2RaPAjaDaQ6Qjg==
X-Received: by 2002:adf:f24d:: with SMTP id b13mr32710406wrp.316.1600361516765; 
 Thu, 17 Sep 2020 09:51:56 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 91sm279556wrq.9.2020.09.17.09.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 09:51:56 -0700 (PDT)
Date: Thu, 17 Sep 2020 16:51:54 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [PATCH v9 4/8] iommu: make map and unmap take a page count,
 similar to flush
Message-ID: <20200917165154.du63taiiw5gnarin@liuwe-devbox-debian-v2>
References: <20200915082936.23663-1-paul@xen.org>
 <20200915082936.23663-5-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200915082936.23663-5-paul@xen.org>
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

On Tue, Sep 15, 2020 at 09:29:32AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> At the moment iommu_map() and iommu_unmap() take a page order rather than a
> count, whereas iommu_iotlb_flush() takes a page count rather than an order.
> This patch makes them consistent with each other, opting for a page count since
> CPU page orders are not necessarily the same as those of an IOMMU.
> 
> NOTE: The 'page_count' parameter is also made an unsigned long in all the
>       aforementioned functions.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <julien@xen.org>

Reviewed-by: Wei Liu <wl@xen.org>

