Return-Path: <SRS0=UaJJ=DP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69696C4363A
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 13:07:58 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F054F2083B
	for <xen-devel@archiver.kernel.org>; Thu,  8 Oct 2020 13:07:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F054F2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4485.11679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQVdz-0005U1-P3; Thu, 08 Oct 2020 13:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4485.11679; Thu, 08 Oct 2020 13:07:39 +0000
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
	id 1kQVdz-0005Tu-LY; Thu, 08 Oct 2020 13:07:39 +0000
Received: by outflank-mailman (input) for mailman id 4485;
 Thu, 08 Oct 2020 13:07:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kQVdx-0005Tp-OR
 for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 13:07:37 +0000
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 72637db2-8990-47eb-82d5-53441f9dde86;
 Thu, 08 Oct 2020 13:07:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l11so6396872wmh.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 06:07:36 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b8sm6746188wmb.4.2020.10.08.06.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 06:07:34 -0700 (PDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+9vM=DP=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
	id 1kQVdx-0005Tp-OR
	for xen-devel@lists.xenproject.org; Thu, 08 Oct 2020 13:07:37 +0000
X-Inumbo-ID: 72637db2-8990-47eb-82d5-53441f9dde86
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 72637db2-8990-47eb-82d5-53441f9dde86;
	Thu, 08 Oct 2020 13:07:36 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id l11so6396872wmh.2
        for <xen-devel@lists.xenproject.org>; Thu, 08 Oct 2020 06:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=KjIx+9Xuwm/NU6V/rg66DBuxDp4aIJaVISlPb6YOr+w=;
        b=j4wXf5GIjLAUdQykC3KMz4jIOku/ykUGeCwnDbJm5RTyC0sfQcjEKcWlHbk8hXOU5N
         bFNHvjxL3T4ZuPhDxO0x0SGjwf267imN2CWtlRRGTDEypfFgppnKnJuFY8+QPZnkP1mH
         PFMql0VqYwHdU1FkbdSt9V+Q4ZYJ7YY4qcIle+ZQvQ++Sql6fdgu3YVr5egK5GZYKuFl
         NAryzoqswhKVTvqyoyOmKm9yc3EF3ozNzZ4GFhWIddbbt4RXHDpyYLjcbNi4pbcfHkAb
         W/viHd4UT6fa0XtQuJO6GBX7v9hz4KgS+hGHCWaP6upWELxeV2J61qHVob7Y2/lTEonx
         OnXw==
X-Gm-Message-State: AOAM531PVtYkzxnDeKJacCdE4jj50nMipG+kT2Q74f0I6cxjw3gBrVdP
	DKbHpCbEKQzX3IDoScPtKM4=
X-Google-Smtp-Source: ABdhPJyLQsnsiC0HvCZsnX9ACo/WUINu6LnF7FIlx5nP90c9nbRejnYyjIcQLj593mOUXLJe4Un4Xg==
X-Received: by 2002:a1c:6a0a:: with SMTP id f10mr8881256wmc.86.1602162455621;
        Thu, 08 Oct 2020 06:07:35 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
        by smtp.gmail.com with ESMTPSA id b8sm6746188wmb.4.2020.10.08.06.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 06:07:34 -0700 (PDT)
Date: Thu, 8 Oct 2020 13:07:33 +0000
From: Wei Liu <wl@xen.org>
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH 1/5] libxl: remove separate calculation of IOMMU memory
 overhead
Message-ID: <20201008130733.7pu73mu4iqjj2svd@liuwe-devbox-debian-v2>
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-2-paul@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005094905.2929-2-paul@xen.org>
User-Agent: NeoMutt/20180716

On Mon, Oct 05, 2020 at 10:49:01AM +0100, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> When using 'shared_pt' mode the IOMMU is using the EPT PTEs. In 'sync_pt'
> mode these PTEs are instead replicated for the IOMMU to use. Hence, it is
> fairly clear that the memory overhead in this mode is essentially another
> copy of the P2M.
> 
> This patch removes the independent calculation done in
> libxl__get_required_iommu_memory() and instead simply uses 'shadow_memkb'
> as the value of the IOMMU overhead since this is the estimated size of
> the P2M.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Acked-by: Wei Liu <wl@xen.org>

