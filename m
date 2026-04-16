Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572EEF8D756
	for <xen-devel@archiver.kernel.org>; Thu, 16 Apr 2026 14:54:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1283621.1565794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDO6T-0004rH-Ax; Thu, 16 Apr 2026 14:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1283621.1565794; Thu, 16 Apr 2026 14:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wDO6T-0004rA-74; Thu, 16 Apr 2026 14:54:01 +0000
Received: by outflank-mailman (input) for mailman id 1283621;
 Thu, 16 Apr 2026 14:53:59 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e0f804.v1-022c2e7114b44be4b2facfd1241cac04@bounce.vates.tech>)
 id 1wDO6R-0004r4-KE
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 14:53:59 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wDO6R-00Dgea-0w
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2026 16:53:59 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e0f804.v1-022c2e7114b44be4b2facfd1241cac04@bounce.vates.tech>)
 id 69e0f804-2eae-0a2a0a5409dd-0a2a4506c0c6-20
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:53:58 +0200
Received: from [198.2.187.30] (helo=mail187-30.suw11.mandrillapp.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e0f804.v1-022c2e7114b44be4b2facfd1241cac04@bounce.vates.tech>)
 id 69e0f805-7371-0a2a45060019-c602bb1e36f7-3
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 16:53:58 +0200
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-30.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fxLch6PFXzP0JmqM
 for <xen-devel@lists.xenproject.org>; Thu, 16 Apr 2026 14:53:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 022c2e7114b44be4b2facfd1241cac04; Thu, 16 Apr 2026 14:53:56 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="anthony.perard@vates.tech" header.h="From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776351236; x=1776621236;
	bh=gi+t3/ZN5lKqMAmYOjIg5gm8bbk5VIPYRqdumnQ0dMU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=zj8wrTcNXBtG79F3PWsTVyL+dOv+gcWinQwz6xIeujpU6pj+hyYCYg3RmQMfjpZAg
	 gLr8qCddCyS1znkuncpBBaPgPcJrwNeVmSIzReuTv8J0eAm0WJJ9ejnZcZN2M23tIr
	 5rctCjGFbgtn+8zpCAagO+UcDypGa7cjHz3Gf+gV1+DNWRwOgfdf9dEKE3JoIRmtqL
	 QgcsJxV0hZLImEN2mzd8ZPZkZVIDLzhgRq2Obv/5TWgrX+YQFN0Or8sdsMDEATEiyn
	 ouCKoD9xGnKVVOKohfS1hZOeVQiIEOz50gpIGXubufDh8wl10J1MpJI2OC8v64OU9c
	 0NXTUDAHbSVBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776351236; x=1776611736; i=anthony.perard@vates.tech;
	bh=gi+t3/ZN5lKqMAmYOjIg5gm8bbk5VIPYRqdumnQ0dMU=;
	h=From:Subject:To:Cc:Message-Id:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=X2fk5H0iNdeVIsb0mOwEekEtbK2OCSKTXtf3zwobtlNGKqPH/8H1Wv/SG1/EY3vX3
	 wK9KgsPyfTYHU57RCGwTENAT9hVThgxI359ODnYQ0gyrdU1MuGx8ZDRcqTnfCoj6gG
	 2N6uDjbTJpr7FC+chUlm0ET5g20sLOvNCowzslS1KSKexAwhEl6MMHaTireyZRelph
	 E1CyxKUmP81iHKR8X1F2VY1VwZkAhwVX7SwpDSlVcj2Zg30cdLSiwgbT888vyP8o6r
	 STRvn9x9Lem3ml7oxb2gYY7TlaYg1FMZqSyVCTmcSP7DlV+Z1TuqQrldJV2ebSHYjB
	 LByg4GNLbjpPQ==
From: "Anthony PERARD" <anthony.perard@vates.tech>
Subject: =?utf-8?Q?Re:=20[PATCH=20test-artifacts=20v3=2013/13]=20Setup=20ssh=20access=20to=20test=20systems?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776351235575
To: "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <aeD4A2ub4VjbM-z5@l14>
References: <cover.bd2e5bd58e4b316c9c1042b1ca8db51b81fb7ea7.1774999132.git-series.marmarek@invisiblethingslab.com> <c58b23b75f4a65ef7bb70b472466ad3586aab9ee.1774999132.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <c58b23b75f4a65ef7bb70b472466ad3586aab9ee.1774999132.git-series.marmarek@invisiblethingslab.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.022c2e7114b44be4b2facfd1241cac04?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260416:md
Date: Thu, 16 Apr 2026 14:53:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: tlsNG-16d1c6/1776351238-CF77FD75-8A070105/0/0
X-purgate-type: clean
X-purgate-size: 1429

On Wed, Apr 01, 2026 at 01:22:03AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> diff --git a/scripts/alpine-rootfs.sh b/scripts/alpine-rootfs.sh
> index f649550d80ab..0afae48cfa6b 100755
> --- a/scripts/alpine-rootfs.sh
> +++ b/scripts/alpine-rootfs.sh
> @@ -72,6 +74,7 @@ rc-update add loopback sysinit
>  rc-update add bootmisc boot
>  rc-update add devfs sysinit
>  rc-update add dmesg sysinit
> +rc-update add dropbear boot
>  rc-update add hostname boot
>  rc-update add hwclock boot
>  rc-update add hwdrivers sysinit
> @@ -84,7 +87,9 @@ echo "ttyS0" >> /etc/securetty
>  echo "hvc0" >> /etc/securetty
>  echo "ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100" >> /etc/inittab
>  echo "hvc0::respawn:/sbin/getty -L hvc0 115200 vt100" >> /etc/inittab
> +echo "DROPBEAR_OPTS=3D\"-R\"" >> /etc/conf.d/dropbear

Is this useful somehow? Because the service that start dropbear will
generate the ssh_host keys before starting dropbear.

>  echo "rc_verbose=3Dyes" >> /etc/rc.conf
> +touch /etc/network/interfaces

That the kind of command that I don't understand what it is for on a
first look ...
But looks like it just to allow the "networking" service to start
without error if the test didn't configure networking via this file. A
comment would be nice, here or in the commit message.

Thanks,


--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



