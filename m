Return-Path: <SRS0=C9dw=UF=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF63C04AB5
	for <xen-devel@archiver.kernel.org>; Thu,  6 Jun 2019 16:03:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81FE820868
	for <xen-devel@archiver.kernel.org>; Thu,  6 Jun 2019 16:03:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81FE820868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYuqw-0007I4-8V; Thu, 06 Jun 2019 16:02:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYuqu-0007Hz-R0
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 16:02:56 +0000
X-Inumbo-ID: 8bce90b0-8874-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8bce90b0-8874-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 16:02:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C934A78;
 Thu,  6 Jun 2019 09:02:55 -0700 (PDT)
Received: from [10.1.38.31] (unknown [10.1.38.31])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E7BF3F690;
 Thu,  6 Jun 2019 09:02:53 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1183ab3f-e483-9ad8-ede3-c905bc2d9331@arm.com>
Date: Thu, 6 Jun 2019 17:02:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-2-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gNS8yMS8xOSAxMDoyNSBQTSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCB0ZWVfaGFuZGxlX2NhbGwoc3RydWN0IGNwdV91c2Vy
X3JlZ3MgKnJlZ3MpCj4gK3sKPiArICAgIHJldHVybiBmYWxzZTsKPiArfQo+ICsKPiArc3RhdGlj
IGlubGluZSBpbnQgdGVlX2RvbWFpbl9pbml0KHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90IHRl
ZV90eXBlKQo+ICt7Cj4gKyAgICByZXR1cm4gLUVOT0RFVjsKPiArfQoKSSBoYWQgYSByZXBvcnQg
dGhhdCBYZW4gZmFpbHMgdG8gYm9vdCB3aXRoIHRoaXMgc2VyaWVzIGFuZCAhQ09ORklHX1RFRS4g
ClRoaXMgaXMgYmVjYXVzZSB5b3UgcmV0dXJuIGFuIGVycm9yIGhlcmUgaW4gYWxsIHRoZSBjYXNl
IHNvbWUgZG9tYWluIApjcmVhdGlvbiB3aWxsIGFsd2F5cyBmYWlsLgoKSW5zdGVhZCB0aGlzIHNo
b3VsZCBjaGVjayB0aGF0IHRlZV90eXBlIGlzIGFsd2F5cyBOT05FIG9yIGVsc2UgcmV0dXJuIGFu
IAplcnJvci4KCkFsc28sIHBsZWFzZSBhdCBsZWFzdCBjaGVjayB0aGF0IHlvdXIgc2VyaWVzIGRv
ZXMgbm90IGJyZWFrIGJvb3Qgd2hlbiAKQ09ORklHX1RFRSBpcyBub3Qgc2VsZWN0ZWQuIEl0IHdv
dWxkIGFsc28gYmUgaWRlYWwgKGJ1dCBub3QgbWFuZGF0b3J5KSAKaWYgeW91IGNhbiBjaGVjayB0
aGF0IGl0IGRvZXMgbm90IGJyZWFrIG9uIG5vbi1PUFRFRSBwbGF0Zm9ybSB3aGVuIAohQ09ORklH
X1RFRSBpcyBzZWxlY3RlZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
