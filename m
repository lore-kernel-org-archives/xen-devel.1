Return-Path: <SRS0=FjyW=DQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2CDC433E7
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 14:43:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA61522260
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2020 14:43:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="f/3KLhGO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA61522260
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.4784.12608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kQtcA-00030V-6x; Fri, 09 Oct 2020 14:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 4784.12608; Fri, 09 Oct 2020 14:43:22 +0000
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
	id 1kQtcA-00030O-3t; Fri, 09 Oct 2020 14:43:22 +0000
Received: by outflank-mailman (input) for mailman id 4784;
 Fri, 09 Oct 2020 14:43:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pj9d=DQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kQtc9-00030J-59
 for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 14:43:21 +0000
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3ce5dcf4-8923-4e31-8ffb-e5d7fb53f4a3;
 Fri, 09 Oct 2020 14:43:19 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Pj9d=DQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
	id 1kQtc9-00030J-59
	for xen-devel@lists.xenproject.org; Fri, 09 Oct 2020 14:43:21 +0000
X-Inumbo-ID: 3ce5dcf4-8923-4e31-8ffb-e5d7fb53f4a3
Received: from mail2.protonmail.ch (unknown [185.70.40.22])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3ce5dcf4-8923-4e31-8ffb-e5d7fb53f4a3;
	Fri, 09 Oct 2020 14:43:19 +0000 (UTC)
Date: Fri, 09 Oct 2020 14:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
	s=protonmail; t=1602254597;
	bh=i/z6qZs3MVcbPYz5v3h03B0WlCRfNj74n7UOutiml5U=;
	h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
	b=f/3KLhGO5sqGnzkmappuJ6HriigUdm3UnQKLBkCSHYmym4dFH/ttIZLrsZZgO22t7
	 HSwu4n45wLe8Q614MZA25yNcy9KNLKGChx2Un5rTmTQTSb2TFRXrC9xq37MShSzoqP
	 Pv11Biuq4FxfZxOJIwsVoUkhVDktbKyD8G0nUiwo=
To: Trammell Hudson <hudson@trmm.net>
From: Trammell Hudson <hudson@trmm.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>, "jbeulich@suse.com" <jbeulich@suse.com>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "wl@xen.org" <wl@xen.org>
Reply-To: Trammell Hudson <hudson@trmm.net>
Subject: Re: [PATCH v9 0/4] efi: Unified Xen hypervisor/kernel/initrd images
Message-ID: <BbDD1Aa2FXJRlpSpqyFVl4-6u6S-OnBkoMyvoPHadElIyfNDl2h9J34bk12XyvFtEOweGsCRTmqY8eSSbvR98RHJpFzDHpWWa67IaW6Sz7I=@trmm.net>
In-Reply-To: <20201002111822.42142-1-hudson@trmm.net>
References: <20201002111822.42142-1-hudson@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Any further thoughts on this patch series? Three out of four of
them have been reviewed or acked by at least one reviewer, with
only the last one currently unreviewed.

--
Trammell

On Friday, October 2, 2020 1:18 PM, Trammell Hudson <hudson@trmm.net> wrote=
:
> This patch series adds support for bundling the xen.efi hypervisor,
> the xen.cfg configuration file, the Linux kernel and initrd, as well
> as the XSM, and architectural specific files into a single "unified"
> EFI executable. This allows an administrator to update the components
> independently without requiring rebuilding xen, as well as to replace
> the components in an existing image.
>
> The resulting EFI executable can be invoked directly from the UEFI Boot
> Manager, removing the need to use a separate loader like grub as well
> as removing dependencies on local filesystem access. And since it is
> a single file, it can be signed and validated by UEFI Secure Boot without
> requring the shim protocol.
>
> It is inspired by systemd-boot's unified kernel technique and borrows the
> function to locate PE sections from systemd's LGPL'ed code. During EFI
> boot, Xen looks at its own loaded image to locate the PE sections for
> the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
> (`.ramdisk`), and XSM config (`.xsm`), which are included after building
> xen.efi using objcopy to add named sections for each input file.
>
> Trammell Hudson (4):
> efi/boot.c: add file.need_to_free
> efi/boot.c: add handle_file_info()
> efi: Enable booting unified hypervisor/kernel/initrd images
> efi: Do not use command line if unified config is included
>
> .gitignore | 1 +
> docs/misc/efi.pandoc | 49 ++++++++++++
> xen/arch/arm/efi/efi-boot.h | 36 ++++++---
> xen/arch/x86/efi/Makefile | 2 +-
> xen/arch/x86/efi/efi-boot.h | 13 ++-
> xen/common/efi/boot.c | 140 ++++++++++++++++++++++++---------
> xen/common/efi/efi.h | 3 +
> xen/common/efi/pe.c | 152 ++++++++++++++++++++++++++++++++++++
> 8 files changed, 347 insertions(+), 49 deletions(-)
> create mode 100644 xen/common/efi/pe.c
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------
>
> 2.25.1



