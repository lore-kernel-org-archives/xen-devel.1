Return-Path: <SRS0=GvgA=T5=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEEFEC04AB3
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 08:05:22 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D061A21670
	for <xen-devel@archiver.kernel.org>; Wed, 29 May 2019 08:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D061A21670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVtZy-0000ME-VC; Wed, 29 May 2019 08:04:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVtZx-0000M9-9b
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 08:04:57 +0000
X-Inumbo-ID: 714a1494-81e8-11e9-8341-9b411ba552e5
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 714a1494-81e8-11e9-8341-9b411ba552e5;
 Wed, 29 May 2019 08:04:55 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 02:04:53 -0600
Message-Id: <5CEE3D2402000078002334DB@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 02:04:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1559103784-23731-1-git-send-email-andrew.cooper3@citrix.com>
 <46e48714-74de-0222-84d3-8f844514710a@citrix.com>
In-Reply-To: <46e48714-74de-0222-84d3-8f844514710a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/altp2m: Fix style errors introduced
 with c/s 9abcac7ff
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190529080452.R1mFYeuOj7h3OeyoTYpzMsWMVDWYgTMWekXYBTuL8HA@z>

Pj4+IE9uIDI5LjA1LjE5IGF0IDA2OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjkvMDUvMjAxOSAwNToyMywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRHJvcCBp
bnRyb2R1Y2VkIHRyYWlsaW5nIHdoaXRlc3BhY2UsIGV4Y2Vzc2l2ZWx5IGxvbmcgbGluZXMsIG1h
bC1pbmRlbnRpb24sCj4+IHN1cGVyZmx1b3VzIHVzZSBvZiBQUkkgbWFjcm9zIGZvciBpbnQtb3It
c21hbGxlciB0eXBlcywgYW5kIGluY29ycmVjdCBQUkkKPj4gbWFjcm9zIGZvciBnZm5zIGFuZCBt
Zm5zLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+PiAtLS0KPj4gQ0M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUu
Y2l0cml4LmNvbT4KPj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4K
Pj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPj4gQ0M6IFdlaSBMaXUgPHds
QHhlbi5vcmc+Cj4+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
PiAKPiBBbmQgY2FuIEkgdGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIHJlbWluZCBhbGwgY29tbWl0
dGVycyB0aGF0IGBnaXQgZGlmZgo+IC0tY2hlY2tgIGV4aXN0cyBhbmQgdG8gcGxlYXNlIG1ha2Ug
c3VyZSBpdCBpcyB1c2VkIGFzIHBhcnQgb2YgcHJlLXB1c2gKPiBjaGVja3MuCgpJIGRvbid0IHRo
aW5rIGNvbW1pdHRlcnMgc2hvdWxkIGRvIGFueSBjaGVja2luZy4gVGhpcyBzaG91bGQgYmUgcGFy
dApvZiB0aGUgcmV2aWV3IHByb2Nlc3MgKGFuZCBldmVuIGJldHRlciBiZSBwYXJ0IG9mIHRoZSBz
dWJtaXR0ZXIncwphY3Rpb25zIGJlZm9yZSBzZW5kaW5nIG91dCBhIHBhdGNoKS4gQ29tbWl0dGlu
ZyBzaG91bGQgYmUgYQptZWNoYW5pY2FsIGFjdC4gTWFueSBvZiB1cyBkb2luZyBidWlsZCBjaGVj
a3MgYWxyZWFkeSBnb2VzIGJleW9uZAp3aGF0IHNob3VsZCByZWFsbHkgYmUgcmVxdWlyZWQuCgpU
aGF0IHNhaWQgSSd2ZSBuZXZlcnRoZWxlc3MgYWRkZWQgaXQgdG8gbXkgc2NyaXB0LCBidXQgSSds
bCBkcm9wIGl0IGFnYWluCmlmIHRoZSBuZWNlc3NhcnkgY2xlYW5pbmcgdXAgdHVybnMgb3V0IHRv
IGJlIHRvbyB0aW1lIGNvbnN1bWluZy4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
