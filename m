Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F633C10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 19:11:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C17F2175B
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 19:11:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FA3VG95G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C17F2175B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJNIj-0002hc-46; Wed, 24 Apr 2019 19:11:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mXGb=S2=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hJNIh-0002hX-7q
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 19:11:23 +0000
X-Inumbo-ID: bed00936-66c4-11e9-92d7-bc764e045a96
Received: from mail-40132.protonmail.ch (unknown [185.70.40.132])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bed00936-66c4-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 19:11:22 +0000 (UTC)
Date: Wed, 24 Apr 2019 19:11:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=default; t=1556133080;
 bh=czk4lRHKy9I6Ey+gSNjfx0AwfCLQfpdH/w1r3I09wn4=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=FA3VG95GlbOre/jShLWhZ4FlxsDVFEr2n5QT08D2C/f2zJavNfiI148yGQDeEiZr5
 dht5MFC19qtjZNfkjSQt1CkA8JVbhd7ejv80uPUdeTs+2Mj80Us9d5M4oqtp9nxvhk
 JJYVfsS5CrOfmJMkKhrnZ80EPaPMadzh7Y0OdOoU=
To: "Nuernberger, Stefan" <snu@amazon.de>
From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Message-ID:
 <IYKeY3DRbzPwRDUkrYcRwfK9dvmuUB6bSPUj8u_tfJBPFbe0BQo0AZZuTXW5DoIyjWE7A3WVwjjJAkkKW--M3_5sEwJR3krOpp4mH3mztVw=@protonmail.com>
In-Reply-To: <1556116072.914.54.camel@amazon.de>
References: <YOhUr-yh3i9FqDqcdQqL11UtyVP7-YReXRJkQKBvuECQRZNHOrOcihig0vnBkLiEj4StXz6rFVftF7Zl4q14uG-CayajSBtGdke6doinhgI=@protonmail.com>
 <1556116072.914.54.camel@amazon.de>
Feedback-ID: 7ARND6YmrAEqSXE0j3TLm6ZqYiFFaDDEkO_KW8fTUEW0kYwGM1KEsuPxEPVWH5YuEnR43INtqwIKH-usvnxVQQ==:Ext:ProtonMail
MIME-Version: 1.0
Subject: Re: [Xen-devel] VMI: singlestep event not received
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
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424191115.Ep1i70ZLqh9I33WoXy1Vg9_FHAsrlHhQFmTuxvtJGDs@z>

T24gV2VkbmVzZGF5IDI0IEFwcmlsIDIwMTkgMTY6MjcsIE51ZXJuYmVyZ2VyLCBTdGVmYW4gPHNu
dUBhbWF6b24uZGU+IHdyb3RlOgoKPiBPbiBTdW4sIDIwMTktMDQtMjEgYXQgMjI6MjYgKzAwMDAs
IE1hdGhpZXUgVGFycmFsIHdyb3RlOgo+Cj4gPiBIaSwKPiA+IEknbSBoYXZpbmcgYW4gaXNzdWUg
d2l0aCBYZW4ncyBWTUkgc3Vic3lzdGVtLgo+ID4gTXkgZ29hbCBpcyB0byBidWlsZCBhIHNtYWxs
IGRlYnVnZ2VyIHRoYXQgY2FuIGJyZWFrIGF0IGFuCj4gPiBhcHBsaWNhdGlvbidzIGVudHJ5cG9p
bnQKPiA+IG9uIFdpbmRvd3MgWFAsIHdoZW4gYSBuZXcgcHJvY2VzcyBpcyBiZWluZyBjcmVhdGVk
Lgo+Cj4gVGhlcmUgd2FzIGFuIGFubm91bmNlbWVudCBhIHdoaWxlIGJhY2sgb24gdGhpcyBsaXN0
IG9mIGEgbW9yZSBtb2Rlcm4KPiB4ZW4gZGVidWdnZXIgZm9yIFZNSSBwdXJwb3Nlcy4gTWF5YmUg
eW91IGFyZSBtb3JlIGx1Y2t5IHdpdGggdGhhdCBvbmU/Cj4KPiBodHRwczovL3d3dy5uY2Nncm91
cC50cnVzdC91cy9hYm91dC11cy9uZXdzcm9vbS1hbmQtZXZlbnRzL2Jsb2cvMjAxOS9qYQo+IG51
YXJ5L3hlbmRiZy1hLWZ1bGwtZmVhdHVyZWQtZGVidWdnZXItZm9yLXRoZS14ZW4taHlwZXJ2aXNv
ci8KPgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9uY2Nncm91cC94ZW5kYmcKPgo+IChJIGhhdmUgbm90
IHlldCB0cmllZCBpdCwgdGhvdWdoLikKClllcywgSSBoZWFyZCBvZiBpdCB2aWEgVGFtYXMuCkkg
YWN0dWFsbHkgY29udGFjdGVkIHRoZSBkZXZlbG9wZXIgYW5kIHRyaWVkIHRvIHNlZSBob3cgd2Ug
Y291bGQgd29yayB0b2dldGhlciBvbiB0aGUgc2FtZSBwcm9qZWN0LgoKSGUgbGlrZXMgdGhlIGlk
ZWEgb2YgYmVpbmcgaHlwZXJ2aXNvci1hZ25vc3RpYywgYW5kIGJlaW5nIGJ1aWx0IHVwb24gYW4g
YWJzdHJhY3Rpb24gbGF5ZXIuCgpUaGUgcmVhc29uIGhlIGNob29zZXMgbm90IHRvIHVzZSBMaWJW
TUkgd2FzIGJlY2F1c2Ugb2YgdGhlIGxhY2sgb2Ygc3VwcG9ydCBmb3IgWGVuIFBWIGd1ZXN0cywg
SUlSQy4KClBpbmcgQFRhbWFzLCBtYXliZSB5b3UgaGF2ZSBhbiBvcGluaW9uIGhlcmUuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
