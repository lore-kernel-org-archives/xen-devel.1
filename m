Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1494C10F11
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 00:03:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA82920873
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 00:03:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZ5htrm1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA82920873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hENBA-000525-DX; Thu, 11 Apr 2019 00:02:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EL0W=SN=gmail.com=cjp256@srs-us1.protection.inumbo.net>)
 id 1hENB8-000520-Jx
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 00:02:54 +0000
X-Inumbo-ID: 27281a2a-5bed-11e9-92d7-bc764e045a96
Received: from mail-it1-x141.google.com (unknown [2607:f8b0:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 27281a2a-5bed-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 00:02:53 +0000 (UTC)
Received: by mail-it1-x141.google.com with SMTP id y204so6662841itf.3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Apr 2019 17:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p49K+H/8yE5bdsfAvGS0nvKFBzoxDnKrutCYoH8AyQ0=;
 b=fZ5htrm1d5Vgpspt1DhnY7z4vd+ck8xIx4+QrXmhngflx3REAjCrb85SlUViPISutx
 R7288j9EuS/LKuldpvQZ3VPN972q+vawhhWOt8KvoXhiw1DuiDpkx5aHkFkbeMgud7oP
 qjPLDCXeDaKMQUr2ilSEqKZxVu4S+iTPmGEFDkqkUtvYTyPELk7ETgIlC+MAqWBWpoEm
 S4g0nChuDyOJXbFk6z6JImSF6Jw9OiTCArwmwasTc7vdizpt3eTPB0+fPFlQQHrlfzlf
 lP0MeAGeAPuWVHB0T7r364bjgBJYQCTTV+nUCPWW1LPduChF/TKzz+UBs9AaVwAl1v44
 rsbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p49K+H/8yE5bdsfAvGS0nvKFBzoxDnKrutCYoH8AyQ0=;
 b=rdXUQs2qef+0MIJXYXp1AQkYezN5SwchUyywVBTa77ZigPeqNp5SF2KoamzuiLIRHl
 YlY8YimhrKZfL+/cbGBAlKZ74lAkiqZ4Z2UMwvggvDGbHb7QyDzpSeJyWXRfvqzTcc+1
 Frn33H0MQpW5PUiXni3sCmdn5bU2N5dST1mPQ74VXabHuneUogNS4FU20bba1hmMCj7U
 LDWrW4M9pGzwcOddjt+Ia/9QZMSbJWCZNeE7hvPssnsN1i1wWmRcXJRezGQuAmnWFIJf
 zJn8j5aWpUiKVbo0WgV7UJKMClrrvtKC7DivBTteuIgI0vagjUHuLdIZxl7bKJ8sbUiT
 qKHQ==
X-Gm-Message-State: APjAAAUkXyo1LSMZkdyO2ebA8qMmXUG+zJ6GWIkbeewxm4mMbPXUkt47
 1AEwFlLY1wG5AuWwnvkdizCNTkt1PK5708MiHhI44E0IlP0=
X-Google-Smtp-Source: APXvYqxlGYHwMCUX+ioVkOqwOQF917whcnLzvKbnTxzKC7HPAYUOik6dy45aCajgqlU8TqB1/vgL5J1kMFRkl4TgcG4=
X-Received: by 2002:a02:5144:: with SMTP id s65mr30124690jaa.27.1554940972724; 
 Wed, 10 Apr 2019 17:02:52 -0700 (PDT)
MIME-Version: 1.0
References: <1554406611-11262-1-git-send-email-cjp256@gmail.com>
In-Reply-To: <1554406611-11262-1-git-send-email-cjp256@gmail.com>
From: Chris Patterson <cjp256@gmail.com>
Date: Wed, 10 Apr 2019 20:02:41 -0400
Message-ID:
 <CABZSBQebNYDTSGZTMNJv6C2qvcNkW=MDMbbB2_1aUu37840yzQ@mail.gmail.com>
To: xen-devel@lists.xenproject.org
Subject: Re: [Xen-devel] [PATCH 1/2] libxl: Add virtio vga interface support
 for qemu
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
Cc: Wei Liu <wei.liu2@citrix.com>, Chris Patterson <pattersonc@ainfosec.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411000241.xbsOoZygkHhpbl2o0b0DJnh26nSwV_mB9pJobmB4UmM@z>

Rm9yIGFueW9uZSBsb29raW5nIGF0IHRoaXMuLi4gd2hpbGUgSSBoYXZlIHRlc3RlZCBhbmQgdmVy
aWZpZWQgdGhhdApib3RoIHZpcnRpby1ncHUgYW5kIFZpckdMIHdvcmssIGl0J3Mgbm90IHdpdGhv
dXQgc29tZSBoaWNjdXAuCgpJIGhhdmUgYmVlbiBydW5uaW5nIFVidW50dSAxOS4wNCB3aXRoIHRo
aXMgY29uZmlnIGZvciBhIGZldyBkYXlzIGFuZCBJCmhhdmUgaGFkIGEgY291cGxlIFZNIGZyZWV6
ZXMuICd4bCBkbWVzZycgaXMgc3BhbW1pbmcgdGhlIGZvbGxvd2luZwpyZXBlYXRlZGx5OgooWEVO
KSBpcnEuYzoyNDc5OiBkb20zOiBwaXJxIDE0MyBvciBlbXVpcnEgLTMgYWxyZWFkeSBtYXBwZWQK
ClNlZW1zIHRvIGJlIHJlbGF0ZWQgdG8gTVNJLVggZm9yIHRoZSBkZXZpY2UsIGJ1dCBJIGhhdmVu
J3QgeWV0IGhhZCBhCmNoYW5jZSB0byBkaWcgaW50byBpdC4gIE1heWJlIHNvbWVvbmUga25vd3Mg
aWYgdGhpcyBpcyB0byBiZSBleHBlY3RlZApnaXZlbiB0aGUgc3RhdGUgb2YgdGhpbmdzPyA6KQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
