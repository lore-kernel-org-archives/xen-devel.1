Return-Path: <SRS0=n2L7=XU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=FROM_EXCESS_BASE64,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC83C432C2
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 09:18:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6022820872
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 09:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6022820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3RW-0003Lt-EW; Wed, 25 Sep 2019 09:18:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD3RV-0003Ll-Fb
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:18:37 +0000
X-Inumbo-ID: 741145fe-df75-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 741145fe-df75-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 09:18:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78387B652;
 Wed, 25 Sep 2019 09:18:35 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <41956413-f33d-f9b9-3830-f58d4fde7b0e@suse.com>
Date: Wed, 25 Sep 2019 11:18:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <845737d3-e16e-61d7-7733-0f8b9eddfb45@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] SVM: correct CPUID event processing
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
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMTkgMTI6MzcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IGh2bV9tb25pdG9yX2NwdWlk
KCkgZXhwZWN0cyB0aGUgaW5wdXQgcmVnaXN0ZXJzLCBub3QgdHdvIG9mIHRoZSBvdXRwdXRzLgo+
IAo+IEhvd2V2ZXIsIG9uY2UgaGF2aW5nIG1hZGUgdGhlIG5lY2Vzc2FyeSBhZGp1c3RtZW50LCB0
aGUgU1ZNIGFuZCBWTVgKPiBmdW5jdGlvbnMgYXJlIHNvIHNpbWlsYXIgdGhhdCB0aGV5IHNob3Vs
ZCBiZSBmb2xkZWQgKHRodXMgYXZvaWRpbmcKPiBmdXJ0aGVyIHNpbWlsYXIgYXN5bW1ldHJpZXMg
dG8gZ2V0IGludHJvZHVjZWQpLiBVc2UgdGhlIGJlc3Qgb2YgYm90aAo+IHdvcmxkcyBieSBlLmcu
IHVzaW5nICJjdXJyIiBjb25zaXN0ZW50bHkuIFRoaXMgdGhlbiBiZWluZyB0aGUgb25seQo+IGNh
bGxlciBvZiBodm1fY2hlY2tfY3B1aWRfZmF1bHRpbmcoKSwgZm9sZCBpbiB0aGF0IGZ1bmN0aW9u
IGFzIHdlbGwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
