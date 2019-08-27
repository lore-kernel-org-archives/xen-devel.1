Return-Path: <SRS0=wySQ=WX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B24C3A5A3
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 12:23:42 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA47206BA
	for <xen-devel@archiver.kernel.org>; Tue, 27 Aug 2019 12:23:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA47206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2aVX-00070v-Mx; Tue, 27 Aug 2019 12:23:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qQN3=WX=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1i2aVW-00070q-P5
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 12:23:30 +0000
X-Inumbo-ID: 78751b5a-c8c5-11e9-8980-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 78751b5a-c8c5-11e9-8980-bc764e2007e4;
 Tue, 27 Aug 2019 12:23:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D8E228;
 Tue, 27 Aug 2019 05:23:26 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D4633F718;
 Tue, 27 Aug 2019 05:23:25 -0700 (PDT)
To: Peng Fan <peng.fan@nxp.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>
References: <20190709083729.11135-1-peng.fan@nxp.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <d70b3a5c-647c-2147-99be-4572f76e898b@arm.com>
Date: Tue, 27 Aug 2019 13:23:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190709083729.11135-1-peng.fan@nxp.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] arm: xen: mm: use __GPF_DMA32 for arm64
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
Cc: "van.freenix@gmail.com" <van.freenix@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 dl-linux-imx <linux-imx@nxp.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkvMDcvMjAxOSAwOToyMiwgUGVuZyBGYW4gd3JvdGU6Cj4gYXJtNjQgc2hhcmVzIHNvbWUg
Y29kZSB1bmRlciBhcmNoL2FybS94ZW4sIGluY2x1ZGluZyBtbS5jLgo+IEhvd2V2ZXIgWk9ORV9E
TUEgaXMgcmVtb3ZlZCBieSBjb21taXQKPiBhZDY3ZjVhNjU0NSgiYXJtNjQ6IHJlcGxhY2UgWk9O
RV9ETUEgd2l0aCBaT05FX0RNQTMyIikuCj4gU28gdG8gQVJNNjQsIG5lZWQgdXNlIF9fR0ZQX0RN
QTMyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+IC0t
LQo+ICAgYXJjaC9hcm0veGVuL21tLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm0veGVuL21t
LmMgYi9hcmNoL2FybS94ZW4vbW0uYwo+IGluZGV4IGUxZDQ0YjkwM2RmYy4uYTk1ZTc2ZDE4YmY5
IDEwMDY0NAo+IC0tLSBhL2FyY2gvYXJtL3hlbi9tbS5jCj4gKysrIGIvYXJjaC9hcm0veGVuL21t
LmMKPiBAQCAtMjcsNyArMjcsNyBAQCB1bnNpZ25lZCBsb25nIHhlbl9nZXRfc3dpb3RsYl9mcmVl
X3BhZ2VzKHVuc2lnbmVkIGludCBvcmRlcikKPiAgIAo+ICAgCWZvcl9lYWNoX21lbWJsb2NrKG1l
bW9yeSwgcmVnKSB7Cj4gICAJCWlmIChyZWctPmJhc2UgPCAocGh5c19hZGRyX3QpMHhmZmZmZmZm
Zikgewo+IC0JCQlmbGFncyB8PSBfX0dGUF9ETUE7Cj4gKwkJCWZsYWdzIHw9IF9fR0ZQX0RNQSB8
IF9fR0ZQX0RNQTMyOwoKR2l2ZW4gdGhlIGRlZmluaXRpb24gb2YgR0ZQX1pPTkVfQkFELCBJJ20g
bm90IHN1cmUgdGhpcyBjb21iaW5hdGlvbiBvZiAKZmxhZ3MgaXMgc3RyaWN0bHkgdmFsaWQsIGJ1
dCByYXRoZXIgaXMgaW1wbGljaXRseSByZWxpYW50IG9uIG9ubHkgb25lIG9mIAp0aG9zZSB6b25l
cyBldmVyIGFjdHVhbGx5IGV4aXN0aW5nLiBBcyBzdWNoLCBpdCBzZWVtcyBsaWFibGUgdG8gYmxv
dyB1cCAKaWYgdGhlIHBsYW5zIHRvIGFkZCBaT05FX0RNQSB0byBhcm02NFsxXSBnbyBhaGVhZC4K
ClJvYmluLgoKWzFdIApodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1hcm0ta2VybmVsLzIw
MTkwODIwMTQ1ODIxLjI3MjE0LTEtbnNhZW56anVsaWVubmVAc3VzZS5kZS8KCj4gICAJCQlicmVh
azsKPiAgIAkJfQo+ICAgCX0KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
