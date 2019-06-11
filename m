Return-Path: <SRS0=31Bo=UK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFA2C43218
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 09:47:01 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E283D20673
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 09:47:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E283D20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hadMd-0000Bt-E0; Tue, 11 Jun 2019 09:46:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hadMc-0000Bo-Tt
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:46:46 +0000
X-Inumbo-ID: d1db9874-8c2d-11e9-8c89-e7af3688143f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1db9874-8c2d-11e9-8c89-e7af3688143f;
 Tue, 11 Jun 2019 09:46:44 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 03:46:42 -0600
Message-Id: <5CFF787E0200007800236EA5@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 03:46:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5CF0F2440200007800233D84@prv1-mh.provo.novell.com>
 <691e7133-4a75-0ca9-c347-5a37aa59a30f@citrix.com>
In-Reply-To: <691e7133-4a75-0ca9-c347-5a37aa59a30f@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] x86/traps: widen condition for logging
 top-of-stack
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
Cc: WeiLiu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA2LjE5IGF0IDIwOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMzEvMDUvMjAxOSAxMDoyMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IERlc3BpdGUg
LWZuby1vbWl0LWZyYW1lLXBvaW50ZXIgdGhlIGNvbXBpbGVyIG1heSBvbWl0IHRoZSBmcmFtZSBw
b2ludGVyLAo+PiBvZnRlbiBmb3IgcmVsYXRpdmVseSBzaW1wbGUgbGVhZiBmdW5jdGlvbnMuIChU
byBnaXZlIGEgc3BlY2lmaWMgZXhhbXBsZSwKPj4gdGhlIGNhc2UgSSd2ZSBydW4gaW50byB0aGlz
IHdpdGggaXMgX3BjaV9oaWRlX2RldmljZSgpIGFuZCBnY2MgOC4KPj4gSW50ZXJlc3RpbmdseSB0
aGUgZXZlbiBtb3JlIHNpbXBsZSBuZWlnaGJvcmluZyBpb21tdV9oYXNfZmVhdHVyZSgpIGRvZXMK
Pj4gZ2V0IGEgZnJhbWUgcG9pbnRlciBzZXQgdXAsIGFyb3VuZCBqdXN0IGEgc2luZ2xlIGluc3Ry
dWN0aW9uLiBCdXQgdGhpcwo+PiBtYXkgYmUgYSByZXN1bHQgb2YgdGhlIHNpemUtb2YtYXNtKCkg
ZWZmZWN0cyBkaXNjdXNzZWQgZWxzZXdoZXJlLikKPj4KPj4gTG9nIHRoZSB0b3Atb2Ytc3RhY2sg
dmFsdWUgaWYgaXQgbG9va3MgdmFsaWQgX29yXyBpZiBSSVAgbG9va3MgaW52YWxpZC4KPj4KPj4g
QWxzbyBhbm5vdGF0ZSBub24tZnJhbWUtcG9pbnRlci1iYXNlZCBzdGFjayB0cmFjZSBlbnRyaWVz
IHdpdGggYQo+PiBxdWVzdGlvbiBtYXJrLCB0byBzaWduYWwgY2xlYXJseSB0aGF0IGFueSBvbmUg
b2YgdGhlbSBtYXkgbm90IGFjdHVhbGx5Cj4+IGJlIHBhcnQgb2YgdGhlIGNhbGwgc3RhY2suCj4g
Cj4gSSB2ZXJ5IHNwZWNpZmljYWxseSBkaWRuJ3QgZG8gdGhhdCBiZWZvcmUsIGJlY2F1c2UgaXQg
Z2l2ZSB0aGUgZmFsc2UKPiBpbXByZXNzaW9uIHRoYXQgd2hlbiBhIHF1ZXN0aW9uIG1hcmsgaXNu
J3QgcHJlc2VudCwgdGhlIGxvZ2dpbmcgbGluZSBpcwo+IGFjY3VyYXRlLgo+IAo+IFRoaXMgaXMg
bm90IHRydWUgZm9yICVyYnAgY29ycnVwdGlvbiwgYXNtIGJsb2NrcyB3aGljaCBkb24ndCByZXNw
ZWN0IHRoZQo+IGZyYW1lIHBvaW50ZXIgQUJJIChhcmd1YWJseSBhbHNvIGNvcnJ1cHRpb24pLCBh
bnkgZmF1bHQgcmFpc2VkIGZyb20KPiB3aXRoaW4gYW4gRUZJIGNhbGwuCgpTbyB3aGF0IGRvIHlv
dSBzdWdnZXN0IGluc3RlYWQ/IFNvbWVob3cgd2Ugc2hvdWxkIG1hcmsgc2xvdHMKdGhhdCBhcmUg
bW9yZSBndWVzc2VzIHRoYW4gYWN0dWFsbHkgZGVyaXZlZC4KCj4gUG9ydGluZyBYZW4gdG8gdXNl
IG9ianRvb2wgd291bGQgYmUgYSBkZWZpbml0ZSBpbXByb3ZlbWVudCwgYnV0IGNhbm5vdAo+IGd1
YXJkIGFnYWluc3QgdW5leHBlY3RlZCAlcmJwIGNvcnJ1cHRpb24gYW5kIHRoZSBFRkkgY2FzZS4K
CkknbSBub3Qgc3VyZSBhYm91dCAiZGVmaW5pdGUiLCBidXQgSSB0aGluayBJIHNlZSB5b3VyIHBv
aW50LiBQZXJzb25hbGx5CkkgY29udGludWUgdG8gYmVsaWV2ZSB0aGF0IHByb2dyYW1tZXIgKGFz
c2VtYmx5IGNvZGUpIGFuZCBjb21waWxlcgooQyBjb2RlKSBhdHRhY2hlZCB1bndpbmQgYW5ub3Rh
dGlvbnMgYXJlIHRoZSBiZXR0ZXIgbW9kZWwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
