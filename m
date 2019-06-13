Return-Path: <SRS0=BDkE=UM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5875C31E45
	for <xen-devel@archiver.kernel.org>; Thu, 13 Jun 2019 14:47:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A326620679
	for <xen-devel@archiver.kernel.org>; Thu, 13 Jun 2019 14:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A326620679
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbR0m-0000mV-Fx; Thu, 13 Jun 2019 14:47:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hbR0l-0000mO-Fp
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:47:31 +0000
X-Inumbo-ID: 2b0bd81a-8dea-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2b0bd81a-8dea-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 14:47:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 13 Jun 2019 08:47:29 -0600
Message-Id: <5D0261FE0200007800237F6B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 13 Jun 2019 08:47:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190611170127.2650-1-paul.durrant@citrix.com>
In-Reply-To: <20190611170127.2650-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] viridian: unify time sources
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDExLjA2LjE5IGF0IDE5OjAxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEBAIC03Nyw2ICs3Niw3IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9yZWZlcmVuY2VfdHNjKHN0
cnVjdCBkb21haW4gKmQsIGJvb2wgaW5pdGlhbGl6ZSkKPiAgICAgICAqIHRpY2tzIHBlciAxMDBu
cyBzaGlmdGVkIGxlZnQgYnkgNjQuCj4gICAgICAgKi8KPiAgICAgIHAtPlRzY1NjYWxlID0gKCgx
MDAwMHVsIDw8IDMyKSAvIGQtPmFyY2gudHNjX2toeikgPDwgMzI7Cj4gKyAgICBwLT5Uc2NPZmZz
ZXQgPSB0cmMtPm9mZjsKPiAgICAgIHNtcF93bWIoKTsKCkV2ZW4gaGF2aW5nIHdyaXR0ZW4gdGhl
IGRlc2NyaXB0aW9uIGl0J3Mgbm90IGltbWVkaWF0ZWx5IG9idmlvdXMKdG8gbWUgd2h5IHRoaXMg
aXMgYW4gb2theSBjaGFuZ2UgdG8gbWFrZSwgbm90IHRoZSBsZWFzdCB3aGVuCnRoaW5raW5nIGFi
b3V0IGEgZ3Vlc3QgbWlncmF0aW5nIGluIGZyb20gYW4gb2xkZXIgdmVyc2lvbi4gQXQgdGhlCnZl
cnkgbGVhc3QgZG9uJ3QgeW91IHRoaW5rIHRoZSBjb21tZW50IGFib3ZlIG1heSB3YW50IHNsaWdo
dGx5CmV4dGVuZGluZz8KCkV2ZXJ5dGhpbmcgZWxzZSBsb29rcyBwbGF1c2libGUgdG8gbWUuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
