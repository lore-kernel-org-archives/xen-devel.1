Return-Path: <SRS0=IYHG=ZK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0255AC432C3
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 12:29:51 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1EDB2071C
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 12:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1EDB2071C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWgA0-0003Co-H0; Mon, 18 Nov 2019 12:29:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWg9y-0003Cc-PA
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 12:29:38 +0000
X-Inumbo-ID: 15a1da42-09ff-11ea-a2d8-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15a1da42-09ff-11ea-a2d8-12813bfff9fa;
 Mon, 18 Nov 2019 12:29:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E94A9AD49;
 Mon, 18 Nov 2019 12:29:36 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>
References: <0e47b56a-4e5d-e815-2e74-eab5da11f3d0@posteo.de>
 <45f6c5bf-2d24-d3d7-1c61-f8e2da04b5b7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <537a13c0-34eb-8687-3e75-6cf6e1f98874@suse.com>
Date: Mon, 18 Nov 2019 13:29:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <45f6c5bf-2d24-d3d7-1c61-f8e2da04b5b7@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [SUSPECTED SPAM]Ryzen 3xxx works with Windows
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Andreas Kinzler <hfp@posteo.de>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxMjozOSwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNS8xOSA1
OjA2IFBNLCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+IEhlbGxvIEFsbCwKPj4KPj4gSSBjb21w
YXJlZCB0aGUgQ1BVSUQgbGlzdGluZ3MgZnJvbSBSeXplbiAyNzAwWCAoYXR0YWNoZWQgYXMgdGFy
Lnh6KSB0bwo+PiAzNzAwWCBhbmQgZm91bmQgb25seSB2ZXJ5IGZldyBkaWZmZXJlbmNlcy4gSSBh
ZGRlZAo+Pgo+PiBjcHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4eHh4eHh4eHgwMTAw
eHh4eHh4eHh4eHh4IiBdCj4+Cj4+IHRvIHhsLmNmZyBhbmQgdGhlbiBXaW5kb3dzIHJ1bnMgZ3Jl
YXQgd2l0aCAxNiB2Q1BVcy4gQ2luZWJlbmNoIFIxNSBzY29yZQo+PiBpcyA+MjA1MCB3aGljaCBp
cyBtb3JlIG9yIGxlc3MgdGhlIGJhcmUgbWV0YWwgdmFsdWUuCj4gCj4gU28gdGhpcyBpcyBzZXR0
aW5nIHRob3NlIGJpdHMgdG8gMDEwMCwgb3IgNC4gIFdoYXQgaXMgaXQgb24gdGhlIDM3MDBYIGlm
Cj4geW91IGRvbid0IGNoYW5nZSBpdCBoZXJlPwoKQWNjb3JkaW5nIHRvIHRoZSBDUFVJRCBvdXRw
dXQgQW5kcmVhcyBoYWQgc2VudCBpdCdzIDQuIFRoZQpjdXJyZW50IG1hc3NhZ2luZyBpbiBsaWJ4
YyAod2hpY2ggeW91ciBwYXRjaCB3b3VsZCBjb25kaXRpb25hbGx5CnN1cHByZXNzKSB3b3VsZCBk
b3VibGUgdGhpcyB0byA4IGFmYWljdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
