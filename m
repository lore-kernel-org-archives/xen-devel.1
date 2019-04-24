Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4205FC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:14:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19B90218D3
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 15:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19B90218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJJbP-0006iG-JA; Wed, 24 Apr 2019 15:14:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJJbN-0006iB-T9
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 15:14:25 +0000
X-Inumbo-ID: a519cb84-66a3-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a519cb84-66a3-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 15:14:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88DD9374;
 Wed, 24 Apr 2019 08:14:24 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78613F557;
 Wed, 24 Apr 2019 08:14:23 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-21-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <34040b98-2010-7f1d-7370-25a539421f80@arm.com>
Date: Wed, 24 Apr 2019 16:14:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-21-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 20/20] xen/arm: Allow cleaning the directory
 even when CONFIG_EARLY_PRINTK is set
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424151422.yEpKYiKeyqLpMzaqjt_pd6q7BAR4t2zxZ4BrbHpOO8c@z>

SGksCgpQbGVhc2UgaWdub3JlIHRoaXMgcGF0Y2guIFRoaXMgd2FzIGFscmVhZHkgc2VudCBzZXBh
cmF0ZWx5LgoKQ2hlZXJzLAoKT24gMjIvMDQvMjAxOSAxNzo0OSwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+IENPTkZJR19FQVJMWV9QUklOVEsgY2FuIG9ubHkgYmUgc2V0IHdoZW4gQ09ORklHX0RFQlVH
IGlzIGVuYWJsZWQuIEl0IGNhbgo+IGJlIHF1aXRlIGNvbnZlbmllbnQgdG8gb25seSBtb2RpZnkg
dGhlIHRhcmdldC4KPiAKPiBIb3dldmVyLCB0aGUgdGFyZ2V0IGNsZWFuIHdpbGwgbm90IGluY2x1
ZGUgdGhlIC5jb25maWcuIFRoaXMgbWVhbnMKPiBDT05GSUdfREVCVUcgaXMgbm90IGVuYWJsZWQg
YW5kIHRoZXJlZm9yZSBtYWtlIHdpbGwgdGhyb3cgYW4gZXJyb3IKPiBwcmV2ZW50aW5nIGNsZWFu
IHRvIGNvbnRpbnVlLgo+IAo+IFRoZSBjaGVjayBpcyBub3QgbW92ZWQgYXQgbGlua2luZyB0aW1l
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4gCj4gLS0tCj4gCj4gVGhpcyBjb2RlIGlzIHByZXR0eSBuYXN0eSwgYnV0IEkgaGF2ZW4ndCBm
b3VuZCBhIGJldHRlciB3YXkgZm9yIGF2b2lkaW5nCj4gdG8gY2hlY2sgaWYgQ09ORklHX0RFQlVH
IGlzIGVuYWJsZWQgd2hlbiB0aGUgdGFyZ2V0IGNsZWFuIGlzIGNhbGxlZC4KPiAKPiBJZGVhbGx5
IHdlIHdpbGwgd2FudCB0byBtb3ZlIENPTkZJR19FQVJMWV9QUklOVEsgaW4gS2NvbmZpZy4gSSBo
YXZlbid0Cj4gaGFkIHRpbWUgeWV0IHRvIGxvb2sgYXQgaXQgcHJvcGVybHkgc28gZmFyLgo+IC0t
LQo+ICAgeGVuL2FyY2gvYXJtL01ha2VmaWxlIHwgNSArKysrKwo+ICAgeGVuL2FyY2gvYXJtL1J1
bGVzLm1rIHwgNyAtLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL01ha2VmaWxlIGIv
eGVuL2FyY2gvYXJtL01ha2VmaWxlCj4gaW5kZXggY2I5MDJjYjZmZS4uZmVmNTA4YzgzNiAxMDA2
NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUKPiArKysgYi94ZW4vYXJjaC9hcm0vTWFr
ZWZpbGUKPiBAQCAtMTAxLDYgKzEwMSwxMSBAQCBwcmVsaW5rLm86ICQoQUxMX09CSlMpCj4gICBl
bmRpZgo+ICAgCj4gICAkKFRBUkdFVCktc3ltczogcHJlbGluay5vIHhlbi5sZHMKPiAraWZuZXEg
KCQoQ09ORklHX0VBUkxZX1BSSU5USyksICkKPiAraWZuZXEgKCQoQ09ORklHX0RFQlVHKSwgeSkK
PiArCSQoZXJyb3IgQ09ORklHX0VBUkxZX1BSSU5USyBlbmFibGVkIGZvciBub24tZGVidWcgYnVp
bGQpCj4gK2VuZGlmCj4gK2VuZGlmCj4gICAJJChMRCkgJChMREZMQUdTKSAtVCB4ZW4ubGRzIC1O
IHByZWxpbmsubyBcCj4gICAJICAgICQoQkFTRURJUikvY29tbW9uL3N5bWJvbHMtZHVtbXkubyAt
byAkKEBEKS8uJChARikuMAo+ICAgCSQoTk0pIC1wYSAtLWZvcm1hdD1zeXN2ICQoQEQpLy4kKEBG
KS4wIFwKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL1J1bGVzLm1rIGIveGVuL2FyY2gvYXJt
L1J1bGVzLm1rCj4gaW5kZXggZjI2NDU5MmFlZi4uMTIxNTA5ODZjNSAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vUnVsZXMubWsKPiArKysgYi94ZW4vYXJjaC9hcm0vUnVsZXMubWsKPiBAQCAt
ODAsMTEgKzgwLDQgQEAgQ0ZMQUdTLSQoRUFSTFlfUFJJTlRLKSArPSAtREVBUkxZX1BSSU5US19C
QVVEPSQoRUFSTFlfUFJJTlRLX0JBVUQpCj4gICBDRkxBR1MtJChFQVJMWV9QUklOVEspICs9IC1E
RUFSTFlfVUFSVF9CQVNFX0FERFJFU1M9JChFQVJMWV9VQVJUX0JBU0VfQUREUkVTUykKPiAgIENG
TEFHUy0kKEVBUkxZX1BSSU5USykgKz0gLURFQVJMWV9VQVJUX1JFR19TSElGVD0kKEVBUkxZX1VB
UlRfUkVHX1NISUZUKQo+ICAgCj4gLWVsc2UgIyAhQ09ORklHX0RFQlVHCj4gLQo+IC1pZm5lcSAo
JChDT05GSUdfRUFSTFlfUFJJTlRLKSwpCj4gLSMgRWFybHkgcHJpbnRrIGlzIGRlcGVuZGFudCBv
biBhIGRlYnVnIGJ1aWxkLgo+IC0kKGVycm9yIENPTkZJR19FQVJMWV9QUklOVEsgZW5hYmxlZCBm
b3Igbm9uLWRlYnVnIGJ1aWxkKQo+IC1lbmRpZgo+IC0KPiAgIGVuZGlmCj4gCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
