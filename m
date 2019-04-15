Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47676C10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 04:55:44 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D1120825
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 04:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="KUpzaOEg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D1120825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFteD-0000NY-N3; Mon, 15 Apr 2019 04:55:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=t1d2=SR=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hFteC-0000NT-HV
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 04:55:12 +0000
X-Inumbo-ID: a5fe8b40-5f3a-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a5fe8b40-5f3a-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 04:55:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1555304110; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=tnrjvu6E0lwCXjxJ49AYJRNYfWhZvISjHj6t8zJq5CY=;
 b=KUpzaOEgC4MrEDhqy1VN5mRh2VAUXqZ3sgFefvEDGc6E1K/sDSBlxb+ZQO8grllvjGgwX+oP
 2Syjm6DL9Xx75SeEL2fXuLemiIaOOjIVcA1ayoXxy92ZCMf4Ub/NGSTbfI7m9TRAEXuPvxyd
 T2/eJTg1xJV+Set+X3Zz8H9201I=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mxa.mailgun.org with ESMTP id 5cb40e71.7f58aef29fb0-smtp-out-n01;
 Mon, 15 Apr 2019 04:54:09 -0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id y7so19975443wrn.11
 for <xen-devel@lists.xenproject.org>; Sun, 14 Apr 2019 21:54:09 -0700 (PDT)
X-Gm-Message-State: APjAAAVULRlA/5da8j30Uu2/6kkRQ9s749Yookr11YFiGDAAkZCrwgsw
 QrsIt2ep/nRZMQL/pkgIHsL9RR2ogsrpaSeiDK4=
X-Google-Smtp-Source: APXvYqxZJU2Ps1lQGvMpoQ3ihf/BR6OIH+v0HYgWVYS7WyiJKtGKpF/uucBvfYRPkRgxPeBrwYnPbOEZzX4gvR+QFNo=
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr21336587wrv.131.1555304048705; 
 Sun, 14 Apr 2019 21:54:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <20190412194712.1602-2-tamas@tklengyel.com>
In-Reply-To: <20190412194712.1602-2-tamas@tklengyel.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sun, 14 Apr 2019 22:53:32 -0600
X-Gmail-Original-Message-ID: <CABfawhn72K1Dz65bNGFxYrZPkazsRmXPMkQwehsBSNsjGim8aA@mail.gmail.com>
Message-ID:
 <CABfawhn72K1Dz65bNGFxYrZPkazsRmXPMkQwehsBSNsjGim8aA@mail.gmail.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/mem_sharing: replace using
 page_lock with our own lock
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415045332.m9NBSJOUzfRUEo_cSqYZElVcR1Gy83FnD1jAQZwdLds@z>

T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgMTo1MCBQTSBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRr
bGVuZ3llbC5jb20+IHdyb3RlOgo+Cj4gVGhlIHBhZ2VfbG9jayBzeXN0ZW0gd2FzIG5vdCBpbnRl
bmRlZCB0byBiZSB1c2VkIG91dHNpZGUgdGhlIFBWIHBhZ2V0YWJsZQo+IGNvZGUuIFJlcGxhY2Ug
aXRzIHVzZSBpbiBtZW1fc2hhcmluZyB3aXRoIGFuIGludGVybmFsIHJ3bG9jay4KPgoKQWZ0ZXIg
ZnVydGhlciB0ZXN0aW5nIEknbSBhY3R1YWxseSBydW5uaW5nIGludG8gYSBsb3Qgb2Ygc3RyYW5n
ZQpwcm9ibGVtcyB3aXRoIHRoaXMgd2hlbiBkb21haW5zIHdpdGggc2hhcmVkIG1lbW9yeSBnZXQg
ZGVzdHJveWVkLApvZGRseSBlbm91Z2ggYWZ0ZXIgbWVtX3NoYXJpbmcgZmluaXNoZXMgY2xlYW5p
bmcgdXA6IChYRU4pCls8ZmZmZjgyZDA4MDI3MjliOT5dIGRvbWFpbi5jI3JlbGlucXVpc2hfbWVt
b3J5KzB4NjIvMHg0ZjguIEkgdHJpZWQKbW92aW5nIHRoZSBsb2NrIGludG8gcGFnZV9pbmZvIGlu
c3RlYWQgKGluIGEgbmV3IHN0cnVjdCB3aXRoCnNoYXJpbmdfaW5mbykgYnV0IHRoaXMgYXBwcm9h
Y2ggc2VlbXMgdG8gcmVxdWlyZSBhIGxvdCBtb3JlIGVmZm9ydCBhbmQKYSBsb3QgbW9yZSB0aG91
Z2h0IHB1dCBpbnRvIGl0IGFzIHBhZ2VfbG9jayBzZWVtcyB0byBoYXZlIHNvbWUgb3RoZXIKc2lk
ZS1lZmZlY3QgdGhhdCBtYWtlcyB0aGlzIGFsbCB3b3JrLiBVbmZvcnR1bmF0ZWx5IGF0IHRoaXMg
dGltZSBJCmNhbid0IGFmZm9yZCBjaGFzaW5nIHRoaXMgcGF0aCBmdXJ0aGVyIHNvIEknbGwganVz
dCBnbyB3aXRoIHRoZQpiYW5kLWFpZCBzb2x1dGlvbiBvZiBtYWtpbmcgcGFnZV9sb2NrL3BhZ2Vf
dW5sb2NrIG1lbV9zaGFyaW5nCmZyaWVuZGx5LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
