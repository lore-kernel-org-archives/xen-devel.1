Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDFEC10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:14:59 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C6A2084F
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 10:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C6A2084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDnm3-0001dC-Rh; Tue, 09 Apr 2019 10:14:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zDjF=SL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hDnm2-0001d7-RC
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 10:14:38 +0000
X-Inumbo-ID: 47f03326-5ab0-11e9-8e57-47919fc3141d
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 47f03326-5ab0-11e9-8e57-47919fc3141d;
 Tue, 09 Apr 2019 10:14:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90E5380D;
 Tue,  9 Apr 2019 03:14:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C71C33F59C;
 Tue,  9 Apr 2019 03:14:36 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>
References: <1553163935-12862-1-git-send-email-amittomer25@gmail.com>
 <1553163935-12862-2-git-send-email-amittomer25@gmail.com>
 <5f956c43-6885-3553-2f37-bb9ce48e981b@arm.com>
 <cd327f36-09db-f322-4675-30140839e159@arm.com>
 <CABHD4K8R7wyA=yGdfdVvsb21Ewyb3buAbhTCsJVuFuLNvGqV6A@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <48bd9982-2569-4a43-ee34-22eaf7a16f24@arm.com>
Date: Tue, 9 Apr 2019 11:14:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CABHD4K8R7wyA=yGdfdVvsb21Ewyb3buAbhTCsJVuFuLNvGqV6A@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/3] xen/arm: Add MESON UART driver for
 Amlogic Meson SoCs
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
Cc: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409101435.TIvdb8LjWGUyfbOkG11aLzp11i34FN6t6EHD2LszHF8@z>

T24gMDkvMDQvMjAxOSAxMTowOSwgQW1pdCBUb21lciB3cm90ZToKPiBIZWxsbywKPiAKPiBPbiBU
dWUsIEFwciA5LCAyMDE5IGF0IDM6MDkgUE0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4gd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiBPbiAwMi8wNC8yMDE5IDIxOjAxLCBBbmRyw6kg
UHJ6eXdhcmEgd3JvdGU6Cj4+PiBPbiAyMS8wMy8yMDE5IDEwOjI1LCBBbWl0IFNpbmdoIFRvbWFy
IHdyb3RlOgo+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBkcml2ZXIgZm9yIFVBUlQgY29udHJvbGxlciBw
cmVzZW50IG9uIEFtbG9naWMgTWVzb24KPj4+PiBTb0NzIGFuZCBpdCBoYXMgYmVlbiB0ZXN0ZWQg
b24gTmFub3BpIEsyIGJvYXJkIGJhc2VkIG9uIFM5MDUgU29DLgo+Pj4+Cj4+Pj4gQ29udHJvbGxl
ciByZWdpc3RlcnMgZGVmaW5hdGlvbiBpcyB0YWtlbiBmcm9tIExpbnV4IDQuMjAuCj4+Pj4gaHR0
cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvdjQuMjAtcmMxL2RyaXZlcnMvdHR5
L3NlcmlhbC9tZXNvbl91YXJ0LmMKPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFtaXQgU2luZ2gg
VG9tYXIgPGFtaXR0b21lcjI1QGdtYWlsLmNvbT4KPj4+Cj4+PiBUaGFua3MgZm9yIHRoZSBjaGFu
Z2VzIQo+Pj4KPj4+IFJldmlld2VkLWJ5OiBBbmRyZSBQcnp5d2FyYSA8YW5kcmUucHJ6eXdhcmFA
YXJtLmNvbT4KPj4KPj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cj4gCj4gVGhhbmtzLgo+IAo+PiBJIGhhdmUgY29tbWl0dGVkIHRoaXMgcGF0Y2ggYW5kIHRo
ZSBmb2xsb3dpbmcgcGF0Y2guIFBsZWFzZSByZXNlbmQgdGhlIGZpcnN0Cj4+IHBhdGNoIHdpdGgg
dGhlIGNvbW1lbnRzIGFkZHJlc3NlZC4KPiAKPiBJcyBpdCB0aGUgcGF0Y2ggd2l0aCBmb2xsb3dp
bmcgc3ViamVjdDoKPiBbUEFUQ0ggdjIgMS8zXSB4ZW4vYXJtOiBBZGQgQW1sb2dpYyBNZXNvbiBT
b0NzIGVhcmx5cHJpbnRrIHN1cHBvcnQKPiAKPiBSZWFsbHksIGNvdWxkbid0IGZpbmQgYW55IGNv
bW1lbnRzIG92ZXIgdGhlcmUuCgpTZWUgaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNo
aXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA0L21zZzAwMTQ1Lmh0bWwKCkkgcG9pbnRlZCB0d28g
aXNzdWVzOgoJMSkgVGhlIGxhY2sgb2YgY292ZXIgbGV0dGVyCgkyKSBUaGUgbGFjayBvZiBjb21t
aXQgbWVzc2FnZQoKMSkgZG9lcyBub3QgbmVlZCB0byBiZSBhZGRyZXNzZWQgZm9yIHRoaXMgc2Vy
aWVzLCBidXQgc2hvdWxkIGJlIGZvciBhbnkgbmV3IApzZXJpZXMgeW91IHNlbmQgd2l0aCBtb3Jl
IHRoYW4gMSBwYXRjaC4KCjIpIHNob3VsZCBiZSBhZGRyZXNzZWQgYmVmb3JlIEkgd2lsbCBjb21t
aXQgdGhlIHBhdGNoLiBUaGUgZXhhY3QgaXNzdWUgd2VyZSAKYWxyZWFkeSBkZXNjcmliZWQgaW4g
dmVyc2lvbiAxIChzZWUgWzFdKS4KCkNoZWVycywKClsxXSBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDIvbXNnMDEyMDQuaHRtbAoKPiAK
PiAtQW1pdC4KPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
