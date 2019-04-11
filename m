Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B39C10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:15:18 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44022184B
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:15:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="PEj+bskD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E44022184B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZXe-0002Cx-7o; Thu, 11 Apr 2019 13:14:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O6VX=SN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEZXc-0002Cs-Sm
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:14:56 +0000
X-Inumbo-ID: cc7ffb55-5c5b-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc7ffb55-5c5b-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 13:14:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1554988495; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=KnUpe57mCMvUfIWFNXkdRsxRKp/eRQqhRGIzQgsHG9U=;
 b=PEj+bskDFGLJdwaFBaxOPpryA5UBfCtp+db5SsvZ+JmF5LL8lIt9dBncx0vEN3Af9b8/Qz7o
 sKPhX+go2ULvXc/SCp2tXc5uSLvutn9mU+qcmNiuet6aYJxWgOzqacCtgaar+mVlud9NG0Lt
 ZM9OC5YSi5v/CFSgbNq3Ucdf3+A=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mxa.mailgun.org with ESMTP id 5caf3dcf.7fa3452e3df0-smtp-out-n01;
 Thu, 11 Apr 2019 13:14:55 -0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id z24so6691458wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2019 06:14:54 -0700 (PDT)
X-Gm-Message-State: APjAAAX+eAzypLqnSAYFvabbHAS73NaPDwm17HnJLiNLSU3Q4fRY2GH2
 03xiaCeu2X5VXoLrsuJkSOiyTFq8IrUqdsb3BeM=
X-Google-Smtp-Source: APXvYqzkYjpegs7GF88Gv4rEg13DU9erQgcUEV0/fERVaM2hooPGQkgLqMvvuHQCyMJTU/ojNW/GddZQe5WNRREnKTY=
X-Received: by 2002:a1c:14:: with SMTP id 20mr6509894wma.66.1554988493380;
 Thu, 11 Apr 2019 06:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <5CAEE3DF0200007800226799@prv1-mh.provo.novell.com>
In-Reply-To: <5CAEE3DF0200007800226799@prv1-mh.provo.novell.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 11 Apr 2019 07:14:16 -0600
X-Gmail-Original-Message-ID: <CABfawhk3-8RO1m-jMGsMtfDkZQjy14BYj=wG5FzKgJYyuzi2Kw@mail.gmail.com>
Message-ID:
 <CABfawhk3-8RO1m-jMGsMtfDkZQjy14BYj=wG5FzKgJYyuzi2Kw@mail.gmail.com>
To: Jan Beulich <JBeulich@suse.com>
Subject: Re: [Xen-devel] [PATCH v2] x86/mem-sharing: statically initialize
 audit list head and lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411131416.uRvQ5FEcx0Zp0kNR9g-iBCgbcVJhZyOKoGJ-q7oEJx4@z>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgMTI6NTEgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+IFRoZXJlJ3Mgbm8gbmVlZCB0byBleGVjdXRlIGFueSBpbnN0cnVj
dGlvbnMgZm9yIGRvaW5nIHNvLiBEcm9wIHRoZSB0aGVuCj4gZWZmZWN0aXZlbHkgZW1wdHkgbWVt
X3NoYXJpbmdfaW5pdCgpIGFsdG9nZXRoZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGlj
aCA8amJldWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
