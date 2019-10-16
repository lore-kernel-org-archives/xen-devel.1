Return-Path: <SRS0=bbgy=YJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A7A0FA3728
	for <xen-devel@archiver.kernel.org>; Wed, 16 Oct 2019 12:47:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EC592168B
	for <xen-devel@archiver.kernel.org>; Wed, 16 Oct 2019 12:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EC592168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKihY-0003bI-7y; Wed, 16 Oct 2019 12:46:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GHfa=YJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iKihX-0003bD-13
 for xen-devel@lists.xenproject.org; Wed, 16 Oct 2019 12:46:51 +0000
X-Inumbo-ID: 04a887fa-f013-11e9-bbab-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 04a887fa-f013-11e9-bbab-bc764e2007e4;
 Wed, 16 Oct 2019 12:46:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36E5228;
 Wed, 16 Oct 2019 05:46:48 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 887233F68E;
 Wed, 16 Oct 2019 05:46:47 -0700 (PDT)
To: "Xia, Hongyan" <hongyax@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190917160202.16770-1-julien.grall@arm.com>
 <0acfc39467986475acddea19da96b55f2468b8fe.camel@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6175492e-7e15-4338-2aed-0b5eee494782@arm.com>
Date: Wed, 16 Oct 2019 13:46:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0acfc39467986475acddea19da96b55f2468b8fe.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSG9uZ3lhbiwKCk9uIDExLzEwLzIwMTkgMTA6NTMsIFhpYSwgSG9uZ3lhbiB3cm90ZToKPiBO
b3QgY29tbWVudGluZyBvbiB0aGUgcGF0Y2gsIGJ1dCBJIGhhZCBleGFjdGx5IHRoZSBzYW1lIHBy
b2JsZW0gd2hlbgo+IHJlbW92aW5nIHRoZSBkaXJlY3QgbWFwIGluIHg4Ni4gbWFwX2RvbWFpbl9w
YWdlIGhhcyB0byBiZSB1c2FibGUKPiB3aXRob3V0IHRoZSBkaXJlY3QgbWFwIGFuZCBldmVuIGJl
Zm9yZSBhbGxvY19ib290X3BhZ2VzIGNhbiBiZSB1c2VkIChzbwo+IHRoYXQgSSBjYW4gbWFwIHRo
ZSBib290bWVtX3JlZ2lvbnNfbGlzdCwgYWx0aG91Z2ggSSBoYXZlIG1hZGUgaXQKPiBzdGF0aWNh
bGx5IGFsbG9jYXRlZCBub3cpLgo+IAo+IFRoZSBkaXJlY3QgbWFwIHRlYXJkb3duIHNlcmllcyBp
biB0aGUgZW5kIGludHJvZHVjZXMgYSBwZXJzaXN0ZW50Cj4gbWFwcGluZyBpbmZyYXN0cnVjdHVy
ZSB0byBtYXAgcGFnZSB0YWJsZXMgd2hpY2ggb2NjdXBpZXMgYSBmZXcgZml4bWFwCj4gZW50cmll
cywgYW5kIGF2b2lkIHNldF9maXhtYXAgYnV0IGluc3RlYWQgbW9kaWZ5IHRoZSBlbnRyaWVzIGRp
cmVjdGx5Cj4gdG8gYXZvaWQgaW52b2NhdGlvbiBsb29wcy4gVGhlIHJlc3VsdCBpcyB0aGF0IG1h
cF94ZW5fcGFnZXRhYmxlIGFuZAo+IG1hcF9kb21haW5fcGFnZSBpcyB1c2FibGUgZnJvbSB0aGUg
dmVyeSBiZWdpbm5pbmcgb2Ygc3RhcnRfeGVuLgoKV291bGQgeW91IG1pbmQgdG8gcG9pbnQgdG8g
dGhlIHBhdGNoIGFkZGluZyB0aGUgaW1wbGVtZW50YXRpb24gb24geDg2PwoKT24gYXJtMzIsIHdl
IGFyZSBub3QgdXNpbmcgYSBkaXJlY3QgbWFwLiBTbyB3ZSBhcmUgdXNpbmcgYSBwZXItY3B1IG1h
cHBpbmcgKHNlZSAKbWFwX2RvbWFpbl9wYWdlKCkgaW1wbGVtZW50YXRpb24gaW4gYXJjaC9hcm0v
bW0uYykuCgpPbiBhcm02NCwgd2UgYXJlIHVzaW5nIHRoZSBkaXJlY3QgbWFwIHNvIGZhci4gQnV0
IHdlIGNvdWxkIHVzZSBhbnkgb2YgdGhlIHR3byAKc29sdXRpb25zIGlmIG5lZWRlZC4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
