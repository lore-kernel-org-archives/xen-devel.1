Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21FE3C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 07:46:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB6220825
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 07:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB6220825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFwJH-000523-KX; Mon, 15 Apr 2019 07:45:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xdBD=SR=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hFwJG-00051y-79
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 07:45:46 +0000
X-Inumbo-ID: 79d48576-5f52-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 79d48576-5f52-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 07:45:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90442374;
 Mon, 15 Apr 2019 00:45:44 -0700 (PDT)
Received: from [192.168.3.111] (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C98C83F68F;
 Mon, 15 Apr 2019 00:45:43 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1555252419-17121-1-git-send-email-amittomer25@gmail.com>
 <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Organization: ARM Ltd.
Message-ID: <e60a9e5a-6492-4232-2400-128fce246cc8@arm.com>
Date: Mon, 15 Apr 2019 08:43:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <58cbfc08-720c-0d55-75ac-f14dc3799036@arm.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH] xen/arm: Blacklist PMU with "arm,
 cortex-a53-pmu"
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
Cc: sstabellini@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415074316.xyz1gO-9lqNhga3yRKXMRmYndqmGDGS_PI-mOmRVoMI@z>

T24gMTQvMDQvMjAxOSAxNzowNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MTQvMTkgMzozMyBQTSwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPj4gQXQgdGhlIG1vbWVudCwg
d2UgaGlkZSBQTVUncyBmcm9tIGRvbWFpbiAwIGFuZCBYRU4gYm9vdCBmYWlscyBvbgo+PiBwbGF0
Zm9ybVsxXQo+PiB3aGVyZSBEVFMgY29udGFpbnMgImFybSxjb3J0ZXgtYTUzLXBtdSIgYXMgY29t
cGF0aWJsZSBzdHJpbmcgZm9yIFBNVQo+PiBub2RlLgo+IAo+ICJEb21haW4gMCBhbmQgWGVuIGJv
b3QgZmFpbHMiIGlzIHByZXR0eSB2YWd1ZS4gSG93IGRvZXMgaXQgZmFpbD8KCkFmdGVyIHRhbGtp
bmcgdmlhIElSQywgdGhlIHByb2JsZW0gaXMgUFBJcywgdGhhdCB0aGlzIHBsYXRmb3JtIHVzZXMg
Zm9yClBNVSBpbnRlcnJ1cHRzLiBXaGVuIFhlbiB0cmllcyB0byBzZXR1cCB0aGUgSVJRIGZvcndh
cmRpbmcgZm9yIERvbTAgZm9yCnRoaXMgZGV2aWNlLCBpdCBmYWlscyBiZWNhdXNlIGl0IG9ubHkg
c3VwcG9ydHMgZm9yd2FyZGluZyBTUElzLgpTbyBpbnRlcmVzdGluZ2x5IHdlIGVycm9uZW91c2x5
IGZvcndhcmRlZCBBNTMgUE1VcyAodGhvc2UgdGhhdCBhcmUKZGVzY3JpYmVkIGJ5IHRoYXQgcGFy
dGljdWxhciBjb21wYXRpYmxlIHN0cmluZyBvbmx5KSB0byBEb20wIGZvciBxdWl0ZSBhCndoaWxl
LCBidXQgbm9ib2R5IG5vdGljZWQgKG9yIGNhcmVkKS4KCkFtaXQsIHBsZWFzZSBhZGp1c3QgdGhl
IGNvbW1pdCBtZXNzYWdlIGFjY29yZGluZ2x5LgoKQ2hlZXJzLApBbmRyZS4KCgo+IAo+IEluIGdl
bmVyYWwsIGEgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIGdpdmUgZW5vdWdoIHRvIHRoZSByZXZpZXdl
ciB0bwo+IHVuZGVyc3RhbmQgd2hhdCBpcyB0aGUgaXNzdWUgYW5kIGJlIGFibGUgdG8gZGVjaWRl
IHdoZXRoZXIgeW91ciBwYXRjaCBpcwo+IHRoZSBjb3JyZWN0IGZpeC4KPiAKPiBDaGVlcnMsCj4g
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
