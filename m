Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B80CCC43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:31:48 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F602206C1
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 14:31:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F602206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK1sj-0004zZ-3M; Fri, 26 Apr 2019 14:31:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pi39=S4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hK1si-0004zU-2g
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 14:31:16 +0000
X-Inumbo-ID: f208d2c8-682f-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f208d2c8-682f-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 14:31:14 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531B6A78;
 Fri, 26 Apr 2019 07:31:14 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3727A3F5C1;
 Fri, 26 Apr 2019 07:31:13 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-3-julien.grall@arm.com>
 <3fa56715-823e-985b-384c-dc8342d77364@gmail.com>
 <fb22f2a1-f3a6-a962-a9ba-54c22e5c7d2a@arm.com>
 <4e365b84-122d-e613-ceaa-e2df8c865262@gmail.com>
 <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7c231a06-bac3-1a76-2fc8-73042a900953@arm.com>
Date: Fri, 26 Apr 2019 15:31:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <eb656a28-7910-c65a-bf50-1c62494f5acd@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/7] xen/arm: Remove
 flush_xen_text_tlb_local()
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
Message-ID: <20190426143111.meMnMMnecDccubheR6cc2_waO5RYZlAK7qpKluyRI00@z>

CgpPbiAyNi8wNC8yMDE5IDE1OjE1LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEp1bGllbiwKPiAK
PiBTb3JyeSwgcmVwbHkgZm9ybWF0IGlzIGJyb2tlbi4gSXQgc2hvdWxkIGJlIGFzIGZvbGxvd2lu
ZzoKPiAKPiBPbiAyNi4wNC4xOSAxNjo1MCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4+IFRvIGJl
IGhvbmVzdCwgSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGV0aGVyIHRoZSBpc2IoKSBpcyBuZWNl
c3NhcnkKPj4+IGhlcmUuIEF0IHdvcnN0LCBhbiBlbnRyeSBvZiBhbiBleGlzdGluZyBtYXBwaW5n
cyBpcyBub3QgY2FjaGVkIHdpdGggdGhlCj4+PiBTQ1RMUl9FTDIuV1hOIHNldC4gVGhpcyBtYXkg
b25seSBkZWZlciB0aGUgcHJvYmxlbSBpcyBhbiBlbnRyeSBpcwo+Pj4gaW5jb3JyZWN0bHkgY29u
ZmlndXJlZCBiZWZvcmUgdGhlIGZsdXNoLiBUaGlzIGlzIGRvbmUgZWFybHkgYXQgYm9vdCAoYW5k
Cj4+PiB3aWxsIGJlIGRvbmUgbXVjaCBlYXJsaWVyIGluIFsxXSkuCj4gCj4gCj4gV2VsbCwgZm9s
bG93aW5nIHRoaXMgbG9naWMgd2UgbWF5IGZpbmlzaCB3aXRoIFRMQiBmbHVzaCBpcyBub3QgbmVl
ZGVkIGhlcmUgYXQgCj4gYWxsLiBCZWNhdXNlIGVudHJpZXMsIGFscmVhZHkgcmVhY2hlZCBUTEIs
IHdlcmUgY29uZmlndXJlZCBiZWZvcmUsIGFuZCBhcmUgCj4gYmVsaWV2ZWQgdmFsaWQuIEFsbCB0
aGUgbmV4dCB3aWxsIGhhdmUgV1hOIHNldC4KPiBCdXQgaW4gdGhpcyBjYXNlLCBJU0IgaXMgbmVl
ZGVkIGFzIGFuIGV4YWN0IHBvaW50IGZyb20gd2hpY2ggYWxsIG5ldyBUTEIgZW50cmllcyAKPiB3
aWxsIGhhdmUgV1hOLgoKSSBhbSBub3Qgc3VyZSB0byBmb2xsb3cgeW91ciBwb2ludCBoZXJlLiBJ
dCB3YXNuJ3QgY2xlYXIgdG8gbWUgd2hldGhlciB0aGUgaXNiKCkgCmJldHdlZW4gc2V0dGluZyBT
Q1RMUl9FTDIuV1hOIGFuZCBUTEIgZmx1c2ggaXMgc3RyaWN0bHkgbmVjZXNzYXJ5LiBUaGUgVExC
IGZsdXNoIApjb250YWluIGFuIGlzYigpIHNvLCBpdCBtYXkgaGFzIHdlbGwgYmUgZW5vdWdoIGhl
cmUuCgpIb3dldmVyLCBzcGVha2luZyB3aXRoIE1hcmsgUnV0bGFuZCwgaXQgd291bGQgYmUgYmVz
dCB0byBrZWVwIHRoZSBzZXF1ZW5jZSAKc3VnZ2VzdCBpbiB0aGlzIHBhdGNoLiBTbyBTQ1RMUl9F
TDIuV1hOIGlzIHZpc2libGUgYmVmb3JlIHRoZSBmbHVzaCBhbmQgdGhlIApmbHVzaCB3aWxsIGVu
c3VyZSBhbGwgY3VycmVudCBlbnRyaWVzIGFyZSByZW1vdmVkLiBTbyBub25lIG9mIHRoZSBlbnRy
aWVzIHNob3VsZCAKaGF2ZSBXWE4gY2xlYXJlZC4KClNvIEkgd2lsbCBrZWVwIHRoaXMgcGF0Y2gg
YXMgaXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
