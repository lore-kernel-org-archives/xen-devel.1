Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A90EC10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 17:49:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C14720850
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 17:49:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C14720850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFjFQ-0001Dw-7I; Sun, 14 Apr 2019 17:48:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFjFP-0001Dr-9o
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 17:48:55 +0000
X-Inumbo-ID: 918aee9d-5edd-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 918aee9d-5edd-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 17:48:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FB8D374;
 Sun, 14 Apr 2019 10:48:53 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5CA503F68F;
 Sun, 14 Apr 2019 10:48:52 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-5-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <69c402ec-3a78-edf4-354d-1413b3c9c603@arm.com>
Date: Sun, 14 Apr 2019 18:48:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554718489-11318-5-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 4/5] xen/arm: Extend SCIF early prink
 code to handle other interfaces
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414174850.MXNYqbWQHvHE2fK_PmauFbZUsUP4mA9XcBRIJvALqd8@z>

SGksCgpPbiA0LzgvMTkgMTE6MTQgQU0sIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOgo+IEZy
b206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4K
PiAKPiBFeHRlbmQgZWFybHkgcHJpbmsgY29kZSB0byBiZSBhYmxlIHRvIGhhbmRsZSBvdGhlciBT
Q0lGKFgpCj4gY29tcGF0aWJsZSBpbnRlcmZhY2VzIGFzIHdlbGwuIFRoZXNlIGludGVyZmFjZXMg
aGF2ZSBsb3QgaW4gY29tbW9uLAo+IGJ1dCBtb3N0bHkgZGlmZmVyIGluIG9mZnNldHMgYW5kIGJp
dHMgZm9yIHNvbWUgcmVnaXN0ZXJzLgo+IAo+IEludHJvZHVjZSAiRUFSTFlfUFJJTlRLX1ZFUlNJ
T04iIGNvbmZpZyBvcHRpb24gdG8gY2hvb3NlIHdoaWNoCj4gaW50ZXJmYWNlIHZlcnNpb24gc2hv
dWxkIGJlIHVzZWQgKHRvIHByb3Blcmx5IGFwcGx5IHJlZ2lzdGVyIG9mZnNldHMpLgo+IAo+IFBs
ZWFzZSBub3RlLCBub3RoaW5nIGhhcyBiZWVuIHRlY2huaWNhbGx5IGNoYW5nZWQgZm9yIFJlbmVz
YXMgIkxhZ2VyIgo+IGFuZCBvdGhlciBzdXBwb3J0ZWQgYm9hcmRzIChTQ0lGKS4KPiAKPiBUaGUg
IkVBUkxZX1BSSU5US19WRVJTSU9OIiBvcHRpb24gZm9yIHRoYXQgYm9hcmQgc2hvdWxkIGJlIGVt
cHR5Ogo+IENPTkZJR19FQVJMWV9QUklOVEs9c2NpZiwweGU2ZTYwMDAwCj4gCj4gU2lnbmVkLW9m
Zi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29t
Pgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IAo+IC0tLQo+ICAg
ICAgQ2hhbmdlcyBpbiB2MzoKPiAgICAgICAgICAtIEl0IHdhcyBkZWNpZGVkIG5vdCB0byBpbnRy
b2R1Y2UgbmV3IGRlYnVnLXNjaWZhLmluYwo+ICAgICAgICAgICAgZm9yIGhhbmRsaW5nIFNDSUZB
IGludGVyZmFjZSwgYnV0IHRvIGV4dGVuZCBleGlzdGluZwo+ICAgICAgICAgICAgZGVidWctc2Np
Zi5pbmMgZm9yIGhhbmRsaW5nIGJvdGggaW50ZXJmYWNlcy4KPiAgICAgICAgICAgIFRoaXMgcGF0
Y2ggaXMgYSByZXN1bHQgb2Ygc3BsaXR0aW5nIGFuIGluaXRpYWwgcGF0Y2gKPiAgICAgICAgICAg
ICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBzdXBwb3J0IGZvciBlYXJseSBwcmludGsiCj4gICAg
ICAgICAgICBhbmQgb25seSByZXdvcmtzIGEgY29kZQo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL1J1
bGVzLm1rICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+ICAgeGVuL2FyY2gvYXJtL2FybTMyL2Rl
YnVnLXNjaWYuaW5jIHwgMTMgKysrKysrKysrLS0tLQoKWW91IHdhbnQgdG8gdXBkYXRlIGRvY3Mv
bWlzYy9hcm0vZWFybHktcHJpbnRrLnR4dCB3aXRoIHRoZSBuZXcgb3B0aW9uLgoKT3RoZXJ3aXNl
LCB0aGUgY29kZSBsb29rcyBnb29kIHRvIG1lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
