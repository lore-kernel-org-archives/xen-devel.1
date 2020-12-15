Return-Path: <SRS0=ELVT=FT=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58741C4361B
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 15:49:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0509A22509
	for <xen-devel@archiver.kernel.org>; Tue, 15 Dec 2020 15:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0509A22509
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xen.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.54335.94334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCa0-0005So-El; Tue, 15 Dec 2020 15:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 54335.94334; Tue, 15 Dec 2020 15:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kpCa0-0005Sh-BD; Tue, 15 Dec 2020 15:49:36 +0000
Received: by outflank-mailman (input) for mailman id 54335;
 Tue, 15 Dec 2020 15:49:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SBK9=FT=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1kpCZz-0005Sc-8C
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 15:49:35 +0000
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2cf23b3b-687b-48fa-b32e-96e2e03dbdef;
 Tue, 15 Dec 2020 15:49:34 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y17so20314593wrr.10
 for <xen-devel@lists.xenproject.org>; Tue, 15 Dec 2020 07:49:34 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id 90sm38267609wrl.60.2020.12.15.07.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 07:49:32 -0800 (PST)
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
X-Inumbo-ID: 2cf23b3b-687b-48fa-b32e-96e2e03dbdef
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fc/eblxcEeudcxVbRfSaIJkDPIOYUdk8ioWRzw/Kc8s=;
        b=R/Hes2Su2goTaqNhj2G3BmINnWjZc/3evZL1N1k69YkQV5N0RzXIWScuPNmHLq29K2
         LJz2inQwaoBcyQt6+6DQISyjuRA/udPzTSLUv8DMk/o4EseVLcK49KEtpYl8giftWaEL
         vSeuXImwb7/1zKEPAuoWtU9d3uymF9OKLUDZEp3oMmYdPMnbc5C0tlufOsVYUlDUkXbU
         y6HetnFwSg1Ri08lO3w5MQ0M16o+d1WIzRUWgHdRzfWjVE/U6va+t2UUKvxZkwww7pb+
         p5AamHQ+OT6hYJBTVLf7lzUpT+0mCL5Hn22GAUhZ0i+3W4x+g+O48voG3Z2DTco5+Tr8
         aSEQ==
X-Gm-Message-State: AOAM531mdJKoG3ABrwN2v4zJZnqDvNSLy1HnBi1J3wqJnarhJTxqXfoV
	YQ2UlSMB5Ow1wdgEurzJ9rw=
X-Google-Smtp-Source: ABdhPJzauL+wWb0NvR0IddQ/VRyo5VPDepb1dUrJVQ3k7d9xvEh7Uzc23e+ln+udUaOerpqMwTircQ==
X-Received: by 2002:a5d:4491:: with SMTP id j17mr3360831wrq.78.1608047373780;
        Tue, 15 Dec 2020 07:49:33 -0800 (PST)
Date: Tue, 15 Dec 2020 15:49:31 +0000
From: Wei Liu <wl@xen.org>
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] examples: Add PVH example to config example list
Message-ID: <20201215154931.xdifgqo4y24cm2ap@liuwe-devbox-debian-v2>
References: <X9gg9Ph2na22YKdj@mattapan.m5p.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X9gg9Ph2na22YKdj@mattapan.m5p.com>
User-Agent: NeoMutt/20180716

On Mon, Dec 14, 2020 at 06:35:32PM -0800, Elliott Mitchell wrote:
> Somewhat helpful to actually install the example configurations.
> 
> Signed-off-by: Elliott Mitchell <ehem+xen@m5p.com>

Acked-by: Wei Liu <wl@xen.org>

