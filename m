Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE156C10F11
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:42:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B631320656
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B631320656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFxBU-0002Lk-13; Mon, 15 Apr 2019 08:41:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xdBD=SR=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hFxBS-0002Lf-AM
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:41:46 +0000
X-Inumbo-ID: 4c88f4d0-5f5a-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4c88f4d0-5f5a-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 08:41:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88024374;
 Mon, 15 Apr 2019 01:41:44 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B2A23F68F;
 Mon, 15 Apr 2019 01:41:43 -0700 (PDT)
Date: Mon, 15 Apr 2019 09:41:39 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Amit Tomer <amittomer25@gmail.com>
Message-ID: <20190415094139.25256f06@donnerap.cambridge.arm.com>
In-Reply-To: <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
 <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
 <CABHD4K98oAZURhvraK5F1RHkv0j2YzaCkV8bsBX-=Cc3xc0irA@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415084139.OhYK0fhtV1cyu0INOVCvB4CwifsY7uzLMMCI-1-3wXo@z>

T24gTW9uLCAxNSBBcHIgMjAxOSAxMzo0MTo0MSArMDUzMApBbWl0IFRvbWVyIDxhbWl0dG9tZXIy
NUBnbWFpbC5jb20+IHdyb3RlOgoKPiBIZWxsbywKPiAKPiA+IEFmdGVyIHRhbGtpbmcgdmlhIElS
QywgdGhlIHByb2JsZW0gaXMgUFBJcywgdGhhdCB0aGlzIHBsYXRmb3JtIHVzZXMgZm9yCj4gPiBQ
TVUgaW50ZXJydXB0cy4gV2hlbiBYZW4gdHJpZXMgdG8gc2V0dXAgdGhlIElSUSBmb3J3YXJkaW5n
IGZvciBEb20wIGZvcgo+ID4gdGhpcyBkZXZpY2UsIGl0IGZhaWxzIGJlY2F1c2UgaXQgb25seSBz
dXBwb3J0cyBmb3J3YXJkaW5nIFNQSXMuCj4gPiBTbyBpbnRlcmVzdGluZ2x5IHdlIGVycm9uZW91
c2x5IGZvcndhcmRlZCBBNTMgUE1VcyAodGhvc2UgdGhhdCBhcmUKPiA+IGRlc2NyaWJlZCBieSB0
aGF0IHBhcnRpY3VsYXIgY29tcGF0aWJsZSBzdHJpbmcgb25seSkgdG8gRG9tMCBmb3IgcXVpdGUg
YQo+ID4gd2hpbGUsIGJ1dCBub2JvZHkgbm90aWNlZCAob3IgY2FyZWQpLgo+ID4KPiA+IEFtaXQs
IHBsZWFzZSBhZGp1c3QgdGhlIGNvbW1pdCBtZXNzYWdlIGFjY29yZGluZ2x5Lgo+ID4gIAo+IE9r
IGJ1dCBvcmlnaW5hbCBjb21taXQgImQ0NWU5YjdjNTM0MjhhMmFhNGQwNjc5MjdlN2VmNWUzMDc4
M2ZiOGIiIHRoYXQgYmxhY2tsaXN0Cj4gUE1VJ3MgY2xlYXJseSBzdGF0ZXMgdGhhdCBpc3N1ZSBp
cyBkdWUgdG8gUFBJIGFuZCB0aGF0IGNhbiBub3QgYmUKPiByb3V0ZWQgdG8gZ3Vlc3QuCj4gCj4g
SSB0aG91Z2h0LCBUaGlzIHBhdGNoIGlzIGp1c3QgY29udGludWF0aW9uIG9mIHNhbWUuCgpTdXJl
LCBidXQgSnVsaWVuIHdhcyBhc2tpbmcgZm9yIGEgcmVhc29uIGZvciB0aGlzIHBhdGNoIGluIHRo
ZSBjb21taXQKbWVzc2FnZS4gVGhlcmUgYXJlIHF1aXRlIHNvbWUgcGxhdGZvcm1zIHdoaWNoIHVz
ZSB0aGlzIGNvbXBhdGlibGUgc3RyaW5nCmFscmVhZHksIGFuZCBub25lIG9mIHRoZW0gZmFpbGVk
IHNvIGZhci4gVGhpcyBpcyBiZWNhdXNlIHRoZXkgdXNlIFNQSXMsCmJ1dCBhcyB0aGUgb3JpZ2lu
YWwgY29tbWl0IG1lc3NhZ2UgbWVudGlvbnMgdGhlcmUgYXJlIG1vcmUgaXNzdWVzIHRoYW4ganVz
dAp0aGUgSVJRcy4KCkFsbCB0aGlzIHNob3VsZCBiZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIEFz
IHlvdSBoYXZlIHNlZW4geW91cnNlbGYgaW4gSWFuJ3MKY29tbWl0LCBpdCdzIHF1aXRlIGhlbHBm
dWwgbGF0ZXIgb24uCgpTbyB5b3Ugc2hvdWxkIG1lbnRpb246CmEpIHRoZSBwcm9ibGVtIHlvdSBl
bmNvdW50ZXJlZDogUFBJIGZvcndhcmRpbmcgZGVuaWVkIG9uIGlNWDgKYikgdGhlIHJlYXNvbiBm
b3IgdGhlIHByb2JsZW06IEE1MyBQTVUgbm90IGJsYWNrbGlzdGVkCmMpIHRoZSBmaXg6IGFkZGlu
ZyB0aGUgQTUzIGNvbXBhdGlibGUgc3RyaW5nIHRvIHRoZSBibGFja2xpc3QKCkNoZWVycywKQW5k
cmUuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
