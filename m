Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37647C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:36:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04CAF21852
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 14:35:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04CAF21852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCPvs-0000JG-0M; Fri, 05 Apr 2019 14:35:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NmJK=SH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hCPvq-0000JB-R3
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 14:35:02 +0000
X-Inumbo-ID: fe8eb688-57af-11e9-81f6-fbb58027e80d
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fe8eb688-57af-11e9-81f6-fbb58027e80d;
 Fri, 05 Apr 2019 14:35:01 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1674C16A3;
 Fri,  5 Apr 2019 07:35:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2CF003F68F;
 Fri,  5 Apr 2019 07:35:00 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190128155909.14289-1-julien.grall@arm.com>
 <f916ec14-a1bd-c4bd-0287-655cfb831d89@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8dec40f1-3b28-d178-13e9-f0dbcde8b7c2@arm.com>
Date: Fri, 5 Apr 2019 15:34:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <f916ec14-a1bd-c4bd-0287-655cfb831d89@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
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
Message-ID: <20190405143458.jQ1Fy_o2WkgRXQ3Qb_m9HMi__drduhyDkkXeAmMe4d8@z>

CgpPbiAwNS8wNC8yMDE5IDE1OjE2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDI4LjAxLjE5
IDE3OjU5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFdoaWxlIFNQSXMgYXJlIHNoYXJlZCBiZXR3
ZWVuIENQVSwgaXQgaXMgbm90IHBvc3NpYmxlIHRvIHJlY2VpdmUgdGhlCj4+IHNhbWUgaW50ZXJy
dXB0cyBvbiBhIGRpZmZlcmVudCBDUFUgd2hpbGUgdGhlIGludGVycnVwdCBpcyBpbiBhY3RpdmUK
Pj4gc3RhdGUuIFRoZSBkZWFjdGl2YXRpb24gb2YgdGhlIGludGVycnVwdCBpcyBkb25lIGF0IHRo
ZSBlbmQgb2YgdGhlCj4+IGhhbmRsaW5nLgo+Pgo+PiBUaGlzIG1lYW5zIHRoZSBfSVJRX1BFTkRJ
TkcgbG9naWMgaXMgdW5lY2Vzc2FyeSBvbiBBcm0gYXMgYSBzYW1lCj4+IGludGVycnVwdCBjYW4g
bmV2ZXIgY29tZSB1cCB3aGlsZSBpbiB0aGUgbG9vcC4gU28gcmVtb3ZlIGl0IHRvCj4+IHNpbXBs
aWZ5IHRoZSBpbnRlcnJ1cHQgaGFuZGxlIGNvZGUuCj4gCj4gV2hhdCBhYm91dCBfSVJRX1BFTkRJ
TkcgbWFjcm8gaXRzZWxmPwo+IEFueSByZWFzb25zIHRvIG5vdCBlbGltaW5hdGUgaXQ/CgpJdCBp
cyBpbiBjb21tb24gaGVhZGVyIGFuZCB1c2VkIGJ5IHg4Ni4gSXQgaXMgcHJlZmVyYWJsZSB0byBr
ZWVwIGFsbCBJUlEgZmxhZ3MgCmF0IHRoZSBzYW1lIHBsYWNlIGhlbmNlIHdoeSB0aGlzIHdhcyBu
b3QgbW92ZWQgaW4gYXJjaC1zcGVjaWZpYyBoZWFkZXIuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
