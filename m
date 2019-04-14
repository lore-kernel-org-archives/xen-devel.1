Return-Path: <SRS0=9rT6=SQ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 687BEC10F13
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 17:56:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DB19206B7
	for <xen-devel@archiver.kernel.org>; Sun, 14 Apr 2019 17:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DB19206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFjMe-00025A-C6; Sun, 14 Apr 2019 17:56:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bMma=SQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hFjMd-000255-7X
 for xen-devel@lists.xenproject.org; Sun, 14 Apr 2019 17:56:23 +0000
X-Inumbo-ID: 9cae5970-5ede-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9cae5970-5ede-11e9-92d7-bc764e045a96;
 Sun, 14 Apr 2019 17:56:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69914374;
 Sun, 14 Apr 2019 10:56:21 -0700 (PDT)
Received: from [10.37.12.66] (unknown [10.37.12.66])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C3FA3F68F;
 Sun, 14 Apr 2019 10:56:20 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-6-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6bf762cb-90b5-4bfe-33eb-6ab3f70c7b34@arm.com>
Date: Sun, 14 Apr 2019 18:56:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1554718489-11318-6-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 5/5] xen/arm: Add early printk support
 for SCIFA compatible UARTs
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190414175619.1BFnOJx2D1osY7sOIgVLPDKOwrzDl2v5-Ms0DJYN1r8@z>

SGkgT2xla3NhbmRyLAoKT24gNC84LzE5IDExOjE0IEFNLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29A
ZXBhbS5jb20+Cj4gCj4gVGhpcyBwYXRjaCBtYWtlcyBwb3NzaWJsZSB0byB1c2UgZXhpc3Rpbmcg
ZWFybHkgcHJpbmsgY29kZQo+IGZvciBSZW5lc2FzICJTdG91dCIgYm9hcmQgYmFzZWQgb24gUi1D
YXIgSDIgU29DIChTQ0lGQSkuCj4gCj4gVGhlICJFQVJMWV9QUklOVEtfVkVSU0lPTiIgZm9yIHRo
YXQgYm9hcmQgc2hvdWxkIGJlICdBJzoKPiBDT05GSUdfRUFSTFlfUFJJTlRLPXNjaWYsMHhlNmM0
MDAwMCxBCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5k
cl90eXNoY2hlbmtvQGVwYW0uY29tPgo+IENDOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgo+IAo+IC0tLQo+ICAgICAgQ2hhbmdlcyBpbiB2MzoKPiAgICAgICAgICAtIEl0IHdh
cyBkZWNpZGVkIG5vdCB0byBpbnRyb2R1Y2UgbmV3IGRlYnVnLXNjaWZhLmluYwo+ICAgICAgICAg
ICAgZm9yIGhhbmRsaW5nIFNDSUZBIGludGVyZmFjZSwgYnV0IHRvIGV4dGVuZCBleGlzdGluZwo+
ICAgICAgICAgICAgZGVidWctc2NpZi5pbmMgZm9yIGhhbmRsaW5nIGJvdGggaW50ZXJmYWNlcy4K
PiAgICAgICAgICAgIFRoaXMgcGF0Y2ggaXMgYSByZXN1bHQgb2Ygc3BsaXR0aW5nIGFuIGluaXRp
YWwgcGF0Y2gKPiAgICAgICAgICAgICJ4ZW4vYXJtOiBBZGQgU0NJRkEgVUFSVCBzdXBwb3J0IGZv
ciBlYXJseSBwcmludGsiCj4gICAgICAgICAgICBhbmQgb25seSBhZGRzIGEgc3VwcG9ydC4KPiAt
LS0KPiAgIHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYyB8IDkgKysrKysrLS0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtMzIvZGVidWctc2NpZi5pbmMgYi94ZW4vYXJjaC9h
cm0vYXJtMzIvZGVidWctc2NpZi5pbmMKPiBpbmRleCBhOGQyZWFlLi45NGExOGVhIDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwo+ICsrKyBiL3hlbi9hcmNo
L2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwo+IEBAIC0xLDcgKzEsNyBAQAo+ICAgLyoKPiAgICAq
IHhlbi9hcmNoL2FybS9hcm0zMi9kZWJ1Zy1zY2lmLmluYwo+ICAgICoKPiAtICogU0NJRiBzcGVj
aWZpYyBkZWJ1ZyBjb2RlCj4gKyAqIFNDSUYoQSkgc3BlY2lmaWMgZGVidWcgY29kZQo+ICAgICoK
PiAgICAqIE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHIudHlzaGNoZW5rb0BnbG9iYWxs
b2dpYy5jb20+Cj4gICAgKiBDb3B5cmlnaHQgKEMpIDIwMTQsIEdsb2JhbGxvZ2ljLgo+IEBAIC0y
MiwxMCArMjIsMTMgQEAKPiAgICNpZmRlZiBFQVJMWV9QUklOVEtfVkVSU0lPTl9OT05FCj4gICAj
ZGVmaW5lIFNUQVRVU19SRUcgICAgU0NJRl9TQ0ZTUgo+ICAgI2RlZmluZSBUWF9GSUZPX1JFRyAg
IFNDSUZfU0NGVERSCj4gKyNlbGlmIEVBUkxZX1BSSU5US19WRVJTSU9OX0EKPiArI2RlZmluZSBT
VEFUVVNfUkVHICAgIFNDSUZBX1NDQVNTUgo+ICsjZGVmaW5lIFRYX0ZJRk9fUkVHICAgU0NJRkFf
U0NBRlREUgo+ICAgI2VuZGlmCj4gICAKPiAgIC8qCj4gLSAqIFNDSUYgVUFSVCB3YWl0IFVBUlQg
dG8gYmUgcmVhZHkgdG8gdHJhbnNtaXQKPiArICogU0NJRihBKSBVQVJUIHdhaXQgVUFSVCB0byBi
ZSByZWFkeSB0byB0cmFuc21pdAoKV2hlbiBTQ0lGQiB3aWxsIGJlIGludHJvZHVjZWQsIHdlIHdp
bGwgaGF2ZSB0byBtb2RpZnkgdGhpcyBjb21tZW50IAphZ2Fpbi4gQXMgd2UgYXJlIG9ubHkgZGVh
bGluZyB3aXRoIGFueSB2ZXJzaW9uIG9mIFNDSUMgaW4gdGhpcyBmaWxlLCAKY291bGQgd2UganVz
dCByZXdvcmsgdGhlIGNvbW1lbnQgdG8gYXZvaWQgbWVudGlvbmluZyB0aGUgVUFSVCBuYW1lPwoK
PiAgICAqIHJiOiByZWdpc3RlciB3aGljaCBjb250YWlucyB0aGUgVUFSVCBiYXNlIGFkZHJlc3MK
PiAgICAqIHJjOiBzY3JhdGNoIHJlZ2lzdGVyCj4gICAgKi8KPiBAQCAtMzcsNyArNDAsNyBAQAo+
ICAgLmVuZG0KPiAgIAo+ICAgLyoKPiAtICogU0NJRiBVQVJUIHRyYW5zbWl0IGNoYXJhY3Rlcgo+
ICsgKiBTQ0lGKEEpIFVBUlQgdHJhbnNtaXQgY2hhcmFjdGVyCgpTYW1lIGhlcmUuCgo+ICAgICog
cmI6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBVQVJUIGJhc2UgYWRkcmVzcwo+ICAgICog
cnQ6IHJlZ2lzdGVyIHdoaWNoIGNvbnRhaW5zIHRoZSBjaGFyYWN0ZXIgdG8gdHJhbnNtaXQKPiAg
ICAqLwo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
