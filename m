Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2214DC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:12:43 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA13420675
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA13420675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGK8m-0001zd-B0; Tue, 16 Apr 2019 09:12:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jU7w=SS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGK8k-0001zU-NT
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 09:12:30 +0000
X-Inumbo-ID: c202b51c-6027-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c202b51c-6027-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 09:12:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6B590EBD;
 Tue, 16 Apr 2019 02:11:58 -0700 (PDT)
Received: from [10.37.12.51] (unknown [10.37.12.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 279133F68F;
 Tue, 16 Apr 2019 02:11:57 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1554718489-11318-1-git-send-email-olekstysh@gmail.com>
 <1554718489-11318-3-git-send-email-olekstysh@gmail.com>
 <3370f03e-3d4d-7d01-3783-6475b110860c@arm.com>
 <1c0b4b09-7d7b-97a7-eecd-b809ea79523c@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6ecca59b-48b5-b515-d273-6ab518bdbd00@arm.com>
Date: Tue, 16 Apr 2019 10:11:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1c0b4b09-7d7b-97a7-eecd-b809ea79523c@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 2/5] xen/arm: drivers: scif: Extend
 driver to handle other interfaces
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416091155.wFjrfyZyFuG8BAn6ZeAZLNUA9O7gVdZ4ZFk9Xos6zsU@z>

SGkgT2xla3NhbmRyLAoKT24gNC8xNS8xOSAxMjozMCBQTSwgT2xla3NhbmRyIHdyb3RlOgo+IAo+
IE9uIDE0LjA0LjE5IDE5OjU1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIE9sZWtzYW5kciwK
PiAKPiBIaSBKdWxpZW4KPiAKPiAKPj4KPj4gT24gNC84LzE5IDExOjE0IEFNLCBPbGVrc2FuZHIg
VHlzaGNoZW5rbyB3cm90ZToKPj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfdHlzaGNoZW5rb0BlcGFtLmNvbT4KPj4+Cj4+PiBFeHRlbmQgZHJpdmVyIHRvIGJlIGFibGUg
dG8gaGFuZGxlIG90aGVyIFNDSUYoWCkgY29tcGF0aWJsZQo+Pj4gaW50ZXJmYWNlcyBhcyB3ZWxs
LiBUaGVzZSBpbnRlcmZhY2VzIGhhdmUgbG90IGluIGNvbW1vbiwKPj4+IGJ1dCBtb3N0bHkgZGlm
ZmVyIGluIG9mZnNldHMgYW5kIGJpdHMgZm9yIHNvbWUgcmVnaXN0ZXJzLgo+Pgo+PiBDYW4geW91
IGJyaWVmbHkgZXhwbGFpbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2Ugd2hhdCBkaWZmZXJzPwo+IAo+
IFN1cmUKPiAKPiAKPj4KPj4gWy4uLl0KPj4KPj4+IEBAIC02NSwxMyArMTAwLDE2IEBAIHN0YXRp
YyB2b2lkIHNjaWZfdWFydF9pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAKPj4+ICpkYXRhLCBzdHJ1
Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNl
cmlhbF9yeF9pbnRlcnJ1cHQocG9ydCwgcmVncyk7Cj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogRXJyb3IgSW50ZXJydXB0ICovCj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCBzdGF0dXMgJiBT
Q0lGX0VSUk9SUyApCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzY2lmX3dyaXRldyh1YXJ0
LCBTQ0lGX1NDRlNSLCB+U0NJRl9FUlJPUlMpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmICggc2Np
Zl9yZWFkdyh1YXJ0LCBTQ0lGX1NDTFNSKSAmIFNDTFNSX09SRVIgKQo+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgc2NpZl93cml0ZXcodWFydCwgU0NJRl9TQ0xTUiwgMCk7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKCBzdGF0dXMgJiBwYXJhbXMtPmVycm9yX21hc2sgKQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc2NpZl93cml0ZXcodWFydCwgcGFyYW1zLT5zdGF0dXNfcmVnLCB+cGFy
YW1zLT5lcnJvcl9tYXNrKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIHBhcmFtcy0+b3ZlcnJ1
bl9yZWcgIT0gcGFyYW1zLT5zdGF0dXNfcmVnICkKPj4KPj4gQmVsb3cgeW91IHdpbGwgd3JpdGUg
dGhlIHNhbWUgcmVnaXN0ZXIgdHdpY2UgaWYgb3ZlcnJ1bl9yZWcgPT0gCj4+IHN0YXR1c19yZWcg
KHNlZSBzY2lmX3VhcnRfaW5pdF9wcmVpcnEpLiBXb3VsZCB0aGVyZSBiZSBhbnkgaXNzdWUgaWYg
Cj4+IHlvdSBkbyB0aGUgc2FtZSBoZXJlPwo+IAo+IEkgZGlkbid0IGV4cGVjdCBhbnkgaXNzdWUg
dG8gd3JpdGUgdGhlIHNhbWUgcmVnaXN0ZXIgdHdpY2UgZHVyaW5nIAo+IGluaXRpYWxpemF0aW9u
IHRvIHNpbXBsaWZ5IHRoZSBjb2RlLCB0aGF0IHdoeSBJIGFncmVlZCB0byByZW1vdmUgdGhlIAo+
IGNoZWNrIGluIFYxLgo+IAo+IEJ1dCBJIGFtIG5vdCBzdXJlIGFib3V0IGRvaW5nIHNvIGhlcmUu
IFdlIGNvdWxkIHNpbXBsaWZ5IHRoZSBjb2RlIGJ5IAo+IGp1c3QgcmVtb3ZpbmcgImlmICggcGFy
YW1zLT5vdmVycnVuX3JlZyAhPSBwYXJhbXMtPnN0YXR1c19yZWcgKSIsCj4gCj4gYnV0IHdlIHdv
dWxkIG5lZWQgdG8gZG8gZXh0cmEgb3BlcmF0aW9uIGZvciBTQ0lGQSB3aGljaCBoYXMgb3ZlcnJ1
bl9yZWcgCj4gPT0gc3RhdHVzX3JlZy4KPiAKPiBXaGF0IHdheSBkbyB5b3UgcHJlZmVyPwoKSXQg
aXMgbm90IGFib3V0IHByZWZlcmVuY2UsIGl0IGlzIGFib3V0IGNvcnJlY3RuZXNzLiBJbiBteSBw
cmV2aW91cyAKcmVwbHksIEkgcG9pbnRlZCBvdXQgdGhhdCB5b3UgZGVmaW5lIG92ZXJydW5fbWFz
ayBmb3IgU0NJRkEgYnV0IGl0IHdpbGwgCm5ldmVyIGJlIHVzZWQuIFdpdGhvdXQgYW55IGV4cGxh
bmF0aW9uLCB0aGUgY29kZSBsb29rcyBwcmV0dHkgd3JvbmcuCgpMb29raW5nIGF0IHRoZSBuZXh0
IHBhdGNoLCB5b3UgZ2V0IGF3YXkgZnJvbSBhbnkgcHJvYmxlbSB3aXRoIFNDSUZBIApiZWNhdXNl
IHRoZSBvdmVycnVuX21hc2sgaXMgYSBzdWJzZXQgb2YgZXJyb3JfbWFzay4gQnV0IEkgc3RpbGwg
ZG9uJ3QgCnNlZSB3aHkgdHJ5aW5nIHRvIHByZXZlbnQgdG8gd3JpdGUgYSBzZWNvbmQgdGltZSBp
cyBhbiBpc3N1ZSwgdGhlIG1vcmUgCnRoZSBMaW51eCBkcml2ZXIgZG9lcyBub3Qgc2VlbSB0byBk
byB0aGlzIGRhbmNlLgoKU28gYXQgYmVzdCwgeW91IG5lZWQgdG8gZXhwbGFpbiBpbiB0aGUgY29t
bWl0IG1lc3NhZ2Ugd2h5IHlvdSB0cnkgdG8gCnNraXAgdGhlIHJlZ2lzdGVyIHdoZW4gaXQgaXMg
dGhlIHNhbWUuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
