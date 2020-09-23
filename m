Return-Path: <SRS0=1HVP=DA=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3B2C4363D
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 14:09:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 528DF2220D
	for <xen-devel@archiver.kernel.org>; Wed, 23 Sep 2020 14:09:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Yqty6k33"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 528DF2220D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL5SW-0004o7-7D; Wed, 23 Sep 2020 14:09:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6W+X=DA=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1kL5SU-0004o2-Si
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 14:09:23 +0000
X-Inumbo-ID: be655d3f-8794-4a3a-9554-c943fcb32bcc
Received: from mail-40134.protonmail.ch (unknown [185.70.40.134])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be655d3f-8794-4a3a-9554-c943fcb32bcc;
 Wed, 23 Sep 2020 14:09:19 +0000 (UTC)
Date: Wed, 23 Sep 2020 14:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1600870157;
 bh=K+wlajLsRA2LV7sdHujyv9aHfWQ4vczpzsQVdblMECQ=;
 h=Date:To:From:Reply-To:Subject:From;
 b=Yqty6k33pPp6wFevOrJUtp5b5Bd0jsHZA4NrJvv5EgKGlAUbQWwaWr9otWL/8PnPN
 ogkZNZH+iaE/Hr3z9kBEv1ArsPFTyIcpbkcgZ95e57ssh6iRtxRQtezhVs5cgnCofb
 pyh1vTDdI0+8sZJVRtllfbsHfWQNX2TTGaEnPelo=
To: xen-devel <xen-devel@lists.xenproject.org>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: [Libvirt] Failed to get udev device for syspath
 '/sys/devices/virtual/dmi/id'
Message-ID: <WBFXzWm02qaMoLNSOnDbHmebQchJ7xMXXT6ocR4SZ-6Pw8VClueBmTcHS3xHg_vttQRPdwdaHeNGskEHxHPETSSY03En7rejlTQ4lXhjlZk=@protonmail.com>
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

I'm facing an issue with libvirt and the LIBXL driver, failing when searchi=
ng for DMI data in /sys.

info : libvirt version: 5.0.0, package: 4+deb10u1 (Guido G=C3=BCnther <agx@=
sigxcpu.org> Thu, 05 Dec 2019 00:22:14 +0100)
error : udevGetDMIData:1719 : internal error: Failed to get udev device for=
 syspath '/sys/devices/virtual/dmi/id' or '/sys/class/dmi/id'
error : libxlDriverConfigNew:1803 : Unable to configure libxl's memory mana=
gement parameters
error : virStateInitialize:662 : Initialization of LIBXL state driver faile=
d: internal error: Failed to get udev device for syspath '/sys/devices/virt=
ual/dmi/id' or '/sys/class/dmi/id'
error : daemonRunStateInit:799 : Driver state initialization failed

The relevant function udevGetDMIData in libvirt:
https://github.com/libvirt/libvirt/blob/cb09344a2cccc0cc9bcefa3cb53d7af45ba=
92631/src/node_device/node_device_udev.c#L1726

I don't understand what's happening, as this initialization failure only ha=
ppens when I boot on the Xen kernel.
Also, the /sys/class/dmi* paths are not exposed on Xen. (should they ?)

Note: Running on Xen 4.12.1

Any ideas ?

Thanks !

