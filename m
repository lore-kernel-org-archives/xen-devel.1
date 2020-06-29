Return-Path: <SRS0=/qc5=AK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 507B8C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 09:33:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B0AA20857
	for <xen-devel@archiver.kernel.org>; Mon, 29 Jun 2020 09:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B0AA20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jpq9g-0002cQ-9i; Mon, 29 Jun 2020 09:32:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wPAo=AK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jpq9e-0002cL-Py
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 09:32:46 +0000
X-Inumbo-ID: 7d32c12a-b9eb-11ea-8547-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7d32c12a-b9eb-11ea-8547-12813bfff9fa;
 Mon, 29 Jun 2020 09:32:46 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7f2vnpZmjRwk/HVS9W+BG0B0Tq+jpbz9Prj9My3XhZae0f8a3E9rAmqo62Z2TF/P6VIUHZaQ02
 bL1yD21I1aY6Hu5ZCaNGye9c7qEMmbrS8B/zTEinjLgzrzpj19Pyb12WWyL4wGRxINeLUtDhuK
 WjPLXsARwtpXWTtNvdrgp3qLQdpAk33tyByjheW7ZHpWIJxxYh7X7YHdiM4jZ73LM9CxxqZGqg
 4+OQPQ3Ei/g1hQQ4oRb6r8pJ8thfqamPDErCxdKvFmUDmquQvEFUjukWEATjyBHZNW+nMP/zBR
 vuI=
X-SBRS: 2.7
X-MesageID: 21370894
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,294,1589256000"; d="scan'208";a="21370894"
Date: Mon, 29 Jun 2020 11:32:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Trevor Bentley <trevor@yubico.com>
Subject: Re: Suspend/hibernate not working on Dell XPS 15 9500 laptop
Message-ID: <20200629093239.GG735@Air-de-Roger>
References: <afe621ac-d446-7dbf-e368-e06ab0a95970@yubico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <afe621ac-d446-7dbf-e368-e06ab0a95970@yubico.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Jun 27, 2020 at 08:35:27AM +0000, Trevor Bentley wrote:
> I asked on #xen on Freenode and was requested to post here.
> 
> Summary: Under Xen, both suspend and hibernate operations put the laptop
> into some sort of unrecoverable low-power mode, and a force power-off is
> required.
> 
> Environment:
>  - Dell XPS 15 9500, BIOS 1.0.1 (this is a new 2020 model)
>  - Intel i7-10750H
>  - Intel i915 + Nvidia GTX 1650 Ti Mobile
>  - Arch linux (clean install)
>  - Linux kernels 5.7.5, 5.7.6 tested
>  - i915 driver loaded, no nvidia drivers loaded (nouveau blacklisted)
>  - Xen 4.13.1, 4.14.0-rc3 tested
>  - UEFI, GRUB2 bootloader, LUKS-encrypted /boot, /root, and swap
> (unencrypted /efi with GRUB stub loader)

Completely a shot in the dark, but have you tried with legacy boot
(BIOS) instead of UEFI? To try to rule out what might cause the
issues.

Roger.

