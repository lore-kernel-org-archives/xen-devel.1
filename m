Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A99E0C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:08:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EE7F2075B
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 22:08:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EE7F2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG9lw-0008LR-DH; Mon, 15 Apr 2019 22:08:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GzYx=SR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hG9lu-0008KP-QV
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 22:08:14 +0000
X-Inumbo-ID: f682a236-5fca-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f682a236-5fca-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 22:08:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2976BEBD;
 Mon, 15 Apr 2019 15:07:43 -0700 (PDT)
Received: from [10.37.12.102] (unknown [10.37.12.102])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 555A73F68F;
 Mon, 15 Apr 2019 15:07:41 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-5-julien.grall@arm.com>
 <alpine.DEB.2.10.1904151457420.29275@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cab39720-04fd-f28d-e0d5-7ced34b9920b@arm.com>
Date: Mon, 15 Apr 2019 23:07:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904151457420.29275@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next 4/9] xen/grant-table: Make arch
 specific macros typesafe
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
Cc: Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415220739.h7MzYDrdUHrtWQwCXTUHGh9-ees86KT2A2CLvcYG5A0@z>

SGksCgpPbiA0LzE1LzE5IDExOjAzIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
TW9uLCAxOCBGZWIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBObyBmdW5jdGlvbmFsIGNo
YW5nZXMgaW50ZW5kZWQuCj4gCj4gUGxlYXNlIGxpc3QgaGVyZSB0aGUgY2hhbmdlcyB0aGlzIHBh
dGNoIGlzIG1ha2luZzoKPiAKPiAtIHJlbmFtaW5nIGdudHRhYl9zaGFyZWRfZ21mbiB0byBnbnR0
YWJfc2hhcmVkX2dmbiB0byBmb2xsb3cgdGhlIG5hbWluZwo+ICAgIGNvbnZlbnRpb24gKGFuZCBv
dGhlcnMuKQoKT2sgZm9yIHRoaXMgYnV0Li4uCgo+IC0gbWFraW5nIGdudHRhYl9zaGFyZWRfZ21m
biByZXR1cm5pbmcgZ2ZuX3QKCi4uLiBpdCBkb2VzIG5vdCBtYWtlIHNlbnNlIHRvIG1lbnRpb24g
b25lIG1hY3JvIGFuZCBub3QgYWxsIHRoZSBvdGhlciAKdGhhdCB3YXMgbW9kaWZpZWQgYmVjYXVz
ZSBvZiB0aGUgY2hhbmdlLiBUaGlzIGlzIGFsc28gYWxyZWFkeSBwcmV0dHkgCmNsZWFyIGZyb20g
dGhlIGNvbW1pdCB0aXRsZSB0aGF0IGFsbCBtYWNyb3Mgd2lsbCBiZSB0eXBlc2FmZS4KClNvIEkg
d291bGQgcmF0aGVyIG5vdCBtZW50aW9uIHRoaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
