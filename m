Return-Path: <SRS0=d7tj=7P=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855BCC433E0
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 14:31:06 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B6BE206C3
	for <xen-devel@archiver.kernel.org>; Tue,  2 Jun 2020 14:31:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdeV/WfX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B6BE206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg7w7-0004h8-SQ; Tue, 02 Jun 2020 14:30:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gJcj=7P=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jg7w6-0004h3-II
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 14:30:38 +0000
X-Inumbo-ID: a06d0d44-a4dd-11ea-81bc-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a06d0d44-a4dd-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 14:30:37 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id f185so3352054wmf.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=UGliGAMK0m7S2tSvoytJT1swPRZuq7C5chivfM4iRi8=;
 b=WdeV/WfXnBxpJhKno2k/iLPnk5kWwTGK7oskeyrQCJFGHvZerlhFh0cJTU/QQqNmYN
 k9mybIySypjoabXvUzIIUK4FRZKOaxTTBPjQZKnp77YuCe5DRmd7ApCwYCLLiKihcCqe
 /4posYPjhHS7MeK6uzk6k1dKiGc8MXBgifZ+RP7dXP+fEOsZab9CMqTbZGvbn1RLUft1
 E39+tfhhE+ReI+FF9XzcqcTLzMhaUu9m/Q0eLhBVa6y1bJ76D4ksUDOF/9xJXfkHQ6W5
 C7t6zNMIEVzvsWhZxyUB1WCngzoP5o9i9K6YNQoP3RDaMG+9Zg02O8dwTjhMxKxl7fGA
 NZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=UGliGAMK0m7S2tSvoytJT1swPRZuq7C5chivfM4iRi8=;
 b=bvLgkOa/jZFLm8ZXrm0zop67ZT8pBfZpCmjOPn6JXHHWl4WAcV1OwRhj+OSK2PVuTQ
 3xYXQ4X3NAGgDE1gCc+OyhbbzKqRzYS3utAiUxfBmaC79lhGT5ItOr8iJwMrGVt6Fs1C
 A15Wj2wG3wDg/tWSazN7LDvQhop6n5TeR+Mdqfy+0zsDLGCmGttSlpL0hUo61YcbVBWH
 EPi/Il0Jnj/5PIN6AYV1b6jjAjuJHB40vSRxPd6zymNKPRx/HBWY/JXWajXW4g0VRQg4
 N9Jn0EA8AM46aME6oFz8ieV3CJ1VOKzH+++97ULaQAm9BWLW1WW2zh7nMtcvyFsKqI9L
 FXNg==
X-Gm-Message-State: AOAM530El1YoXxy5Cssboy3rpv5yKZvqywpDNlTRfazXKG3SrsuqXE3x
 igezPVgD8eXtCsa9vM9bOak=
X-Google-Smtp-Source: ABdhPJwYp7BP2qX1mz1wbRd6y26QhJ5Cc5KQc7xTVHbJJKfk9J5V+6lpIVgCjICgPOb7tMgFPo+MdQ==
X-Received: by 2002:a1c:de46:: with SMTP id v67mr4359702wmg.146.1591108237093; 
 Tue, 02 Jun 2020 07:30:37 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-224.amazon.com. [54.240.197.224])
 by smtp.gmail.com with ESMTPSA id l18sm3497613wmj.22.2020.06.02.07.30.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Jun 2020 07:30:36 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Juergen Gross'" <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20200602125900.4424-1-jgross@suse.com>
In-Reply-To: <20200602125900.4424-1-jgross@suse.com>
Subject: RE: [PATCH-for-4.14 v2 0/2] xen: build fixes for CONFIG_HYPFS
Date: Tue, 2 Jun 2020 15:30:35 +0100
Message-ID: <003b01d638ea$61a16c40$24e444c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJKOXQt7xRe1uFXwlCBkJ1ef6M2OqfdYa6w
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
Reply-To: paul@xen.org
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Julien Grall' <julien@xen.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Sent: 02 June 2020 13:59
> To: xen-devel@lists.xenproject.org
> Cc: paul@xen.org; Juergen Gross <jgross@suse.com>; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Julien Grall <julien@xen.org>; Stefano Stabellini =
<sstabellini@kernel.org>; Wei
> Liu <wl@xen.org>; Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Subject: [PATCH-for-4.14 v2 0/2] xen: build fixes for CONFIG_HYPFS
>=20
> Fixing an issue Andrew met, and disabling CONFIG_HYPFS in pv-shim.
>=20
> Juergen Gross (2):
>   xen: fix build with CONFIG_HYPFS_CONFIG enabled
>   xen/config: disable hypervisor filesystem for pv-shim
>=20
>  xen/arch/x86/configs/pvshim_defconfig | 1 +
>  xen/common/Makefile                   | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20

Release-acked-by: Paul Durrant <paul@xen.org>


