Return-Path: <SRS0=lSNx=W2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D542C3A59B
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 14:25:46 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7092223407
	for <xen-devel@archiver.kernel.org>; Fri, 30 Aug 2019 14:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7092223407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3hqI-00027B-2W; Fri, 30 Aug 2019 14:25:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xdvb=W2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3hqG-000273-5M
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 14:25:32 +0000
X-Inumbo-ID: 0472c2c4-cb32-11e9-b95f-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0472c2c4-cb32-11e9-b95f-bc764e2007e4;
 Fri, 30 Aug 2019 14:25:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3077CAE50;
 Fri, 30 Aug 2019 14:25:29 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <012a0e6de52d8a0ad50b0b784362cf509768990e.camel@infradead.org>
 <20190821163542.172063-1-dwmw2@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <67dbd0fb-7c97-3e47-8790-3c7d6692b4c8@suse.com>
Date: Fri, 30 Aug 2019 16:25:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821163542.172063-1-dwmw2@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/5] x86/boot: Only jump into low
 trampoline code for real-mode boot
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDguMjAxOSAxODozNSwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ib290L2hlYWQuUwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ib290L2hlYWQuUwo+IEBA
IC03MjcsNyArNzI3LDE3IEBAIHRyYW1wb2xpbmVfc2V0dXA6Cj4gICAgICAgICAgLyogU3dpdGNo
IHRvIGxvdy1tZW1vcnkgc3RhY2sgd2hpY2ggbGl2ZXMgYXQgdGhlIGVuZCBvZiB0cmFtcG9saW5l
IHJlZ2lvbi4gKi8KPiAgICAgICAgICBtb3YgICAgIHN5bV9mcyh0cmFtcG9saW5lX3BoeXMpLCVl
ZGkKPiAgICAgICAgICBsZWEgICAgIFRSQU1QT0xJTkVfU1BBQ0UrVFJBTVBPTElORV9TVEFDS19T
UEFDRSglZWRpKSwlZXNwCj4gKyAgICAgICAgY21wYiAgICAkMCwgc3ltX2ZzKHNraXBfcmVhbG1v
ZGUpCj4gKyAgICAgICAganogICAgICAxZgo+ICsgICAgICAgIC8qIElmIG5vLXJlYWwtbW9kZSwg
anVtcCBzdHJhaWdodCB0byB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5ICovCj4gKyAgICAgICAg
bGVhICAgICB0cmFtcG9saW5lX3Byb3Rtb2RlX2VudHJ5LXRyYW1wb2xpbmVfc3RhcnQoJWVkaSks
JWVheAo+ICsgICAgICAgIC8qIEVCWCA9PSAwIGluZGljYXRlcyB3ZSBhcmUgdGhlIEJQIChCb290
IFByb2Nlc3NvcikuICovCj4gKyAgICAgICAgeG9yICAgICAlZWJ4LCVlYngKPiArICAgICAgICBq
bXAgICAgIDJmCj4gKzE6Cj4gKyAgICAgICAgLyogR28gdmlhIDE2LWJpdCBjb2RlIGluIHRyYW1w
b2xpbmVfYm9vdF9jcHVfZW50cnkgKi8KPiAgICAgICAgICBsZWEgICAgIHRyYW1wb2xpbmVfYm9v
dF9jcHVfZW50cnktdHJhbXBvbGluZV9zdGFydCglZWRpKSwlZWF4Cj4gKzI6Cj4gICAgICAgICAg
cHVzaGwgICAkQk9PVF9DUzMyCj4gICAgICAgICAgcHVzaCAgICAlZWF4CgpQcm92aWRlZCBpdCBn
b2VzIGluIHRvZ2V0aGVyIHdpdGggdGhlIHN1YnNlcXVlbnQgY2hhbmdlIHJlbW92aW5nIHRoaXMK
ZG91YmxlIGp1bXAgYWdhaW4KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCk9mIGNvdXJzZSBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSBpZiB3aXRoaW4geW91IGFkZGl0
aW9uIHlvdSdkIGJlZW4KY29uc2lzdGVudCB3aXRoIGFkZGluZyAob3Igbm90KSBibGFua3MgYWZ0
ZXIgY29tbWFzIHNlcGFyYXRpbmcgaW5zbgpvcGVyYW5kcy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
