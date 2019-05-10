Return-Path: <SRS0=iSTY=TK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5736CC04A6B
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:03:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3037321479
	for <xen-devel@archiver.kernel.org>; Fri, 10 May 2019 13:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3037321479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5Au-0001LU-6s; Fri, 10 May 2019 13:02:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5As-0001LP-RP
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:02:54 +0000
X-Inumbo-ID: ebc50af2-7323-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ebc50af2-7323-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:02:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 867E3374;
 Fri, 10 May 2019 06:02:52 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522673F6C4;
 Fri, 10 May 2019 06:02:51 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
Date: Fri, 10 May 2019 14:02:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190510130249.dGqrRO1e3AgoimgtEEy8cZ6lRfK9maVJhm72fUYv8II@z>

CgpPbiAxMC8wNS8yMDE5IDEyOjM1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNy4wNS4x
OSBhdCAxNzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gLS0tIGEveGVuL2Fy
Y2gveDg2L21tL3NoYWRvdy9jb21tb24uYwo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vc2hhZG93
L2NvbW1vbi5jCj4+IEBAIC00NzQsNyArNDc0LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHRyYWNl
X3Jlc3luYyhpbnQgZXZlbnQsIG1mbl90IGdtZm4pCj4+ICAgICAgIGlmICggdGJfaW5pdF9kb25l
ICkKPj4gICAgICAgewo+PiAgICAgICAgICAgLyogQ29udmVydCBnbWZuIHRvIGdmbiAqLwo+PiAt
ICAgICAgICB1bnNpZ25lZCBsb25nIGdmbiA9IG1mbl90b19nZm4oY3VycmVudC0+ZG9tYWluLCBn
bWZuKTsKPj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSBnZm5feChtZm5fdG9fZ2ZuKGN1
cnJlbnQtPmRvbWFpbiwgZ21mbikpOwo+PiArCj4+ICAgICAgICAgICBfX3RyYWNlX3ZhcihldmVu
dCwgMC8qIXRzYyovLCBzaXplb2YoZ2ZuKSwgJmdmbik7Cj4+ICAgICAgIH0KPiAKPiBDYW4ndCB5
b3UgdXNlIGdmbl90IGhlcmUsIGFuZCBoZW5jZSBhdm9pZCB0aGUgZ2ZuX3goKT8gU2FtZSBhZ2Fp
biBmdXJ0aGVyCj4gZG93bi4KQmVjYXVzZSBfX3RyYWNlX3ZhciB3aWxsIGV4cG9ydCB0aGUgdmFs
dWUgdG8gdGhlIGd1ZXN0LiBJIHdhc24ndCBzdXJlIHdoZXRoZXIgd2UgCmNhbiBzYWZlbHkgY29u
c2lkZXIgdGhhdCBnZm5fdCBpcyBleGFjdGx5IHRoZSBzYW1lIGFzIHVuc2lnbmVkIGxvbmcgaW4g
ZGVidWctYnVpbGQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
