Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BCEC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:15:41 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A9A520818
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 10:15:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A9A520818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEWjp-0002eO-QK; Thu, 11 Apr 2019 10:15:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5H/f=SN=citrix.com=prvs=9971fd090=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hEWjo-0002eJ-4F
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 10:15:20 +0000
X-Inumbo-ID: b458551a-5c42-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b458551a-5c42-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 10:15:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,337,1549929600"; d="scan'208";a="83315243"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23727.4977.863227.616924@mariner.uk.xensource.com>
Date: Thu, 11 Apr 2019 11:14:09 +0100
To: <xen-devel@lists.xenproject.org>
In-Reply-To: <osstest-134608-mainreport@xen.org>
References: <osstest-134608-mainreport@xen.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [osstest test] 134608: regressions - trouble:
 broken/fail/pass
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411101409.f3SAkDSFChtd3ul6Xsh197mwvi05EzoqjS8fdVToZYc@z>

b3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltvc3N0ZXN0IHRlc3RdIDEzNDYwODogcmVn
cmVzc2lvbnMgLSB0cm91YmxlOiBicm9rZW4vZmFpbC9wYXNzIik6Cj4gZmxpZ2h0IDEzNDYwOCBv
c3N0ZXN0IHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcv
b3NzdGVzdC9sb2dzLzEzNDYwOC8KPiAKPiBSZWdyZXNzaW9ucyA6LSgKPiAKPiBUZXN0cyB3aGlj
aCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hcm02NC1hcm02NC14bCAgICAgICAgICAgICA8
am9iIHN0YXR1cz4gICAgICAgICAgICAgICAgIGJyb2tlbgo+ICB0ZXN0LWFybTY0LWFybTY0LXhs
ICAgICAgICAgICA0IGhvc3QtaW5zdGFsbCg0KSAgICAgICAgYnJva2VuIFJFR1IuIHZzLiAxMzM3
MjIKPiAgdGVzdC1hcm02NC1hcm02NC1leGFtaW5lICAgICAgNSBob3N0LWluc3RhbGwgICAgICAg
ICAgIGJyb2tlbiBSRUdSLiB2cy4gMTMzNzIyCgpUaGlzIGFwcGVhcnMgdG8gaGF2ZSBiZWVuIGEg
c3R1Y2sgUERVIHJlbGF5IG9uIGxheHRvbjAgOi0vLgoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC1saWJ2
aXJ0LXZoZCAgNyB4ZW4tYm9vdCAgICAgICAgICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTMzNzIy
CgpUaGlzIGlzIG5vdCBleHBlY3RlZC4gIFRoZSBsb2dzIGFyZSBvZGQ6CgpBcHIgMTAgMTY6MTA6
MTMuODA4MDE0IFsgICAgMC41NTA1MTVdIFBNLVRpbWVyIGZhaWxlZCBjb25zaXN0ZW5jeSBjaGVj
ayAgKDB4ZmZmZmZmKSAtIGFib3J0aW5nLgouLi4KQXByIDEwIDE2OjEwOjEzLjkxNjAxOCBbICAg
IDAuNTUwOTQ3XSBwY2kgMDAwMDowNDowMC4wOiBCQVIgMTA6IG5vIHNwYWNlIGZvciBbbWVtIHNp
emUgMHgwMDEwMDAwMCA2NGJpdF0KQXByIDEwIDE2OjEwOjEzLjkyODAwNyBbICAgIDAuNTUwOTUz
XSBwY2kgMDAwMDowNDowMC4wOiBCQVIgMTA6IGZhaWxlZCB0byBhc3NpZ24gW21lbSBzaXplIDB4
MDAxMDAwMDAgNjRiaXRdCgphbmQgdGhlbiBpdCBzZWVtcyB0byBnZXQgc3R1Y2suICBJdCdzIHN0
aWxsIHVwOiB0aGUgZGVidWcga2V5cyBwcm9kdWNlCnJlZ2lzdGVyIGR1bXBzIGV0Yy4gIFRoZSBo
b3N0IHNlZW1zIHRvIGJlIG1vc3RseSB3b3JraW5nIC0gaWUgdGhpcyB3YXMKYSBvbmUtb2ZmLgoK
PiAgdGVzdC1hbWQ2NC1hbWQ2NC14bC1xY293MiAgICAxNyBndWVzdC1sb2NhbG1pZ3JhdGUveDEw
ICAgZmFpbCBSRUdSLiB2cy4gMTMzNzIyCj4gIHRlc3QtYW1kNjQtYW1kNjQtZXhhbWluZSAgICAg
IDQgbWVtZGlzay10cnktYXBwZW5kICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzMzcyMgoKVGhlc2Ug
YXJlIHRoZSByZWdyZXNzaW9ucyBJIGFtIGV4cGVjdGluZy4KCkknbSBnb2luZyB0byBzZWUgd2hh
dCB0aGUgbmV4dCBmbGlnaHQgKGV4cGVjdGVkIGZpbmlzaCBhcm91bmQgMi0zcG0gVUsKdGltZSkg
bG9va3MgbGlrZS4KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
