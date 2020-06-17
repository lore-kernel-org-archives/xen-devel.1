Return-Path: <SRS0=oX/+=76=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46181C433DF
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 13:40:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DD5820739
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jun 2020 13:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0DD5820739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ens-lyon.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlYIJ-00068k-Dp; Wed, 17 Jun 2020 13:39:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z1j2=76=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1jlYII-00068d-9C
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2020 13:39:58 +0000
X-Inumbo-ID: 080ab7e4-b0a0-11ea-bb8b-bc764e2007e4
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 080ab7e4-b0a0-11ea-bb8b-bc764e2007e4;
 Wed, 17 Jun 2020 13:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id B9434D72;
 Wed, 17 Jun 2020 15:39:55 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l8GbQ7YFzV9q; Wed, 17 Jun 2020 15:39:55 +0200 (CEST)
Received: from function (lfbn-bor-1-797-11.w86-234.abo.wanadoo.fr
 [86.234.239.11])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 0A43AC25;
 Wed, 17 Jun 2020 15:39:54 +0200 (CEST)
Received: from samy by function with local (Exim 4.94)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1jlYIE-0018V2-6e; Wed, 17 Jun 2020 15:39:54 +0200
Date: Wed, 17 Jun 2020 15:39:54 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Olaf Hering <olaf@aepfle.de>
Subject: Re: [PATCH v1] stubdom/vtpmmgr: simplify handling of hardware_version
Message-ID: <20200617133954.f5s6znsgmhccndw3@function>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
References: <20200617061349.7623-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617061349.7623-1-olaf@aepfle.de>
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
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Quan Xu <quan.xu0@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Olaf Hering, le mer. 17 juin 2020 08:13:49 +0200, a ecrit:
>  int hw_is_tpm2(void)
>  {
> -    return (hardware_version.hw_version == TPM2_HARDWARE) ? 1 : 0;
> +    return hardware_version == 2 ? 1 : 0;
>  }

Or even

return hardware_version == 2;

?

Either case,

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!
Samuel

