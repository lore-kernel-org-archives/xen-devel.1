Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6682DC4321A
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:48:37 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE5B205ED
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 15:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE5B205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hK35H-0002XW-HK; Fri, 26 Apr 2019 15:48:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hK35H-0002XR-0H
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 15:48:19 +0000
X-Inumbo-ID: b3d53afe-683a-11e9-8cb4-87abb2ed2203
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3d53afe-683a-11e9-8cb4-87abb2ed2203;
 Fri, 26 Apr 2019 15:48:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 09:48:14 -0600
Message-Id: <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 09:48:10 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
In-Reply-To: <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, 206497@studenti.unimore.it,
 xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426154810.1FKVkLfoU8Xkc69277DGsyv_WizVGt5pmeUhFXkk5uw@z>

Pj4+IE9uIDI2LjA0LjE5IGF0IDE3OjM4LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDI2LzA0LzIwMTkgMTA6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNi4wNC4x
OSBhdCAxMToxOSwgPEp1bGllbi5HcmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IFNvIGhvdyBkb2Vz
IHRoZSBQRFggd29yayBmb3IgbWVtb3J5IGJlbG93IDRHQj8gRG8geW91IHN0aWxsIGNhbGwKPj4+
IHBmbl90b19wZHggb3IgdGhvc2UgcGFnZXM/Cj4+IAo+PiBPZiBjb3Vyc2UuIFdlIG1lcmVseSBu
ZXZlciBjb21wcmVzcyBhbnkgb2YgdGhlIGxvdyAzMiBhZGRyZXNzCj4+IGJpdHMsIGkuZS4gb3Vy
IGNob2ljZSBpcyBsaW1pdGVkIHRvIGFkZHJlc3MgYml0cyAzMiAuLi4gNTEuCj4gCj4gQWgsIHRo
ZSBjb2RlIG1ha2VzIGEgYml0IG1vcmUgc2Vuc2Ugb24gdGhlIHg4NiBzaWRlLiBJcyB0aGVyZSBh
bnkgcmVhc29uIHRvIAo+IGxpbWl0IHRvIGFkZHJlc3MgYml0IDMyIC4uIDUxPwoKV2VsbCwgdGhl
cmUgYmVpbmcgdmFyaW91cyBzcGVjaWFsIHRoaW5ncyBpbW1lZGlhdGVseSBiZWxvdyA0R2IKdGhl
cmUncyBzaW1wbHkgbGl0dGxlIHBvaW50IGluIHRyeWluZyB0byBzcXVhc2ggYW55IG9mIHRoZSBs
b3dlciBiaXRzLgoKPiBGb3IgQXJtLCB3ZSBjYW4ndCBjb21wcmVzcyBiaXRzIDAgLi4uIDMwIGR1
ZSB0byB0aGUgYnVkZHkgYWxsb2NhdG9yIChzZWUgCj4gcGZuX3BkeF9ob2xlX3NldHVwKS4gU28g
d2UgY291bGQgaWdub3JlIHRoZSBmaXJzdCAxR0Igb2YgUkFNLgoKQml0cyAwIC4uLiAzMCB3b3Vs
ZCBiZSB0aGUgZmlyc3QgMkdiIGFmYWljdC4KCj4+PiBTZWU6Cj4+Pgo+Pj4gLyoKPj4+ICAgICog
WXVrISBFbnN1cmUgdGhlcmUgaXMgYSBvbmUtcGFnZSBidWZmZXIgYmV0d2VlbiBYZW4gYW5kIERv
bSB6b25lcywgdG8KPj4+ICAgICogcHJldmVudCBtZXJnaW5nIG9mIHBvd2VyLW9mLXR3byBibG9j
a3MgYWNyb3NzIHRoZSB6b25lIGJvdW5kYXJ5Lgo+Pj4gICAgKi8KPj4+Cj4+PiBBbmQgdGhlIDAg
aXMgeWV0IGFub3RoZXIgaGFjayBmb3IgdGhlIGJ1ZGR5IGFsbG9jYXRvci4KPj4gCj4+IEFoLCB0
aGlzIG9uZS4gSXMgdGhpcyBhY3R1YWxseSBhbiBpc3N1ZSBvbiBBcm0zMj8gaXg4NiBuZWVkZWQK
Pj4gdG8gZGVhbCB3aXRoIHRoZSBzaXR1YXRpb24gYmVjYXVzZSBpdHMgZGlyZWN0IG1hcCByYW5n
ZSB3YXMKPj4gMTJNYiBpbiBzaXplLCBpLmUuIG5vdCBhIHBvd2VyIG9mIHR3by4gSWYgaXQncyBu
b3QgYW4gaXNzdWUgKEkKPj4gY2FuJ3QgcmVhbGx5IGZpZ3VyZSBpdCBvdXQgY29uc2lkZXJpbmcg
dGhlcmUgYXJlIG5vIERJUkVDVE1BUF8qCj4+IGNvbnN0YW50cyBmb3IgQXJtMzIgYXQgYWxsLCBv
bmx5IFhFTkhFQVBfKiBvbmVzKSwgSSdkIHN1Z2dlc3QKPj4gcHV0dGluZyB0aGlzIHVnbGluZXNz
IGluIGFuICNpZmRlZiB1c2luZyBhIENPTkZJR18qIG9wdGlvbiBub3QKPj4gc2VsZWN0ZWQgYnkg
YW55IHByZXNlbnRseSBzdXBwb3J0ZWQgYXJjaC4KPiAKPiBPbiBBcm0zMiwgdGhlIHNpemUgb2Yg
dGhlIHhlbmhlYXAgZGVwZW5kcyBvbiB0aGUgcGxhdGZvcm0uIEl0IGlzIGNhbGN1bGF0ZWQgYnkg
Cj4gc2V0dXBfbW0gaW4gYXJjaC9hcm0vc2V0dXAuYy4gRnJvbSBteSB1bmRlcnN0YW5kaW5nIGl0
IG1heSBub3QgYmUgYSBwb3dlciBvZiAyLCAKPiBzbyB3ZSB3b3VsZCBiZSBhZmZlY3RlZCBieSB0
aGUgcHJvYmxlbSB5b3UgbWVudGlvbiBoZXJlLgo+IAo+IE1heSBJIGFzayB3aHkgaXQgaXMgY3Vy
cmVudGx5IG5vdCBiZSBhbiBpc3N1ZSBvbiB4ODY/IERvIHlvdSBhbHdheXMgcGFzcyBhIHBvd2Vy
IAo+IG9mIDIgdG8gaW5pdF94ZW5oZWFwX3BhZ2VzPwoKTm8sIGl0J3MgYmVjYXVzZSBDT05GSUdf
U0VQQVJBVEVfWEVOSEVBUCBpcyB1bmRlZmluZWQgb24KKDY0LWJpdCkgeDg2LCBpLmUuIHRoZXJl
IHNpbXBseSBpcyBubyBib3VuZGFyeSBiZXR3ZWVuIGJvdGggaGVhcHMuCgpKYW4KCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
