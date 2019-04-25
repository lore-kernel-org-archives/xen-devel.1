Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB5CC10F03
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:15:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85672217FA
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 11:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85672217FA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJcL4-0003PR-FU; Thu, 25 Apr 2019 11:14:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJcL2-0003PM-Qm
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 11:14:48 +0000
X-Inumbo-ID: 5543af24-674b-11e9-92bc-ab6322512352
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5543af24-674b-11e9-92bc-ab6322512352;
 Thu, 25 Apr 2019 11:14:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 05:14:45 -0600
Message-Id: <5CC196A20200007800229009@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 05:14:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>,"Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
 <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
In-Reply-To: <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425111442.x9sigZx1MpwfcEWMa0n_6u-cqIalJ2R_vtxDoa5Nuyw@z>

Pj4+IE9uIDE1LjA0LjE5IGF0IDE5OjUxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
U2ltcGx5IGNoYW5naW5nIHRvIGdldF9wYWdlIHdpdGggZG9tX2NvdyBpcyBub3QgZW5vdWdoLCBJ
IHJhbiBpbnRvCj4gaXNzdWVzIHdoZXJlIHRoZSBzeXN0ZW0gc3RpbGwgZGVhZGxvY2tzIGR1ZSB0
byB0aGUgb3JkZXJpbmcgb2YKPiBwdXRfcGFnZV9hbmRfdHlwZSBiZWluZyBjYWxsZWQgYmVmb3Jl
IG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrLiBTbyB0aGUKPiBvcmRlcmluZyBzdGlsbCBoYXMgdG8g
YmUgY2hhbmdlZC4KCkRlYWQgbG9ja3MgYmVjYXVzZSBvZiB0aGUgb3JkZXJpbmcgb2YgcmVsZWFz
ZXMgKG9yIGxvY2tzIG9yIGFsaWtlKSwKbm90IGFjcXVpcmVzPyBUaGF0IGxvb2tzIHN1c3BpY2lv
dXMgdG8gbWUsIGkuZS4gc3VnZ2VzdHMgeWV0CmFub3RoZXIgcHJvYmxlbSBlbHNld2hlcmUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
