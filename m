Return-Path: <SRS0=BDkE=UM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81ADC31E45
	for <xen-devel@archiver.kernel.org>; Thu, 13 Jun 2019 15:12:56 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B006720449
	for <xen-devel@archiver.kernel.org>; Thu, 13 Jun 2019 15:12:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="HCKoNHRo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B006720449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbRP3-0003Ny-TB; Thu, 13 Jun 2019 15:12:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Czlu=UM=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hbRP2-0003Np-A1
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 15:12:36 +0000
X-Inumbo-ID: ac51a93b-8ded-11e9-8980-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ac51a93b-8ded-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 15:12:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1560438754; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=parRFA5vbQh6G9kQtDRIN3EG7doB3Q1Sm8He5syg6cU=;
 b=HCKoNHRodaEi5YSuDKlWPmsCe9vAbWRGlBPpvvzTnicUbqYS3MVuQjcKY6/0F1QZw+j5kZkj
 8y6Qpp7vTxSf1DCJ94cZhzpHnmJ3EUzQODN++7RkvK3JfvWanqrwxNb5ST4iwXdCXPNhR2oP
 R9LErrHS5ABVvDWKqVj/VBvVxRU=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mxa.mailgun.org with ESMTP id 5d0267e2.7f0ffc7b4bf0-smtp-out-n01;
 Thu, 13 Jun 2019 15:12:34 -0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r16so2055630wrl.11
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 08:12:34 -0700 (PDT)
X-Gm-Message-State: APjAAAVH4K4NlxLAMmmrnmHIcBK1yCcTFLOWczXvd2WfdyHiUXPJXAI9
 0hFKp1/yXv4Zu+1WhO1+X6L/0AU4a4ozGoBLH4E=
X-Google-Smtp-Source: APXvYqyalnuj3UL+X1khtsG3I74QEOwy7o9QazWJNs6M9Yuzo8FWTg8FXAtvA/VhA9mSio3xLxONYMC88xXB256wz1o=
X-Received: by 2002:adf:81c8:: with SMTP id 66mr57962770wra.261.1560438753398; 
 Thu, 13 Jun 2019 08:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
In-Reply-To: <1560434447-14363-1-git-send-email-rcojocaru@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 13 Jun 2019 09:11:57 -0600
X-Gmail-Original-Message-ID: <CABfawhnyFohstOVKZT6+AA4kLDXUaQ2WpKtfB4v+tzU3TEhGaw@mail.gmail.com>
Message-ID: <CABfawhnyFohstOVKZT6+AA4kLDXUaQ2WpKtfB4v+tzU3TEhGaw@mail.gmail.com>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH RESEND] MAINTAINERS: hand over vm_event
 maintainership
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgODowMSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gUmVtb3ZlIG15c2VsZiBhcyB2bV9ldmVudCBt
YWludGFuZXIsIGFkZCBBbGV4YW5kcnUgYW5kIFBldHJlIGFzCj4gQml0ZGVmZW5kZXIgdm1fZXZl
bnQgbWFpbnRhaW5lcnMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYXp2YW4gQ29qb2NhcnUgPHJjb2pv
Y2FydUBiaXRkZWZlbmRlci5jb20+CgpBY2tlZC1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0
a2xlbmd5ZWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
