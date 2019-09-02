Return-Path: <SRS0=4VTz=W5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42FCEC3A59E
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 13:47:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2027E216C8
	for <xen-devel@archiver.kernel.org>; Mon,  2 Sep 2019 13:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2027E216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4mg1-0008FN-NN; Mon, 02 Sep 2019 13:47:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kzGk=W5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i4mfz-0008FE-M4
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 13:47:23 +0000
X-Inumbo-ID: 305af408-cd88-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 305af408-cd88-11e9-b95f-bc764e2007e4;
 Mon, 02 Sep 2019 13:47:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EB673AEAE;
 Mon,  2 Sep 2019 13:47:21 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
 <20190821163542.172063-1-dwmw2@infradead.org>
 <20190821163542.172063-4-dwmw2@infradead.org>
 <babca242-db4b-ca59-a1c0-bc1948f9c5b0@suse.com>
 <05a88a2bb876b3a165746b91774dc6ee05d86b03.camel@infradead.org>
 <daf8f6f2-aab5-6a4a-e6e4-c10082a70ad4@suse.com>
 <afe1e398b12579c48c6732b5efbcbc90db46ad22.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7d32e0e-62fa-df10-c27d-36bd482e7a88@suse.com>
Date: Mon, 2 Sep 2019 15:47:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <afe1e398b12579c48c6732b5efbcbc90db46ad22.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/5] x86/boot: Copy 16-bit boot variables
 back up to Xen image
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDkuMjAxOSAxNDo1MSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IE9uIE1vbiwgMjAx
OS0wOS0wMiBhdCAwOTo0NCArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFJpZ2h0LCBqdXN0
IG9uZSBwYWlyIHNob3VsZCBzdXJ2aXZlLiBBbmQgc2VlaW5nIGhvdyB0aGluZ3Mgd29yayBiZWZv
cmUKPj4gdGhpcyBzZXJpZXMgSSB0aGluayBpdCBpbmRlZWQgc2hvdWxkIGJlIGxpbmtlciBzY3Jp
cHQgc3ltYm9scyBvbmx5Lgo+PiBBbmQgdGhlbiB0aGUgQUxJR04oKSBhaGVhZCBvZiB0aGUgInN0
YXJ0IiBvbmVzIHNob3VsZCBzdGF5LCBidXQgdGhlcmUncwo+PiBubyBuZWVkIGZvciBvbmUgb24g
dGhlICJlbmQiIG9uZXMgKGFnYWluIGFzIGlzIGN1cnJlbnRseSB0aGUgY2FzZSkuCj4gCj4gSWYg
d2UgZG9uJ3QgYWxpZ24gdGhlIGVuZCBzeW1ib2wgdGhlbiB3ZSBuZWVkIHRvIGdvIGJhY2sgdG8g
cm91bmRpbmcgdXAKPiB0aGUgbGVuZ3RoIHdpdGggKChib290X3RyYW1wb2xpbmVfZW5kIC0gYm9v
dF90cmFtcG9saW5lX3N0YXJ0KSArIDMpIC8gNAo+IGFnYWluIHRob3VnaCwgcmlnaHQ/CgpXYWl0
IC0gd2UndmUgYmVlbiB0YWxraW5nIGFib3V0IHRoZSAqX3JlbCBzZWN0aW9ucyAvIHRhYmxlcyBo
ZXJlLApoYXZlbid0IHdlPyBBbGwgZW50cmllcyBvZiB0aGVzZSB0YWJsZXMgb3VnaHQgdG8gYmUg
b2YgZXF1YWwgc2l6ZSwKYW5kIGhlbmNlIGFsaWdubWVudCBvZiBhIHRhYmxlJ3MgImVuZCIgbGFi
ZWwgYXV0b21hdGljYWxseSBtYXRjaGVzCnRoZSBzaXplIG9mIHRoZSB0YWJsZSBlbnRyaWVzLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
