Return-Path: <SRS0=sOOj=WJ=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4ED1C433FF
	for <xen-devel@archiver.kernel.org>; Tue, 13 Aug 2019 06:54:45 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A5DE20665
	for <xen-devel@archiver.kernel.org>; Tue, 13 Aug 2019 06:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A5DE20665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxQhX-0002zU-S6; Tue, 13 Aug 2019 06:54:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hxQhX-0002yT-0i
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 06:54:35 +0000
X-Inumbo-ID: 62e13d9e-bce7-11e9-92ac-7b9521b9ff1b
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62e13d9e-bce7-11e9-92ac-7b9521b9ff1b;
 Mon, 12 Aug 2019 09:56:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D4085ABD9;
 Mon, 12 Aug 2019 09:55:58 +0000 (UTC)
To: David Woodhouse <dwmw2@infradead.org>
References: <cover.1565362089.git.dwmw@amazon.co.uk>
 <759652afb52a3258f0da44de61ed28d0875774f8.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6a051513-e462-e93a-3118-b722fa5ccdaa@suse.com>
Date: Mon, 12 Aug 2019 11:55:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <759652afb52a3258f0da44de61ed28d0875774f8.camel@infradead.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/6] x86/boot: Rename trampoline_{start,
 end} to boot_trampoline_{start, end}
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDguMjAxOSAxNzowMiwgRGF2aWQgV29vZGhvdXNlIHdyb3RlOgo+IEZyb206IERhdmlk
IFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+Cj4gCj4gSW4gcHJlcGFyYXRpb24gZm9yIHNw
bGl0dGluZyB0aGUgYm9vdCBhbmQgcGVybWFuZW50IHRyYW1wb2xpbmVzIGZyb20KPiBlYWNoIG90
aGVyLiBTb21lIG9mIHRoZXNlIHdpbGwgY2hhbmdlIGJhY2ssIGJ1dCBtb3N0IGFyZSBib290IHNv
IGRvIHRoZQo+IHBsYWluIHNlYXJjaC9yZXBsYWNlIHRoYXQgd2F5IGZpcnN0LCB0aGVuIGEgc3Vi
c2VxdWVudCBwYXRjaCB3aWxsIGV4dHJhY3QKPiB0aGUgcGVybWFuZW50IHRyYW1wb2xpbmUgY29k
ZS4KClRvIGJlIGhvbmVzdCBJIGRvbid0IHZpZXcgaXQgYXMgaGVscGZ1bCB0byBkbyB0aGluZ3Mg
aW4gdGhpcyBvcmRlci4KSWYgeW91IGZpcnN0IHJlLWFycmFuZ2VkIHRoZSBvcmRlcmluZyBvZiBp
dGVtcyB3aXRoaW4gdGhlIHRyYW1wb2xpbmUsCndlJ2QgdGhlbiBub3QgZW5kIHVwIHdpdGggYW4g
aW50ZXJtZWRpYXRlIHN0YXRlIHdoZXJlIHRoZSBsYWJlbHMgYXJlCm1pc2xlYWRpbmcuIElzIHRo
ZXJlIGEgcmVhc29uIHRoaW5ncyBjYW4ndCBzZW5zaWJseSBiZSBkb25lIHRoZSBvdGhlcgp3YXkg
YXJvdW5kPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
