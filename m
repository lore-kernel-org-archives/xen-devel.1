Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A02C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:23:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E3A206A3
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 21:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E3A206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK8JX-0006IM-5z; Fri, 26 Apr 2019 21:23:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK8JW-0006IF-8s
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 21:23:22 +0000
X-Inumbo-ID: 8446a4c4-6869-11e9-8de6-abf65ea72ffe
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 8446a4c4-6869-11e9-8de6-abf65ea72ffe;
 Fri, 26 Apr 2019 21:23:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED67EA78;
 Fri, 26 Apr 2019 14:23:20 -0700 (PDT)
Received: from [10.37.8.211] (unknown [10.37.8.211])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4567B3F557;
 Fri, 26 Apr 2019 14:23:20 -0700 (PDT)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-12-ian.jackson@eu.citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8ba9d00a-daa1-c09d-4b7b-7556a9d98a7e@arm.com>
Date: Fri, 26 Apr 2019 22:23:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190426164002.22381-12-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [OSSTEST PATCH 11/15] cross builds:
 ts-kernel-build: Support cross target armhf
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
Cc: Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426212318.LkdI-njviFEtKZImMOVq7cNdA-WVsLHtllgyJ5sM1Sg@z>

SGkgSWFuLAoKVGhhbmsgeW91IGZvciBsb29raW5nIGludG8gdGhpcy4KCk9uIDQvMjYvMTkgNToz
OSBQTSwgSWFuIEphY2tzb24gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+Cj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9y
Zz4KPiAtLS0KPiAgIHRzLWtlcm5lbC1idWlsZCB8IDE5ICsrKysrKysrKysrKysrKysrKy0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL3RzLWtlcm5lbC1idWlsZCBiL3RzLWtlcm5lbC1idWlsZAo+IGluZGV4IDcyY2E5
OGExLi4yOWM2YzQzZCAxMDA3NTUKPiAtLS0gYS90cy1rZXJuZWwtYnVpbGQKPiArKysgYi90cy1r
ZXJuZWwtYnVpbGQKPiBAQCAtMjEsNiArMjEsNyBAQCBCRUdJTiB7IHVuc2hpZnQgQElOQywgcXco
Lik7IH0KPiAgIHVzZSBPc3N0ZXN0Owo+ICAgdXNlIE9zc3Rlc3Q6OlRlc3RTdXBwb3J0Owo+ICAg
dXNlIE9zc3Rlc3Q6OkJ1aWxkU3VwcG9ydDsKPiArdXNlIENhcnA7Cj4gICAKPiAgIHRzcmVhZGNv
bmZpZygpOwo+ICAgCj4gQEAgLTQ4LDkgKzQ5LDI0IEBAIG15ICRwYXJtcyA9ICRhcmNocGFybXMt
PnsgJHJ7YXJjaH0gfTsKPiAgIAo+ICAgc3ViIGVuYWJsZV94ZW5fY29uZmlnICgpOwo+ICAgCj4g
K291ciAkYXJjaF9lbnZ2YXJzID0gJyc7Cj4gKwo+ICAgc3ViIGNtZCAoJCQpIHsKPiAgICAgICBt
eSAoJHRpbWVvdXQsICRzY3JpcHQpID0gQF87Cj4gLSAgICB0YXJnZXRfY21kX2J1aWxkKCRobywg
JHRpbWVvdXQsICRidWlsZGRpciwgJHNjcmlwdCk7Cj4gKyAgICB0YXJnZXRfY21kX2J1aWxkKCRo
bywgJHRpbWVvdXQsICRidWlsZGRpciwgJGFyY2hfZW52dmFycy4kc2NyaXB0KTsKPiArfQo+ICsK
PiArc3ViIGNoZWNrYXJjaCAoKSB7Cj4gKyAgICByZXR1cm4gaWYgJHJ7YXJjaH0gZXEgJGhvLT57
QXJjaH07Cj4gKyAgICBteSAkY2MgPSAnZ2NjJzsKPiArICAgIGlmICgkcnthcmNofSBlcSAnYXJt
aGYnKSB7Cj4gKwl0YXJnZXRfaW5zdGFsbF9wYWNrYWdlcygkaG8sICJjcm9zc2J1aWxkLWVzc2Vu
dGlhbC0kcnthcmNofSIpOwo+ICsJJGFyY2hfZW52dmFycyA9IDw8RU5EOwo+ICsgICAgZXhwb3J0
IEFSQ0g9YXJtIEhPU1RDQz0kY2MgQ1JPU1NfQ09NUElMRT1hcm0tbGludXgtZ251ZWFiaWhmLQoK
TklUOiBIT1NUQ0MgaXMgbm90IG5lY2Vzc2FyeS4gSXQgd2lsbCBiZSBkZWZhdWx0IHRvIGdjYyBp
ZiBub3QgcGFzc2VkLgoKT3RoZXJ3aXNlLCB0aGUgZXhwb3J0IGxvb2tzIHdyaXRlIHRvIG1lLgoK
PiArRU5ECj4gKyAgICB9IGVsc2Ugewo+ICsJY29uZmVzcyAidW5rbm93biBjcm9zcyB0YXJnZXQg
KGdudSAnaG9zdCcpICRye2FyY2h9IjsKPiArICAgIH0KPiAgIH0KPiAgIAo+ICAgc3ViIGNoZWNr
b3V0ICgpIHsKPiBAQCAtNDUwLDYgKzQ2Niw3IEBAIHN1YiBmd2luc3RhbGwgKCkgewo+ICAgRU5E
Cj4gICB9Cj4gICAKPiArY2hlY2thcmNoKCk7Cj4gICBjaGVja291dCgpOwo+ICAgY29uZmlnKCk7
Cj4gICBidWlsZCgpOwo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
