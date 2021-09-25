Return-Path: <SRS0=Sjj7=OP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1EF8C433F5
	for <xen-devel@archiver.kernel.org>; Sat, 25 Sep 2021 00:00:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0847610F7
	for <xen-devel@archiver.kernel.org>; Sat, 25 Sep 2021 00:00:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0847610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.195736.348578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv6q-0001t6-VX; Sat, 25 Sep 2021 00:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 195736.348578; Sat, 25 Sep 2021 00:00:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTv6q-0001sm-Rl; Sat, 25 Sep 2021 00:00:04 +0000
Received: by outflank-mailman (input) for mailman id 195736;
 Sat, 25 Sep 2021 00:00:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ba80=OP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTv6p-0001e9-DK
 for xen-devel@lists.xenproject.org; Sat, 25 Sep 2021 00:00:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87bab42e-1d93-11ec-bb2c-12813bfff9fa;
 Sat, 25 Sep 2021 00:00:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B156060FDC;
 Sat, 25 Sep 2021 00:00:00 +0000 (UTC)
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
X-Inumbo-ID: 87bab42e-1d93-11ec-bb2c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632528001;
	bh=EKfV/yiH0BiCtSeksLFvBycTxpbIEpQuEjnB3dB/SZc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=k/0c6mrmVD+UX/KMUwkIADgnVwtolbmTF08NMHErewJvHipX5BV+3pzfMmv7A01LJ
	 m/W3X2A4g5y8gHfiP/lLYKHw7+Yoc7fjOEYC7ixBniAlfFsgvWnWdmYF2WCx0kH5T3
	 iuc7XPtXzaqBMB3vVXXzZ3+J8W3N5lzkMKMHi8JQL9j6/iJrsmturyffV1l5YDRARj
	 dbQ3V+Hmvoox7dWn5Sx7BscQ7LwVRq3GBMnSNnbgoZ50JBzQ6c1F87NfIJB+DtynuR
	 dxS+iEhTFb/5sjo16dB0MImaUzE8rk1q83/l6brHoyfby+LJnk+06/32JyHAYrs7tz
	 N3laaS8fJO49Q==
Date: Fri, 24 Sep 2021 17:00:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, 
    Ian Jackson <iwj@xenproject.org>, Juergen Gross <jgross@suse.com>, 
    jbeulich@suse.com, roger.pau@citrix.com, andrew.cooper3@citrix.com
Subject: Re: [PATCH v2 07/11] libxl: Allow removing PCI devices for all types
 of domains
In-Reply-To: <20210923125438.234162-8-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109241658350.17979@sstabellini-ThinkPad-T480s>
References: <20210923125438.234162-1-andr2000@gmail.com> <20210923125438.234162-8-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers

On Thu, 23 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> The PCI device remove path may now be used by PVH on ARM, so the
> assert is no longer valid.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Cc: Ian Jackson <iwj@xenproject.org>
> Cc: Juergen Gross <jgross@suse.com>
>
> ---
>  tools/libs/light/libxl_pci.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> index 1a1c2630803b..59f3686fc85e 100644
> --- a/tools/libs/light/libxl_pci.c
> +++ b/tools/libs/light/libxl_pci.c
> @@ -1947,8 +1947,6 @@ static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
>              goto out_fail;
>          }
>      } else {
> -        assert(type == LIBXL_DOMAIN_TYPE_PV);

This is fine for ARM, but is it OK from an x86 point of view considering
the PVH implications?


>          char *sysfs_path = GCSPRINTF(SYSFS_PCI_DEV"/"PCI_BDF"/resource", pci->domain,
>                                       pci->bus, pci->dev, pci->func);
>          FILE *f = fopen(sysfs_path, "r");
> -- 
> 2.25.1
> 

