Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A83C10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:11:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8379A2084E
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 16:11:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8379A2084E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFhiw-00027Y-BI; Sun, 14 Apr 2019 16:11:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFhiv-00027S-8d
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 16:11:17 +0000
X-Inumbo-ID: edfe6217-5ecf-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id edfe6217-5ecf-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 16:11:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EF7680D;
 Sun, 14 Apr 2019 09:10:45 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 267603F68F;
 Sun, 14 Apr 2019 09:10:44 -0700 (PDT)
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1555223611-10263-1-git-send-email-amittomer25@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7e3b90ce-d4ea-d1ba-2c39-f5920e12d73b@arm.com>
Date: Sun, 14 Apr 2019 17:10:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1555223611-10263-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen/arm: Add Amlogic Meson SoCs
 earlyprintk support
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414161042.l-mh0FmAKEuwa1s9CJmuVaTNBvDNnvxQXesSxUQ6uF8@z>

SGkgQW1pdCwKCk9uIDQvMTQvMTkgNzozMyBBTSwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPiBU
aGlzIHBhdGNoIGFkZHMgZWFybHlwcmludGsgc3VwcG9ydCBmb3IgQW1sb2dpYyBNZXNvbiBTb0Mg
YmFzZWQKPiBib2FyZHMuCj4gCj4gSXQgcmVsaWVzIG9uIGZpcm13YXJlWzFdIHRvIGluaXRpYWxp
emUgdGhlIFVBUlQuCgpEbyBhbGwgdGhlIGZpcm13YXJlIGV4aXN0aW5nIGZvciB0aGlzIHBsYXRm
b3JtIGluaXRpYWxpemUgdGhlIFVBUlQ/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
