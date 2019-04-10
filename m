Return-Path: <SRS0=ih+i=SM=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B14AC10F11
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 20:59:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C98642082E
	for <xen-devel@archiver.kernel.org>; Wed, 10 Apr 2019 20:59:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP13Az4w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C98642082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEKJ9-0006r9-5D; Wed, 10 Apr 2019 20:58:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wh6+=SM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hEKJ8-0006r4-5h
 for xen-devel@lists.xenproject.org; Wed, 10 Apr 2019 20:58:58 +0000
X-Inumbo-ID: 74d9ecd6-5bd3-11e9-92d7-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 74d9ecd6-5bd3-11e9-92d7-bc764e045a96;
 Wed, 10 Apr 2019 20:58:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB7DD2082E;
 Wed, 10 Apr 2019 20:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554929936;
 bh=iJE/buhhl5lmWfJ2MleI2wqti5NP/T5AcbHXXjlgsPM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=FP13Az4w4C7kgCPgBuqIAgeMJiZyb8gbNXMKjef9mKEdtD1svz5x6d/vQHAQMMR0i
 nl1UFyil4xkm9/o1jIwXCJhO3qVzjanWusuoCVnbed85f2jVvYJL80FHL5i9rHIW1H
 wi5LVei+potIiOaki/xOBRGk0o1ogDT8BRtgSrGU=
Date: Wed, 10 Apr 2019 13:58:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <86a5cc61-00de-cc29-a06c-8f0956c38ea4@arm.com>
Message-ID: <alpine.DEB.2.10.1904101351220.23132@sstabellini-ThinkPad-X260>
References: <tencent_DA6EA655E660F6F60C353F2674306A989F0A@qq.com>
 <86a5cc61-00de-cc29-a06c-8f0956c38ea4@arm.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Xen ARM dom0less use PV drivers
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
 Stefano Stabellini <sstabellini@kernel.org>, jinchen <jinchen1227@qq.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190410205845.Zrcl0fuKSR8M723QAFktuo0RwYBphJxyXYolJKWXQPc@z>

T24gV2VkLCAxMCBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IENDaW5n
IFN0ZWZhbm8gd2hvIGlzIGxvb2tpbmcgYWZ0ZXIgZG9tMGxlc3MuCj4KPiBPbiAwOC8wNC8yMDE5
IDAzOjE3LCBqaW5jaGVuIHdyb3RlOgo+ID4gSGVsbG8gZXhwZXJ0czoKPiA+ICA/MD8yID8wPzIg
VGhlIHhlbiA0LjEyIHN1cHBvcnQgdGhlIERvbTBsZXNzIFZNIHRoYXQgc3RhcnQgZG9tdSBmcm9t
IHhlbiBub3QKPiA+IHhsLCBidXQgdGhlIFBWIGRyaXZlcnMgaGFzbid0IGJlZW4gc3VwcG9ydGVk
LgoKVGhhdCdzIHJpZ2h0LiBQbGVhc2UgcmVmZXIgdG8gZG9jcy9taXNjL2FybS9kZXZpY2UtdHJl
ZS9ib290aW5nLnR4dCBmb3IKZXhhbXBsZXMgb24gaG93IHRvIGJvb3Qgb3RoZXIgVk1zIGZyb20g
WGVuLiBBbHNvLCBJIHdyb3RlIGEgbW9yZQpkZXRhaWxlZCB0dXRvcmlhbCBvbiBob3cgdG8gdXNl
IGRvbTBsZXNzIHRoYXQgSSBoYXZlIHlldCB0byBwdWJsaXNoLgpTdGF5IHR1bmVkLgoKCj4gPiBE
byB5b3UgaGF2ZSBzb21lIGd1aWRhbmNlIGZvciBob3cgdG8gZW5hYmxlIFBWIGRyaXZlcnMgd2hl
biB1c2luZyBkb20wbGVzcz8KClRoZSBmaXJzdCBxdWVzdGlvbiB3b3VsZCBiZSwgZG8geW91IGFj
dHVhbGx5IG5lZWQgUFYgZHJpdmVycyBiZXR3ZWVuIHRoZQpkb20wbGVzcyBWTXM/IEJlY2F1c2Ug
UFYgZHJpdmVycyBhcmUgc3RpbGwgYXZhaWxhYmxlIGZvciBhbGwgVk1zIHN0YXJ0ZWQKbGF0ZXIg
ZnJvbSBkb20wLiBBbHNvLCBpZiB5b3UganVzdCBuZWVkIGEgc2ltcGxlIGNvbW11bmljYXRpb24g
bWVjaGFuaXNtCmJldHdlZW4gdGhlIGRvbTBsZXNzIFZNcywgaXQgd291bGQgYmUgcHJldHR5IHNp
bXBsZSB0byBzZXR1cCBhIHNoYXJlZAptZW1vcnkgYXJlYSBiZXR3ZWVuIHRoZW0uIE90aGVyd2lz
ZSwgc2VlIGJlbG93LgoKCj4gPiAgPzA/MiA/MD8yIER1ZSB0byBrZXJuZWwgdXNlIHhlbmJ1cyBh
bmQgeGVuc3RvcmUgdG8gcHJvYmUgUFYgZHJpdmVycywgdGhlc2UKPiA+IG1lY2hhbmlzbSBzaG91
bGQ/MD8ycmVtYWluIGZvciBjb21wYXRpYmlsaXR5Pwo+ID4gID8wPzIgPzA/MiBSZW1vdmFsIHRo
ZSB4ZW5zdG9yZSBtZWNoYW5pc20gdG8geGVuIGludGVybmFsIG9yIHNvbWUgb3RoZXIgd2F5Pwo+
ID4gID8wPzIgPzA/MiBUaGFuayB5b3UgdmVyeSBtdWNoPz8KCklmIHlvdSByZWFsbHkgbmVlZCBQ
ViBkcml2ZXJzIGluIGRvbTBsZXNzIFZNcywgdGhlbiB0aGUgZmlyc3QgdGhpbmcgdG8KZG8gd291
bGQgYmUgdG8gZ2V0IHhlbnN0b3JlIHVwIGFuZCBydW5uaW5nIGluIGEgZG9tMGxlc3MgZG9tVS4g
SXQgaXMgYQptYXR0ZXIgb2YgYWxsb2NhdGluZyB0aGUgcHJvcGVyIHJlc291cmNlcywgc3VjaCBh
cyB0aGUgZXZ0Y2huIHBhZ2UuIEl0CmlzIGFsc28gYSBtYXR0ZXIgb2YgZ2V0dGluZyB4ZW5zdG9y
ZSB1cCBhbmQgcnVubmluZyBldmVuIGlmIGl0IG1pZ2h0IGhhdmUKdG8gd2FpdCBmb3IgeGVuc3Rv
cmVkIGluIGRvbTAgdG8gYmUgaW5pdGlhbGl6ZWQgYmVmb3JlIGJlaW5nIGFibGUgdG8KbWFrZSBh
IGNvbm5lY3Rpb24uIEkgZXhwZWN0IHRoaXMgbm90IHRvIGJlIHRyaXZpYWwuIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
