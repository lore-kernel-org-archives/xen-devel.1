Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA5F6C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:09:39 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1AB3206BA
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 08:09:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1AB3206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFwg8-0007TN-36; Mon, 15 Apr 2019 08:09:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=6WyI=SR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hFwg6-0007TI-N2
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 08:09:22 +0000
X-Inumbo-ID: c632f5fd-5f55-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c632f5fd-5f55-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 08:09:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 15 Apr 2019 02:09:21 -0600
Message-Id: <5CB43C2E02000078001553EC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 15 Apr 2019 02:09:18 -0600
From: "Jan Beulich" <jbeulich@suse.com>
To: <andrew.cooper3@citrix.com>
References: <1555172532-23814-1-git-send-email-andrew.cooper3@citrix.com>
 <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1555172532-23814-3-git-send-email-andrew.cooper3@citrix.com>
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
Message-ID: <20190415080918.SZ6S8z4mnjr2jeBHW3PgnMdIs6iEH3D8JoKiIEo10Fc@z>

Pj4+IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IDA0LzEzLzE5IDY6
MjIgUE0gPj4+LS0tIGEveGVuL2FyY2gveDg2L21zci5jKysrIGIveGVuL2FyY2gveDg2L21zci5j
Cj5AQCAtMTMxLDYgKzEzMSw3IEBAIGludCBndWVzdF9yZG1zcihjb25zdCBzdHJ1Y3QgdmNwdSAq
diwgdWludDMyX3QgbXNyLCB1aW50NjRfdCAqdmFsKQo+Y2FzZSBNU1JfUFJFRF9DTUQ6Cj5jYXNl
IE1TUl9GTFVTSF9DTUQ6Cj4vKiBXcml0ZS1vbmx5ICovCj4rICAgIGNhc2UgTVNSX0lOVEVMX0NP
UkVfVEhSRUFEX0NPVU5UOgo+Y2FzZSBNU1JfVFNYX0ZPUkNFX0FCT1JUOgo+LyogTm90IG9mZmVy
ZWQgdG8gZ3Vlc3RzLiAqLwo+Z290byBncF9mYXVsdDsKCkluIGEgcHJpdmF0ZSB0YWxrIHdlIGhh
ZCwgZGlkbid0IHlvdSBtZW50aW9uIHRoZXJlIGlzIGF0IGxlYXN0IG9uZSBPUyAod2FzIGl0IE9T
WCkKdGhhdCB1bmNvbmRpdGlvbmFsbHkgcmVhZHkgdGhpcyBNU1I/IERlc3BpdGUgYXNzdW1pbmcg
dGhlcmUgYXJlIG90aGVyIGlzc3Vlcwp3aXRoIE9TWCwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRv
IGF2b2lkIGdpdmluZyAjR1AoMCkgYmFjayBoZXJlPyBJIHJlYWxpemUgd2UgY2FuJ3QKeWV0IGdp
dmUgYmFjayBhIGZ1bGx5IGNvbnNpc3RlbnQgdmFsdWUgaGVyZSwgbG9va2luZyBhdCB3aGF0IGNv
bmNsdXNpb25zIExpbnV4CmRyYXdzIGZyb20gb3RoZXIgQ1BVSUQgb3V0cHV0LCBjb3VsZG4ndCAw
eDAwMDEwMDAxIGJlIHVzZWQgYXMgImZha2UiIHZhbHVlPwoKCk5ldmVydGhlbGVzcyBpZiB5b3Un
cmUgY29udmluY2VkIGl0IHNob3VsZCBiZSB0aGlzIHdheSwgYW5kIGlmIHRoaXMgZG9lc24ndCBh
Y3RpdmVseQpicmVhayBhbnkgZ3Vlc3QgT1MgKGR1ZSB0byBpbnRyb2R1Y2luZyB0aGlzIGFzIHRo
ZSBfb25seV8gdGhpbmcgY2F1c2luZyB0aGVpciBib290CnRvIGZhaWwpCgpBY2tlZC1ieTogSmFu
IEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
