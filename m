Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70041C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:24:38 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471BF2077B
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 471BF2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJx5i-00047s-Cm; Fri, 26 Apr 2019 09:24:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJx5h-00047n-0I
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:24:21 +0000
X-Inumbo-ID: 11cd9e9d-6805-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 11cd9e9d-6805-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 09:24:19 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 03:24:18 -0600
Message-Id: <5CC2CE3D02000078002295C7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 03:24:13 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190425153252.14795-1-tamas@tklengyel.com>
 <20190425153252.14795-2-tamas@tklengyel.com>
 <ced3d7b5-e683-f17c-b068-2d372f59c498@citrix.com>
 <CABfawhn4eS2aB8+aZjo10ixmtzsOrSfugEz7ELMM9uMqC-6dSw@mail.gmail.com>
 <495a1395-06d4-2ce3-7216-1417ba41fe07@citrix.com>
 <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
In-Reply-To: <CABfawhm8KxHwY4PB8u-EBqw0K+G1Hv9S9iTC_RYaqOY15bxX4A@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/3] x86/mem_sharing: replace use of
 page_lock/unlock with our own lock
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426092413.Wim4wfVXTp16OOXN1M6Dw5GtERNH_FkPtvtU-FHuMmo@z>

Pj4+IE9uIDI2LjA0LjE5IGF0IDAyOjEyLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
SSB3b3VsZCBiZSBPSyB3aXRoIHB1dHRpbmcgdGhlIHdob2xlIHRoaW5nIGJlaGluZAo+IENPTkZJ
R19IQVNfTUVNX1NIQVJJTkcgYW5kIGhhdmluZyB0aGF0IGJlIG9mZiBieSBkZWZhdWx0LiBJcyB0
aGF0IGEKPiBmZWFzaWJsZSByb3V0ZSBmcm9tIHlvdXIgUE9WPwoKU28gaXMgdGhlcmUgYW55dGhp
bmcgd3Jvbmcgd2l0aCBteSBlYXJsaWVyIHN1Z2dlc3Rpb24gb2YKcmUtcHVycG9zaW5nIHRoZSBz
aGFyaW5nIGZpZWxkIHRvIGF0dGFjaCBhIHN0cnVjdHVyZSB0byB0aGUgcGFnZQp3aGljaCBjb250
YWlucyB0aGUgbmVjZXNzYXJ5IGxvY2s/IEkuZS4gaW4gdGhlIHNpbXBsZXN0IGNhc2UgYnkKYWRk
aW5nIHRoZSBsb2NrIHRvIHN0cnVjdCBwYWdlX3NoYXJpbmdfaW5mbyBpdHNlbGY/CgpBcyB0byB5
b3VyIHF1ZXN0aW9uIGFib3ZlIC0gdGhhdCB3b3VsZCBiZSBhbm90aGVyIG9wdGlvbiwgb2YKY291
cnNlIHdpdGggdGhlIGNvbmZpZyBvcHRpb24gZ2V0dGluZyBpdHMgSEFTXyBwYXJ0IGRyb3BwZWQu
ClBvc3NpYmx5IGl0IGNvdWxkIHRoZW4gZXZlbiBkZWZhdWx0IHRvIGVuYWJsZWQgd2hlbiBCSUdN
RU09eS4KQnV0IHlvdSByZWFsaXplIHRoYXQgYnkgZ29pbmcgdGhpcyByb3V0ZSB5b3UgZnVydGhl
ciBpbmNyZWFzZQp0aGUgcmlzayBvZiBjaGFuZ2VzIGVsc2V3aGVyZSBicmVha2luZyBtZW0tc2hh
cmluZyB3aXRob3V0CmFueW9uZSBub3RpY2luZyByaWdodCBhd2F5PwoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
