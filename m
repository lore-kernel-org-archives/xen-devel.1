Return-Path: <SRS0=BXCD=X3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77F7C352AA
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:35 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A69B121D81
	for <xen-devel@archiver.kernel.org>; Wed,  2 Oct 2019 14:19:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A69B121D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFfTQ-000802-3J; Wed, 02 Oct 2019 14:19:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFfTO-0007zx-T8
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 14:19:22 +0000
X-Inumbo-ID: a09f04f8-e51f-11e9-9718-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a09f04f8-e51f-11e9-9718-12813bfff9fa;
 Wed, 02 Oct 2019 14:19:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DB71CAE0C;
 Wed,  2 Oct 2019 14:19:20 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20190930133238.49868-1-roger.pau@citrix.com>
 <20190930133238.49868-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7660f1a7-a0ef-3739-cf83-fdfc41761a4c@suse.com>
Date: Wed, 2 Oct 2019 16:19:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190930133238.49868-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 01/10] ioreq: terminate cf8 handling at
 hypervisor level
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 WeiLiu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAuMDkuMjAxOSAxNTozMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaW9yZXEuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYwo+IEBA
IC0xNTE4LDExICsxNTE4LDE1IEBAIHN0YXRpYyBpbnQgaHZtX2FjY2Vzc19jZjgoCj4gIHsKPiAg
ICAgIHN0cnVjdCBkb21haW4gKmQgPSBjdXJyZW50LT5kb21haW47Cj4gIAo+IC0gICAgaWYgKCBk
aXIgPT0gSU9SRVFfV1JJVEUgJiYgYnl0ZXMgPT0gNCApCj4gKyAgICBpZiAoIGJ5dGVzICE9IDQg
KQo+ICsgICAgICAgIHJldHVybiBYODZFTVVMX09LQVk7CgpJIHRoaW5rIGl0IHdhcyBhbHJlYWR5
IG9uIHYxIHRoYXQgQW5kcmV3IGhhZCBwb2ludGVkIG91dCB0aGF0IGUuZy4KYSAxLWJ5ZSBhY2Nl
c3MgdG8gQ0Y5IHNob3VsZCBzdGlsbCBiZSBmb3J3YXJkZWQuIEkgZ3Vlc3MgeW91IG1lYW4KdG8g
dXNlIFg4NkVNVUxfVU5IQU5ETEVBQkxFIGhlcmUsIGp1c3QgbGlrZSB3YXMgZG9uZSAuLi4KCj4g
KyAgICBpZiAoIGRpciA9PSBJT1JFUV9XUklURSApCj4gICAgICAgICAgZC0+YXJjaC5odm0ucGNp
X2NmOCA9ICp2YWw7Cj4gKyAgICBlbHNlCj4gKyAgICAgICAgKnZhbCA9IGQtPmFyY2guaHZtLnBj
aV9jZjg7Cj4gIAo+IC0gICAgLyogV2UgYWx3YXlzIG5lZWQgdG8gZmFsbCB0aHJvdWdoIHRvIHRo
ZSBjYXRjaCBhbGwgZW11bGF0b3IgKi8KPiAtICAgIHJldHVybiBYODZFTVVMX1VOSEFORExFQUJM
RTsKPiArICAgIHJldHVybiBYODZFTVVMX09LQVk7Cj4gIH0KCi4uLiB1bml2ZXJzYWxseSBiZWZv
cmUuIFRoZSBjb21tZW50IChzdWl0YWJseSBhZGp1c3RlZCkgbWF5IHRoZW4KYWxzbyB3YW50IHRv
IG1vdmUgdXAuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
