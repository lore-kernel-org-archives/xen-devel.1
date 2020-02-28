Return-Path: <SRS0=X6vN=4Q=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBAAC3F2CF
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 09:11:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 463A424677
	for <xen-devel@archiver.kernel.org>; Fri, 28 Feb 2020 09:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 463A424677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7bfc-0006od-Px; Fri, 28 Feb 2020 09:10:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7bfb-0006oW-UK
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 09:10:55 +0000
X-Inumbo-ID: 391075fd-5a0a-11ea-98d9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 391075fd-5a0a-11ea-98d9-12813bfff9fa;
 Fri, 28 Feb 2020 09:10:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2C64EB11F;
 Fri, 28 Feb 2020 09:10:54 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200214195510.22667-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <faec15bd-0138-e6d5-a3a4-7627c4d3aa54@suse.com>
Date: Fri, 28 Feb 2020 10:11:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200214195510.22667-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/msr: Virtualise MSR_PLATFORM_ID properly
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

T24gMTQuMDIuMjAyMCAyMDo1NSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvbXNyLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbXNyLmMKPiBAQCAtMTQzLDYgKzE0Mywx
MyBAQCBpbnQgZ3Vlc3RfcmRtc3Ioc3RydWN0IHZjcHUgKnYsIHVpbnQzMl90IG1zciwgdWludDY0
X3QgKnZhbCkKPiAgICAgICAgICAvKiBOb3Qgb2ZmZXJlZCB0byBndWVzdHMuICovCj4gICAgICAg
ICAgZ290byBncF9mYXVsdDsKPiAgCj4gKyAgICBjYXNlIE1TUl9JQTMyX1BMQVRGT1JNX0lEOgo+
ICsgICAgICAgIGlmICggIShjcC0+eDg2X3ZlbmRvciAmIFg4Nl9WRU5ET1JfSU5URUwpIHx8Cj4g
KyAgICAgICAgICAgICAhKGJvb3RfY3B1X2RhdGEueDg2X3ZlbmRvciAmIFg4Nl9WRU5ET1JfSU5U
RUwpICkKClRoaXMgaGFzIHR1cm5lZCBvdXQgdG8gYmUgYW4gdW5mb3J0dW5hdGUgdHJhcCBmb3Ig
YmFja3BvcnRpbmcuCldoaWxlIEkgdW5kZXJzdGFuZCB1c2luZyAmIGhlcmUgaXMgdGhlIG1vcmUg
bW9kZXJuIGZvcm0sIGNvdWxkCndlIHBlcmhhcHMgc2V0dGxlIG9uIHVzaW5nID09IC8gIT0gd2hl
cmUgcG9zc2libGUgKGkuZS4ganVzdCBhCnNpbmdsZSB2ZW5kb3IgY2hlY2tlZCkgdW50aWwgNC4x
MiBoYXMgZ29uZSBvdXQgb2YgYXQgbGVhc3QKcmVndWxhciBzdXBwb3J0PyAoVGhlIHByZXZhaWxp
bmcgdXNlIHdpdGggbW9yZSB0aGFuIG9uZSB2ZW5kb3IKaXMgd2l0aCBBTUQgYW5kIEh5Z29uLCB3
aGljaCBkb2Vzbid0IGdvIHNpbGVudCBhcwpYODZfVkVORE9SX0hZR09OIGRvZXNuJ3QgZXhpc3Qg
eWV0IGluIDQuMTIuKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
