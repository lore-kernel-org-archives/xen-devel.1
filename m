Return-Path: <SRS0=JVlm=TD=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F999C43219
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 16:21:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47E9A20651
	for <xen-devel@archiver.kernel.org>; Fri,  3 May 2019 16:21:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47E9A20651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMawK-0003lG-Rm; Fri, 03 May 2019 16:21:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMawJ-0003l7-9g
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:21:35 +0000
X-Inumbo-ID: 84652f00-6dbf-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 84652f00-6dbf-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 16:21:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B19D6A78;
 Fri,  3 May 2019 09:21:33 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6DC43F557;
 Fri,  3 May 2019 09:21:32 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-13-julien.grall@arm.com>
 <be841c38-657f-de69-0a9b-dd2b8c214a22@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0308b323-9bde-dfaa-830b-717b1867d3b0@arm.com>
Date: Fri, 3 May 2019 17:21:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <be841c38-657f-de69-0a9b-dd2b8c214a22@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 12/20] xen/arm32: head: Always zero r3
 before update a page-table entry
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
Message-ID: <20190503162131.1oFpjiArD6DuZw9ScK27sqH41Waele2nmqA8WrbfSWA@z>

CgpPbiAwMy8wNS8yMDE5IDE2OjU3LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IEhlbGxvIEp1bGll
biwKPiAKPiBPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBUaGUgYm9v
dCBjb2RlIGlzIHVzaW5nIHIyIGFuZCByMyB0byBob2xkIHRoZSBwYWdlLXRhYmxlIGVudHJ5IHZh
bHVlLgo+PiBXaGlsZSByMiBpcyBhbHdheXMgdXBkYXRlZCBiZWZvcmUgc3RvcmluZyB0aGUgdmFs
dWUsIHRoaXMgaXMgbm90IGFsd2F5cwo+PiB0aGUgY2FzZSBmb3IgcjMuCj4+Cj4+IFRoYW5rZnVs
bHkgdG9kYXksIHIzIHdpbGwgYWx3YXlzIGJlIHplcm8gd2hlbiB3ZSBjYXJlLiBCdXQgdGhpcyBp
cwo+PiBkaWZmaWN1bHQgdG8gdHJhY2sgYW5kIGVycm9yLXByb25lLgo+Pgo+PiBTbyBhbHdheXMg
emVybyByMyB3aXRoaW4gdGhlIGZldyBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSB3cml0ZSB0aGUK
Pj4gcGFnZS10YWJsZSBlbnRyeS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxq
dWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4gLS0tCj4+IMKgIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMgfCAzICsrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4+Cj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TIGIveGVuL2FyY2gvYXJtL2FybTMy
L2hlYWQuUwo+PiBpbmRleCAzNDQ4ODE3YWFiLi4wNTM2YjYyYWVjIDEwMDY0NAo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFk
LlMKPj4gQEAgLTI3MCw2ICsyNzAsNyBAQCBjcHVfaW5pdF9kb25lOgo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgb3JywqDCoCByMiwgcjIsICNQVF9VUFBFUihNRU0pIC8qIHIyOnIzIDo9IHNlY3Rpb24g
bWFwICovCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBvcnLCoMKgIHIyLCByMiwgI1BUX0xPV0VSKE1F
TSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGxzbMKgwqAgcjEsIHIxLCAjM8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAvKiByMSA6PSBTbG90IG9mZnNldCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgbW92
wqDCoCByMywgIzB4MD7CoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJkwqAgcjIsIHIzLCBbcjQsIHIx
XcKgwqDCoMKgwqDCoCAvKiBNYXBwaW5nIG9mIAo+PiBwYWRkcihzdGFydCkgKi8KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIG1vdsKgwqAgcjYsICMxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLyogcjYgOj0gaWRlbnRpdHkgbWFwIG5vdyBpbiBwbGFjZSAqLwo+PiBAQCAtMzc3LDYgKzM3
OCw3IEBAIHBhZ2luZzoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGxzbMKgwqAgcjIsIHIyLCAjVEhJ
UkRfU0hJRlTCoMKgIC8qIDRLIGFsaWduZWQgcGFkZHIgb2YgVUFSVCAqLwo+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgb3JywqDCoCByMiwgcjIsICNQVF9VUFBFUihERVZfTDMpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBvcnLCoMKgIHIyLCByMiwgI1BUX0xPV0VSKERFVl9MMykgLyogcjI6cjMgOj0gNEsg
ZGV2IG1hcCBpbmNsdWRpbmcgCj4+IFVBUlQgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIG1vdsKgwqAg
cjMsICMwCj4gCj4gV2hhdCdzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gYCMweDBgIGFuZCBgIzBg
PyBJJ3ZlIHNlZW4gdGhlIHVzYWdlIGlzIG1peGVkIAo+IGFjcm9zcyB0aGUgZmlsZSwgYnV0IG5v
dCBzdXJlIHdoeS4gQ291bGQgaXQgYmUgdW5pZmllZD8KCk5vIGRpZmZlcmVuY2UsIG1hdHRlciBv
ZiB0YXN0ZS4gVGhlIGZpbGUgc2VlbXMgdG8gdXNlIDB4MCBpbiBtb3JlIHBsYWNlcywgc28gSSAK
d2lsbCB1c2UgMHgwIGluIHRoaXMgcGF0Y2ggYXMgd2VsbC4KCj4gCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJkwqAgcjIsIHIzLCBbcjEsICMoRklYTUFQX0NPTlNPTEUqOCldIC8qIE1hcCBpdCBp
biB0aGUgZmlyc3QgCj4+IGZpeG1hcCdzIHNsb3QgKi8KPj4gwqAgMToKPj4gQEAgLTM4OCw2ICsz
OTAsNyBAQCBwYWdpbmc6Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBvcnLCoMKgIHIyLCByMiwgI1BU
X0xPV0VSKFBUKcKgIC8qIHIyOnIzIDo9IHRhYmxlIG1hcCBvZiB4ZW5fZml4bWFwICovCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCBsZHLCoMKgIHI0LCA9RklYTUFQX0FERFIoMCkKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIG1vdsKgwqAgcjQsIHI0LCBsc3IgIyhTRUNPTkRfU0hJRlQgLSAzKcKgwqAgLyog
cjQgOj0gU2xvdCBmb3IgRklYTUFQKDApICovCj4+ICvCoMKgwqDCoMKgwqDCoCBtb3bCoMKgIHIz
LCAjMAo+IERpdHRvLgo+IAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RyZMKgIHIyLCByMywgW3Ix
LCByNF3CoMKgwqDCoMKgwqAgLyogTWFwIGl0IGluIHRoZSBmaXhtYXAncyBzbG90ICovCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBVc2UgYSB2aXJ0dWFsIGFkZHJlc3MgdG8gYWNjZXNzIHRoZSBV
QVJULiAqLwo+Pgo+IAo+IFdpdGggdGhlIG1pbm9yIGNvbW1lbnRzOgo+IAo+IFJldmlld2VkLWJ5
OiBBbmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKVGhhbmsgeW91LgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
