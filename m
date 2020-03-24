Return-Path: <SRS0=L5TH=5J=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06DEC4332B
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 10:25:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B911B2080C
	for <xen-devel@archiver.kernel.org>; Tue, 24 Mar 2020 10:25:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nqQjkBxQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B911B2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGgkJ-0002IP-2D; Tue, 24 Mar 2020 10:25:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HUun=5J=gmail.com=yyankovskyi@srs-us1.protection.inumbo.net>)
 id 1jGgkH-0002IK-9X
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 10:25:17 +0000
X-Inumbo-ID: c0f12fe2-6db9-11ea-92cf-bc764e2007e4
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0f12fe2-6db9-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 10:25:16 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a81so2714036wmf.5
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2020 03:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LGUT3817m9dwKpwcgiwDpk5iBVynd8BwaSr3esU1DVk=;
 b=nqQjkBxQq4SmF2eCBrJZzQSJadKYuiApD6sLS+K5WWogPn0aWVPYOliY7P5ZnqmlqP
 Qs+X1WJJKib2E770uVyb0mp59LdlV9RJ00WoQqkaOwrSDBTSBtmxVQX7Xv6JTBsev/uF
 WzMexXe2iqzX4VMmwg3KfGSS7nxLYktDIpikFryUTbUFmjp2JBmkTajGCNAaTLiU6nGH
 06UG8o53k36hd+F4u0dwG/bqIKO6ITxnKPUY1j5+pyH1zuPM4qgw7P5ypTOJ3p/AiUH+
 cErRkLv0Hmjc3HkymikCdUfKXK6J0t28LUYI2cZLZraXlDCdpwrZIoCPyZhMduk0HS8C
 ppcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LGUT3817m9dwKpwcgiwDpk5iBVynd8BwaSr3esU1DVk=;
 b=ETlEtg0v6mxtLgcy2kEDkvQG78kzG5QVVwn+D977oImWv3a7oSV+Rh/Y6hFHckyXLb
 U2pB5JyAbNltvXbd1LaViGi13QjXRYFy4P33cTkK7KBR5isGY4qi2r7Ey5d3AfvKol1t
 DTXOw/0xYkmnH4ib33kMwnmUNJRhdFPPUQH4Q8r66IdYmBS5QP0iO8eXKFQ8PVSb5FR7
 DNwfsVSSY6zbq9er2gj1yiIdDmfzPbiMghW1tHDvyHwu53nYicmx3FLsHBrfkV5NjE7v
 VlB5IU89iW5SthzCTqGQweCDNZXZOtpaKQ3cFcOsFC7xt+V1dvWrPzvfg3C03szd4PCw
 iQdA==
X-Gm-Message-State: ANhLgQ3Jqy8J5cm0v5m5+Q4MRfgBIgxWx7b7DPtftA6gr7hHK6by/fof
 9hynBoLcOXZflDofYtsYQCU=
X-Google-Smtp-Source: ADFU+vvyCe3wYKRgESX6ZP/xX3EjW7zkB/m7qMqBuI2AgmS3QY9jKMFz4rSHz8KYcVak7Kmna/2mMQ==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr4880707wma.118.1585045515798; 
 Tue, 24 Mar 2020 03:25:15 -0700 (PDT)
Received: from kbp1-lhp-F74019 ([46.189.28.41])
 by smtp.gmail.com with ESMTPSA id f9sm28268562wrc.71.2020.03.24.03.25.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Mar 2020 03:25:15 -0700 (PDT)
Date: Tue, 24 Mar 2020 12:25:05 +0200
From: Yan Yankovskyi <yyankovskyi@gmail.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200324102505.GA4248@kbp1-lhp-F74019>
References: <20200323152343.GA28422@kbp1-lhp-F74019>
 <06458b85-fb66-faac-e75a-1ccefa848cb0@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06458b85-fb66-faac-e75a-1ccefa848cb0@oracle.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: Use evtchn_type_t as a type for
 event channels
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Mar 23, 2020 at 05:55:39PM -0400, Boris Ostrovsky wrote:
> 
> On 3/23/20 12:15 PM, Yan Yankovskyi wrote:
> > Make event channel functions pass event channel port using
> > evtchn_port_t type. It eliminates signed <-> unsigned conversion.
> >
> > Signed-off-by: Yan Yankovskyi <yyankovskyi@gmail.com>
> 
> 
> If the difference is only the whitespace fix

There were two more fixes: missing include in gntdev-common.h and
a variable initialization in bind_virq_to_irq (eliminates warning).

