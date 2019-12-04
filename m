Return-Path: <SRS0=ZD/N=Z2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7607DC2BC73
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 10:37:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 511602154A
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 10:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 511602154A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icS1L-0000iJ-3W; Wed, 04 Dec 2019 10:36:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVNC=Z2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1icS1K-0000iE-BS
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:36:34 +0000
X-Inumbo-ID: f06c8404-1681-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f06c8404-1681-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 10:36:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 60BBDB164;
 Wed,  4 Dec 2019 10:36:32 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20191202114117.1264-1-pdurrant@amazon.com>
 <20191202114117.1264-2-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d6998d80-99f1-ffa4-f4cf-5c9bb938587d@suse.com>
Date: Wed, 4 Dec 2019 11:36:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191202114117.1264-2-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/2] xen/xenbus: reference count
 registered modules
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
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTIuMTkgMTI6NDEsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUbyBwcmV2ZW50IGEgUFYg
ZHJpdmVyIG1vZHVsZSBiZWluZyByZW1vdmVkIHdoaWxzdCBhdHRhY2hlZCB0byBpdHMgb3RoZXIK
PiBlbmQsIGFuZCBoZW5jZSB4ZW5idXMgY2FsbGluZyBpbnRvIHBvdGVudGlhbGx5IGludmFsaWQg
dGV4dCwgdGFrZSBhCj4gcmVmZXJlbmNlIG9uIHRoZSBtb2R1bGUgYmVmb3JlIGNhbGxpbmcgdGhl
IHByb2JlKCkgbWV0aG9kIChkcm9wcGluZyBpdCBpZgo+IHVuc3VjY2Vzc2Z1bCkgYW5kIGRyb3Ag
dGhlIHJlZmVyZW5jZSBhZnRlciByZXR1cm5pbmcgZnJvbSB0aGUgcmVtb3ZlKCkKPiBtZXRob2Qu
Cj4gCj4gU3VnZ2VzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgoKUHVzaGVkIHRv
IHhlbi90aXAuZ2l0IGZvci1saW51cy01LjViCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
