Return-Path: <SRS0=WVJZ=CQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0511C433E2
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 17:46:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82698206E7
	for <xen-devel@archiver.kernel.org>; Mon,  7 Sep 2020 17:46:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=trmm.net header.i=@trmm.net header.b="d6Hf2pkZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82698206E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=trmm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFLDN-0002TG-OR; Mon, 07 Sep 2020 17:46:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FGN5=CQ=trmm.net=hudson@srs-us1.protection.inumbo.net>)
 id 1kFLDM-0002TB-8g
 for xen-devel@lists.xenproject.org; Mon, 07 Sep 2020 17:46:00 +0000
X-Inumbo-ID: 7439f2a4-9304-4efa-afd6-0299d2bd0b21
Received: from mail-40131.protonmail.ch (unknown [185.70.40.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7439f2a4-9304-4efa-afd6-0299d2bd0b21;
 Mon, 07 Sep 2020 17:45:58 +0000 (UTC)
Date: Mon, 07 Sep 2020 17:45:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trmm.net;
 s=protonmail; t=1599500756;
 bh=/8zcHwUuvK5LeQi51pKE9BjzgihG2EhTxZhRqi19ek4=;
 h=Date:To:From:Reply-To:Subject:From;
 b=d6Hf2pkZPGceHpn3eT0+m3vz5w4NJSxQ0xLv4AWhXUopIbBvbY8eX0XMdvg3fdIts
 KjOHP279gH4BDO4eH3LVqTiu2T9drDGnyVcNpD1sFi+rEi7MDBrLAr1/49/adKdIQP
 T9gGDWsjvqASH+O/Mcb650ZR5E4WMxYNKmLtqfTo=
To: Xen-devel <xen-devel@lists.xenproject.org>
From: Trammell Hudson <hudson@trmm.net>
Subject: [PATCH v3 0/4] efi: Unified Xen hypervisor/kernel/initrd images
Message-ID: <b8BKlNQRW9YVOeX7T7TU64N8ek2l9Klzq0TVfkmLC3vzz4K2Gx6KHSLKjEHIlk5wjT0S0k-uieet1mvDEgHwSpKzg1LIiEL_eZPfpKDhpfo=@trmm.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Trammell Hudson <hudson@trmm.net>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This patch series adds support for bundling the xen.efi hypervisor,
the xen.cfg configuration file, the Linux kernel and initrd, as well
as the XSM, and architectural specific files into a single "unified"
EFI executable.  This allows an administrator to update the components
independently without requiring rebuilding xen, as well as to replace
the components in an existing image.

The resulting EFI executable can be invoked directly from the UEFI Boot
Manager, removing the need to use a separate loader like grub as well
as removing dependencies on local filesystem access.  And since it is
a single file, it can be signed and validated by UEFI Secure Boot without
requring the shim protocol.

It is inspired by systemd-boot's unified kernel technique and borrows the
function to locate PE sections from systemd's LGPL'ed code.  During EFI
boot, Xen looks at its own loaded image to locate the PE sections for
the Xen configuration (`.config`), dom0 kernel (`.kernel`), dom0 initrd
(`.initrd`), and XSM config (`.xsm`), which are included after building
xen.efi using objcopy to add named sections for each input file.

Trammell hudson (4):
  x86/xen.lds.S: Work around binutils build id alignment bug
  efi/boot.c: add file.need_to_free and split display_file_info()
  efi: Enable booting unified hypervisor/kernel/initrd images
  efi: Do not use command line if secure boot is enabled.

 .gitignore                  |   1 +
 docs/misc/efi.pandoc        |  47 ++++++++++++
 xen/arch/arm/efi/efi-boot.h |  22 ++++--
 xen/arch/x86/efi/Makefile   |   2 +-
 xen/arch/x86/efi/efi-boot.h |   7 +-
 xen/arch/x86/xen.lds.S      |   1 +
 xen/common/efi/boot.c       | 139 ++++++++++++++++++++++++++---------
 xen/common/efi/efi.h        |   3 +
 xen/common/efi/pe.c         | 141 ++++++++++++++++++++++++++++++++++++
 9 files changed, 317 insertions(+), 46 deletions(-)
 create mode 100644 xen/common/efi/pe.c

--
2.25.1






