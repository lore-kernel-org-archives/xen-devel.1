Return-Path: <SRS0=r7lW=VH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7875C74A2B
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 16:49:07 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81B0220665
	for <xen-devel@archiver.kernel.org>; Wed, 10 Jul 2019 16:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81B0220665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlFm0-0002Zl-DV; Wed, 10 Jul 2019 16:48:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELaq=VH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlFly-0002Zg-UO
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 16:48:50 +0000
X-Inumbo-ID: 9762f382-a332-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9762f382-a332-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 16:48:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 65B1E344;
 Wed, 10 Jul 2019 09:48:49 -0700 (PDT)
Received: from [10.119.48.3] (unknown [10.119.48.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E85613F246;
 Wed, 10 Jul 2019 09:48:48 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-5-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4ac4df55-e602-326b-1a51-233e5568368d@arm.com>
Date: Wed, 10 Jul 2019 17:48:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190621235608.2153-5-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/6] xen/arm: don't iomem_permit_access
 for reserved-memory regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjIvMTkgMTI6NTYgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBEb24ndCBhbGxvdyByZXNlcnZlZC1tZW1vcnkgcmVnaW9ucyB0byBiZSByZW1hcHBlZCBp
bnRvIGFueSBndWVzdHMsCj4gdW50aWwgcmVzZXJ2ZWQtbWVtb3J5IHJlZ2lvbnMgYXJlIHByb3Bl
cmx5IHN1cHBvcnRlZCBpbiBYZW4uIEZvciBub3csCj4gZG8gbm90IGNhbGwgaW9tZW1fcGVybWl0
X2FjY2VzcyBmb3IgdGhlbS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2NDoKPiAtIG5ldyBwYXRj
aAo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMjMgKysrKysrKysrKysr
KysrLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCBkOTgzNjc3OWQxLi43NmRkNGJmNmY5
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC0xMTU4LDE1ICsxMTU4LDIyIEBAIHN0YXRpYyBp
bnQgX19pbml0IG1hcF9yYW5nZV90b19kb21haW4oY29uc3Qgc3RydWN0IGR0X2RldmljZV9ub2Rl
ICpkZXYsCj4gICAgICAgYm9vbCBuZWVkX21hcHBpbmcgPSAhZHRfZGV2aWNlX2Zvcl9wYXNzdGhy
b3VnaChkZXYpOwo+ICAgICAgIGludCByZXM7Cj4gICAKPiAtICAgIHJlcyA9IGlvbWVtX3Blcm1p
dF9hY2Nlc3MoZCwgcGFkZHJfdG9fcGZuKGFkZHIpLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYWRkcl90b19wZm4oUEFHRV9BTElHTihhZGRyICsgbGVuIC0gMSkpKTsKPiAtICAg
IGlmICggcmVzICkKPiArICAgIC8qCj4gKyAgICAgKiBEb24ndCBnaXZlIGlvbWVtIHBlcm1pc3Np
b25zIGZvciByZXNlcnZlZC1tZW1vcnkgcmFuZ2VzIHVudGlsCj4gKyAgICAgKiByZXNlcnZlZC1t
ZW1vcnkgc3VwcG9ydCBpcyBjb21wbGV0ZS4KPiArICAgICAqLwo+ICsgICAgaWYgKCBzdHJjbXAo
ZHRfbm9kZV9uYW1lKGRldiksICJyZXNlcnZlZC1tZW1vcnkiKSApCgpBc2lkZSBPbGVrc2FuZHIn
cyBjb21tZW50LCB5b3Ugc2hvdWxkIHRlY2huaWNhbGx5IHVzZSBkdF9ub2RlX2NtcCguLi4pIApm
b3IgY29tcGFyaW5nIG5vZGUgbmFtZS4KCj4gICAgICAgewo+IC0gICAgICAgIHByaW50ayhYRU5M
T0dfRVJSICJVbmFibGUgdG8gcGVybWl0IHRvIGRvbSVkIGFjY2VzcyB0byIKPiAtICAgICAgICAg
ICAgICAgIiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4iLAo+IC0gICAgICAgICAgICAgICBk
LT5kb21haW5faWQsCj4gLSAgICAgICAgICAgICAgIGFkZHIgJiBQQUdFX01BU0ssIFBBR0VfQUxJ
R04oYWRkciArIGxlbikgLSAxKTsKPiAtICAgICAgICByZXR1cm4gcmVzOwo+ICsgICAgICAgIHJl
cyA9IGlvbWVtX3Blcm1pdF9hY2Nlc3MoZCwgcGFkZHJfdG9fcGZuKGFkZHIpLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFkZHJfdG9fcGZuKFBBR0VfQUxJR04oYWRkciAr
IGxlbiAtIDEpKSk7Cj4gKyAgICAgICAgaWYgKCByZXMgKQo+ICsgICAgICAgIHsKPiArICAgICAg
ICAgICAgcHJpbnRrKFhFTkxPR19FUlIgIlVuYWJsZSB0byBwZXJtaXQgdG8gZG9tJWQgYWNjZXNz
IHRvIgo+ICsgICAgICAgICAgICAgICAgICAgIiAweCUiUFJJeDY0IiAtIDB4JSJQUkl4NjQiXG4i
LAo+ICsgICAgICAgICAgICAgICAgICAgZC0+ZG9tYWluX2lkLAo+ICsgICAgICAgICAgICAgICAg
ICAgYWRkciAmIFBBR0VfTUFTSywgUEFHRV9BTElHTihhZGRyICsgbGVuKSAtIDEpOwo+ICsgICAg
ICAgICAgICByZXR1cm4gcmVzOwo+ICsgICAgICAgIH0KPiAgICAgICB9Cj4gICAKPiAgICAgICBp
ZiAoIG5lZWRfbWFwcGluZyApCj4gCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
