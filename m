Return-Path: <SRS0=kidI=ZP=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7171FC432C0
	for <xen-devel@archiver.kernel.org>; Sat, 23 Nov 2019 05:56:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3028920672
	for <xen-devel@archiver.kernel.org>; Sat, 23 Nov 2019 05:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3028920672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iYOOx-0000FO-Bp; Sat, 23 Nov 2019 05:56:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KFiP=ZP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iYOOv-0000FJ-SQ
 for xen-devel@lists.xenproject.org; Sat, 23 Nov 2019 05:56:09 +0000
X-Inumbo-ID: f08b91e8-0db5-11ea-a370-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f08b91e8-0db5-11ea-a370-12813bfff9fa;
 Sat, 23 Nov 2019 05:56:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4D40AD3A;
 Sat, 23 Nov 2019 05:56:05 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191122175400.4001-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a1fb12bd-6b4a-03d2-1684-b3c965ea7ec5@suse.com>
Date: Sat, 23 Nov 2019 06:56:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191122175400.4001-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vvmx: Fix livelock with
 XSA-304 fix
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
Cc: Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMTEuMTkgMTg6NTQsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gSXQgdHVybnMgb3V0IHRo
YXQgdGhlIFhTQS0zMDQgLyBDVkUtMjAxOC0xMjIwNyBmaXggb2YgZGlzYWJsaW5nIGV4ZWN1dGFi
bGUKPiBzdXBlcnBhZ2VzIGRvZXNuJ3Qgd29yayB3ZWxsIHdpdGggdGhlIG5lc3RlZCBwMm0gY29k
ZS4KPiAKPiBOZXN0ZWQgdmlydCBpcyBleHBlcmltZW50YWwgYW5kIG5vdCBzZWN1cml0eSBzdXBw
b3J0ZWQsIGJ1dCBpcyB1c2VmdWwgZm9yCj4gZGV2ZWxvcG1lbnQgcHVycG9zZXMuICBJbiBvcmRl
ciB0byBub3QgcmVncmVzcyB0aGUgc3RhdHVzIHF1bywgZGlzYWJsZSB0aGUKPiBYU0EtMzA0IHdv
cmthcm91bmQgdW50aWwgdGhlIG5lc3RlZCBwMm0gY29kZSBjYW4gYmUgaW1wcm92ZWQuCj4gCj4g
SW50cm9kdWNlIGEgcGVyLWRvbWFpbiBleGVjX3NwIGNvbnRyb2wgYW5kIHNldCBpdCBiYXNlZCBv
biB0aGUgY3VycmVudAo+IG9wdF9lcHRfZXhlY19zcCBzZXR0aW5nLiAgVGFrZSB0aGUgb3Bwb3R1
bml0eSB0byBvbWl0IGEgUFZIIGhhcmR3YXJlIGRvbWFpbgo+IGZyb20gdGhlIHBlcmZvcm1hbmNl
IGhpdCwgYmVjYXVzZSBpdCBpcyBhbHJlYWR5IHBlcm1pdHRlZCB0byBEb1MgdGhlIHN5c3RlbSBp
bgo+IHN1Y2ggd2F5cyBhcyBpc3N1aW5nIGEgcmVib290Lgo+IAo+IFdoZW4gbmVzdGVkIHZpcnQg
aXMgZW5hYmxlZCBvbiBhIGRvbWFpbiwgZm9yY2UgaXQgdG8gdXNpbmcgZXhlY3V0YWJsZQo+IHN1
cGVycGFnZXMgYW5kIHJlYnVpbGQgdGhlIHAybS4KPiAKPiBIYXZpbmcgdGhlIHNldHRpbmcgcGVy
LWRvbWFpbiBpbnZvbHZlcyByZWFycmFuZ2luZyB0aGUgaW50ZXJuYWxzIG9mCj4gcGFyc2VfZXB0
X3BhcmFtX3J1bnRpbWUoKSBidXQgaXQgc3RpbGwgcmV0YWlucyB0aGUgc2FtZSBvdmVyYWxsIHNl
bWFudGljcyAtCj4gZm9yIGVhY2ggYXBwbGljYWJsZSBkb21haW4gd2hvc2Ugc2V0dGluZyBuZWVk
cyB0byBjaGFuZ2UsIHJlYnVpbGQgdGhlIHAybS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1ieTogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
