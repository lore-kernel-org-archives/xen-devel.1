Return-Path: <SRS0=W9gt=ZN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06082C432C0
	for <xen-devel@archiver.kernel.org>; Thu, 21 Nov 2019 07:55:26 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB62820872
	for <xen-devel@archiver.kernel.org>; Thu, 21 Nov 2019 07:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB62820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXhIv-0008BH-Hq; Thu, 21 Nov 2019 07:55:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXhIt-0008BC-Tk
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 07:55:03 +0000
X-Inumbo-ID: 384c784a-0c34-11ea-a325-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 384c784a-0c34-11ea-a325-12813bfff9fa;
 Thu, 21 Nov 2019 07:55:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A8267B0BF;
 Thu, 21 Nov 2019 07:54:59 +0000 (UTC)
To: Steven Haigh <netwiz@crc.id.au>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <006fa7b3-ae93-2812-c88a-7bf8e2ac88b0@suse.com>
Date: Thu, 21 Nov 2019 08:36:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
Content-Language: en-US
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMTkgMDg6MzAsIFN0ZXZlbiBIYWlnaCB3cm90ZToKPiBPbiAyMDE5LTExLTIxIDE3
OjA1LCBKw7xyZ2VuIEdyb8OfIHdyb3RlOgo+PiBXaGVyZSBkbyB3ZSBzdGFuZCB3aXRoIFhlbiA0
LjEzIHJlZ2FyZGluZyBibG9ja2VycyBhbmQgcmVsYXRlZCBwYXRjaGVzPwo+Pgo+PiAyLiBSeXpl
bi9Sb21lIGZhaWx1cmVzIHdpdGggV2luZG93cyBndWVzdHM6Cj4+IMKgwqAgV2hhdCBpcyB0aGUg
Y3VycmVudGx5IHBsYW5uZWQgd2F5IHRvIGFkZHJlc3MgdGhlIHByb2JsZW0/IFdobyBpcwo+PiDC
oMKgIHdvcmtpbmcgb24gdGhhdD8KPiAKPiBBIHdvcmthcm91bmQgd2FzIGZvdW5kIGJ5IHNwZWNp
ZnlpbmcgY3B1aWQgdmFsdWVzIGluIHRoZSBXaW5kb3dzIFZNIAo+IGNvbmZpZyBmaWxlLgo+IAo+
IFRoZSB3b3JrYXJvdW5kIGxpbmUgaXM6Cj4gY3B1aWQgPSBbICIweDgwMDAwMDA4OmVjeD14eHh4
eHh4eHh4eHh4eHh4MDEwMHh4eHh4eHh4eHh4eCIgXQo+IAo+IEl0IHdhcyBzdWdnZXN0ZWQgdGhh
dCB0aGlzIGJlIGRvY3VtZW50ZWQgLSBidXQgbm8gaW1tZWRpYXRlIGFjdGlvbiAKPiBzaG91bGQg
YmUgdGFrZW4gLSB3aXRoIGEgdmlldyB0byBjb3JyZWN0IHRoaXMgcHJvcGVybHkgaW4gNC4xNC4K
CkknbSBhd2FyZSBvZiB0aGUgc3VnZ2VzdGlvbiwgYnV0IG5vdCBvZiBhbnkgZGVjaXNpb24uIDot
KQoKPiBJJ20gbm90IHN1cmUgdGhlIHN0YXR1cyBvZiBhbnkgcGF0Y2hlcyAvIGFkZGl0aW9ucyB0
byBkb2N1bWVudGF0aW9uIC0gCj4gaG93ZXZlciBtYXliZSB0aGlzIGlzIHRoZSB3aWtpPyBJJ2xs
IGxlYXZlIHRoYXQgZm9yIHNvbWVvbmUgZWxzZSB0byAKPiBjb21tZW50IG9uLgoKSSBndWVzcyB0
aGlzIHdvdWxkIG5lZWQgdG8gZ28gaW50byB0aGUgcmVsZWFzZSBub3RlcyBhdCBsZWFzdC4KCgpK
dWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
