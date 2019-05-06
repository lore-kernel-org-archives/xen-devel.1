Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006B2C04A6B
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 16:55:09 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D141D205ED
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 16:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D141D205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNgt6-0007wD-Ck; Mon, 06 May 2019 16:54:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IX9s=TG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hNgt4-0007w8-VS
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 16:54:47 +0000
X-Inumbo-ID: a4c6e46c-701f-11e9-b1b6-8737bb7011fe
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a4c6e46c-701f-11e9-b1b6-8737bb7011fe;
 Mon, 06 May 2019 16:54:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB755374;
 Mon,  6 May 2019 09:54:41 -0700 (PDT)
Received: from [10.37.12.89] (unknown [10.37.12.89])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 920A43F575;
 Mon,  6 May 2019 09:54:40 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
 <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
 <4bd14bff-9689-7943-9319-908b74139617@arm.com>
 <a4fa267f-c4c0-ac09-4694-42f675965cea@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9bc3a7a4-aadd-a6ec-b7ff-86d1f6f755c6@arm.com>
Date: Mon, 6 May 2019 17:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <a4fa267f-c4c0-ac09-4694-42f675965cea@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190506165438.WfZZ7XjOuocet3gyBRqRlUneJ8VIfieTY_XV_NNTRRw@z>

CgpPbiA1LzYvMTkgOToyMCBBTSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKdWxpZW4s
Cj4gCj4gT24gMDMuMDUuMTkgMjA6MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gVExEUjsgYmVj
YXVzZSB4ZW4gcGFnZS10YWJsZXMgYXJlIG5vdCB0aGF0IG9mdGVuIG1vZGlmaWVkIGFmdGVyIGJv
b3QuIAo+PiBZZXQgaXQgaXMgc3RpbGwgcG9zc2libGUgdG8gcmFjZS4KPj4KPj4gQXQgdGhlIG1v
bWVudCwgY3JlYXRlX3hlbl9lbnRyaWVzKCkgY2FuIG9ubHkgbW9kaWZ5IHRoZSBWQSByYW5nZSAw
IC0gCj4+IDJHQi4gSW4gdGhhdCByYW5nZSwgd2UgY2FuIG1vZGlmeSBhdCBydW50aW1lIHRoZSBW
TUFQIGFyZWEuIE9uZSAKPj4gcG90ZW50aWFsIGlzc3VlIGlzCj4+IGEgdm1hcCBpc3N1ZWQgYXQg
dGhlIHNhbWUgdGltZS4KPj4KPj4gV2hpbGUgdGhlIHJhbmdlIGFsbG9jYXRpb24gaXMgcHJvdGVj
dGVkIGJ5IGEgbG9jayAoc2VlIHZtX2FsbG9jKSwgdGhlIAo+PiBtYXBwaW5nIGlzIG5vdC4gU28g
aXQgd291bGQgYmUgcG9zc2libGUgdG8gZW5kIHVwIG1vZGlmeWluZyB0aGUgCj4+IHBhZ2UtdGFi
bGUgYXQgdGhlIHNhbWUuIFRoYXQgY291bGQgYmxvdyB1cCBpZiBmb3IgaW5zdGFuY2UsIHRoZSAK
Pj4gc2Vjb25kLWxldmVsIGVudHJ5IGlzIGludmFsaWQgYXMgd2Ugd291bGQgbmVlZCB0byBhbGxv
Y2F0ZSBtZW1vcnkgCj4+IChvbmx5IG9uZSBjYW4gd2luIHRoYXQgcmFjZSkuCj4gCj4gSSB1bmRl
cnN0YW5kIHRoZSBwb3RlbnRpYWwgcmFjZSwgYnV0IHN0aWxsIHdvbmRlcmluZyB3aHkgZGlkbid0
IHdlIHNlZSAKPiB0aG9zZSBpc3N1ZXMuIE1heWJlIHdlIGFyZSB0b28gbHVja3kuCgpBcyBJIHBv
aW50ZWQgb3V0IGFib3ZlLCB0aGUgVk1BUCBhcmVhIGlzIG5vdCBvZnRlbiB1cGRhdGVkIGFmdGVy
IGJvb3QuIApGdXJ0aGVybW9yZSwgdG8gaGl0IHRoZSByYWNlLCB5b3UgbmVlZCB0byBpbnNlcnQg
MiBlbnRyaWVzIGNvdmVyZWQgYnkgCnRoZSBzYW1lIHVuYWxsb2NhdGVkIDNyZC1sZXZlbCB0YWJs
ZSBhdCB0aGUgc2FtZSB0aW1lLiBBcyB0aGUgM3JkLWxldmVsIAp0YWJsZSBhcmUgb25seSBhbGxv
Y2F0ZWQgb25jZSBhbmQgbmV2ZXIgcmVsZWFzZWQsIHlvdSBwcm9iYWJseSBoYXZlIG1vcmUgCmNo
YW5jZSB0byB3aW4gYXQgdGhlIGxvdHRlcnkgb3ZlciBoaXR0aW5nIHRoZSByYWNlLgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
