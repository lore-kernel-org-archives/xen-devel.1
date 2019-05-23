Return-Path: <SRS0=bRyV=TX=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD5B7C04AAC
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 08:34:17 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9289A20879
	for <xen-devel@archiver.kernel.org>; Thu, 23 May 2019 08:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9289A20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTjAl-0003Az-SO; Thu, 23 May 2019 08:33:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oIoO=TX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTjAk-0003Au-S7
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 08:33:58 +0000
X-Inumbo-ID: 8187f4b2-7d35-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8187f4b2-7d35-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 08:33:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 23 May 2019 02:33:56 -0600
Message-Id: <5CE65AF002000078002319A7@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 23 May 2019 02:33:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1558540230-26612-1-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558540230-26612-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] libx86: Elide more empty CPUID leaves when
 serialising a policy
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190523083352.vkbeUUqWuS5bxY_svCIY0xFBFVGRcxRz94rCB3mFutA@z>

Pj4+IE9uIDIyLjA1LjE5IGF0IDE3OjUwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4geDg2X2NwdWlkX2NvcHlfdG9fYnVmZmVyKCkgY3VycmVudGx5IHNlcmlhbGlzZXMgdGhl
IGZ1bGwgY29udGVudCBvZiB0aGUKPiB2YXJpb3VzIHN1YmxlYWYgdW5pb25zLiAgV2hpbGUgbGVh
dmVzIDQsIDB4YiBhbmQgMHhkIGRvbid0IGhhdmUgYSBjb25jcmV0ZQo+IG1heF9zdWJsZWFmIGZp
ZWxkLCB0aGV5IGRvIGhhdmUgd2VsbCBkZWZpbmVkIHVwcGVyIGJvdW5kcy4KPiAKPiBEaWZmaW5n
IHRoZSByZXN1bHRzIG9mIGB4ZW4tY3B1aWQgLXBgIHNob3dzIHRoZSByZXN1dGxpbmcgc2F2aW5n
Ogo+IAo+ICAgQEAgLTEsNSArMSw1IEBACj4gICAgWGVuIHJlcG9ydHMgdGhlcmUgYXJlIG1heGlt
dW0gMTE0IGxlYXZlcyBhbmQgMSBNU1JzCj4gICAtUmF3IHBvbGljeTogOTMgbGVhdmVzLCAxIE1T
UnMKPiAgICtSYXcgcG9saWN5OiAzOCBsZWF2ZXMsIDEgTVNScwo+ICAgICBDUFVJRDoKPiAgICAg
IGxlYWYgICAgIHN1YmxlYWYgIC0+IGVheCAgICAgIGVieCAgICAgIGVjeCAgICAgIGVkeAo+ICAg
ICAgMDAwMDAwMDA6ZmZmZmZmZmYgLT4gMDAwMDAwMTY6NzU2ZTY1NDc6NmM2NTc0NmU6NDk2NTZl
NjkKPiAgIEBAIC0zMiw3ICszMiw3IEBAIFJhdyBwb2xpY3k6IDkzIGxlYXZlcywgMSBNU1JzCj4g
ICAgIE1TUnM6Cj4gICAgICBpbmRleCAgICAtPiB2YWx1ZQo+ICAgICAgMDAwMDAwY2UgLT4gMDAw
MDAwMDA4MDAwMDAwMAo+ICAgLUhvc3QgcG9saWN5OiA5MyBsZWF2ZXMsIDEgTVNScwo+ICAgK0hv
c3QgcG9saWN5OiAzMyBsZWF2ZXMsIDEgTVNScwo+ICAgICBDUFVJRDoKPiAgICAgIGxlYWYgICAg
IHN1YmxlYWYgIC0+IGVheCAgICAgIGVieCAgICAgIGVjeCAgICAgIGVkeAo+ICAgICAgMDAwMDAw
MDA6ZmZmZmZmZmYgLT4gMDAwMDAwMGQ6NzU2ZTY1NDc6NmM2NTc0NmU6NDk2NTZlNjkKPiAKPiB3
aGljaCBpcyBtb3N0bHkgZHVlIHRvIG5vIGxvbmdlciB3cml0aW5nIG91dCA2NCBsZWF2ZXMgZm9y
IHhzdGF0ZSB3aGVuIChvbgo+IHRoaXMgQ29mZmVlTGFrZSBzeXN0ZW0pIDggd2lsbCBkby4KPiAK
PiBFeHRlbmQgdGhlIHVuaXQgdGVzdHMgdG8gY292ZXIgZW1wdHkgYW5kIHBhcnRpYWxseSBmaWxs
ZWQgc3VibGVhZiB1bmlvbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkZvciB0aGUgbGliL3g4Ni8gcGFydApSZXZpZXdlZC1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpGb3IgdGhlIHRlc3QgaGFybmVzcyBw
YXJ0CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ck5vIGlkZWEgaG93
IGVsc2UgSSBzaG91bGQgcmVwcmVzZW50IHRoYXQgSSBkaWRuJ3QgbG9vayBvdmVybHkgY2xvc2Vs
eQphdCB0aGUgaGFybmVzcyBhZGRpdGlvbnMuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
