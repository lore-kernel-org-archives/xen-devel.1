Return-Path: <SRS0=QSaH=BO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B0A4C433DF
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 11:08:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03332206DA
	for <xen-devel@archiver.kernel.org>; Tue,  4 Aug 2020 11:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="eTvJS5RA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03332206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2uoA-0002NP-RK; Tue, 04 Aug 2020 11:08:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MwBG=BO=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k2uo9-0002NH-Th
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 11:08:37 +0000
X-Inumbo-ID: ebe2f065-f725-47b2-8cfe-b6e1fcde202c
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebe2f065-f725-47b2-8cfe-b6e1fcde202c;
 Tue, 04 Aug 2020 11:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596539316;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=LDZlDAUyFdhhsr8jIsjUPy20+y2smNRkNz/QqUF46fc=;
 b=eTvJS5RAgaeJS5zVtHiQEjzXalvSKdS0xsvgs0CxYpTIYLXyq1+TB3KO
 nl2UzFBJ42m9UUdYicFCm0cdGBIGDxv3y0UO1itl5TmCd5Zs8xJWSasYG
 IPYAW2UnPFGApmmBtM65z/mh7+ot3cRCzvjHxwya7oQJwAgjt0AtxP63Q 8=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xbDK6NuB3IxMztfV/KWP86GkVvDnTiEWDD4MDvf6cPT8Ufl0LfrEUJB/mwfMKj8BfQd78iqXjQ
 3fJd/bqIA2phSsf7j47cDuBH4uHh0umr49CRrRxZjPVXwqVT7Bi4bzRRiDUWaAuZZperYJRLIN
 gJc2bDJaAW9MWRsVRbciQJ68iJ9fR30t8bwmmXioLOQE4SMfX2bVkfwVXFRmaDCTQ6AdQeJQ+T
 JsrMRr2AK3H+5B8BtPvQMTyxuUlmyO6KqxTAPi8UxWvxUbsmFQStwp2nJ/w6qt4hGK5wj24V2Q
 mJ4=
X-SBRS: 3.7
X-MesageID: 23984060
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,433,1589256000"; d="scan'208";a="23984060"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-ID: <24361.16815.556488.913875@mariner.uk.xensource.com>
Date: Tue, 4 Aug 2020 12:08:31 +0100
To: Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 2/4] tools/hotplug: combine add/online and
 remove/offline in vif-bridge...
In-Reply-To: <20200803124931.2678-3-paul@xen.org>
References: <20200803124931.2678-1-paul@xen.org>
 <20200803124931.2678-3-paul@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Paul
 Durrant <pdurrant@amazon.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Paul Durrant writes ("[PATCH v2 2/4] tools/hotplug: combine add/online and remove/offline in vif-bridge..."):
> From: Paul Durrant <pdurrant@amazon.com>
> 
> ... as they are in vif-route.
> 
> The script is invoked with online/offline for vifs and add/remove for taps.
> The operations that are necessary, however, are the same in both cases. This
> patch therefore combines the cases.

This seems to newly add a "remove" case.  Previously "remove" was a
no-op here.  Is that right ?  If so it needs to be discussed in the
commit message.  We're not talking about a simple refactoring here!

Perhaps it would be best to move this bit

> +    remove)
> +        ;&
>      offline)

which I think is the relevant change, into its own commit ?

Ian.

