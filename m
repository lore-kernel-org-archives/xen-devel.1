Return-Path: <SRS0=Sbf7=AM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55167C433E0
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 13:24:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F884207F5
	for <xen-devel@archiver.kernel.org>; Wed,  1 Jul 2020 13:23:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JRZTfk0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F884207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqchx-0003NO-7c; Wed, 01 Jul 2020 13:23:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SYL=AM=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jqchv-0003NJ-T1
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 13:23:24 +0000
X-Inumbo-ID: 096fd264-bb9e-11ea-b7bb-bc764e2007e4
Received: from mail-wm1-x331.google.com (unknown [2a00:1450:4864:20::331])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 096fd264-bb9e-11ea-b7bb-bc764e2007e4;
 Wed, 01 Jul 2020 13:23:23 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id f139so23227066wmf.5
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 06:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=jf2wtkoCW3xmuHm5TPxfRgukLk2yxsCQD6cMw9FXid4=;
 b=JRZTfk0UBEXbxiHvzkprt7OnwOCmnqK0YSOplNzWeMPVRnneceqLBOWcNyMjqu0kxV
 L+GLOYlHYQsrrlko3ph/fstgBqOwm3LqpCCgy/ZF3YDCm6Wn6h/WsRCuJl6ED7I7uaZ/
 g47MTBzW9xDJiYIfZF/QtFl+Rd0QeDZgEfONFSqhn/hMlv/lnKykQ3I6DQcqt4L8P1FY
 pV5m/I/4WSy66Jugy2brHSwE6rBiQtG3s0ts81FIe+Pf/flS2mzFh1DvPrVds1vcRnMJ
 3hPLvrLVl38VFqE/1+r0UBDL30Fcndt7tTNMWjT3fDJu9DdByrKhNqNSH43bv0ZaMxsj
 dHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=jf2wtkoCW3xmuHm5TPxfRgukLk2yxsCQD6cMw9FXid4=;
 b=Y2ZCI7Xpgvp62dKbhv0voaMQ0qKJlLzoM1LoGjo3IeDVIxte3QWwkLidpqqfDaTliv
 usfm8jcpaloTtJ8+yc3kyLA3lRabuGfURgVUYNvnfuKGbH+RRWUMs1+R6MFMVWNjvfhr
 tvQaTQ8fDwV36t4kvrnnWWhkWRGeUfxCXRadVR8iL1yMxEKcrVFSfFS/6IGZI32a1MUm
 Z3uOTe7qFqHd52NS/N/GAfzShA/EqUg9G6aXq+JF9vOHcoTPZbMv91QpROhPEBKMDKTw
 BF8SIjwfgFT5gSkAnFuqgDkKXyLC8oZRfZYkLlhPRWLyoU8A34nzhd/0uDMKCB/lkSw3
 FP6A==
X-Gm-Message-State: AOAM5305/tIbswx89KWIeo6A0ly1yZ4glYu6M5gbdPVWF38VeAvnHvn+
 o6x40W6td1qQqGiiZyXDQ7M=
X-Google-Smtp-Source: ABdhPJw4NwuvaTFUJ06O9gdmNc5bF9TTa83gE/UxLK90XtyKmstGli/mWH+gg7QwhvIx0xOcvwoU4g==
X-Received: by 2002:a1c:2d83:: with SMTP id
 t125mr27363966wmt.187.1593609802266; 
 Wed, 01 Jul 2020 06:23:22 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id h14sm7676165wrt.36.2020.07.01.06.23.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jul 2020 06:23:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>,
 "'Andrew Cooper'" <andrew.cooper3@citrix.com>
References: <20200701115842.18583-1-andrew.cooper3@citrix.com>
 <41b49d79-e0fa-161a-bb27-a9a2ccf361f5@suse.com>
In-Reply-To: <41b49d79-e0fa-161a-bb27-a9a2ccf361f5@suse.com>
Subject: RE: [PATCH for-4.14] x86/spec-ctrl: Protect against CALL/JMP
 straight-line speculation
Date: Wed, 1 Jul 2020 14:23:18 +0100
Message-ID: <001201d64faa$ca8a6370$5f9f2a50$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQEAcbj1SdXayzh+G/7yKy5sunlvLgKYQmRNqomv8RA=
Content-Language: en-gb
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
Cc: 'Xen-devel' <xen-devel@lists.xenproject.org>, 'Wei Liu' <wl@xen.org>,
 =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 01 July 2020 13:27
> To: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: Xen-devel <xen-devel@lists.xenproject.org>; Wei Liu <wl@xen.org>; =
Roger Pau Monn=C3=A9
> <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>
> Subject: Re: [PATCH for-4.14] x86/spec-ctrl: Protect against CALL/JMP =
straight-line speculation
>=20
> On 01.07.2020 13:58, Andrew Cooper wrote:
> > Some x86 CPUs speculatively execute beyond indirect CALL/JMP =
instructions.
> >
> > With CONFIG_INDIRECT_THUNK / Retpolines, indirect CALL/JMP =
instructions are
> > converted to direct CALL/JMP's to __x86_indirect_thunk_REG(), =
leaving just a
> > handful of indirect JMPs implementing those stubs.
> >
> > There is no architectrual execution beyond an indirect JMP, so use =
INT3 as
> > recommended by vendors to halt speculative execution.  This is =
shorter than
> > LFENCE (which would also work fine), but also shows up in logs if we =
do
> > unexpected execute them.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Release-acked-by: Paul Durrant <paul@xen.org>


