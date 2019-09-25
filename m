Return-Path: <SRS0=n2L7=XU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92522C432C1
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 09:01:24 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BE0A214DA
	for <xen-devel@archiver.kernel.org>; Wed, 25 Sep 2019 09:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BE0A214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD3Af-0001iD-Ra; Wed, 25 Sep 2019 09:01:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD3Af-0001i3-72
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 09:01:13 +0000
X-Inumbo-ID: 05650868-df73-11e9-962c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 05650868-df73-11e9-962c-12813bfff9fa;
 Wed, 25 Sep 2019 09:01:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 075E3B077;
 Wed, 25 Sep 2019 09:01:11 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
Date: Wed, 25 Sep 2019 11:01:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAyMDoyMCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBJJ20gYSBiaXQg
YXQgYSBsb3NzIG9mIHdoYXQncyBoYXBwZW5pbmcgaGVyZSwgYnV0IGl0IHNlZW1zIHRoYXQKPiB0
aGUgbGF0ZXN0IFhlbiBmcm9tIG1hc3RlciBmYWlscyB0byBib290IG9uIEhQIFByb0xpYW50IERM
MjAKPiBHRU4xMCBzZXJ2ZXIgKHNhbWUgWGVuIGJvb3RzIGZpbmUgb24gZXZlcnkgb3RoZXIgcGll
Y2Ugb2YKPiBoYXJkd2FyZSBpbiBteSBsYWIpLgoKRmlyc3Qgb2YgYWxsIC0gaXMgdGhpcyBrbm93
biB0byBiZSBhIHJlZ3Jlc3Npb24sIGkuZS4gaXMgb2xkZXIKWGVuIGtub3duIHRvIHdvcmsgb24g
dGhpcyBwYXJ0aWN1bGFyIGhhcmR3YXJlPwoKPiBUaGVyZSBhcmUgYWJzb2x1dGVseSBubyBzaWdu
cyBvZiB3aGF0J3MgZ29pbmcgd3Jvbmcgd2l0aCBpdC4KPiBJdCBqdXN0IHN0b3BzIGF0Cj4gCj4g
KFhFTikgSFZNOiBBU0lEcyBlbmFibGVkLgo+IChYRU4pIEhWTTogVk1YIGVuYWJsZWQKPiAoWEVO
KSBIVk06IEhhcmR3YXJlIEFzc2lzdGVkIFBhZ2luZyAoSEFQKSBkZXRlY3RlZAo+IChYRU4pIEhW
TTogSEFQIHBhZ2Ugc2l6ZXM6IDRrYiwgMk1CLCAxR0IKPiAuLi4KPiAoWEVOKSBBZGRpbmcgY3B1
IDEgdG8gcnVucXVldWUgMAo+IChYRU4pIG13YWl0LWlkbGU6IG1heCBDLXN0YXRlIGNvdW50IG9m
IDggcmVhY2hlZAo+IChYRU4pIEFkZGluZyBjcHUgMiB0byBydW5xdWV1ZSAwCj4gKFhFTikgbXdh
aXQtaWRsZTogbWF4IEMtc3RhdGUgY291bnQgb2YgOCByZWFjaGVkCj4gCj4gSSBndWVzcyB0aGUg
b25seSBjbHVlIGlzIHRoYXQgeW91ciB0eXBpY2FsIGxpbmUgb2Y6Cj4gCj4gKFhFTikgQnJvdWdo
dCB1cCBYIENQVXMKPiAKPiBuZXZlciBnZXRzIHByaW50ZWQgLS0gc28gcGVyaGFwcyB0aGVyZSdz
IHNvbWV0aGluZyB3b25reQo+IGdvaW5nIG9uIHdpdGggQ1BVIGluaXRpYWxpemF0aW9uLgo+IAo+
IEFueSBhZHZpY2Ugb24gaG93IHRvIGRpYWdub3NlIHRoaXMgZnVydGhlciB3aWxsIGJlIGdyZWF0
bHkgYXBwcmVjaWF0ZWQuCgpTZWNvbmQsIGFzIGFsd2F5cywgYSBjb21wbGV0ZSBsb2cgd2lsbCBh
bHJlYWR5IGhlbHAsIGUuZy4gYnkgYWxsb3dpbmcKdXMgdG8gc2VlIHdoYXQgQ1BVIG1vZGVsIGl0
IGlzIHRoYXQncyBpbiB0aGUgc3lzdGVtLiBJaXJjIHRoZXJlIHdhcyBhCnNpbWlsYXIgcmVwb3J0
IGZvciBhIGNlcnRhaW4gQXRvbSB2YXJpYW50LCBidXQgSSBhc3N1bWUgaXQncyBhIFNreWxha2UK
aGVyZS4gTWF4aW11bSB2ZXJib3NpdHkgKGxvZ2x2bD1hbGwpIGFuZCBleHRyYSBDUFUgcmVsYXRl
ZCBvdXRwdXQKKCJjcHVpbmZvIikgc2hvdWxkIGJlIGVuYWJsZWQgZm9yIHRoaXMuCgpGdXJ0aGVy
bW9yZSwgd2hpbGUgSSBkb24ndCB0aGluayB0aGUgKGJvZ3VzOyBJJ2xsIG1ha2UgYSBwYXRjaCBp
biBhCm1pbnV0ZSkgbXdhaXQtaWRsZSBtZXNzYWdlIGlzIHJlbGF0ZWQsIGV4Y2x1ZGluZyB0aGVy
ZSB0byBiZSBhbiBlZmZlY3QKd291bGQgYmUgYSBoZWxwZnVsIGV4dHJhIGRhdGEgcG9pbnQgKCJj
cHVpZGxlPTAiIGZvciBzaW1wbGljaXR5KS4KCkFub3RoZXIgcG90ZW50aWFsbHkgdXNlZnVsIGV4
cGVyaW1lbnQgd291bGQgYmUgdG8gbGltaXQgdGhlIG51bWJlciBvZgpDUFVzIHRvIGJvb3QgKCJu
b3NtcCIgc2hvdWxkIGJvb3QgZmluZSBpbiBhbnkgY2FzZSwgc28gIm1heGNwdXM9Igp3b3VsZCBi
ZSB3aGF0IHlvdSdkIHdhbnQgdG8gcGxheSB3aXRoKSwgYW5kIHRvIG92ZXJyaWRlIHRoZSBkZWZh
dWx0Cm9mIHdoZXRoZXIgdG8gcGFyayBzZWNvbmRhcnkgaHlwZXJ0aHJlYWRzICgic210PTAiIGFu
ZCAic210PTEiKS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
