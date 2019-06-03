Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92EF0C04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 12:44:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F31327EBE
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 12:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F31327EBE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXmKE-0005ph-SM; Mon, 03 Jun 2019 12:44:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXmKD-0005pb-Jq
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 12:44:29 +0000
X-Inumbo-ID: 5377d53c-85fd-11e9-871b-7f2d68557f13
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5377d53c-85fd-11e9-871b-7f2d68557f13;
 Mon, 03 Jun 2019 12:44:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4CFBE15A2;
 Mon,  3 Jun 2019 05:44:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F70B3F5AF;
 Mon,  3 Jun 2019 05:44:27 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-10-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2b7d24b8-02a0-3ff6-bfa3-56811063a70e@arm.com>
Date: Mon, 3 Jun 2019 13:44:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521212530.12706-10-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 09/10] tools/arm: tee: add "tee" option
 for xl.cfg
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
Cc: "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603124425.mGXDFlFp_IEmv7qZQR0tSE3VgVK3SpsdRVLxh0Q9B1k@z>

SGkgVm9sb2R5bXlyLAoKU29tZSBjb21tZW50IG9uIHRoZSBkb2N1bWVudGF0aW9uLCB0aGUgcmVz
dCBsb29rcyBnb29kIHRvIG1lLgoKCk9uIDIxLzA1LzIwMTkgMjI6MjYsIFZvbG9keW15ciBCYWJj
aHVrIHdyb3RlOgo+IGRpZmYgLS1naXQgYS9kb2NzL21hbi94bC5jZmcuNS5wb2QuaW4gYi9kb2Nz
L21hbi94bC5jZmcuNS5wb2QuaW4KPiBpbmRleCBjN2Q3MGU2MThiLi43M2M2NGRjODk2IDEwMDY0
NAo+IC0tLSBhL2RvY3MvbWFuL3hsLmNmZy41LnBvZC5pbgo+ICsrKyBiL2RvY3MvbWFuL3hsLmNm
Zy41LnBvZC5pbgo+IEBAIC0xNTQ0LDYgKzE1NDQsMjUgQEAgU2V0IG1heGltdW0gaGVpZ2h0IGZv
ciBwb2ludGVyIGRldmljZS4KPiAgIAo+ICAgPWJhY2sKPiAgIAo+ICs9aXRlbSBCPHRlZT1bIm5v
bmUiLCAib3B0ZWUiXT4KClRoaXMgd2lsbCBiZWNvbWUgcXVpdGUgZGlmZmljdWx0IHRvIHJlYWQg
aWYgd2UgYWRkIG1vcmUgVEVFLiBIb3cgYWJvdXQ6Cgo8dGVlPSJTVFJJTkciPj8KCj4gKwo+ICtT
ZXQgVEVFIHR5cGUgZm9yIHRoZSBndWVzdC4gVEVFIGlzIGEgVHJ1c3RlZCBFeGVjdXRpb24gRW52
aXJvbm1lbnQgLS0gc2VwYXJhdGUKPiArc2VjdXNlIE9TIGZvdW5kIG9uIHNvbWUgcGxhdGZvcm1z
LgoKcy9zZWN1c2Uvc2VjdXJlLwoKSSB3b3VsZCBhbHNvIG1lbnRpb24gdGhpcyBpcyBBcm0gb25s
eSBzbyBmYXIuIE1heWJlOgoKQjxBcm0gb25seT4gU2V0IFRFRS4uLgoKPiArCj4gKz1vdmVyIDQK
PiArCj4gKz1pdGVtIEI8Im5vbmUiPgo+ICsKPiArRGlzYWJsZSBURUUgc3VwcG9ydCBhdCBhbGwu
IFRoaXMgaXMgdGhlIGRlZmF1bHQgdmFsdWUuCj4gKwo+ICs9aXRlbSBCPCJvcHRlZSI+Cj4gKwo+
ICtBbGxvdyBndWVzdCB0byBhY2Nlc3MgdG8gT1AtVEVFIGVuYWJsZWQgb24gdGhlIHBsYXRmb3Jt
LiBHdWVzdCB3aWxsIG5vdCBiZSBjcmVhdGVkCj4gK2lmIHBsYXRmb3JtIGRvZXMgbm90IGhhdmUg
T1AtVEVFIHdpdGggdmlydHVhbGl6YXRpb24gZmVhdHVyZSBvciBpZiBPUC1URUUgd2lsbAo+ICtk
ZW55IGFjY2Vzcy4KCkkgaGF2ZSBzb21lIHRyb3VibGUgdG8gcmVhZCB0aGlzIHBhcmFncmFwaC4g
SG93IGFib3V0OgoKIkFsbG93IGEgZ3Vlc3QgdG8gdXNlIE9QLVRFRS4gTm90ZSB0aGF0IGEgdmly
dHVhbGl6YXRpb24tYXdhcmUgT1AtVEVFIGlzIApyZXF1aXJlZCBmb3IgdGhpcy4iLgoKPiArCj4g
Kz1iYWNrCj4gKwo+ICAgPWJhY2sKPiAgIAo+ICAgPWhlYWQyIFBhcmF2aXJ0dWFsaXNlZCAoUFYp
IEd1ZXN0IFNwZWNpZmljIE9wdGlvbnMKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
