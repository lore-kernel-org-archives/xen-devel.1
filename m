Return-Path: <SRS0=TnSW=TH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B591C04AAB
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 16:02:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 284D8205ED
	for <xen-devel@archiver.kernel.org>; Tue,  7 May 2019 16:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 284D8205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2Xo-0005nD-9A; Tue, 07 May 2019 16:02:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO2Xn-0005n5-7A
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:02:15 +0000
X-Inumbo-ID: 7a8a1aeb-70e1-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 7a8a1aeb-70e1-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 16:02:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 910C7374;
 Tue,  7 May 2019 09:02:13 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B390C3F5AF;
 Tue,  7 May 2019 09:02:12 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <1556816422-25185-4-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <06cd7a91-e70b-1eeb-bafb-d59a7f5d4d2b@arm.com>
Date: Tue, 7 May 2019 17:02:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556816422-25185-4-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 3/4] xen/arm: Extend SCIF early prink
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
Message-ID: <20190507160211.vwVujpynAdW2gC7Y4hGeIJgGNuwvtHgiMtpfXO3G3OA@z>

SGksCgpPbiA1LzIvMTkgNjowMCBQTSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gICBk
b2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50eHQgICAgfCAgNSArKysrKwo+ICAgeGVuL2FyY2gv
YXJtL1J1bGVzLm1rICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+ICAgeGVuL2FyY2gvYXJtL2Fy
bTMyL2RlYnVnLXNjaWYuaW5jIHwgMTcgKysrKysrKysrKystLS0tLS0KPiAgIDMgZmlsZXMgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
ZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0IGIvZG9jcy9taXNjL2FybS9lYXJseS1wcmlu
dGsudHh0Cj4gaW5kZXggYjIzYzU0Zi4uODllMDgxZSAxMDA2NDQKPiAtLS0gYS9kb2NzL21pc2Mv
YXJtL2Vhcmx5LXByaW50ay50eHQKPiArKysgYi9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50
eHQKPiBAQCAtMjcsNiArMjcsMTEgQEAgQ09ORklHX0VBUkxZX1BSSU5USz08SU5DPiw8QkFTRV9B
RERSRVNTPiw8T1RIRVJfT1BUSU9OUz4KPiAgICAgICAgIElmIDxCQVVEX1JBVEU+IGlzIG5vdCBn
aXZlbiB0aGVuIHRoZSBjb2RlIHdpbGwgbm90IHRyeSB0bwo+ICAgICAgICAgaW5pdGlhbGl6ZSB0
aGUgVUFSVCwgc28gdGhhdCBib290bG9hZGVyIG9yIGZpcm13YXJlIHNldHRpbmdzIGNhbgo+ICAg
ICAgICBiZSB1c2VkIGZvciBtYXhpbXVtIGNvbXBhdGliaWxpdHkuCj4gKyAgLSBzY2lmLDxCQVNF
X0FERFJFU1M+LDxWRVJTSU9OPgo+ICsgICAgLSBTQ0lGPFZFUlNJT04+IGlzLCBvcHRpb25hbGx5
LCB0aGUgaW50ZXJmYWNlIHZlcnNpb24gb2YgdGhlIFVBUlQuCj4gKwo+ICsgICAgICBJZiA8VkVS
U0lPTj4gaXMgbm90IGdpdmVuIHRoZW4gdGhlIGRlZmF1bHQgaW50ZXJmYWNlIHZlcnNpb24gKFND
SUYpCj4gKyAgICAgIHdpbGwgYmUgdXNlZC4KClRoaXMgcGF0Y2ggbm93IGxvb2tzIGdvb2QuIEkg
d291bGQgbGlrZSBzb21lIGlucHV0IGZyb20gU3RlZmFubyBvbiB0aGUgCndvcmRpbmcgaGVyZSBi
ZWZvcmUgaXQgZ2V0cyBtZXJnZWQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
