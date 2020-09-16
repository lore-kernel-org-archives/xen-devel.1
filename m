Return-Path: <SRS0=Rhtt=CZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F73BC35257
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 06:46:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1DD208E4
	for <xen-devel@archiver.kernel.org>; Wed, 16 Sep 2020 06:46:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="KIc8F4vd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D1DD208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIRDA-0006rB-4K; Wed, 16 Sep 2020 06:46:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9sPA=CZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kIRD8-0006r4-Ge
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 06:46:34 +0000
X-Inumbo-ID: ce46843a-bc1f-4b47-926c-4f87fb0254a6
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ce46843a-bc1f-4b47-926c-4f87fb0254a6;
 Wed, 16 Sep 2020 06:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1600238794;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ZrGDe+E68fEPEDPBrioqb4olM1nX/kk/Msu1nSUcNRw=;
 b=KIc8F4vdTLraU4+3SqELVkR1xVA/DHU4eg/idFngYhsg90TfhkTNIGlf
 JhY2jFqCghJyI+ygqiZkNT7ekQk5lTJBKz+pR0grU7Aaci9kEKRK2KxNF
 Cowcjp40NckL70OfB3vSaHiKcYxb5BWROEIrNpm3sQfcpj7RS+IFZ+oXp I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: FO2YIFa9eLR5IGwVTKyLqYykZBLzXDJLkDMnaD7TI7L6Wh4IFT4kGb6sPcDgJfM2dMLZT60L8k
 p3aRwqRRwYeRsLEa8nZx7vAmL8bx4YybnYMJE+ZGJiNOg3xvieiZ/eM+Dh5ewYmkeZKjW5S9of
 wvDNn5phCFUxFHd93nMPgy6o/FAiq8zZFL/p6PzvOu/nobN/sg8socHVM5gxf1lhqiFrWncAcF
 gWw2tfoeILlCnu5TgIlTslfICViKNlgjZ8Q46V7bQH0p5N2VitPcpgXEI+mcH48kmYC/Ji2z2v
 fJ8=
X-SBRS: 2.7
X-MesageID: 27133158
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,431,1592884800"; d="scan'208";a="27133158"
Date: Wed, 16 Sep 2020 08:46:24 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trammell Hudson <hudson@trmm.net>
CC: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>,
 <andrew.cooper3@citrix.com>, <wl@xen.org>
Subject: Re: [PATCH v4 2/4] efi/boot.c: add handle_file_info()
Message-ID: <20200916064624.GQ753@Air-de-Roger>
References: <20200914115013.814079-1-hudson@trmm.net>
 <20200914115013.814079-3-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914115013.814079-3-hudson@trmm.net>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL06.citrite.net (10.13.108.179)
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

On Mon, Sep 14, 2020 at 07:50:11AM -0400, Trammell Hudson wrote:
> Add a separate function to display the address ranges used by
> the files and call `efi_arch_handle_module()` on the modules.
> 
> Signed-off-by: Trammell Hudson <hudson@trmm.net>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks!

