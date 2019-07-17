Return-Path: <SRS0=IKXj=VO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90349C7618F
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jul 2019 16:53:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DC5F205F4
	for <xen-devel@archiver.kernel.org>; Wed, 17 Jul 2019 16:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DC5F205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnnAX-0005xt-EM; Wed, 17 Jul 2019 16:52:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=edZn=VO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hnnAW-0005xm-Uz
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 16:52:40 +0000
X-Inumbo-ID: 47b86b66-a8b3-11e9-8aa3-0bc1d05d918a
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 47b86b66-a8b3-11e9-8aa3-0bc1d05d918a;
 Wed, 17 Jul 2019 16:52:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 773CB28;
 Wed, 17 Jul 2019 09:52:36 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D5923F71F;
 Wed, 17 Jul 2019 09:52:35 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>, xen-devel@lists.xenproject.org
References: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
 <a94734d2-ea51-3ba3-917b-e7cf21ace1d0@arm.com>
 <d304061e-f34e-d0e6-04a4-1a8bfc7414fa@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3261754d-f036-fbf1-d111-3ad10aa6f2eb@arm.com>
Date: Wed, 17 Jul 2019 17:52:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <d304061e-f34e-d0e6-04a4-1a8bfc7414fa@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Switch OMAP5 secondary cores
 into hyp mode
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
Cc: hy-gsoc@hy-research.com, sstabellini@kernel.org, drhunter95@gmail.com,
 andre.przywara@arm.com, tim@xen.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, baozich@gmail.com,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgRGVuaXMsCgpPbiAxNy8wNy8yMDE5IDE3OjMyLCBEZW5pcyBPYnJlemtvdiB3cm90ZToKPj4K
Pj4gSSBhbSB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgdGhpcyBldmVyIHdvcmtlZC4gb21hcDVf
c21wX2luaXQgaXMgY2FsbGVkCj4+IGJ5IHR3byBzZXRzIG9mIHBsYXRmb3JtcyAoYmFzZWQgb24g
Y29tcGF0aWJsZSk6Cj4+ICDCoMKgIC0gdGksZHJhNzogdGhlcmUgd2VyZSBzb21lIGhhY2tzIGlu
IFUtYm9vdCB0byBhdm9pZCB0aGUgU01DLiBJZiBJIGFtCj4+IHJpZ2h0LCB0aGVuIEkgd291bGQg
bm90IGJvdGhlciB0byBzdXBwb3J0IGhhY2tlZCBVLWJvb3QuCj4+ICDCoMKgIC0gdGksb21hcDU6
IFsxXSBzdWdnZXN0IHRoYXQgVS1ib290IGRvIHRoZSBzd2l0Y2ggZm9yIHVzIGJ1dCBpdCBpcwo+
PiBub3QgY2xlYXIgd2hldGhlciB0aGlzIGlzIHVwc3RyZWFtZWQuIEBDaGVuLCBJIGtub3cgeW91
IGRpZCB0aGUgcG9ydCBhCj4+IGxvbmcgdGltZSBhZ28uIERvIHlvdSByZWNhbGwgaG93IHRoaXMg
d29ya2VkPwo+Pgo+PiBMaW51eCBzZWVtcyB0byB1c2UgdGhlIHNtYyBvbiBhbnkgZHJhNyBhbmQg
b21hcDU0eHguIFNvIG1heWJlIHdlIGNhbiB1c2UKPj4gc2FmZWx5IGhlcmUuCj4+IEkgZG9uJ3Qg
dW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zIHRvIHRoZSBmdWxsIGV4dGVudC4gV2hhdCBzaG91bGQg
YmUKPiBpbnZlc3RpZ2F0ZWQ/CgpXZWxsLCBYZW4gaGFzIGJlZW4gc3VwcG9ydGVkIHRoZSBvbWFw
NSBmb3IgcXVpdGUgYSB3aGlsZS4gU28gdGhlcmUgYXJlIHR3byAKcG9zc2liaWxpdGllcyByZWdh
cmRpbmcgdGhlIGN1cnJlbnQgU01QIGNvZGU6CiAgICAxKSBJdCBpcyB0b3RhbGx5IGJyb2tlbiBh
bmQgdGhlcmVmb3JlIG5ldmVyIHdvcmtlZCBvbiBhbnkgb21hcDUgcGxhdGZvcm0uCiAgICAyKSBJ
dCB3b3JrcyBidXQgd2l0aCBtYXliZSBtb2RpZmljYXRpb24gaW4gVS1ib290LgoKTG9va2luZyBh
dCB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUgYW5kIHdpa2ksIEkgYmVsaWV2ZSAyKSBpcyBjbG9z
ZXIgdG8gdGhlIApjdXJyZW50IHJlYWxpdHkuIFNvIHRoaXMgcmFpc2UgdGhlIHF1ZXN0aW9uIHdo
ZXRoZXIgeW91ciBwYXRjaCB3aWxsIGJyZWFrIGFueSAKZXhpc3Rpbmcgc2V0dXAuCgpEb24ndCBn
ZXQgbWUgd3JvbmcsIHRoZSBjb2RlIGlzIHBlcmZlY3RseSBmaW5lIGFzLCB0byB0aGUgYmVzdCBv
ZiBteSBrbm93bGVkZ2UsIAppdCBtYXRjaGVzIHdoYXQgTGludXggZG9lcy4gSG93ZXZlciwgSSB3
b3VsZCBsaWtlIHRvIHNlZSBhbiBhbmFseXNpcyB3cml0dGVuIGluIAp0aGUgY29tbWl0IG1lc3Nh
Z2UgcmVnYXJkaW5nIHdoYXQncyBnb2luZyB0byBoYXBwZW4gZm9yIGFueSBleGlzdGluZyBzZXR1
cC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
