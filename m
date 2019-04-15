Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC949C10F12
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:15:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 859552147C
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 15:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 859552147C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hG3KK-0001Ha-Fj; Mon, 15 Apr 2019 15:15:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hG3KJ-0001HV-5O
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 15:15:19 +0000
X-Inumbo-ID: 46cd89f5-5f91-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46cd89f5-5f91-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 15:15:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 15 Apr 2019 09:15:17 -0600
Message-Id: <5CB4A0DE0200007800155514@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 15 Apr 2019 09:18:54 -0600
From: "Jan Beulich" <jbeulich@suse.com>
To: <andrew.cooper3@citrix.com>
References: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
 <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
 <5CB43C2E02000078001553EC@prv1-mh.provo.novell.com>
 <1d3c66a8-d964-0e92-ba68-9cf5cb1fb384@citrix.com>
In-Reply-To: <1d3c66a8-d964-0e92-ba68-9cf5cb1fb384@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] x86/msr: Definitions for
 MSR_INTEL_CORE_THREAD_COUNT
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
Cc: xen-devel@lists.xenproject.org, wei.liu2@citrix.com, roger.pau@citrix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415151854.BOk0XEtZ-1Kr5jGvatSWreBiCCzYo-OTbRLUV37HfP0@z>

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA0LzE1LzE5IDEw
OjMwIEFNID4+Pgo+T24gMTUvMDQvMjAxOSAwOTowOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4g
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gMDQvMTMvMTkgNjoyMiBQ
TSAKCj4+Pi0tLSBhL3hlbi9hcmNoL3g4Ni9tc3IuYysrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwo+
Pj4gQEAgLTEzMSw2ICsxMzEsNyBAQCBpbnQgZ3Vlc3RfcmRtc3IoY29uc3Qgc3RydWN0IHZjcHUg
KnYsIHVpbnQzMl90IG1zciwgdWludDY0X3QgKnZhbCkKPj4+IGNhc2UgTVNSX1BSRURfQ01EOgo+
Pj4gY2FzZSBNU1JfRkxVU0hfQ01EOgo+Pj4gLyogV3JpdGUtb25seSAqLwo+Pj4gKyAgICBjYXNl
IE1TUl9JTlRFTF9DT1JFX1RIUkVBRF9DT1VOVDoKPj4+IGNhc2UgTVNSX1RTWF9GT1JDRV9BQk9S
VDoKPj4+IC8qIE5vdCBvZmZlcmVkIHRvIGd1ZXN0cy4gKi8KPj4+IGdvdG8gZ3BfZmF1bHQ7Cj4+
IEluIGEgcHJpdmF0ZSB0YWxrIHdlIGhhZCwgZGlkbid0IHlvdSBtZW50aW9uIHRoZXJlIGlzIGF0
IGxlYXN0IG9uZSBPUyAod2FzIGl0IE9TWCkKPj4gdGhhdCB1bmNvbmRpdGlvbmFsbHkgcmVhZHkg
dGhpcyBNU1I/IERlc3BpdGUgYXNzdW1pbmcgdGhlcmUgYXJlIG90aGVyIGlzc3Vlcwo+PiB3aXRo
IE9TWCwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGF2b2lkIGdpdmluZyAjR1AoMCkgYmFjayBo
ZXJlPyBJIHJlYWxpemUgd2UgY2FuJ3QKPj4geWV0IGdpdmUgYmFjayBhIGZ1bGx5IGNvbnNpc3Rl
bnQgdmFsdWUgaGVyZSwgbG9va2luZyBhdCB3aGF0IGNvbmNsdXNpb25zIExpbnV4Cj4+IGRyYXdz
IGZyb20gb3RoZXIgQ1BVSUQgb3V0cHV0LCBjb3VsZG4ndCAweDAwMDEwMDAxIGJlIHVzZWQgYXMg
ImZha2UiIHZhbHVlPwo+Cj5JIGRpZCBjb25zaWRlciB0aGF0IG9wdGlvbiwgYnV0IGZvciBhbnlv
bmUgbG9va2luZyBhdCB0aGlzIE1TUiwgaXQgaXMKPmxpa2VseSB0byBtYWtlIHRoZSBzaXR1YXRp
b24gd29yc2UgcmF0aGVyIHRoYW4gYmV0dGVyLgo+Cj5UaGUgb3RoZXIgb3B0aW9uIHRvIGNvbnNp
ZGVyIGlzIHJldGFpbmluZyB0aGUgY3VycmVudCBsZWFreSBiZWhhdmlvdXIuIAo+VGhlcmUgaGF2
ZW4ndCBiZWVuIG9idmlvdXMgcHJvYmxlbXMgdGh1cyBmYXIsIGFuZCB0aGUgYWNjdXJhdGUgdG9w
b2xvZ3kKPmluZm9ybWF0aW9uIGlzIGdvaW5nIHRvIGJlIGFycml2aW5nIHNob3J0bHkgdG8gbWVz
aCBpbiB3aXRoIHRoZSBjb3JlCj5zY2hlZHVsaW5nIHdvcmsuCgpJbW8gdGhpcyB3b3VsZCBzdGls
bCBiZSBiZXR0ZXIgdGhhbiBkZWxpdmVyaW5nICNHUCgwKS4KCkphbgoKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
