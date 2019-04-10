Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35BAC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:48:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A62420830
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 15:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A62420830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEFRt-0003nh-CE; Wed, 10 Apr 2019 15:47:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PZ5s=SM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hEFRr-0003nc-VY
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 15:47:40 +0000
X-Inumbo-ID: f7950ac8-5ba7-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f7950ac8-5ba7-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 15:47:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED2C374;
 Wed, 10 Apr 2019 08:47:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53D253F59C;
 Wed, 10 Apr 2019 08:47:07 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190410142408.22848-1-ian.jackson@eu.citrix.com>
 <20190410142408.22848-14-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f6c6ecc8-c2bc-76a8-19f4-a2e6526fde02@arm.com>
Date: Wed, 10 Apr 2019 16:47:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190410142408.22848-14-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 13/62] Extend workaround
 `clk_ignore_unused' to stretch
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410154705.o5u3YttOxDD_F8ptZJdpTnk1QndLqmyq7Xs-rItuJS4@z>

SGksCgpPbiAxMC8wNC8yMDE5IDE1OjIzLCBJYW4gSmFja3NvbiB3cm90ZToKPiBGcm9tOiBXZWkg
TGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IAo+IFRoaXMgaXMgaHR0cHM6Ly9idWdzLnhlbnBy
b2plY3Qub3JnL3hlbi9idWcvNDUKU3RpbGwgbm8gcmVzb2x1dGlvbiBmb3IgdGhpcyBvbmUgOi8u
Cgo+IAo+IFdpdGhvdXQgdGhhdCBwYXJhbWV0ZXIgd2UgbG9zZSB1YXJ0IG91dHB1dC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+IENDOiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCj4gLS0tCj4gICBPc3N0ZXN0L0RlYmlhbi5wbSB8IDIg
Ky0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9Pc3N0ZXN0L0RlYmlhbi5wbSBiL09zc3Rlc3QvRGViaWFuLnBtCj4gaW5k
ZXggODJiNWZiNDAuLjkxYmZmZGZmIDEwMDY0NAo+IC0tLSBhL09zc3Rlc3QvRGViaWFuLnBtCj4g
KysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KPiBAQCAtMjQxLDcgKzI0MSw3IEBAIEVORAo+ICAgCXB1
c2ggQHhlbmtvcHQsICR4ZW5rb3B0Owo+ICAgCSMgaHR0cDovL2J1Z3MueGVucHJvamVjdC5vcmcv
eGVuL2J1Zy80NQo+ICAgCXB1c2ggQHhlbmtvcHQsICJjbGtfaWdub3JlX3VudXNlZCIKPiAtCSAg
ICBpZiAkaG8tPntTdWl0ZX0gPX4gbS93aGVlenl8amVzc2llLzsKPiArCSAgICBpZiAkaG8tPntT
dWl0ZX0gPX4gbS93aGVlenl8amVzc2llfHN0cmV0Y2gvOwo+ICAgCj4gICAJJHhlbmtvcHQgPSBq
b2luICcgJywgQHhlbmtvcHQ7Cj4gICAJbG9nbSgiRG9tMCBMaW51eCBvcHRpb25zOiAkeGVua29w
dCIpOwo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
