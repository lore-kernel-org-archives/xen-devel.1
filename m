Return-Path: <SRS0=ZD/N=Z2=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 369E7C43603
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 10:19:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11F8120675
	for <xen-devel@archiver.kernel.org>; Wed,  4 Dec 2019 10:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11F8120675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icRkF-0007Pm-0C; Wed, 04 Dec 2019 10:18:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icRkD-0007Ph-QY
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 10:18:53 +0000
X-Inumbo-ID: 7632e11c-167f-11ea-81ff-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7632e11c-167f-11ea-81ff-12813bfff9fa;
 Wed, 04 Dec 2019 10:18:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 377ECAFF3;
 Wed,  4 Dec 2019 10:18:48 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191204094335.24603-1-andrew.cooper3@citrix.com>
 <20191204094335.24603-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f193cc9d-be1e-aaf3-87e6-dd7a3b9fc7b7@suse.com>
Date: Wed, 4 Dec 2019 11:19:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204094335.24603-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] x86/svm: Clean up intinfo_t variables
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxMDo0MywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gYS94ZW4vYXJj
aC94ODYvaHZtL3N2bS9pbnRyLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3N2bS9pbnRyLmMK
PiBAQCAtNDMsMTUgKzQzLDEzIEBAIHN0YXRpYyB2b2lkIHN2bV9pbmplY3Rfbm1pKHN0cnVjdCB2
Y3B1ICp2KQo+ICB7Cj4gICAgICBzdHJ1Y3Qgdm1jYl9zdHJ1Y3QgKnZtY2IgPSB2LT5hcmNoLmh2
bS5zdm0udm1jYjsKPiAgICAgIHUzMiBnZW5lcmFsMV9pbnRlcmNlcHRzID0gdm1jYl9nZXRfZ2Vu
ZXJhbDFfaW50ZXJjZXB0cyh2bWNiKTsKPiAtICAgIGV2ZW50aW5qX3QgZXZlbnQ7Cj4gIAo+IC0g
ICAgZXZlbnQuYnl0ZXMgPSAwOwo+IC0gICAgZXZlbnQuZmllbGRzLnYgPSAxOwo+IC0gICAgZXZl
bnQuZmllbGRzLnR5cGUgPSBYODZfRVZFTlRUWVBFX05NSTsKPiAtICAgIGV2ZW50LmZpZWxkcy52
ZWN0b3IgPSAyOwo+IC0KPiAtICAgIEFTU0VSVCh2bWNiLT5ldmVudGluai5maWVsZHMudiA9PSAw
KTsKPiAtICAgIHZtY2ItPmV2ZW50aW5qID0gZXZlbnQ7Cj4gKyAgICBBU1NFUlQoIXZtY2ItPmV2
ZW50aW5qLnYpOwo+ICsgICAgdm1jYi0+ZXZlbnRpbmogPSAoaW50aW5mb190KXsKPiArICAgICAg
ICAudmVjdG9yID0gMiwKClBlcmhhcHMgVFJBUF9ubWkgaGVyZSwgc2VlaW5nIHRoYXQgVFJBUF8q
IGFyZSB1c2VkIGVsc2V3aGVyZSBhcyB3ZWxsPwpJbiBhbnkgZXZlbnQKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
