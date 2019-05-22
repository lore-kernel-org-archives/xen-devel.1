Return-Path: <SRS0=PJHi=TW=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8327C072A4
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 06:52:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC27220644
	for <xen-devel@archiver.kernel.org>; Wed, 22 May 2019 06:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC27220644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTL64-00010O-2x; Wed, 22 May 2019 06:51:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTL62-00010J-8F
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 06:51:30 +0000
X-Inumbo-ID: 0608a3ad-7c5e-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0608a3ad-7c5e-11e9-8980-bc764e045a96;
 Wed, 22 May 2019 06:51:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 22 May 2019 00:49:27 -0600
Message-Id: <5CE4F0F50200007800231309@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 22 May 2019 00:49:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "osstest service owner" <osstest-admin@xenproject.org>
References: <osstest-136566-mainreport@xen.org>
In-Reply-To: <osstest-136566-mainreport@xen.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [xen-4.8-testing test] 136566: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190522064925.uqkxkrIBKabngXHYqPG5KDs4K3pYc0Qq5YAh1_pLApE@z>

Pj4+IE9uIDIyLjA1LjE5IGF0IDAzOjA3LCA8b3NzdGVzdC1hZG1pbkB4ZW5wcm9qZWN0Lm9yZz4g
d3JvdGU6Cj4gZmxpZ2h0IDEzNjU2NiB4ZW4tNC44LXRlc3RpbmcgcmVhbCBbcmVhbF0KPiBodHRw
Oi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM2NTY2LyAKPiAK
PiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFy
ZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAg
dGVzdC14dGYtYW1kNjQtYW1kNjQtNCA1MCB4dGYvdGVzdC1odm02NC1sYnItdHN4LXZtZW50cnkg
ZmFpbCBSRUdSLiB2cy4gMTMwOTY1Cj4gIHRlc3QteHRmLWFtZDY0LWFtZDY0LTQgICAgICAgNzAg
eHRmL3Rlc3QtaHZtNjQteHNhLTI3OCAgIGZhaWwgUkVHUi4gdnMuIDEzMDk2NQo+ICBidWlsZC1h
bWQ2NC1wcmV2ICAgICAgICAgICAgICA2IHhlbi1idWlsZCAgICAgICAgICAgICAgICBmYWlsIFJF
R1IuIHZzLiAxMzA5NjUKPiAgYnVpbGQtaTM4Ni1wcmV2ICAgICAgICAgICAgICAgNiB4ZW4tYnVp
bGQgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMwOTY1CgpBbSBJIG1pc3Rha2VuIGlu
IHVuZGVyc3RhbmRpbmcgdGhhdCB0aGVzZSB0d28gd2lsbCBnbyBhd2F5IG9ubHkgb25jZQp0aGUg
NC43IHRyZWUgZ2V0cyBhIHB1c2ggKHdoaWNoLCBldmVuIHdoZW4gaXRzIG93biBidWlsZCBmYWls
dXJlcyBoYXZlCmdvdCBhZGRyZXNzZWQsIHdpbGwgcmVxdWlyZSBhIDQuNiBwdXNoIHRvIG9jY3Vy
IGZpcnN0KSwgYW5kIGluIHR1cm4gdGhlCnJlc3BlY3RpdmUgNC45IGZhaWx1cmVzIHdpbGwgZ28g
YXdheSBvbmx5IG9uY2Ugd2UgZ2V0IGEgcHVzaCBoZXJlPyBJZgpzbyAtIHdoYXQncyB0aGUgc3Rh
dGUgb2YgdGhlc2Ugb2xkIHRyZWVzPyBTbyBmYXIgSSBoYWQgYmVlbiB1bmRlciB0aGUKaW1wcmVz
c2lvbiB0aGF0IG5lY2Vzc2FyeSBidWlsZCBmaXggYmFja3BvcnRzIGhhZCBiZWVuIGlkZW50aWZp
ZWQgYW5kCmFwcGxpZWQgLi4uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
