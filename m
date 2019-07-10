Return-Path: <SRS0=r7lW=VH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D02C74A35
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 17:17:57 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10E5A20844
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 17:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10E5A20844
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlGDr-0004j4-6f; Wed, 10 Jul 2019 17:17:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELaq=VH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlGDp-0004iz-Vv
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 17:17:38 +0000
X-Inumbo-ID: 9d236bca-a336-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9d236bca-a336-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 17:17:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9F46344;
 Wed, 10 Jul 2019 10:17:36 -0700 (PDT)
Received: from [10.119.48.3] (unknown [10.119.48.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A66D43F246;
 Wed, 10 Jul 2019 10:17:36 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906181618130.2072@sstabellini-ThinkPad-T480s>
 <20190618232019.26425-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5d5749e2-883d-70f5-b953-7381d9207b0b@arm.com>
Date: Wed, 10 Jul 2019 18:17:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190618232019.26425-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/5] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, JBeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKClRoZSBBcm0gY29kZSBsb29rcyBnb29kIHRvIG1lLiBPbmUgY29tbWVudCBi
ZWxvdy4KCk9uIDYvMTkvMTkgMTI6MjAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3AybS5jIGIveGVuL2FyY2gvYXJtL3AybS5jCj4gaW5k
ZXggZTI4ZWExYzg1YS4uZDg4ZGYxMWUwOSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vcDJt
LmMKPiArKysgYi94ZW4vYXJjaC9hcm0vcDJtLmMKPiBAQCAtMTMxMCwzMSArMTMxMCwxOCBAQCBz
dGF0aWMgaW5saW5lIGludCBwMm1fcmVtb3ZlX21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwKPiAg
ICAgICByZXR1cm4gcmM7Cj4gICB9Cj4gICAKPiAtaW50IG1hcF9yZWdpb25zX3AybXQoc3RydWN0
IGRvbWFpbiAqZCwKPiAraW50IG1hcF9tbWlvX3JlZ2lvbnMoc3RydWN0IGRvbWFpbiAqZCwKPiAg
ICAgICAgICAgICAgICAgICAgICAgIGdmbl90IGdmbiwKPiAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGxvbmcgbnIsCj4gICAgICAgICAgICAgICAgICAgICAgICBtZm5fdCBtZm4sCj4g
ICAgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQpCj4gICB7Cj4gKyAgICBBU1NF
UlQoIHAybXQgPT0gcDJtX21taW9fZGlyZWN0X2RldiB8fAo+ICsgICAgICAgICAgICBwMm10ID09
IHAybV9tbWlvX2RpcmVjdF9uYyB8fAo+ICsgICAgICAgICAgICBwMm10ID09IHAybV9tbWlvX2Rp
cmVjdF9jICk7CgpDb3VsZCB5b3UgaW50cm9kdWNlIHAybV9pc19tbWlvKC4uLikgaW4gcDJtLmg/
Cgo+ICAgICAgIHJldHVybiBwMm1faW5zZXJ0X21hcHBpbmcoZCwgZ2ZuLCBuciwgbWZuLCBwMm10
KTsKPiAgIH0KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
