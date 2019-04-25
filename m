Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F3CAC43219
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 16:04:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3CF20878
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 16:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3CF20878
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgqf-0004rN-6D; Thu, 25 Apr 2019 16:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJgqe-0004rI-9A
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 16:03:44 +0000
X-Inumbo-ID: b1c6e8d8-6773-11e9-9ed9-0fdb5b909359
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1c6e8d8-6773-11e9-9ed9-0fdb5b909359;
 Thu, 25 Apr 2019 16:03:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 10:03:40 -0600
Message-Id: <5CC1DA5802000078002292DF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 10:03:36 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190415052502.1067-1-jgross@suse.com>
 <bad92fbd-6513-4b11-7668-74af70bf7176@arm.com>
 <5CC1CF0A020000780022920A@prv1-mh.provo.novell.com>
 <dabb943e-d5a5-31c1-b4d5-e3012ac10beb@arm.com>
In-Reply-To: <dabb943e-d5a5-31c1-b4d5-e3012ac10beb@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] Xen 4.13 Development Update
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
Cc: Juergen Gross <jgross@suse.com>, Lars Kurth <lars.kurth@citrix.com>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Dario Faggioli <dfaggioli@suse.com>, Paul Durrant <paul.durrant@citrix.com>,
 committers@xenproject.org, Pu Wen <puwen@hygon.cn>,
 Luwei Kang <luwei.kang@intel.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190425160336.dKd_e7-wDtMb1tg8EWqp6-EXS3N9X2jYxigTWzDT17w@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDE3OjMyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDI1LzA0LzIwMTkgMTY6MTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyNS4wNC4x
OSBhdCAxNjo1NywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIDE1LzA0LzIw
MTkgMDY6MjUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+Pj4gVGhpcyBlbWFpbCBvbmx5IHRyYWNr
cyBiaWcgaXRlbXMgZm9yIHhlbi5naXQgdHJlZS4gUGxlYXNlIHJlcGx5IGZvciBpdGVtcyB5b3UK
Pj4+PiB3b3VsZCBsaWtlIHRvIHNlZSBpbiA0LjEzIHNvIHRoYXQgcGVvcGxlIGhhdmUgYW4gaWRl
YSB3aGF0IGlzIGdvaW5nIG9uIGFuZAo+Pj4+IHByaW9yaXRpc2UgYWNjb3JkaW5nbHkuCj4+Pgo+
Pj4gVGhvc2UgZS1tYWlscyBiZWNvbWUgZWFzaWx5IHVubm90aWNlZCBvbiB4ZW4tZGV2ZWwgd2hl
biB5b3UgYXJlIG5vdCBDQ2VkLiBJbiBhbGwKPj4+IGhvbmVzdHksIEkgcHJvYmFibHkgbWlzc2Vk
IHRoZSBhbGwgdGhvc2UgZS1tYWlscyBmb3IgdGhlIHBhc3QgeWVhciBiZWNhdXNlIHRoZXkKPj4+
IGRpZG4ndCBsYW5kIGluIG15IGluYm94LiBZZXMgSSB0aGluayB0aGV5IGFyZSBpbXBvcnRhbnQg
Zm9yIHRoZSBtYWludGFpbmVycyB0bwo+Pj4gc2VlIHdoYXQncyBnb2luZyBvbi4KPj4gCj4+IFNv
IHlvdSdyZSBub3Qgc3Vic2NyaWJlZCB0byB4ZW4tZGV2ZWw/Cj4gCj4gTm90IGV2ZXJ5b25lIGhh
cyB0aW1lIHRvIGdvIHRocm91Z2ggeGVuLWRldmVsLiBJIG9ubHkgcmVjZWl2ZWQgZS1tYWlsIHdo
ZXJlIEkgYW0gCj4gQ0NlZCBpbiBteSBpbmJveC4gQWxsIHRoZSBvdGhlcnMgYXJlIHF1ZXVlZCBp
biBhIGZvbGRlci4KCk9oLCBzbyBqdXN0IGEgbWF0dGVyIG9mIHRlcm1pbm9sb2d5LiBUaGlzIG1l
YW5zIHlvdSBzdGlsbCBnZXQgdGhlbSwKeW91IGp1c3QgaGF2ZSB0byBmaXNoIHRoZW0gb3V0LgoK
Pj4+IENvdWxkIHdlIGZpbmQgYSB3YXkgdG8gZWFzaWx5IGZpbHRlciB0aGVtPyBPbiBJUkMsIEp1
ZXJnZW4gc3VnZ2VzdGVkIFtQcm9jY2VzXS4KPj4+IEFueSBvcGluaW9ucz8KPj4gCj4+IEhvdyB3
b3VsZCBhIHRhZyBoZWxwPyBUaGF0IHRhZyB3b3VsZCBiZSB0aGVyZSBvbiBhbGwgdGhlIHJlcGxp
ZXMKPj4gb2YgcGVvcGxlIG5vdCB0cmltbWluZyB0aGUgQ2MgbGlzdHMuIEFuZCBpZiB5b3UgYXNr
ZWQgdGhlbSB0byBkcm9wCj4+IHRoZSB0YWcsIHRoZXknZCBzdXJlbHkgaG9ub3IgdGhlIHJlcXVl
c3QgYXMgbXVjaCBhcyB0aGV5IGRvCj4+IGhvbm9yIHRoZSBDYyBsaXN0IGNsaXBwaW5nIG9uZS4K
PiAKPiBJIGhvbmVzdGx5IGRvbid0IGV4cGVjdCBhIGxvdyB2b2x1bWUgb2YgZS1tYWlsIG9uIHN1
Y2ggdGFnZ2VkIGUtbWFpbC4gU28gSSBkb24ndCAKPiBzZWUgYW55IGNvbmNlcm4gaGVyZS4KCkkn
bSBjb25mdXNlZCBieSB5b3VyIHJlcGx5OiBFaXRoZXIgeW91IGludmVydGVkIHRoZSBzZW5zZSBh
bmQKbWVhbnQgeW91IGRvbid0IGV4cGVjdCBhIGhpZ2ggdm9sdW1lIG9mIG1haWxzLCBvciB5b3Ug
cmVhbGx5CmxvdmUgZ2V0dGluZyBtb3VudGFpbnMgb2YgbWFpbC4KCkFuZCBqdXN0IHRvIGJlIGNs
ZWFyIC0gSSdtIG5vdCByZWFsbHkgb3Bwb3NlZCB0byB0aGUgdGFnZ2luZwphcHByb2FjaCwgSSdt
IG1lcmVseSBhZnJhaWQgdGhhdCBpdCdsbCBub3QgaGVscCBhbmQgLyBvciBnZXQKYWJ1c2VkIChh
Z2FpbikuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
