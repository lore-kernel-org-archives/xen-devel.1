Return-Path: <SRS0=ZpmR=ST=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B84C282DA
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:00:29 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A10B2183E
	for <xen-devel@archiver.kernel.org>; Wed, 17 Apr 2019 21:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A10B2183E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGrfA-0003wJ-ST; Wed, 17 Apr 2019 21:00:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Uj5y=ST=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGrf9-0003wE-Ln
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2019 21:00:11 +0000
X-Inumbo-ID: c96bf960-6153-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c96bf960-6153-11e9-92d7-bc764e045a96;
 Wed, 17 Apr 2019 21:00:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA90515AB;
 Wed, 17 Apr 2019 14:00:09 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73BD83F557;
 Wed, 17 Apr 2019 14:00:08 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
Date: Wed, 17 Apr 2019 22:00:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190417210006.WS_kWz7ZHdafTnPOH-bCvi_8K99igjkKTX7nUsX536w@z>

SGksCgpPbiA0LzE3LzE5IDk6NDUgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBX
ZWQsIDI3IE1hciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENsYW5nIHVuZGVyc3RhbmRz
IHRoZSBHQ0Npc20gaW4gdXNlIGhlcmUsIGJ1dCBzdGlsbCBjb21wbGFpbnMgdGhhdCBzcCBpcwo+
PiB1bml0aWFsaXNlZC4gSW4gc3VjaCBjYXNlcywgcmVzb3J0IHRvIHRoZSBvbGRlciB2ZXJzaW9u
cyBvZiB0aGlzIGNvZGUsCj4+IHdoaWNoIGRpcmVjdGx5IHJlYWQgc3AgaW50byB0aGUgdGVtcG9y
YXJ5IHZhcmlhYmxlLgo+Pgo+PiBOb3RlIHRoYXQgd2Ugc3RpbGwga2VlcCB0aGUgR0NDaXNtIGlu
IHRoZSBkZWZhdWx0IGNhc2UsIGFzIGl0IGNhdXNlcyBHQ0MKPj4gdG8gY3JlYXRlIHJhdGhlciBi
ZXR0ZXIgYXNzZW1ibHkuCj4+Cj4+IFRoaXMgaXMgYmFzZWQgb24gdGhlIHg4NiBjb3VudGVycGFy
dC4KPiAKPiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBiYXNlZCBvbiBhbiBleGlzdGluZyBhcHByb2Fj
aCBidXQgd2hhdCBhYm91dCBvdGhlcgo+IGNvbXBpbGVycz8gSSBoYXZlIGEgc3VnZ2VzdGlvbiBi
ZWxvdy4KCldoYXQgaWYgdGhlIGNvbXBpbGVyIGFjdHVhbGx5IHN1cHBvcnQgbmFtZWQgcmVnaXN0
ZXJzPyBXaHkgd291bGQgd2UgbWFrZSAKdGhlIGNvZGUgbGVzcyBlZmZpY2llbnQ/CgpDaGVlcnMs
CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
