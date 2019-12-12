Return-Path: <SRS0=p1A9=2C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20019C2D0C8
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 06:04:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F156B2173E
	for <xen-devel@archiver.kernel.org>; Thu, 12 Dec 2019 06:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F156B2173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifHaT-0008VI-8l; Thu, 12 Dec 2019 06:04:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifHaR-0008VB-QZ
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 06:04:31 +0000
X-Inumbo-ID: 423c57cc-1ca5-11ea-8cb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 423c57cc-1ca5-11ea-8cb6-12813bfff9fa;
 Thu, 12 Dec 2019 06:04:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 35B59AD75;
 Thu, 12 Dec 2019 06:04:29 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191211152956.5168-1-pdurrant@amazon.com>
 <20191211152956.5168-4-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <cfd8f169-e925-dbff-64b2-d471300a6694@suse.com>
Date: Thu, 12 Dec 2019 07:04:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211152956.5168-4-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/4] xen/interface: re-define
 FRONT/BACK_RING_ATTACH()
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

T24gMTEuMTIuMTkgMTY6MjksIFBhdWwgRHVycmFudCB3cm90ZToKPiBDdXJyZW50bHkgdGhlc2Ug
bWFjcm9zIGFyZSBkZWZpbmVkIHRvIHJlLWluaXRpYWxpemUgYSBmcm9udC9iYWNrIHJpbmcKPiAo
cmVzcGVjdGl2ZWx5KSB0byB2YWx1ZXMgcmVhZCBmcm9tIHRoZSBzaGFyZWQgcmluZyBpbiBzdWNo
IGEgd2F5IHRoYXQgYW55Cj4gcmVxdWVzdHMvcmVzcG9uc2VzIHRoYXQgYXJlIGFkZGVkIHRvIHRo
ZSBzaGFyZWQgcmluZyB3aGlsc3QgdGhlIGZyb250L2JhY2sKPiBpcyBkZXRhY2hlZCB3aWxsIGJl
IHNraXBwZWQgb3Zlci4gVGhpcywgaW4gZ2VuZXJhbCwgaXMgbm90IGEgZGVzaXJhYmxlCj4gc2Vt
YW50aWMgc2luY2UgbW9zdCBmcm9udGVuZCBpbXBsZW1lbnRhdGlvbnMgd2lsbCBldmVudHVhbGx5
IGJsb2NrIHdhaXRpbmcKPiBmb3IgYSByZXNwb25zZSB3aGljaCB3b3VsZCBlaXRoZXIgbmV2ZXIg
YXBwZWFyIG9yIG5ldmVyIGJlIHByb2Nlc3NlZC4KPiAKPiBTaW5jZSB0aGUgbWFjcm9zIGFyZSBj
dXJyZW50bHkgdW51c2VkLCB0YWtlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gcmUtZGVmaW5lCj4gdGhl
bSB0byByZS1pbml0aWFsaXplIGEgZnJvbnQvYmFjayByaW5nIHVzaW5nIHNwZWNpZmllZCB2YWx1
ZXMuIFRoaXMgYWxzbwo+IGFsbG93cyBGUk9OVC9CQUNLX1JJTkdfSU5JVCgpIHRvIGJlIHJlLWRl
ZmluZWQgaW4gdGVybXMgb2YKPiBGUk9OVC9CQUNLX1JJTkdfQVRUQUNIKCkgdXNpbmcgYSBzcGVj
aWZpZWQgdmFsdWUgb2YgMC4KPiAKPiBOT1RFOiBCQUNLX1JJTkdfQVRUQUNIKCkgd2lsbCBiZSB1
c2VkIGRpcmVjdGx5IGluIGEgc3Vic2VxdWVudCBwYXRjaC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQ
YXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpSZXZpZXdlZC1ieTogSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
