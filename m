Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D807C4321A
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:13:32 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42D5220675
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 09:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42D5220675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJwuf-0003AM-Sh; Fri, 26 Apr 2019 09:12:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJwuf-0003AF-2T
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 09:12:57 +0000
X-Inumbo-ID: 78cb3586-6803-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78cb3586-6803-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 09:12:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 03:12:52 -0600
Message-Id: <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 03:12:44 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
In-Reply-To: <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/arm: skip first page when RAM starts at
 0x0
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
 Stefano Stabellini <stefanos@xilinx.com>, nd@arm.com,
 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426091244.wjJ8eYd4WL3Ily00I-KdvNM6hK_dTs7GwpWFS_F77Bo@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDIzOjI3LCA8SnVsaWVuLkdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDI1LzA0LzIwMTkgMTg6NTEsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gWGVuIGFz
c3VtZXMgdGhhdCBSQU0gc3RhcnRzIGF0IGFkZHJlc3NlcyBncmVhdGVyIHRoYW4gMHgwIGluIGEg
ZmV3Cj4+IHBsYWNlcy4gVGhlIFBEWCBjb2RlIGlzIG9uZSBvZiB0aGVtIGJ1dCB0aGVyZSBhcmUg
bW9yZS4KPiAKPiBBIGJpdCBtb3JlIGNvbnRleHQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIHdvdWxk
IGhhdmUgYmVlbiB1c2VmdWwuIEltYWdpbmUgCj4gaWYgd2UgaGF2ZSB0byBsb29rIGF0IHRoZSBj
b21taXQgbWVzc2FnZSBpdCBpbiAyIHllYXJzIHRpbWUuCj4gCj4+IAo+PiBGb3Igbm93LCBza2lw
IHRoZSBmaXJzdCBwYWdlIGluIG1lbW9yeSB3aGVuIHRoZSBzdGFydCBhZGRlc3MgaXMgMHgwLgo+
PiAKPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxpbngu
Y29tPgoKSXNuJ3QgdGhpcyBpbiByZXNwb25zZSB0byBhIGJ1ZyByZXBvcnQgLyBjb21wbGV0ZWx5
IGRpZmZlcmVudApjb2RlIGNoYW5nZSBmcm9tIHNvbWVvbmUgYXQgRG9ybmVyV29ya3M/IEluIHdo
aWNoIGNhc2UKc2hvdWxkbid0IHRoZXJlIGJlIGEgUmVwb3J0ZWQtYnk/Cgo+IEZvciBhIGZpcnN0
IHdlIG5lZWQgdG8gZ2F0aGVyIGZlZWRiYWNrIGZyb20gY29udHJpYnV0b3JzIHRoYXQga25vdyBh
IGJpdCAKPiBtb3JlIG9mIHRoZSBjb2RlIHRoYXQgbWF5IGJlIGFmZmVjdGVkLiBBRkFJQ1QsIHRo
ZXJlIGFyZSBvbmx5IHR3byBwaWVjZXMgCj4gd2hlcmUgd2UgaGFuZCBvdmVyIG1lbW9yeSB0byBj
b21tb24gY29kZToKPiAgICAgIC0gUERYOiBUaGUgcHJvYmxlbSBpcyBwYXNzaW5nIDAgdG8gcGR4
X2luaXRfbWFzaygpIHdpbGwgcmVzdWx0IHRvIGEgCj4gfjAgbWFzayBkZWZlYXRpbmcgdGhlIGNv
bXByZXNzaW9uIGxhdGVyIG9uLgoKT24geDg2IHRoZSBmdW5jdGlvbiBnZXRzIGNhbGxlZCBvbmx5
IGZvciBtZW1vcnkgYmxvY2tzIGFib3ZlIDRHYi4KUXVlc3Rpb24gaXMgd2hldGhlciBvbiBBcm0g
eW91IGFsc28gaGF2ZSBzb21lIGFkIGhvYyBib3VuZGFyeQpiZWxvdyB3aGljaCB0aGVyZSdzIG5v
IHBvaW50IHRvIGxvb2sgZm9yIGJpdHMgdG8gY29tcGFjdC4gSWYgbm90IEkKd29uZGVyIHdoeSB5
b3UgY2FsbCB0aGUgZnVuY3Rpb24gYXQgYWxsOyBhdCB0aGUgdmVyeSBsZWFzdCAoYXMgeW91CnNl
ZW0gdG8gaW1wbHkpIGl0IHNob3VsZG4ndCBiZSBjYWxsZWQgd2hlbgpib290aW5mby5tZW0uYmFu
a1swXS5zdGFydCBpcyB6ZXJvLgoKPiAgICAgIC0gQnVkZHkgYWxsb2NhdG9yOiBKYW4gaGFzIGJl
ZW4gc3VnZ2VzdGluZyB0byBzdGljayBhIGNoZWNrIGluIAo+IGluaXRfeGVuaGVhcF9wYWdlcygp
LiBUaGlzIHdvdWxkIGdvIHRoZSBvdGhlciB1Z2xpbmVzcyBleGlzdGluZyB0byBkZWFsIAo+IHdp
dGggdGhlIGJ1ZGR5IGFsbG9jYXRvci4KCkFuZCB0aGlzIHdvdWxkIHRoZW4gYWxzbyB0YWtlIGNh
cmUgb2YgZnV0dXJlIGFyY2hpdGVjdHVyZXMgWGVuIG1heQpnZXQgcG9ydGVkIHRvLiAoTm8gaWRl
YSB3aGF0IG90aGVyIHVnbGluZXNzIHlvdSByZWZlciB0by4pCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
