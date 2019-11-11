Return-Path: <SRS0=qr0R=ZD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C87EC43331
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 09:56:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D16A20856
	for <xen-devel@archiver.kernel.org>; Mon, 11 Nov 2019 09:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D16A20856
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iU6Qe-0003g7-DZ; Mon, 11 Nov 2019 09:56:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SdMF=ZD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iU6Qd-0003g2-H2
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2019 09:56:11 +0000
X-Inumbo-ID: 7c31d08c-0469-11ea-adbe-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c31d08c-0469-11ea-adbe-bc764e2007e4;
 Mon, 11 Nov 2019 09:56:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 58840AF84;
 Mon, 11 Nov 2019 09:56:08 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191110092506.98925-1-roger.pau@citrix.com>
 <20191110092506.98925-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <812c72dc-c713-9038-5e63-68f3c0b29be6@suse.com>
Date: Mon, 11 Nov 2019 10:56:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191110092506.98925-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 2/2] x86/ioapic: fix
 clear_IO_APIC_pin write of raw entries
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 SergeyDyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTEuMjAxOSAxMDoyNSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IGNsZWFyX0lPX0FQ
SUNfcGluIGNhbiBiZSBjYWxsZWQgYWZ0ZXIgdGhlIGlvbW11IGhhcyBiZWVuIGVuYWJsZWQsIGFu
ZAo+IHVzaW5nIHJhdyByZWFkcyBhbmQgd3JpdGVzIHRvIG1vZGlmeSBJTy1BUElDIGVudHJpZXMg
dGhhdCBoYXZlIGJlZW4KPiBzZXR1cCB0byB1c2UgaW50ZXJydXB0IHJlbWFwcGluZyBjYW4gbGVh
ZCB0byBpc3N1ZXMgYXMgc29tZSBvZiB0aGUKPiBmaWVsZHMgaGF2ZSBkaWZmZXJlbnQgbWVhbmlu
ZyB3aGVuIHRoZSBJTy1BUElDIGVudHJ5IGlzIHNldHVwIHRvIHBvaW50Cj4gdG8gYW4gaW50ZXJy
dXB0IHJlbWFwcGluZyB0YWJsZSBlbnRyeS4KPiAKPiBUaGUgZm9sbG93aW5nIEFTU0VSVCBpbiBB
TUQgSU9NTVUgY29kZSB0cmlnZ2VycyBhZnRlcndhcmRzIGFzIGEgcmVzdWx0Cj4gb2YgdGhlIHJh
dyBjaGFuZ2VzIHRvIElPLUFQSUMgZW50cmllcyBwZXJmb3JtZWQgYnkgY2xlYXJfSU9fQVBJQ19w
aW4uCj4gCj4gKFhFTikgWyAgIDEwLjA4MjE1NF0gRU5BQkxJTkcgSU8tQVBJQyBJUlFzCj4gKFhF
TikgWyAgIDEwLjA4Nzc4OV0gIC0+IFVzaW5nIG5ldyBBQ0sgbWV0aG9kCj4gKFhFTikgWyAgIDEw
LjA5MzczOF0gQXNzZXJ0aW9uICdnZXRfcnRlX2luZGV4KHJ0ZSkgPT0gb2Zmc2V0JyBmYWlsZWQg
YXQgaW9tbXVfaW50ci5jOjMyOAo+IAo+IEZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIHRoYXQgbW9k
aWZpY2F0aW9ucyB0byBlbnRyaWVzIGFyZSBwZXJmb3JtZWQgaW4KPiBub24gcmF3IG1vZGUuCgou
Li4gd2hlbiBmaWVsZHMgYXJlIGFmZmVjdGVkIHdoaWNoIG1heSBlaXRoZXIgaGF2ZSBjaGFuZ2Vk
IG1lYW5pbmcKd2l0aCBpbnRlcnJ1cHQgcmVtYXBwaW5nLCBvciB3aGljaCBtYXkgbmVlZCBtaXJy
b3JpbmcgaW50byBJUlRFcy4KCj4gUmVwb3J0ZWQtYnk6IFNlcmdleSBEeWFzbGkgPHNlcmdleS5k
eWFzbGlAY2l0cml4LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KCldpdGggdGhlIGFib3ZlIGFkZGl0aW9uIChvciBzb21ldGhpbmcg
c3Vic3RhbnRpYWxseSBzaW1pbGFyKQpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgpPZiBjb3Vyc2UgdGhlIGFkanVzdG1lbnQgaXMgZWFzeSBlbm91Z2ggdG8gZG8g
d2hpbGUgY29tbWl0dGluZy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
