Return-Path: <SRS0=p1A9=2C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F547C43603
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 06:02:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A162073D
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 06:02:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A162073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifHYV-0008PT-SG; Thu, 12 Dec 2019 06:02:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifHYT-0008PO-NN
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 06:02:29 +0000
X-Inumbo-ID: f4e94b6a-1ca4-11ea-b6f1-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4e94b6a-1ca4-11ea-b6f1-bc764e2007e4;
 Thu, 12 Dec 2019 06:02:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3FC70AD20;
 Thu, 12 Dec 2019 06:02:19 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191211152956.5168-1-pdurrant@amazon.com>
 <20191211152956.5168-3-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <61622e02-9cdc-03bc-b107-f3d1e6ff0fb9@suse.com>
Date: Thu, 12 Dec 2019 07:02:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211152956.5168-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/4] xenbus: limit when state is forced
 to closed
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTY6MjksIFBhdWwgRHVycmFudCB3cm90ZToKPiBJZiBhIGRyaXZlciBwcm9i
ZSgpIGZhaWxzIHRoZW4gbGVhdmUgdGhlIHhlbnN0b3JlIHN0YXRlIGFsb25lLiBUaGVyZSBpcyBu
bwo+IHJlYXNvbiB0byBtb2RpZnkgaXQgYXMgdGhlIGZhaWx1cmUgbWF5IGJlIGR1ZSB0byB0cmFu
c2llbnQgcmVzb3VyY2UKPiBhbGxvY2F0aW9uIGlzc3VlcyBhbmQgaGVuY2UgYSBzdWJzZXF1ZW50
IHByb2JlKCkgbWF5IHN1Y2NlZWQuCj4gCj4gSWYgdGhlIGRyaXZlciBzdXBwb3J0cyByZS1iaW5k
aW5nIHRoZW4gb25seSBmb3JjZSBzdGF0ZSB0byBjbG9zZWQgZHVyaW5nCj4gcmVtb3ZlKCkgb25s
eSBpbiB0aGUgY2FzZSB3aGVuIHRoZSB0b29sc3RhY2sgbWF5IG5lZWQgdG8gY2xlYW4gdXAuIFRo
aXMgY2FuCj4gYmUgZGV0ZWN0ZWQgYnkgY2hlY2tpbmcgd2hldGhlciB0aGUgc3RhdGUgaW4geGVu
c3RvcmUgaGFzIGJlZW4gc2V0IHRvCj4gY2xvc2luZyBwcmlvciB0byBkZXZpY2UgcmVtb3ZhbC4K
PiAKPiBOT1RFOiBSZS1iaW5kIHN1cHBvcnQgaXMgaW5kaWNhdGVkIGJ5IG5ldyBib29sZWFuIGlu
IHN0cnVjdCB4ZW5idXNfZHJpdmVyLAo+ICAgICAgICB3aGljaCBkZWZhdWx0cyB0byBmYWxzZS4g
U3Vic2VxdWVudCBwYXRjaGVzIHdpbGwgYWRkIHN1cHBvcnQgdG8KPiAgICAgICAgc29tZSBiYWNr
ZW5kIGRyaXZlcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBh
bWF6b24uY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
CgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
