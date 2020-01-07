Return-Path: <SRS0=cwKM=24=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C268C33C8C
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jan 2020 16:35:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB02D2081E
	for <xen-devel@archiver.kernel.org>; Tue,  7 Jan 2020 16:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB02D2081E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iorp2-000728-LH; Tue, 07 Jan 2020 16:35:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=a7vm=24=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iorp0-00071q-Mv
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:35:10 +0000
X-Inumbo-ID: aaf062a7-316b-11ea-ac5c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaf062a7-316b-11ea-ac5c-12813bfff9fa;
 Tue, 07 Jan 2020 16:35:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5870EAC7C;
 Tue,  7 Jan 2020 16:35:09 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-6-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <848ae9be-6bce-910e-808b-c8eef85c5b7e@suse.com>
Date: Tue, 7 Jan 2020 17:35:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200106155423.9508-6-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 5/6] x86/boot: Don't map 0 during boot
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDEuMjAyMCAxNjo1NCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvYm9vdC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC94ODYvYm9vdC9oZWFkLlMKPiBAQCAt
Njg5LDEyICs2ODksMTUgQEAgdHJhbXBvbGluZV9zZXR1cDoKPiAgICAgICAgICBzdWIgICAgICQo
TDJfUEFHRVRBQkxFX0VOVFJJRVMqOCksJWVheAo+ICAgICAgICAgIGxvb3AgICAgMWIKPiAgCj4g
LSAgICAgICAgLyoKPiAtICAgICAgICAgKiBEdXJpbmcgYm9vdCwgaG9vayA0a0IgbWFwcGluZ3Mg
b2YgZmlyc3QgMk1CIG9mIG1lbW9yeSBpbnRvIEwyLgo+IC0gICAgICAgICAqIFRoaXMgYXZvaWRz
IG1peGluZyBjYWNoYWJpbGl0eSBmb3IgdGhlIGxlZ2FjeSBWR0EgcmVnaW9uLgo+IC0gICAgICAg
ICAqLwo+IC0gICAgICAgIGxlYSAgICAgX19QQUdFX0hZUEVSVklTT1Irc3ltX2VzaShsMV9pZGVu
dG1hcCksJWVkaQo+IC0gICAgICAgIG1vdiAgICAgJWVkaSxzeW1fZnMobDJfYm9vdG1hcCkKPiAr
ICAgICAgICAvKiBNYXAgdGhlIHBlcm1lbnRhbnQgdHJhbXBvbGluZSBwYWdlIGludG8gbHsxLDJ9
X2Jvb3RtYXBbXS4gKi8KCiJwZXJtYW5lbnQiPwoKPiArICAgICAgICBtb3YgICAgIHN5bV9lc2ko
dHJhbXBvbGluZV9waHlzKSwgJWVkeAo+ICsgICAgICAgIG1vdiAgICAgJWVkeCwgJWVjeAo+ICsg
ICAgICAgIG9yICAgICAgJF9fUEFHRV9IWVBFUlZJU09SX1JYLCAlZWR4IC8qICVlZHggPSBQVEUg
dG8gd3JpdGUgICovCj4gKyAgICAgICAgc2hyICAgICAkUEFHRV9TSElGVCwgJWVjeCAgICAgICAg
ICAgLyogJWVjeCA9IFNsb3QgdG8gd3JpdGUgKi8KCkZvbGxvd2luZyB0aGUgTEVBIG1vZGVsIGZ1
cnRoZXIgZG93biwgaG93IGFib3V0CgogICAgICAgIG1vdiAgICAgc3ltX2VzaSh0cmFtcG9saW5l
X3BoeXMpLCAlZWN4CiAgICAgICAgbGVhICAgICBfX1BBR0VfSFlQRVJWSVNPUl9SWCglZWN4KSwg
JWVkeCAvKiAlZWR4ID0gUFRFIHRvIHdyaXRlICAqLwogICAgICAgIHNociAgICAgJFBBR0VfU0hJ
RlQsICVlY3ggICAgICAgICAgICAgICAgLyogJWVjeCA9IFNsb3QgdG8gd3JpdGUgKi8KCj8gQW55
d2F5LCB3aXRoIG9yIHdpdGhvdXQgdGhpcyBhZGp1c3RtZW50ClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
