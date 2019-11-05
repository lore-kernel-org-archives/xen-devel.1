Return-Path: <SRS0=K4eM=Y5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF06CC5DF60
	for <xen-devel@archiver.kernel.org>; Tue,  5 Nov 2019 15:12:53 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE0D0214D8
	for <xen-devel@archiver.kernel.org>; Tue,  5 Nov 2019 15:12:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="fk0i7/Sh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE0D0214D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS0VS-0005Xc-0d; Tue, 05 Nov 2019 15:12:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JBwa=Y5=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1iS0VR-0005XX-29
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:12:29 +0000
X-Inumbo-ID: adb08656-ffde-11e9-b678-bc764e2007e4
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adb08656-ffde-11e9-b678-bc764e2007e4;
 Tue, 05 Nov 2019 15:12:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1572966748; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=jAVSMZPVmE72EiI+W3+hmqx484N/OTvPYsSGTiM2Shw=;
 b=fk0i7/ShDsF+jR3CvvVgb62kjD+hQzeKiZzMuhYKA4/CsxfU2TxBFzv75DODGNp8qWRl0b+L
 Wqq3uNTmKh/Nayf3OI5ScNtqzonLqC21UQG6SULFpTC4FDpTcl9zcVxcFXgRg55W8LakgSGL
 AG9UqhtUssNDnxlo6VxwBoAG8pY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mxa.mailgun.org with ESMTP id 5dc19155.7f5ce478d570-smtp-out-n03;
 Tue, 05 Nov 2019 15:12:21 -0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id x4so10216001wmi.3
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2019 07:12:21 -0800 (PST)
X-Gm-Message-State: APjAAAUqaAKewKXwr31lI3MbjaXfFdIDMZrk+RqKqfPliiklut4Mlb/5
 9JTwJ9hPM3RyXlhdQn4Ggj1oNfWm9otXcxscBH0=
X-Google-Smtp-Source: APXvYqxvq0ttky6tLzCB02aqsRFIv/lHwX1mmMiGzzF2KoxI3+4AKJj3ZVzNFW/gQXkQy+mWRDvYYMXyl3EMklFYKXU=
X-Received: by 2002:a7b:c762:: with SMTP id x2mr2614419wmk.128.1572966740919; 
 Tue, 05 Nov 2019 07:12:20 -0800 (PST)
MIME-Version: 1.0
References: <20191105124332.4380-1-aisaila@bitdefender.com>
 <20191105124332.4380-2-aisaila@bitdefender.com>
In-Reply-To: <20191105124332.4380-2-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 5 Nov 2019 08:11:43 -0700
X-Gmail-Original-Message-ID: <CABfawhkuw3=F1au=NkNX0goDFh5BB5opR0sz4QDiAL_iZcDakg@mail.gmail.com>
Message-ID: <CABfawhkuw3=F1au=NkNX0goDFh5BB5opR0sz4QDiAL_iZcDakg@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH V1 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBOb3YgNSwgMjAxOSBhdCA1OjQzIEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCjxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBBdCB0aGlzIG1vbWVudCB0aGUgZGVm
YXVsdF9hY2Nlc3MgcGFyYW0gZnJvbSB4Y19hbHRwMm1fY3JlYXRlX3ZpZXcgaXMKPiBub3QgdXNl
ZC4KPgo+IFRoaXMgcGF0Y2ggYXNzaWducyBkZWZhdWx0X2FjY2VzcyB0byBwMm0tPmRlZmF1bHRf
YWNjZXNzIGF0IHRoZSB0aW1lIG9mCj4gaW5pdGlhbGl6aW5nIGEgbmV3IGFsdHAybSB2aWV3Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5j
b20+CgpSZXZpZXdlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
