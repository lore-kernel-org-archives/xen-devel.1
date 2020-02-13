Return-Path: <SRS0=/EcG=4B=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA46C2BA83
	for <xen-devel@archiver.kernel.org>; Thu, 13 Feb 2020 11:09:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76BDC24650
	for <xen-devel@archiver.kernel.org>; Thu, 13 Feb 2020 11:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76BDC24650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2CMX-0004Dk-Hd; Thu, 13 Feb 2020 11:08:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hLo+=4B=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1j2CMW-0004Df-A4
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 11:08:52 +0000
X-Inumbo-ID: 369e5ebe-4e51-11ea-ade5-bc764e2007e4
Received: from Galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 369e5ebe-4e51-11ea-ade5-bc764e2007e4;
 Thu, 13 Feb 2020 11:08:51 +0000 (UTC)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1j2CM3-0007iV-Ra; Thu, 13 Feb 2020 12:08:23 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 885FA1013A6; Thu, 13 Feb 2020 12:08:23 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Anchal Agarwal <anchalag@amazon.com>, mingo@redhat.com, bp@alien8.de,
 hpa@zytor.com, x86@kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 linux-pm@vger.kernel.org, linux-mm@kvack.org, kamatam@amazon.com,
 sstabellini@kernel.org, konrad.wilk@oracle.com, roger.pau@citrix.com,
 axboe@kernel.dk, davem@davemloft.net, rjw@rjwysocki.net, len.brown@intel.com,
 pavel@ucw.cz, peterz@infradead.org, eduval@amazon.com, sblbir@amazon.com,
 anchalag@amazon.com, xen-devel@lists.xenproject.org, vkuznets@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw@amazon.co.uk,
 fllinden@amaozn.com, benh@kernel.crashing.org
In-Reply-To: <20200212222935.GA3421@dev-dsk-anchalag-2a-9c2d1d96.us-west-2.amazon.com>
Date: Thu, 13 Feb 2020 12:08:23 +0100
Message-ID: <87a75m3ftk.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC PATCH v3 00/12] Enable PM hibernation on guest
 VMs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5jaGEsCgpBbmNoYWwgQWdhcndhbCA8YW5jaGFsYWdAYW1hem9uLmNvbT4gd3JpdGVzOgoKPiBI
ZWxsbywKPiBJIGFtIHNlbmRpbmcgb3V0IGEgdjMgdmVyc2lvbiBvZiBzZXJpZXMgb2YgcGF0Y2hl
cyB0aGF0IGltcGxlbWVudHMgZ3Vlc3QKPiBQTSBoaWJlcm5hdGlvbi4KCmNhbiB5b3UgcHJldHR5
IHBsZWFzZSB0aHJlYWQgeW91ciBwYXRjaCBzZXJpZXMgc28gdGhhdCB0aGUgMS1uL24gbWFpbHMK
aGF2ZSBhCgogIFJlZmVyZW5jZXM6IDxtZXNzYWdlLWlkLW9mLTAtb2Ytbi1tYWlsQHdoYXRldmVy
eW91cmNsaWVudHB1dHN0aGVyZT4KCmluIHRoZSBoZWFkZXJzPyBnaXQtc2VuZC1lbWFpbCBkb2Vz
IHRoYXQgcHJvcGVyIGFzIGRvIG90aGVyIHRvb2xzLgoKQ29sbGVjdGluZyB0aGUgaW5kaXZpZHVh
bCBtYWlscyBpcyBwYWluZnVsLgoKVGhhbmtzLAoKICAgICAgICB0Z2x4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
