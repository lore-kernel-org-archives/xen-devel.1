Return-Path: <SRS0=MKw+=S2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5061EC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 12:19:50 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27B8C21773
	for <xen-devel@archiver.kernel.org>; Wed, 24 Apr 2019 12:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27B8C21773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJGs7-000106-Cx; Wed, 24 Apr 2019 12:19:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8RIj=S2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hJGs6-000101-7X
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 12:19:30 +0000
X-Inumbo-ID: 3501cb8d-668b-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 3501cb8d-668b-11e9-92d7-bc764e045a96;
 Wed, 24 Apr 2019 12:19:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F6F4A78;
 Wed, 24 Apr 2019 05:19:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E0C93F238;
 Wed, 24 Apr 2019 05:19:26 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: "Hawrylko, Lukasz" <lukasz.hawrylko@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1552379750.git.lukasz.hawrylko@intel.com>
 <129fd12dfea45b7c051fb19359cffd0db204591e.1552379750.git.lukasz.hawrylko@intel.com>
 <95bd4522-1d33-9e0b-95d0-32575ea6f837@arm.com>
Message-ID: <e7446ef9-1d77-9cad-21d2-c9f003b50783@arm.com>
Date: Wed, 24 Apr 2019 13:19:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <95bd4522-1d33-9e0b-95d0-32575ea6f837@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/1] Update TXT maintainter
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, jimmy.wg@gmail.com,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190424121925.biXyRx321HyK_ELTIGMsyp3PwnCDpOB7I-QEJMeXAHs@z>

SGksCgpJIGhhdmVuJ3Qgc2VlbiBhbnkgYW5zd2VyIGZyb20gR2FuZyBXZWkuIEkgYXNzdW1lIHRo
aXMgaXMgZmluZS4KCkkgd2lsbCBxdWV1ZSB0aGlzIHBhdGNoIGluIG15IGJyYW5jaCBuZXh0LTQu
MTMuCgpDaGVlcnMsCgpPbiAyMi8wMy8yMDE5IDEwOjQ2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4g
SGksCj4gCj4gQWRkaW5nIEdhbmcgV2VpIHNvIGhlIGNhbiBhY2sgdGhlIHBhdGNoLgo+IAo+IENo
ZWVycywKPiAKPiBPbiAxMi8wMy8yMDE5IDA5OjM5LCBIYXdyeWxrbywgTHVrYXN6IHdyb3RlOgo+
PiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogSGF3cnlsa28gPGx1a2Fzei5oYXdyeWxrb0BpbnRlbC5j
b20+Cj4+IC0tLQo+PiDCoCBNQUlOVEFJTkVSUyB8IDIgKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJ
TkVSUyBiL01BSU5UQUlORVJTCj4+IGluZGV4IGEwY2RhNGY3YTEuLjRjNDcyOTQ3MDYgMTAwNjQ0
Cj4+IC0tLSBhL01BSU5UQUlORVJTCj4+ICsrKyBiL01BSU5UQUlORVJTCj4+IEBAIC0yMzcsNyAr
MjM3LDcgQEAgRjrCoMKgwqAgeGVuL2FyY2gveDg2L2RlYnVnLmMKPj4gwqAgRjrCoMKgwqAgdG9v
bHMvZGVidWdnZXIvZ2Ric3gvCj4+IMKgIElOVEVMKFIpIFRSVVNURUQgRVhFQ1VUSU9OIFRFQ0hO
T0xPR1kgKFRYVCkKPj4gLU06wqDCoMKgIEdhbmcgV2VpIDxnYW5nLndlaUBpbnRlbC5jb20+Cj4+
ICtNOsKgwqDCoCBMdWthc3ogSGF3cnlsa28gPGx1a2Fzei5oYXdyeWxrb0BpbnRlbC5jb20+Cj4+
IMKgIE06wqDCoMKgIFNoYW5lIFdhbmcgPHNoYW5lLndhbmdAaW50ZWwuY29tPgo+PiDCoCBTOsKg
wqDCoCBTdXBwb3J0ZWQKPj4gwqAgRjrCoMKgwqAgeGVuL2FyY2gveDg2L3Rib290LmMKPj4KPiAK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
