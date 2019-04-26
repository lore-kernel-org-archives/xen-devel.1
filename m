Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E17DC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:07:55 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0BFB206C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0BFB206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK1V4-0002hO-Ri; Fri, 26 Apr 2019 14:06:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK1V3-0002hJ-2U
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 14:06:49 +0000
X-Inumbo-ID: 87b1917e-682c-11e9-8937-8b8d790d7f9b
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 87b1917e-682c-11e9-8937-8b8d790d7f9b;
 Fri, 26 Apr 2019 14:06:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 633B2A78;
 Fri, 26 Apr 2019 07:06:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 475B83F5C1;
 Fri, 26 Apr 2019 07:06:46 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-7-julien.grall@arm.com>
 <4de7931e-27e0-be57-51e0-f2807aeff7bd@gmail.com>
 <d700c117-80b6-45c7-38f8-6193f92e2a63@arm.com>
 <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0308fa00-070f-cc98-2ef4-f109d94aa8b8@arm.com>
Date: Fri, 26 Apr 2019 15:06:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <122d7f0f-d209-6a7a-8092-64985797b383@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/7] xen/arm: tlbflush: Rework TLB helpers
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
Cc: "Oleksandr_Tyshchenko@epam.com" <Oleksandr_Tyshchenko@epam.com>,
 nd <nd@arm.com>, "Andrii_Anisov@epam.com" <Andrii_Anisov@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426140644._mbRngssZlThTicdyD5Y8mkjZo0zewWKbwX-VMGlk9A@z>

SGksCgpPbiAyNi8wNC8yMDE5IDE0OjQ5LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IAo+IAo+IE9u
IDI1LjA0LjE5IDIzOjQyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEkgYW0gbm90IHN1cmUgd2h5
IEkgdXNlIEEuayBiZWNhdXNlIHRoaXMgaXMgYSBwcmV0dHkgb2xkIHNwZWMuCj4gSSBkaWQgbWVh
biB0aGF0IEEuay4gaXMgbm90IHB1YmxpY2x5IGF2YWlsYWJsZSwgZXZlbiBub3csIHNvIGl0IGlz
IG5vdCBxdWl0ZSAKPiByaWdodCB0byByZWZlciBzdWNoIGEgZG9jdW1lbnQsIGF0IGxlYXN0IHdp
dGhvdXQgbWVudGlvbmluZyBpdCBpcyBpbnRlcm5hbApQbGVhc2UgYXZvaWQgdG8gdGFrZSBteSB3
b3JkcyBvdXQgb2YgY29udGV4dC4uLiBBcyB5b3UgcmVhZCB0aGUgc2VudGVuY2UgYWJvdmUsIAp5
b3UgcHJvYmFibHkgbm90aWNlZCB0aGF0IEEuayB3YXMgcHVibGlzaGVkIHdpdGggZGVmZWN0cyBp
biBpdCBhbmQgcHJvYmFibHkgdGhlIApyZWFzb25zIHdoeSBpdCBjYW4ndCBiZSBmb3VuZCB0b2Rh
eS4KCkkgZG93bmxvYWQgYWxsIG15IHNwZWNzIGZyb20gcHVibGljIHdlYnNpdGUgdG8gYXZvaWQg
cG90ZW50aWFsIGRpc2Nsb3N1cmUgb2YgCmludGVybmFsIGNvbnRlbnQuIElmIHlvdSBsb29rIGF0
IEdvb2dsZSwgdGhlIHNwZWMgd2FzIGFjdHVhbGx5IHB1YmxpYyBhdCBzb21lIApwb2ludCAoc2Vl
IFsxXSBmb3IgaW5zdGFuY2UpLgoKSW4gd2hhdCB5b3UgcXVvdGUsIEkgbWVyZWx5IHBvaW50ZWQg
b3V0IHRoYXQgSSBzaG91bGQgbm90IGhhdmUgdXNlZCBpdCBiZWNhdXNlIAppdCBpcyBwcmV0dHkg
b2xkICh+MiBhbmQgaGFsZiB5ZWFycykuCgpDaGVlcnMsCgpbMV0gaHR0cHM6Ly9sa21sLm9yZy9s
a21sLzIwMTcvMy8zLzI0NwoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
