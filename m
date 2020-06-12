Return-Path: <SRS0=NwDn=7Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B185BC433E0
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 14:55:54 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFDC20691
	for <xen-devel@archiver.kernel.org>; Fri, 12 Jun 2020 14:55:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebzvonPQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFDC20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjl5V-0000gi-5n; Fri, 12 Jun 2020 14:55:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5ow=7Z=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jjl5U-0000gd-Hr
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 14:55:20 +0000
X-Inumbo-ID: bb3c78d0-acbc-11ea-bca7-bc764e2007e4
Received: from mail-wr1-x42b.google.com (unknown [2a00:1450:4864:20::42b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb3c78d0-acbc-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 14:55:18 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id h5so10061599wrc.7
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2020 07:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=IAlgWmMpNXud4HHQ6/Kga7WExUXf5qDyf7r//9MvSHc=;
 b=ebzvonPQqEhiaQP1INPnJTEXwUAbfWP+9Lr1wBQEhqcGN39odqjyBN+lRANuOTgKhy
 QWDSHRojoYn/JbwEO5Zor9v5ej+PNcslWKFhb6n6RV9dZ0qYjYPY1UYzIZXUfz7v0RH8
 GrMcFoobx4aGPCWNrUrwlZT7OuNEo4R89IZRB7W2aGTsOq5h0eugEaewb9pUhg5iHihx
 MhWzHVuZ6cK3srowMpl0u9tilY7QR6G9fHt82Uly9M8ULdkJ8PQwdrOaBlLykuOhGt1k
 QFHlx+xLvGfDJxlIrUBUlcBkqrvctbLrz2RxmCkGoUUsfIKa1NmsHWDHz7IDC4C/yEnj
 eJDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=IAlgWmMpNXud4HHQ6/Kga7WExUXf5qDyf7r//9MvSHc=;
 b=aM00inPlGRSivW8bFmQReY7YfQzLt9F5bFSZIo7S6/yoMEvaw+lmgZOzp7dwN5eHVX
 fvKHwNZTk5qGbmWBMJJwtjcpakjgRFLfpi0KxwpmJMBByr4TmgsMyxw2Jj9dOg1fJC95
 PlqjN++oFM2O0MNEcNuvBDau9WGkmwhwyzYaFvZ6bLbpiUJ0sRgnaf0UmK2ewAxUi6K/
 yjIfAca+q10HiVzE2UnjT5Q5CH1cWZrrQR+lAmpV0g+HwMrPHQ3vz65Qe+vTQZyPLgxO
 xtOepQ25G87CalQeqD6qb3mO4McM+61wMCdQKsyTsqiQV5ME/szCuqhNb76wovDmm4vz
 N+kg==
X-Gm-Message-State: AOAM533m6R5stAnJQcAFa3WS2DpO6ZFvxtvun/jzaBuaBZeBRshlvM6Q
 zFcCCsQlrH2hZJkKsblVNDQ=
X-Google-Smtp-Source: ABdhPJyDk6bMq/MuXhq3ecOuPdA9Lb8vK9TOU4qU74M9lRSFrMR2AsZQyp4EBNirwwOs9t6u8Sh1kQ==
X-Received: by 2002:a5d:4f0d:: with SMTP id c13mr16311216wru.357.1591973718015; 
 Fri, 12 Jun 2020 07:55:18 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id g82sm9393597wmf.1.2020.06.12.07.55.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jun 2020 07:55:15 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Ian Jackson'" <ian.jackson@citrix.com>,
 "'Andrew Cooper'" <Andrew.Cooper3@citrix.com>
References: <439f3d92-2e18-1868-2b4b-2747973fbe3b@citrix.com>
 <24291.36156.961284.809662@mariner.uk.xensource.com>
In-Reply-To: <24291.36156.961284.809662@mariner.uk.xensource.com>
Subject: RE: libxl dirty in tree after libxl build
Date: Fri, 12 Jun 2020 15:55:14 +0100
Message-ID: <000401d640c9$7b14e760$713eb620$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQLZtzJZYIE21Pzr7nw56XGkYRVH5gJkCQYOprsDwnA=
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
Cc: 'xen-devel' <xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of =
Ian Jackson
> Sent: 12 June 2020 15:12
> To: Andrew Cooper <Andrew.Cooper3@citrix.com>
> Cc: xen-devel <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>
> Subject: Re: libxl dirty in tree after libxl build
>=20
> Andrew Cooper writes ("libxl dirty in tree after libxl build"):
> > A build of libxl has just dirtied the tree with:
> >
> > index 05f7ac74a0..94a4438666 100644
> > --- a/tools/libxl/libxlu_disk_l.c
> > +++ b/tools/libxl/libxlu_disk_l.c
> > @@ -10,221 +10,11 @@
> > =A0#define FLEX_SCANNER
> > =A0#define YY_FLEX_MAJOR_VERSION 2
> > =A0#define YY_FLEX_MINOR_VERSION 6
> > -#define YY_FLEX_SUBMINOR_VERSION 4
> > +#define YY_FLEX_SUBMINOR_VERSION 1
> > =A0#if YY_FLEX_SUBMINOR_VERSION > 0
> > =A0#define FLEX_BETA
> > =A0#endif
> >
> > and a whole slew of other changes in the generated code.=A0 It looks =
like
> > the version of Flex has just been updated in Jessie.
> >
> > Given the flex and bison are strictly required for the libxl build, =
why
> > is this temporary file checked in?
>=20
> The point of the exercise is to *not* require them.  The reason is
> that some of our developers have very old development systems which do
> not support essential flex/bison features.

Can't we check in a file with a different name 'e.g.' with something =
like '.tmpl' on the end, which we copy into place in case the
flex/bison don't generate such a file? That way the checked in file =
never gets dirtied.

  Paul

>=20
> How about we update them to the version from buster ?
>=20
> Ian.



