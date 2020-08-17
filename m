Return-Path: <SRS0=Z/2m=B3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE3DC433DF
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 10:13:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6638D2067C
	for <xen-devel@archiver.kernel.org>; Mon, 17 Aug 2020 10:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6638D2067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7c8J-0000pL-FI; Mon, 17 Aug 2020 10:12:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KDWc=B3=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1k7c8I-0000pC-Dy
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 10:12:50 +0000
X-Inumbo-ID: e29b2183-b6a6-4619-be8f-f2812e906ccf
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e29b2183-b6a6-4619-be8f-f2812e906ccf;
 Mon, 17 Aug 2020 10:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id C2C25218F;
 Mon, 17 Aug 2020 12:12:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lchaadG8xUye; Mon, 17 Aug 2020 12:12:45 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 7A80231F6;
 Mon, 17 Aug 2020 12:12:45 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1k7c8B-001Xs3-Nw; Mon, 17 Aug 2020 12:12:43 +0200
Date: Mon, 17 Aug 2020 12:12:43 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: Re: [PATCH II v2 01/17] stubdom: add correct dependencies for Xen
 libraries
Message-ID: <20200817101243.vxb6feikogjv6rqj@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
References: <20200817094922.15768-1-jgross@suse.com>
 <20200817094922.15768-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200817094922.15768-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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

Hello,

Juergen Gross, le lun. 17 août 2020 11:49:06 +0200, a ecrit:
> The stubdom Makefile is missing several dependencies between Xen
> libraries. Add them.

> @@ -405,6 +405,7 @@ libs-$(XEN_TARGET_ARCH)/toollog/libxentoollog.a: mk-headers-$(XEN_TARGET_ARCH) $
>  
>  .PHONY: libxenevtchn
>  libxenevtchn: libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a
> +libs-$(XEN_TARGET_ARCH)/evtchn/libxenevtchn.a: libxentoolcore

I see

evtchn/Makefile:USELIBS  := toollog toolcore

So it'd actually need libxentoollog as well?

> @@ -423,6 +425,7 @@ libs-$(XEN_TARGET_ARCH)/gnttab/libxengnttab.a: mk-headers-$(XEN_TARGET_ARCH) $(N
>  
>  .PHONY: libxencall
>  libxencall: libs-$(XEN_TARGET_ARCH)/call/libxencall.a
> +libs-$(XEN_TARGET_ARCH)/call/libxencall.a: libxentoolcore

Same with

call/Makefile:USELIBS  := toollog toolcore

?

> @@ -432,6 +435,7 @@ libs-$(XEN_TARGET_ARCH)/call/libxencall.a: mk-headers-$(XEN_TARGET_ARCH) $(NEWLI
>  
>  .PHONY: libxenforeignmemory
>  libxenforeignmemory: libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a
> +libs-$(XEN_TARGET_ARCH)/foreignmemory/libxenforeignmemory.a: libxentoolcore

Same with 

foreignmemory/Makefile:USELIBS  := toollog toolcore

?

Possibly they are actually already coming from somewhere by
transitivity, but it'd probably better to just make sure we match
Makefiles' USELIBS.

Samuel

