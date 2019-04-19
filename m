Return-Path: <SRS0=iVlm=SV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94400C282E0
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 21:10:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54FA22171F
	for <xen-devel@archiver.kernel.org>; Fri, 19 Apr 2019 21:10:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/x7EZO7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54FA22171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHalU-0008Jh-TK; Fri, 19 Apr 2019 21:09:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4FrJ=SV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHalU-0008JA-2d
 for xen-devel@lists.xenproject.org; Fri, 19 Apr 2019 21:09:44 +0000
X-Inumbo-ID: 73163572-62e7-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 73163572-62e7-11e9-92d7-bc764e045a96;
 Fri, 19 Apr 2019 21:09:42 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 799D220652;
 Fri, 19 Apr 2019 21:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1555708181;
 bh=ek/Z2r03wOvL1jvSfhebo2qvXQ2Mz5NmXapYYjmD7lg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=d/x7EZO7Zp96F5B5VHx6Lj3DOXTRd6X6PGTEWoLaxib3hIaWGh6Xt7k8YIuphz+yR
 kGqWM0T4Gt2XvJOu6Kje1vT/XCQ8lbiFbMoUqKiKWxubyiFF00zjhp8Rv/WMKRbpQC
 +1uH3KeK35xuXtt16AU78zamrDdhoUBQVORGxPjM=
Date: Fri, 19 Apr 2019 14:09:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <04cb358b-5579-d5c6-bddc-5b1468f01bf5@arm.com>
Message-ID: <alpine.DEB.2.10.1904191409220.1370@sstabellini-ThinkPad-X260>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C8691A0020000780021D5F7@prv1-mh.provo.novell.com>
 <9314781f-a219-591c-a35e-05163d114057@arm.com>
 <5C88D99F020000780021E06E@prv1-mh.provo.novell.com>
 <04cb358b-5579-d5c6-bddc-5b1468f01bf5@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] BACKPORT Re: [PATCH 3/7] Arm/atomic: correct asm()
 constraints in build_add_sized()
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
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190419210941.f0pr0cWdhdrMU7MOWaJzpEjLDpV8XE7PHIyFA65R_IM@z>

T24gV2VkLCAxMyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDEzLzAzLzIwMTkg
MTA6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+ID4gT24gMTEuMDMuMTkgYXQgMTk6MDgs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIDExLzAzLzIwMTkgMTY6NDks
IEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPiA+IFRoZSBtZW1vcnkgb3BlcmFuZCBpcyBhbiBpbi9v
dXQgb25lLCBhbmQgdGhlIGF1eGlsaWFyeSByZWdpc3RlciBnZXRzCj4gPiA+ID4gd3JpdHRlbiB0
byBlYXJseS4KPiA+ID4gPiAKPiA+ID4gPiBUYWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgYWxzbyBk
cm9wIHRoZSByZWR1bmRhbnQgY2FzdCAodGhlIGlubGluZQo+ID4gPiA+IGZ1bmN0aW9ucycgcGFy
YW1ldGVycyBhcmUgYWxyZWFkeSBvZiB0aGUgY2FzdGVkLXRvIHR5cGUpLgo+ID4gPiA+IAo+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+ID4g
Cj4gPiA+IEkgZ3Vlc3MgdGhpcyBpcyBjYW5kaWRhdGUgZm9yIGJhY2twb3J0aW5nLgo+ID4gCj4g
PiBCdHcsIGRvIHlvdSB3YW50IG1lIHRvIHF1ZXVlIHRoaXMsIG9yIHdpbGwgeW91IG9yIFN0ZWZh
bm8gd2FudCB0bwo+ID4gdGFrZSBjYXJlPwo+IAo+IFN0ZWZhbm8gaXMgdGFraW5nIGNhcmUgb2Yg
YmFja3BvcnRpbmcuIFN0ZWZhbm8sIGNhbiB5b3UgcXVldWUgaXQgZm9yIGFsbCB0aGUKPiB0cmVl
IHlvdSBjYW4gYmFja3BvcnQgdG8/CgpEb25lLCBhbmQgc29ycnkgZm9yIHRoZSBkZWxheS4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
