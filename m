Return-Path: <SRS0=7Zcw=UL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518CFC31E46
	for <xen-devel@archiver.kernel.org>; Wed, 12 Jun 2019 15:15:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 332A921019
	for <xen-devel@archiver.kernel.org>; Wed, 12 Jun 2019 15:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 332A921019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb4yG-0003NA-V1; Wed, 12 Jun 2019 15:15:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb4yF-0003N5-Uz
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 15:15:27 +0000
X-Inumbo-ID: e701499a-8d24-11e9-939c-fbd2adcb8f6b
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e701499a-8d24-11e9-939c-fbd2adcb8f6b;
 Wed, 12 Jun 2019 15:15:24 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F1292B;
 Wed, 12 Jun 2019 08:15:24 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A4C033F73C;
 Wed, 12 Jun 2019 08:15:23 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190514121132.26732-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <02df0ece-264c-4ce0-428d-d7177dc5c0f5@arm.com>
Date: Wed, 12 Jun 2019 16:15:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514121132.26732-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART1 v3 0/8] xen/arm: TLB flush helpers
 rework
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
Cc: Oleksandr_Tyshchenko@epam.com, Stefano Stabellini <sstabellini@kernel.org>,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpUaGlzIHBhdGNoIGlzIGZ1bGx5IGNvbW1pdHRlZCBub3cuCgpUaGFuayB5b3UgZm9yIHRo
ZSByZXZpZXdzIQoKQ2hlZXJzLAoKT24gMTQvMDUvMjAxOSAxMzoxMSwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIGFsbCwKPiAKPiBJIHNwZW50IHRoZSBsYXN0IGZldyBtb250aHMgbG9va2luZyBh
dCBYZW4gYm9vdCBhbmQgbWVtb3J5IG1hbmFnZW1lbnQgdG8gbWFrZQo+IGl0IHNpbXBsZXIsIG1v
cmUgZWZmaWNpZW50IGFuZCBhbHNvIG1vcmUgY29tcGxpYW50IGluIHJlc3BlY3Qgb2YgdGhlIEFy
bSBBcm0uCj4gCj4gVGhlIGZ1bGwgcmV3b3JrIGlzIHF1aXRlIGNvbnNlcXVlbmNlIChhbHJlYWR5
IDE1MCBwYXRjaGVzIGFuZCBJIGhhdmVuJ3QgeWV0Cj4gZmluaXNoZWQhKSwgc28gSSBhbSBwbGFu
bmluZyB0byBzZW5kIGluIHNtYWxsZXIgcGFydCBvdmVyIHRoZSBuZXh0IGZldyB3ZWVrcy4KPiAK
PiBJbiB0aGlzIGZpcnN0IHBhcnQsIEkgZm9jdXMgb24gcmV3b3JraW5nIGhvdyB3ZSBmbHVzaCB0
aGUgVExCcyBpbiBYZW4uCj4gCj4gVGhlIG1haW4gYWRkaXRpb24gZm9yIHRoaXMgdmVyc2lvbiBp
cyB0byBwcmV2ZW50IFhlbiBib290aW5nIG9uIEFJVklWVAo+IGluc3RydWN0aW9uIGNhY2hlcyAo
c2VlIHBhdGNoICMxKS4gRm9yIGFsbCB0aGUgb3RoZXIgY2hhbmdlcywgc2VlIGVhY2ggcGF0Y2gu
Cj4gCj4gQ2hlZXJzLAo+IAo+IEp1bGllbiBHcmFsbCAoOCk6Cj4gICAgeGVuL2FybTogRG9uJ3Qg
Ym9vdCBYZW4gb24gcGxhdGZvcm0gdXNpbmcgQUlWSVZUIGluc3RydWN0aW9uIGNhY2hlcwo+ICAg
IHhlbi9hcm06IG1tOiBDb25zb2xpZGF0ZSBzZXR0aW5nIFNDVExSX0VMMi5XWE4gaW4gYSBzaW5n
bGUgcGxhY2UKPiAgICB4ZW4vYXJtOiBSZW1vdmUgZmx1c2hfeGVuX3RleHRfdGxiX2xvY2FsKCkK
PiAgICB4ZW4vYXJtOiB0bGJmbHVzaDogQ2xhcmlmeSB0aGUgVExCIGhlbHBlcnMgbmFtZQo+ICAg
IHhlbi9hcm06IHBhZ2U6IENsYXJpZnkgdGhlIFhlbiBUTEJzIGhlbHBlcnMgbmFtZQo+ICAgIHhl
bi9hcm06IEdhdGhlciBhbGwgVExCIGZsdXNoIGhlbHBlcnMgaW4gdGxiZmx1c2guaAo+ICAgIHhl
bi9hcm06IHRsYmZsdXNoOiBSZXdvcmsgVExCIGhlbHBlcnMKPiAgICB4ZW4vYXJtOiBtbTogRmx1
c2ggdGhlIFRMQnMgZXZlbiBpZiBhIG1hcHBpbmcgZmFpbGVkIGluCj4gICAgICBjcmVhdGVfeGVu
X2VudHJpZXMKPiAKPiAgIHhlbi9hcmNoL2FybS9tbS5jICAgICAgICAgICAgICAgICAgICB8IDY5
ICsrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAgeGVuL2FyY2gvYXJtL3AybS5j
ICAgICAgICAgICAgICAgICAgIHwgIDYgKy0tCj4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAg
ICAgICAgICAgICAgfCAgNSArKysKPiAgIHhlbi9hcmNoL2FybS9zbXAuYyAgICAgICAgICAgICAg
ICAgICB8ICAyICstCj4gICB4ZW4vYXJjaC9hcm0vdHJhcHMuYyAgICAgICAgICAgICAgICAgfCAg
MiArLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0zMi9mbHVzaHRsYi5oIHwgNzEgKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm0z
Mi9wYWdlLmggICAgIHwgNDggKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHhlbi9pbmNsdWRl
L2FzbS1hcm0vYXJtNjQvZmx1c2h0bGIuaCB8IDc1ICsrKysrKysrKysrKysrKysrKysrLS0tLS0t
LS0tLS0tLS0tLQo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9hcm02NC9wYWdlLmggICAgIHwgNDkg
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vZmx1c2h0bGIu
aCAgICAgICB8IDM4ICsrKysrKysrKysrKysrKysrKwo+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9w
YWdlLmggICAgICAgICAgIHwgMzggLS0tLS0tLS0tLS0tLS0tLS0tCj4gICB4ZW4vaW5jbHVkZS9h
c20tYXJtL3Byb2Nlc3Nvci5oICAgICAgfCAgNSArKysKPiAgIDEyIGZpbGVzIGNoYW5nZWQsIDE5
NCBpbnNlcnRpb25zKCspLCAyMTQgZGVsZXRpb25zKC0pCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
