Return-Path: <SRS0=ZtLg=IN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CE8C433E0
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 20:19:47 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8ECC64F3F
	for <xen-devel@archiver.kernel.org>; Mon, 15 Mar 2021 20:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8ECC64F3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.98115.185994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLtgR-0007Oa-6B; Mon, 15 Mar 2021 20:19:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98115.185994; Mon, 15 Mar 2021 20:19:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLtgR-0007OT-38; Mon, 15 Mar 2021 20:19:23 +0000
Received: by outflank-mailman (input) for mailman id 98115;
 Mon, 15 Mar 2021 20:19:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=srjA=IN=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1lLtgQ-0007OO-9O
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 20:19:22 +0000
Received: from MTA-06-4.privateemail.com (unknown [198.54.122.56])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd3ac662-a94f-449d-a895-c648d782c544;
 Mon, 15 Mar 2021 20:19:20 +0000 (UTC)
Received: from MTA-06.privateemail.com (localhost [127.0.0.1])
 by MTA-06.privateemail.com (Postfix) with ESMTP id 10675600CE
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 16:19:20 -0400 (EDT)
Received: from mail-wm1-f50.google.com (unknown [10.20.151.235])
 by MTA-06.privateemail.com (Postfix) with ESMTPA id C9F32600CB
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 16:19:19 -0400 (EDT)
Received: by mail-wm1-f50.google.com with SMTP id
 c76-20020a1c9a4f0000b029010c94499aedso154951wme.0
 for <xen-devel@lists.xenproject.org>; Mon, 15 Mar 2021 13:19:19 -0700 (PDT)
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
X-Inumbo-ID: dd3ac662-a94f-449d-a895-c648d782c544
X-Gm-Message-State: AOAM531IFcbBSQRydcia3tPQUq0xlCcJkpQY9t6KS3G34Uv7ChzelPkC
	Oumfx6r8KSl0oLzqE5Z9QBPWYkza7FKvjKvHU4A=
X-Google-Smtp-Source: ABdhPJzfeDAUbvlSAqPIQ7lulTcyFszqHTdsiGgjVfL/qZp3U4oRHTAxz133zLb1JcQ8ICF1dlN1+BYQfrlkTqHduNU=
X-Received: by 2002:a1c:5f54:: with SMTP id t81mr1356942wmb.84.1615839558425;
 Mon, 15 Mar 2021 13:19:18 -0700 (PDT)
MIME-Version: 1.0
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 15 Mar 2021 16:18:42 -0400
X-Gmail-Original-Message-ID: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>
Message-ID: <CABfawh=fNCxQs+QBsYw5StA+vNwqzyQUHyiib3_rujDS1W8S9A@mail.gmail.com>
Subject: 4.15.0-rc3 can't create domain when dom0 uses newer kernel
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000e4e06105bd98f6f5"
X-Virus-Scanned: ClamAV using ClamSMTP

--000000000000e4e06105bd98f6f5
Content-Type: text/plain; charset="UTF-8"

Hi all,
I've ran into a pretty strange issue. I have a freshly installed 4.15.0-rc3
system and everything works fine with the stock Ubuntu 20.04
vmlinuz-5.4.0-66-generic as the dom0 kernel - except vmtrace, which needs a
newer kernel, that's expected. Now if I boot dom0 with
vmlinuz-5.8.0-44-generic or vmlinuz-5.10.0-1016-oem I can't start any
domains because of some strange disk error:

root@t2:/shared/cfg# xl create ubuntu-20.04.cfg
Parsing config from ubuntu-20.04.cfg
libxl: error: libxl_device.c:1109:device_backend_callback: Domain 1:unable
to add device with path /local/domain/0/backend/vbd/1/51712
libxl: error: libxl_create.c:1613:domcreate_launch_dm: Domain 1:unable to
add disk devices
libxl: error: libxl_device.c:1109:device_backend_callback: Domain 1:unable
to remove device with path /local/domain/0/backend/vbd/1/51712
libxl: error: libxl_domain.c:1529:devices_destroy_cb: Domain
1:libxl__devices_destroy failed
libxl: error: libxl_domain.c:1182:libxl__destroy_domid: Domain
1:Non-existant domain
libxl: error: libxl_domain.c:1136:domain_destroy_callback: Domain 1:Unable
to destroy guest
libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 1:Destruction
of domain failed

This is the disk config:

disk = ['phy:/dev/t2vg/ubuntu-20.04,xvda,w']

It's a standard LVM volume that is active, lvscan shows:

  ACTIVE            '/dev/t2vg/ubuntu-20.04' [40.00 GiB] inherit

I checked all the logs and I don't see anything relevant anywhere. If I
reboot the system with the older kernel everything works as expected as far
as creating the same domain with the same config.

Anyone has any idea what might be going on here?

Thanks,
Tamas

--000000000000e4e06105bd98f6f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div>I&#39;ve ran into a pretty strange =
issue. I have a freshly installed 4.15.0-rc3 system and everything works fi=
ne with the stock Ubuntu 20.04 vmlinuz-5.4.0-66-generic as the dom0 kernel =
- except vmtrace, which needs a newer kernel, that&#39;s expected. Now if I=
 boot dom0 with vmlinuz-5.8.0-44-generic or vmlinuz-5.10.0-1016-oem I can&#=
39;t start any domains because of some strange disk error:</div><div><br></=
div><div>root@t2:/shared/cfg# xl create ubuntu-20.04.cfg<br>Parsing config =
from ubuntu-20.04.cfg<br>libxl: error: libxl_device.c:1109:device_backend_c=
allback: Domain 1:unable to add device with path /local/domain/0/backend/vb=
d/1/51712<br>libxl: error: libxl_create.c:1613:domcreate_launch_dm: Domain =
1:unable to add disk devices<br>libxl: error: libxl_device.c:1109:device_ba=
ckend_callback: Domain 1:unable to remove device with path /local/domain/0/=
backend/vbd/1/51712<br>libxl: error: libxl_domain.c:1529:devices_destroy_cb=
: Domain 1:libxl__devices_destroy failed<br>libxl: error: libxl_domain.c:11=
82:libxl__destroy_domid: Domain 1:Non-existant domain<br>libxl: error: libx=
l_domain.c:1136:domain_destroy_callback: Domain 1:Unable to destroy guest<b=
r>libxl: error: libxl_domain.c:1063:domain_destroy_cb: Domain 1:Destruction=
 of domain failed</div><div><br></div><div>This is the disk config:</div><d=
iv><br></div><div>disk =3D [&#39;phy:/dev/t2vg/ubuntu-20.04,xvda,w&#39;]</d=
iv><div><br></div><div>It&#39;s a standard LVM volume that is active, lvsca=
n shows:</div><div><br></div><div>=C2=A0 ACTIVE =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0&#39;/dev/t2vg/ubuntu-20.04&#39; [40.00 GiB] inherit<br></div=
><div><br></div><div>I checked all the logs and I don&#39;t see anything re=
levant anywhere. If I reboot the system with the older kernel everything wo=
rks as expected as far as creating the same domain with the same config.</d=
iv><div><br></div><div>Anyone has any idea what might be going on here?</di=
v><div><br></div><div>Thanks,</div><div>Tamas<br></div></div>

--000000000000e4e06105bd98f6f5--

