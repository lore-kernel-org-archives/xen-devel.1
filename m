Return-Path: <SRS0=IYHG=ZK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43DDC432C3
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 11:21:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B77EC2067D
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 11:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B77EC2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWf5s-0005Ft-Cl; Mon, 18 Nov 2019 11:21:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWf5q-0005Fo-Sn
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 11:21:18 +0000
X-Inumbo-ID: 894d4ba2-09f5-11ea-984a-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 894d4ba2-09f5-11ea-984a-bc764e2007e4;
 Mon, 18 Nov 2019 11:21:16 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E62E3AFCC;
 Mon, 18 Nov 2019 11:21:15 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1573844370-29159-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6cdcc12-70e4-9405-b403-12c10875d7e9@suse.com>
Date: Mon, 18 Nov 2019 12:21:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1573844370-29159-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] passthrough: simplify locking
 and logging
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
 pdurrant@amazon.com, PaulDurrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxOTo1OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9w
Y2kuYwo+IEBAIC05MzIsMzAgKzkzMiwyNiBAQCBzdGF0aWMgaW50IGRlYXNzaWduX2RldmljZShz
dHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCBzZWcsIHVpbnQ4X3QgYnVzLAo+ICAgICAgICAgICAg
ICBicmVhazsKPiAgICAgICAgICByZXQgPSBoZC0+cGxhdGZvcm1fb3BzLT5yZWFzc2lnbl9kZXZp
Y2UoZCwgdGFyZ2V0LCBkZXZmbiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcGNpX3RvX2RldihwZGV2KSk7Cj4gLSAgICAgICAgaWYgKCAhcmV0ICkK
PiAtICAgICAgICAgICAgY29udGludWU7Cj4gLQo+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19F
UlIgIiVwZDogZGVhc3NpZ24gJTA0eDolMDJ4OiUwMnguJXUgZmFpbGVkICglZClcbiIsCj4gLSAg
ICAgICAgICAgICAgIGQsIHNlZywgYnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZu
KSwgcmV0KTsKPiAtICAgICAgICByZXR1cm4gcmV0Owo+ICsgICAgICAgIGlmICggcmV0ICkKPiAr
ICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICB9Cj4gIAo+ICAgICAgZGV2Zm4gPSBwZGV2LT5k
ZXZmbjsKPiAgICAgIHJldCA9IGhkLT5wbGF0Zm9ybV9vcHMtPnJlYXNzaWduX2RldmljZShkLCB0
YXJnZXQsIGRldmZuLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBjaV90b19kZXYocGRldikpOwo+ICAgICAgaWYgKCByZXQgKQo+IC0gICAgewo+IC0gICAg
ICAgIGRwcmludGsoWEVOTE9HX0dfRVJSLAo+IC0gICAgICAgICAgICAgICAgIiVwZDogZGVhc3Np
Z24gZGV2aWNlICglMDR4OiUwMng6JTAyeC4ldSkgZmFpbGVkXG4iLAo+IC0gICAgICAgICAgICAg
ICAgZCwgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pKTsKPiAtICAg
ICAgICByZXR1cm4gcmV0Owo+IC0gICAgfQo+ICsgICAgICAgIGdvdG8gb3V0Owo+ICAKPiAgICAg
IGlmICggcGRldi0+ZG9tYWluID09IGhhcmR3YXJlX2RvbWFpbiAgKQo+ICAgICAgICAgIHBkZXYt
PnF1YXJhbnRpbmUgPSBmYWxzZTsKPiAgCj4gICAgICBwZGV2LT5mYXVsdC5jb3VudCA9IDA7Cj4g
IAo+ICtvdXQ6Cj4gKyAgICBpZiAoIHJldCApCj4gKyAgICAgICAgcHJpbnRrKFhFTkxPR19HX0VS
UiAiJXBkOiBkZWFzc2lnbiAoJTA0eDolMDJ4OiUwMnguJXUpIGZhaWxlZCAoJWQpXG4iLAo+ICsg
ICAgICAgICAgICAgICBkLCBzZWcsIGJ1cywgUENJX1NMT1QoZGV2Zm4pLCBQQ0lfRlVOQyhkZXZm
biksIHJldCk7Cj4gKwoKU2luY2UsIGRlc3BpdGUgbXkgc3VnZ2VzdGlvbiB0byB0aGUgY29udHJh
cnksIHlvdSd2ZSBrZXB0IHRoZQppbnRyb2R1Y3Rpb24gb2YgZ290byBoZXJlLCB0aGUgbGFiZWwg
c2hvdWxkIGhhdmUgZ290IGluZGVudGVkCihhcyBwb2ludGVkIG91dCBmb3IgdjIpLiBXaXRoIHRo
aXMgYWRqdXN0ZWQgKHdoaWNoIGNvdWxkIGJlIGRvbmUKd2hpbGUgY29tbWl0dGluZykKQWNrZWQt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
