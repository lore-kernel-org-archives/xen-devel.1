Return-Path: <SRS0=kLId=UC=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE84EC04AB5
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 13:48:05 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCACB242DD
	for <xen-devel@archiver.kernel.org>; Mon,  3 Jun 2019 13:48:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCACB242DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXnJN-00037T-98; Mon, 03 Jun 2019 13:47:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXnJM-00037O-BP
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:47:40 +0000
X-Inumbo-ID: 26f916bd-8606-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 26f916bd-8606-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 13:47:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 144CD15A2;
 Mon,  3 Jun 2019 06:47:39 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 263203F246;
 Mon,  3 Jun 2019 06:47:38 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>
References: <osstest-137100-mainreport@xen.org>
 <5CF4E99E02000078002347D5@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <86e15367-cecd-a351-62ba-c0fd672e5933@arm.com>
Date: Mon, 3 Jun 2019 14:47:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF4E99E02000078002347D5@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 137100:
 regressions - FAIL
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190603134736.TtUJAUMrGy_HXh1Wg4KIpiocG6Lg-85rgxK77qQsBPI@z>

SGkgSmFuLAoKT24gMDMvMDYvMjAxOSAxMDozNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MDEuMDYuMTkgYXQgMTA6NDMsIDxvc3N0ZXN0LWFkbWluQHhlbnByb2plY3Qub3JnPiB3cm90ZToK
Pj4gZmxpZ2h0IDEzNzEwMCBxZW11LXVwc3RyZWFtLTQuMTEtdGVzdGluZyByZWFsIFtyZWFsXQo+
PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTM3MTAw
Lwo+Pgo+PiBSZWdyZXNzaW9ucyA6LSgKPj4KPj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVk
IGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBub3QgYmUg
cnVuOgo+PiAgIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAg
ICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDUwNAo+PiAgIGJ1aWxkLWFybTY0LXhzbSAgICAg
ICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAgICAgICAgICAgICBicm9rZW4gIGluIDEzNDUw
NAo+PiAgIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgICAgICAgPGpvYiBzdGF0dXM+ICAgICAg
ICAgICAgICAgICBicm9rZW4gIGluIDEzNDUwNAo+PiAgIGJ1aWxkLWFybTY0LXhzbSAgICAgICAg
ICAgIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+
PiAgIGJ1aWxkLWFybTY0ICAgICAgICAgICAgICAgIDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBp
biAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIGJ1aWxkLWFybTY0LXB2b3BzICAgICAgICAg
IDQgaG9zdC1pbnN0YWxsKDQpIGJyb2tlbiBpbiAxMzQ1MDQgUkVHUi4gdnMuIDEyNTU3NQo+PiAg
IHRlc3QtYXJtNjQtYXJtNjQteGwgICAgICAgICAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAg
IGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIHRlc3QtYXJtNjQtYXJtNjQtbGlidmlydC14c20g
IDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIHRl
c3QtYXJtNjQtYXJtNjQteGwtY3JlZGl0MiAgIDcgeGVuLWJvb3QgICAgICAgICAgICAgICAgIGZh
aWwgUkVHUi4gdnMuIDEyNTU3NQo+PiAgIHRlc3QtYXJtNjQtYXJtNjQteGwteHNtICAgICAgIDcg
eGVuLWJvb3QgICAgICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEyNTU3NQo+IAo+IFdoYXQg
aXMgdGhlIHNpdHVhdGlvbiBoZXJlPyBXaGVuIGNhbiB3ZSBleHBlY3QgdG8gYmUgYWJsZSB0byBn
ZXQKPiA0LjExLjIgb3V0IHRoZSBkb29yPwoKSSBoYXZlbid0IHNlZW4gYW55b25lIHJlcGx5aW5n
IG15IGUtbWFpbCBbMV0gc2VudCAxNCBkYXlzIGFnby4KCkNoZWVycywKClsxXSBodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDUvbXNnMDE3
NzEuaHRtbAoKPiAKPiBKYW4KPiAKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
