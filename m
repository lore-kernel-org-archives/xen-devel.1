Return-Path: <SRS0=DbOf=ZM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70628C432C3
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 16:24:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40ECB206F4
	for <xen-devel@archiver.kernel.org>; Wed, 20 Nov 2019 16:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40ECB206F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSm0-0001td-Qu; Wed, 20 Nov 2019 16:24:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXSlz-0001tN-Rr
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:24:07 +0000
X-Inumbo-ID: 2c047c5e-0bb2-11ea-a31a-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c047c5e-0bb2-11ea-a31a-12813bfff9fa;
 Wed, 20 Nov 2019 16:24:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 760F969B90;
 Wed, 20 Nov 2019 16:24:05 +0000 (UTC)
To: Hongyan Xia <hongyax@amazon.com>, Wei Liu <wl@xen.org>
References: <cover.1570034362.git.hongyax@amazon.com>
 <f2f9ecb21bb40d0d41d169872b1cb18088f28e37.1570034362.git.hongyax@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <64e3eda5-ee11-77bf-a412-a0c004bd0e85@suse.com>
Date: Wed, 20 Nov 2019 17:24:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <f2f9ecb21bb40d0d41d169872b1cb18088f28e37.1570034362.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/9] x86/mm: map_pages_to_xen should have
 one exit path
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxOToxNiwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gQEAgLTUwMzQsMTAgKzUw
MzYsMTMgQEAgaW50IG1hcF9wYWdlc190b194ZW4oCj4gIAo+ICAgICAgd2hpbGUgKCBucl9tZm5z
ICE9IDAgKQo+ICAgICAgewo+IC0gICAgICAgIGwzX3BnZW50cnlfdCBvbDNlLCAqcGwzZSA9IHZp
cnRfdG9feGVuX2wzZSh2aXJ0KTsKPiArICAgICAgICBwbDNlID0gdmlydF90b194ZW5fbDNlKHZp
cnQpOwo+ICAKPiAgICAgICAgICBpZiAoICFwbDNlICkKPiAtICAgICAgICAgICAgcmV0dXJuIC1F
Tk9NRU07Cj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBBU1NFUlQocmMgPT0gLUVOT01FTSk7
Cj4gKyAgICAgICAgICAgIGdvdG8gb3V0Owo+ICsgICAgICAgIH0KCnJjIG5ldmVyIGdldHMgY2hh
bmdlZCB0byBhbnkgb3RoZXIgZXJyb3IgY29kZSwgYW5kIEkgYWxzbyBjYW4ndApmb3Jlc2VlIHRo
aXMgaGFwcGVuaW5nIGluIHRoZSBmdXR1cmUuIEFyZSBhbGwgdGhlc2UgQVNTRVJUKClzCihhbmQg
dGhlIGFzc29jaWF0ZWQgYnJhY2UgcGFpcnMpIHJlYWxseSBoZWxwZnVsPwoKQWxzbyBJIHRoaW5r
IEknZCBwcmVmZXIgYSBsZXNzIHN0cm9uZyB0aXRsZSwgZS5nLiAid291bGQgYmV0dGVyIgppbnN0
ZWFkIG9mICJzaG91bGQiLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
