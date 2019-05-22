Return-Path: <SRS0=PJHi=TW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251E9C282CE
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 12:21:10 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02EC220675
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 12:21:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02EC220675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTQEl-0003D4-2o; Wed, 22 May 2019 12:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jZt=TW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTQEj-0003Cz-Bw
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 12:20:49 +0000
X-Inumbo-ID: 07e2a554-7c8c-11e9-a6ab-1ff60071444d
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 07e2a554-7c8c-11e9-a6ab-1ff60071444d;
 Wed, 22 May 2019 12:20:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCE5980D;
 Wed, 22 May 2019 05:20:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC1AB3F575;
 Wed, 22 May 2019 05:20:46 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20190520181250.17404-1-julien.grall@arm.com>
 <5CE3C45A0200007800230E0E@prv1-mh.provo.novell.com>
 <1c7f43ce-7df2-24c9-ecb2-d8be1afebfa5@arm.com>
 <5CE3C8370200007800230E40@prv1-mh.provo.novell.com>
 <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
Message-ID: <83c1a4f7-0714-0ee5-e225-835126d92c5d@arm.com>
Date: Wed, 22 May 2019 13:20:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f2f912ac-a1c6-1f07-f708-cf2935c0270f@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/public: arch-arm: Restrict the
 visibility of struct vcpu_guest_core_regs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190522122045.Icai35w-hGqBfl8I4UkI3XJPPP3s425ecDqnFyWS_94@z>

CgpPbiAyMS8wNS8yMDE5IDEwOjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmFuLAo+IAo+
IE9uIDUvMjEvMTkgMTA6NDMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMS4wNS4x
OSBhdCAxMTozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDUvMjEvMTkg
MTA6MjYgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4+IE9uIDIwLjA1LjE5IGF0IDIwOjEy
LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+Pj4+PiDCoMKgwqDCoMKgIEFzIHRoaXMg
aXMgbm93IFhlbiBhbmQgdG9vbHMgb25seSwgSSBhbSB3b25kZXJpbmcgd2hldGhlciB0aGUgY2hl
Y2sgb24KPj4+Pj4gwqDCoMKgwqDCoCBHTlVfQyBpcyBzdGlsbCBuZWNlc3NhcnkuIEkgYW0gaGFw
cHkgdG8gc2VuZCBhIGZvbGxvdy11cCBwYXRjaCAob3IgZm9sZAo+Pj4+PiDCoMKgwqDCoMKgIGlu
IHRoaXMgb25lKSBpZiBpdCBjYW4gYmUgcmVtb3ZlZC4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhpcyBz
aG91bGQgYmUgZHJvcHBlZCBpZiBpdCBjYW4gYmUgd2l0aG91dCBicmVha2luZyBhbnkKPj4+PiBw
YXJ0IG9mIHRoZSBidWlsZC4KPj4+IFRoaXMgaXMgYmVjYXVzZSBhbGwgdGhlIHRvb2xzIGFyZSBw
YXJ0IG9mIHhlbi5naXQsIHJpZ2h0Pwo+Pgo+PiBSaWdodCAtIG5vLW9uZSBlbHNlIGlzIHN1cHBv
c2VkIHRvIGRlZmluZSBfX1hFTl9UT09MU19fLCBvcgo+PiBpZiBhbnlvbmUgZG9lcywgdGhleSdy
ZSBvbiB0aGVpciBvd24uCj4gCj4gVGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIEkgd2lsbCBk
byBhIGZ1bGwgYnVpbGQgY2hlY2suCgpJIHRob3VnaHQgYWJvdXQgdGhpcyBhZ2FpbiwgbG9uZyB0
ZXJtIHRoZXJlIGFyZSBhbiBhdHRlbXB0IHRvIGJ1aWxkIHhlbiB3aXRoIApvdGhlciBjb21waWxl
ciBub3QgbmVjZXNzYXJpbHkgc3VwcG9ydGluZyBHTlUgQyBleHRlbnNpb24uCgpXaGlsZSB0aGlz
IHdvdWxkIHByb2JhYmx5IG5vdCBiZSB0aGUgb25seSBwbGFjZSB0aGF0IG5lZWQgdG8gYmUgcmV3
b3JrZWQsIHdlIAp3b3VsZCBoYXZlIHRvIHJldmVydCBwYXJ0IG9mIHRoaXMgY2hhbmdlLiBTbyBJ
IHdpbGwgbm90IGRyb3AgdGhlICNpZmRlZiBoZXJlLgoKSSB3aWxsIHJlc2VuZCB0aGUgcGF0Y2gg
bmV4dCB3ZWVrIHRvIGdpdmUgc29tZSB0aW1lIGZvciBtb3JlIGZlZWRiYWNrLgoKCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
