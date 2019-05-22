Return-Path: <SRS0=PJHi=TW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA56C18E7D
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 09:27:40 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 769CD2075B
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 09:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 769CD2075B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTNWh-0004uE-W7; Wed, 22 May 2019 09:27:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jZt=TW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTNWh-0004u9-7z
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 09:27:11 +0000
X-Inumbo-ID: c5690c9e-7c73-11e9-85ff-9f2f78891670
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c5690c9e-7c73-11e9-85ff-9f2f78891670;
 Wed, 22 May 2019 09:27:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 690C9341;
 Wed, 22 May 2019 02:27:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B3E73F575;
 Wed, 22 May 2019 02:27:06 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
 <5CE50C12020000780023137C@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <55b6761c-152a-a6fa-085d-5f78443831d1@arm.com>
Date: Wed, 22 May 2019 10:27:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE50C12020000780023137C@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 tee-dev@lists.linaro.org, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190522092704.uupOb8ot9vLVitoPhlTc-w8lQzeHstJ4TJXDqHn_Thc@z>

CgpPbiAyMi8wNS8yMDE5IDA5OjQ1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAyMS4wNS4x
OSBhdCAyMzoyNSwgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPiB3cm90ZToKPj4gICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICB8ICAgNiArKwo+PiAgIHhlbi9hcmNoL2FybS9LY29u
ZmlnICAgICAgICAgIHwgICA3ICsrKwo+PiAgIHhlbi9hcmNoL2FybS9NYWtlZmlsZSAgICAgICAg
IHwgICAxICsKPj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICB8ICAxOCArKysrKysK
Pj4gICB4ZW4vYXJjaC9hcm0vc2V0dXAuYyAgICAgICAgICB8ICAgMiArCj4+ICAgeGVuL2FyY2gv
YXJtL3RlZS9NYWtlZmlsZSAgICAgfCAgIDEgKwo+PiAgIHhlbi9hcmNoL2FybS90ZWUvdGVlLmMg
ICAgICAgIHwgIDkzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgeGVuL2FyY2gv
YXJtL3ZzbWMuYyAgICAgICAgICAgfCAgIDUgKysKPj4gICB4ZW4vYXJjaC9hcm0veGVuLmxkcy5T
ICAgICAgICB8ICAgNyArKysKPj4gICB4ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAg
MSArCj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvdGVlLmggfCAxMDkgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+PiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNoLWFybS5o
IHwgICAzICsKPj4gICAxMiBmaWxlcyBjaGFuZ2VkLCAyNTMgaW5zZXJ0aW9ucygrKQo+PiAgIGNy
ZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vdGVlL01ha2VmaWxlCj4+ICAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS90ZWUvdGVlLmMKPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQg
eGVuL2luY2x1ZGUvYXNtLWFybS90ZWUvdGVlLmgKPiAKPiBJIGRvbid0IHRoaW5rIEknbSBhc2tp
bmcgdGhpcyBmb3IgdGhlIGZpcnN0IHRpbWU6IFdoeSBhbSBJIGJlaW5nIENjLWVkCj4gaGVyZT8g
SXQncyBhbGwgQXJtIGNvZGUgdGhhdCBnZXRzIGNoYW5nZWQsIGFuZCB0aGUgTUFJTlRBSU5FUlMK
PiBhZGRpdGlvbiBhbG9uZSBpbW8gZG9lc24ndCB3YXJyYW50IHdpZGVuaW5nIHRoZSBDYyBsaXN0
LgoKQSBsb3Qgb2YgdXNlcnMgdXNlcyB0aGUgc2NyaXB0cy97YWRkLCBnZXR9X21haW50YWluZXJz
LnBsIHRvIGdldCB0aGUgbGlzdCBvZiAKbWFpbnRhaW5lcnMgdG8gQ0NlZC4gQm90aCBvZiB0aGVt
IG91dHB1dCAiVEhFIFJFU1QiIGJlY2F1c2Ugb2YgdGhlIGZpbGUgCk1BSU5UQUlORVJTIGlzIG1v
ZGlmaWVkLgoKSSBkb24ndCB0aGluayBpdCBpcyBzZW5zaWJsZSB0byBleHBlY3QgdXNlcnMgdG8g
a25vdyB3aGVuIHRvIHN0cmlwIHRoZSBsaXN0Li4uCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
