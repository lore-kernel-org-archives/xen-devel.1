Return-Path: <SRS0=u+XK=ZZ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C90AC432C0
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 15:33:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57CCE2070A
	for <xen-devel@archiver.kernel.org>; Tue,  3 Dec 2019 15:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57CCE2070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icAAe-0005V3-EP; Tue, 03 Dec 2019 15:33:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icAAd-0005Uy-2R
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 15:32:59 +0000
X-Inumbo-ID: 2e774b44-15e2-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e774b44-15e2-11ea-9db0-bc764e2007e4;
 Tue, 03 Dec 2019 15:32:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1429169B9B;
 Tue,  3 Dec 2019 15:32:57 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7ed6d33a-8f99-684b-f5ca-d3f4cb8d984b@suse.com>
Date: Tue, 3 Dec 2019 16:33:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129112851.19273-5-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] x86/apic: allow enabling x2APIC mode
 regardless of interrupt remapping
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMjoyOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9hcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYvYXBpYy5jCj4gQEAgLTQ5Miw3ICs0
OTIsOCBAQCBzdGF0aWMgdm9pZCBfX2VuYWJsZV94MmFwaWModm9pZCkKPiAgCj4gIHN0YXRpYyB2
b2lkIHJlc3VtZV94MmFwaWModm9pZCkKPiAgewo+IC0gICAgaW9tbXVfZW5hYmxlX3gyYXBpYygp
Owo+ICsgICAgaWYgKCBpb21tdV9zdXBwb3J0c194MmFwaWMoKSApCj4gKyAgICAgICAgaW9tbXVf
ZW5hYmxlX3gyYXBpYygpOwoKVGhlIGhvb2tzIGNhbGxlZCBieSB0aGlzIGZ1bmN0aW9uIGFyZSBf
X2luaXQsIGFuZCBhdCBsZWFzdCB0aGUgQU1ECm9uZSBhbHNvIGlzbid0IChJIHRoaW5rKSBwcmVw
YXJlZCB0byBiZSBjYWxsZWQgbW9yZSB0aGFuIG9uY2UuCgpKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
