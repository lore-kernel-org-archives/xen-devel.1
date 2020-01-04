Return-Path: <SRS0=0OWO=2Z=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BEF0C2D0C2
	for <xen-devel@archiver.kernel.org>; Sat,  4 Jan 2020 18:43:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF28221734
	for <xen-devel@archiver.kernel.org>; Sat,  4 Jan 2020 18:43:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKnNY5KD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF28221734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inoNr-0008Iv-1e; Sat, 04 Jan 2020 18:42:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vM5p=2Z=gmail.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1inoNp-0008In-5O
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2020 18:42:45 +0000
X-Inumbo-ID: fe60f668-2f21-11ea-b6f1-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fe60f668-2f21-11ea-b6f1-bc764e2007e4;
 Sat, 04 Jan 2020 18:42:44 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id u71so46929141lje.11
 for <xen-devel@lists.xenproject.org>; Sat, 04 Jan 2020 10:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=72rbYMR10Isq3LSKQhbq7SuslMLr3om5+P+3+CGCuqI=;
 b=MKnNY5KD3mjf0wKERxH5lDj2d2Nb16iNARo5EOv3CSLMXJB2li9y73vHedpWpcjtEJ
 1BmRPIhdH13+vu6e7GTPnxvK5isCnc/Dv5ubLe8Hg1SKCJZboIhVF0XS1UpSd9BOIV63
 Tpy+fAbO60A/NezbUb6siTXwdGD8Fz1Vk3IIU2pgTis8V7y5BtSEBPQGn7HlSZfv7FdM
 z8TB2OzmSQDqG47J82e/qUyhZ1ey38kGTY/47aBqIZzvayjdNC4pvq5YzEplbKvnGZJi
 MjGvaC1tXE52PvjC+lza5BR5qLRGdlH3htu5EXmV/wewuuweM1LCzrUOAC4wat0CdLZw
 fLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=72rbYMR10Isq3LSKQhbq7SuslMLr3om5+P+3+CGCuqI=;
 b=jl72N5kZ34x6JOdCFj3GblPNGaefwZAWloxtvH7RAARCwZGWjNZKhpCaPybAQr3s0e
 7E5gxHIdGiDRSPDJgsk3p7QMFUptxciYdIHddoIfzPhNvklPFqxeywuWaUmTaMcSpnnf
 XRM6JF+kUr67RNxT4OpMUgDDIneZH7qNA/rzTTCO9JYWjqoP9EHjC/qT3BS9+O4uZjQR
 aqV5sDfy0ToB2LkKbt4U+37WdKsGeoZFFzl0MqsclgDeyOCsQTA1sG9FKvXBr6K2nVd7
 skLeD81Sjm/Th+kn4KTfd5tywusJrtgPoE3l5eh7CfYf98xMc9qbdCNSSzTz0ggfZ+rC
 dyew==
X-Gm-Message-State: APjAAAWTG4BtIJJXmDsx80lVcyqWz6riO4QnMVV7tLU04/EiqjF4P1M4
 LNh4G4/ONL2GoCm8OaKFRn2YT3RFTuFCKgBIaCw=
X-Google-Smtp-Source: APXvYqx/jQDS/lsc8Mx5R76+uDhMbQRXm/Y2YtKGVWcH3s43lQTroB5W7mAjRC7WGtyTMn8PTpXtuFxBte47XrWj61k=
X-Received: by 2002:a2e:880c:: with SMTP id x12mr49923408ljh.44.1578163363224; 
 Sat, 04 Jan 2020 10:42:43 -0800 (PST)
MIME-Version: 1.0
References: <20191227163224.4113837-1-george.dunlap@citrix.com>
 <20191227163224.4113837-4-george.dunlap@citrix.com>
In-Reply-To: <20191227163224.4113837-4-george.dunlap@citrix.com>
From: Nick Rosbrook <rosbrookn@gmail.com>
Date: Sat, 4 Jan 2020 13:42:32 -0500
Message-ID: <CAEBZRSfB5xcTg0AeZtU8S6b6Q-rgjWMrxnXEzD+_eCKPwqu75g@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH 4/9] go/xenlight: Fix CpuidPoliclyList
 conversion
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBFbXB0eSBHbyBzdHJpbmdzIHNob3VsZCBiZSBjb252ZXJ0ZWQgdG8gYG5pbGAgbGlieGxfY3B1
aWRfcG9saWN5X2xpc3Q7Cj4gb3RoZXJ3aXNlIGxpYnhsX2NwdWlkX3BhcnNlX2NvbmZpZyBnZXRz
IGNvbmZ1c2VkLgo+Cj4gQWxzbywgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QgcmV0dXJucyBhIHdl
aXJkIGVycm9yLCBub3QgYSAibm9ybWFsIgo+IGxpYnhsIGVycm9yOyBpZiBpdCByZXR1cm5zIG9u
ZSBvZiB0aGVzZSBub24tc3RhbmRhcmQgZXJyb3JzLCBjb252ZXJ0Cj4gaXQgdG8gRXJyb3JJbnZh
bC4KPgo+IFNpZ25lZC1vZmYtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4
LmNvbT4KCkxvb2tzIGdvb2QgdG8gbWUuIElmICJnb2xhbmcveGVubGlnaHQ6IGJlZ2luIEdvIHRv
IEMgdHlwZSBtYXJzaGFsaW5nIgppcyBjb21taXR0ZWQgYmVmb3JlIHRoaXMsIHRoZSBzaWduYXR1
cmUgb2YgdG9DIHdpbGwgbmVlZCB0byBiZSB1cGRhdGVkCmFzIHBlciB5b3VyIHN1Z2dlc3Rpb24u
CgpPdGhlcndpc2UsCgpSZXZpZXdlZC1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZv
c2VjLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
