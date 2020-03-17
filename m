Return-Path: <SRS0=G0Zv=5C=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099D2C2BB1D
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 14:17:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8EAA20663
	for <xen-devel@archiver.kernel.org>; Tue, 17 Mar 2020 14:17:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8EAA20663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jED1x-0004B0-15; Tue, 17 Mar 2020 14:17:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lIpW=5C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jED1v-0004Au-9b
 for xen-devel@lists.xenproject.org; Tue, 17 Mar 2020 14:17:15 +0000
X-Inumbo-ID: ffcedcc4-6859-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffcedcc4-6859-11ea-92cf-bc764e2007e4;
 Tue, 17 Mar 2020 14:17:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC7E4ABDC;
 Tue, 17 Mar 2020 14:17:13 +0000 (UTC)
To: Jason Andryuk <jandryuk@gmail.com>
References: <4019c78f-6546-4edc-b5c3-1ea471e129ff@www.fastmail.com>
 <f886576a-a6cc-699a-5acf-1c2399c47133@citrix.com>
 <17bc1026-ebdf-4077-85b2-8b8615b59101@www.fastmail.com>
 <CAKf6xpszDF5ZfvkKGrZ6fOaBEKX3wrDyo8sp-oyhPdUr-H66NQ@mail.gmail.com>
 <f467fbc1-be3b-6e4c-681b-71001beb35f5@citrix.com>
 <CAKf6xptqF2vJLx6MyGbmu5QEhu3qpxKk9oHxBQmx7Caam45aKw@mail.gmail.com>
 <bdba95c2-8325-af8e-83a4-e06364b045df@citrix.com>
 <CAKf6xpt26=s_+cD63VJ1Cp3WZvtq3p673uUiqiuDHAVH=ZJOcQ@mail.gmail.com>
 <ea7cba55-f267-09c5-044e-e8947a6d2900@citrix.com>
 <4354846c-2210-db80-d14e-6f00c5ed2a3f@suse.com>
 <CAKf6xpsh3y_JpD15JLv52mgZOAVSu_Rp3EZOgGOmuS8_P5OsVQ@mail.gmail.com>
 <CAKf6xpu+YC9zcwZr7rWSz37RE20GQ0dpsMBSqQh6+oPDuYQXuQ@mail.gmail.com>
 <CAKf6xpvd=6PUm7_kUcUtTFPM9b5HbsXSo4=P4=RbS_SrhSoiVQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0e890ee2-b577-db80-cccf-0eac89b7003f@suse.com>
Date: Tue, 17 Mar 2020 15:17:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAKf6xpvd=6PUm7_kUcUtTFPM9b5HbsXSo4=P4=RbS_SrhSoiVQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] panic: "IO-APIC + timer doesn't work" -
 several people have reproduced
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Aaron Janse <aaron@ajanse.me>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDMuMjAyMCAxNTowOCwgSmFzb24gQW5kcnl1ayB3cm90ZToKPiBPbiBUdWUsIE1hciAx
NywgMjAyMCBhdCA5OjQ4IEFNIEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4+IEkgZ290IGl0IHRvIGJvb3QgcGFzdCAiSU8tQVBJQyArIHRpbWVyIGRvZXNuJ3Qgd29y
ayIuICBJIHByb2dyYW1tZWQKPj4gdGhlIEhQRVQgdG8gcHJvdmlkZSBhIHBlcmlvZGljIHRpbWVy
IGluIGhwZXRfcmVzdW1lKCkgb24gVDAuICBXaGVuIEkKPj4gYWN0dWFsbHkgZ290IGl0IHByb2dy
YW1tZWQgcHJvcGVybHksIGl0IHdvcmtlZCB0byBpbmNyZW1lbnQKPj4gcGl0MF90aWNrcy4gIEkg
YWxzbyBtYWRlIHRpbWVyX2ludGVycnVwdCgpIHVuY29uZGl0aW9uYWxseQo+PiBwaXQwX3RpY2tz
KysgdGhvdWdoIHRoYXQgbWF5IG5vdCBtYXR0ZXIuCj4gCj4gQWxzbywgSFBFVF9DRkdfTEVHQUNZ
IGlzIGVuYWJsZWQgZm9yIHRoZSBIUEVULgoKV2hpY2ggd2UgY2xlYXIgaW4gaHBldF9yZXN1bWUo
KSwgbXVjaCBsaWtlIExpbnV4IGRvZXMgaW4KaHBldF9lbmFibGUoKS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
