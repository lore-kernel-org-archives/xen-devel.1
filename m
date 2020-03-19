Return-Path: <SRS0=5+kv=5E=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD83C4332E
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 10:03:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89E8B20757
	for <xen-devel@archiver.kernel.org>; Thu, 19 Mar 2020 10:03:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89E8B20757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEs1E-0000os-NO; Thu, 19 Mar 2020 10:03:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEs1D-0000om-Cj
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 10:03:15 +0000
X-Inumbo-ID: d916c40a-69c8-11ea-bec1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d916c40a-69c8-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 10:03:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2511BB14B;
 Thu, 19 Mar 2020 10:03:14 +0000 (UTC)
To: Miroslav Benes <mbenes@suse.cz>
References: <20200319095606.23627-1-mbenes@suse.cz>
 <20200319095606.23627-3-mbenes@suse.cz>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ca0a03c-734c-3a9e-90fd-8209046c5f01@suse.com>
Date: Thu, 19 Mar 2020 11:03:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319095606.23627-3-mbenes@suse.cz>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/xen: Make the secondary CPU idle
 tasks reliable
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
Cc: jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, jpoimboe@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 live-patching@vger.kernel.org, boris.ostrovsky@oracle.com, jslaby@suse.cz,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAyMCAxMDo1NiwgTWlyb3NsYXYgQmVuZXMgd3JvdGU6Cj4gLS0tIGEvYXJjaC94
ODYveGVuL3NtcF9wdi5jCj4gKysrIGIvYXJjaC94ODYveGVuL3NtcF9wdi5jCj4gQEAgLTUzLDYg
KzUzLDcgQEAgc3RhdGljIERFRklORV9QRVJfQ1BVKHN0cnVjdCB4ZW5fY29tbW9uX2lycSwgeGVu
X2lycV93b3JrKSA9IHsgLmlycSA9IC0xIH07Cj4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1
Y3QgeGVuX2NvbW1vbl9pcnEsIHhlbl9wbXVfaXJxKSA9IHsgLmlycSA9IC0xIH07Cj4gIAo+ICBz
dGF0aWMgaXJxcmV0dXJuX3QgeGVuX2lycV93b3JrX2ludGVycnVwdChpbnQgaXJxLCB2b2lkICpk
ZXZfaWQpOwo+ICtleHRlcm4gdW5zaWduZWQgY2hhciBhc21fY3B1X2JyaW5ndXBfYW5kX2lkbGVb
XTsKCkltbyB0aGlzIHdvdWxkIGJldHRlciByZWZsZWN0IHRoZSBhY3R1YWwgdHlwZSwgaS5lLiBi
ZSBhIGZ1bmN0aW9uCmRlY2wuIElmIGxlZnQgYXMgYW4gYXJyYXkgb25lLCBJIGd1ZXNzIHlvdSBt
YXkgd2FudCB0byBhZGQgY29uc3QuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
