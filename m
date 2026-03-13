Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B13107BCD0
	for <xen-devel@archiver.kernel.org>; Fri, 13 Mar 2026 17:25:21 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1254289.1550247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w16G2-0001p0-G7; Fri, 13 Mar 2026 17:25:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1254289.1550247; Fri, 13 Mar 2026 17:25:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w16G2-0001ot-Cc; Fri, 13 Mar 2026 17:25:06 +0000
Received: by outflank-mailman (input) for mailman id 1254289;
 Fri, 13 Mar 2026 17:25:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3LYz=BN=bounce.vates.tech=bounce-md_30504962.69b4486d.v1-992b3fd75b61474193ed23f45f990027@srs-se1.protection.inumbo.net>)
 id 1w16G0-0001on-Fo
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2026 17:25:04 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9163679e-1f01-11f1-b164-2bf370ae4941;
 Fri, 13 Mar 2026 18:25:02 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fXWZj2XMKzPm0PqZ
 for <xen-devel@lists.xenproject.org>; Fri, 13 Mar 2026 17:25:01 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 992b3fd75b61474193ed23f45f990027; Fri, 13 Mar 2026 17:25:01 +0000
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
X-Inumbo-ID: 9163679e-1f01-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773422701; x=1773692701;
	bh=6peDlQT9ickBq/NI+sv4l1/9hjip/fcjxW/bBanvJ+A=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=xSp64EMPyDXrSOnBZDXX9IMfvb1kv89k9wKF+9F54oERa59l+hXBFb17iLMt65yVR
	 Xfj3q8J/kP/wc8dmlm13BvZg46Ba7z8q+w+T0MvFPrs1rQDrBNeG1bnEyKA7eaHSof
	 IPDtpMb50HG16Njodsa0nOPYLh1iOkooR5Og498ZMZJcs8YG79sq4/1oZUDqtsydJa
	 FchBg4mNCysa0hs5bghKhBwHyIWFdjA2FdC0mdfjEJbzls1SeZiBBuUBMlO7/364Ms
	 m0gZtpoKXknIyf0i0IhW31WDHoIm1LkEW4cZPMAfJLXE8PfxWjjmnqTXpO+e6mYplt
	 iU4RTUG6cnpCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773422701; x=1773683201; i=thierry.escande@vates.tech;
	bh=6peDlQT9ickBq/NI+sv4l1/9hjip/fcjxW/bBanvJ+A=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=yXoGa6BNaZLchYIb4y5ZZ8d3CpUxYoz0CT6dPo+HL+7Pp8qdFAD3KwSEtE+O7F722
	 IWgjqWSrsS2Igx0UaD+CYmZgmZok/T2wgwPsJQlpISg9Nv/USky8SQo77p3dH5BFzP
	 FCR6hFXtJXCx9ZrybH9m8d5iJUB99Uh+jYN9PCS9olsj5/L1bIBGr9hknfuxjbB91h
	 ngj7PD69xJToo8l5lA66k2JjiHvMBt3kQY7QYa2QKEyqsB7jZW1X0QQ4VRaBiyBCjD
	 mFhN9gGfhcxTvtFIxlziDM23XLQDKSXEEQb/eGZEqJ+8+auP5Shtb7PfHX5hg+MipJ
	 ipTsmLdtLdPyw==
From: "Thierry Escande" <thierry.escande@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20install.sh:=20Preserve=20directory=20symlinks?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773422700428
To: xen-devel@lists.xenproject.org
Cc: "Thierry Escande" <thierry.escande@vates.tech>, "Anthony PERARD" <anthony.perard@vates.tech>
Message-Id: <20260313172456.871518-1-thierry.escande@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.992b3fd75b61474193ed23f45f990027?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260313:md
Date: Fri, 13 Mar 2026 17:25:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

In various distros (i.e. Debian) some folders like /lib or /var/run are
symlinks. Using the tar option --keep-directory-symlink preserves these
symlinks.

Signed-off-by: Thierry Escande <thierry.escande@vates.tech>
---
 install.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/install.sh b/install.sh
index 3e11c4d46f..5d0b7a4933 100644
--- a/install.sh
+++ b/install.sh
@@ -27,7 +27,7 @@ tmp="`mktemp -d`"
 echo "Installing Xen from '$src' to '$dst'..."
 (cd $src; tar -cf - * ) | tar -C "$tmp" -xf -
 
-(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" -xf -
+(cd $tmp; tar -cf - *) | tar --no-same-owner -C "$dst" --keep-directory-symlink -xf -
 rm -rf "$tmp"
 
 echo "All done."
-- 
2.51.0



--
Thierry Escande | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


