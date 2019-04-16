Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4107BC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:55:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BC2020693
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 09:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BC2020693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGKne-0005Z4-9G; Tue, 16 Apr 2019 09:54:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jU7w=SS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hGKnd-0005Yz-HE
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 09:54:45 +0000
X-Inumbo-ID: a97c75f5-602d-11e9-92d7-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id a97c75f5-602d-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 09:54:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3855780D;
 Tue, 16 Apr 2019 02:54:44 -0700 (PDT)
Received: from [10.37.12.51] (unknown [10.37.12.51])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8874C3F68F;
 Tue, 16 Apr 2019 02:54:42 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <726f5f58-bdae-8379-34c5-f31879fd1edd@arm.com>
Date: Tue, 16 Apr 2019 10:54:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="UTF-8"; format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416095441.HWcgSaljM9WchJoIHYOqLoFuPHq4hOodhMjM1n5qZgM@z>

SGkgSmFuLAoKT24gNC85LzE5IDEyOjQyIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAw
OS4wNC4xOSBhdCAxMzoyNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMDMv
MDQvMjAxOSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBBbHNvIHBsZWFzZSBub3RlIHRo
ZSBxdW90YXRpb24gdXNlZCBieSB0aGUgbWVudGlvbmVkCj4+PiBleGlzdGluZyBkb2MgY29tbWVu
dHMsIGFzIHdlbGwgYXMgYSBmZXcgb3RoZXIgZm9ybWFsIGFzcGVjdHMKPj4+IChsaWtlIHRoZW0g
YWxzbyBtYWtpbmcgY2xlYXIgd2hhdCB0aGUgcmV0dXJuIHR5cGUgaXMpLiBJIHRoaW5rCj4+PiB0
aGF0J3MgYSBtb2RlbCB1c2VkIGVsc2V3aGVyZSBhcyB3ZWxsLCBzbyBJIHRoaW5rIHlvdSBzaG91
bGQKPj4+IGZvbGxvdyBpdCBoZXJlLgo+Pgo+PiBJIGhhdmVuJ3QgcmVwbGljYXRlZCB0aGUgYCBi
ZWNhdXNlIEkgaGF2ZSBubyBpZGVhIHdoYXQgdGhleSBhcmUgdXNlZCBmb3IuIEkKPj4gd291bGQg
YXBwcmVjaWF0ZSBpZiB5b3UgcHJvdmlkZSBwb2ludGVyIGhvdyB0byB1c2UgdGhlbS4KPiAKPiBX
ZWxsLCBJIGNhbiBvbmx5IHBvaW50IHlvdSBhdCB0aGUgaGlzdG9yeSBvZiB0aGluZ3MsIGUuZy4K
PiAyNjJlMTE4YTM3ICJkb2NzL2h0bWwvOiBBbm5vdGF0aW9ucyBmb3IgdHdvIGh5cGVyY2FsbHMi
LgoKVGhhbmsgeW91IGZvciB0aGUgcG9pbnRlci4gSG93ZXZlciwgd2UgZG9uJ3Qgc2VlbSB0byB1
c2UgdGhpcyBmb3JtYXR0aW5nIApldmVyeXdoZXJlLiBGb3IgaW5zdGFuY2UsIHRoZSBmb3JtYXR0
aW5nIHVzZWQgaW4gbXkgcGF0Y2ggc2VlbXMgdG8gYmUgCmNvbnNpc3RlbnQgd2l0aCB4ZW4vaW5j
bHVkZS9wdWJsaWMvdmNwdS5oLgoKRnVydGhlcm1vcmUsIHRoZSBkZXNjcmlwdGlvbiBvZiB0aGUg
aHlwZXJjYWxsIGlzIGRvbmUgb24gdG9wIG9mIHRoZSAKZGVmaW5pdGlvbiBvZiB0aGUgaHlwZXJj
YWxsIG51bWJlci4gQmVmb3JlIEkgcmV3b3JrIHRoaXMgcGF0Y2gsIGNvdWxkIHdlIAphZ3JlZSBv
biB3aGF0IGZvcm1hdHRpbmcgd2Ugd2FudD8KCj4gCj4+PiBUaGUgb3RoZXIgdGhpbmcgaXM6IEFz
IG1lbnRpb25lZCBlbHNld2hlcmUsIEkgZG9uJ3QgdGhpbmsgdGhlCj4+PiBmaXJzdCB0d28gcGFy
YW1ldGVycyBzaG91bGQgYmUgcGxhaW4gaW50LiBJJ20gbm90IGhhcHB5IHRvIHNlZQo+Pj4gdGhp
cyBwcm9saWZlcmF0ZSBpbnRvIGRvY3VtZW50YXRpb24gYXMgd2VsbCwgaS5lLiBJJ2QgcHJlZmVy
IGlmCj4+PiB0aGlzIHdhcyBjb3JyZWN0ZWQgYmVmb3JlIGFkZGluZyBkb2N1bWVudGF0aW9uLiBX
b3VsZCB5b3UKPj4+IGJlIHdpbGxpbmcgdG8gZG8gdGhpcywgb3Igc2hvdWxkIEkgYWRkIGl0IHRv
IG15IHRvZG8gbGlzdD8KPj4KPj4gV2hpbGUgc3dpdGNoaW5nIGZyb20gY21kIGZyb20gc2lnbmVk
IHRvIHVuc2lnbmVkIHNob3VsZCBiZSBvay4gVGhpcyB3b3VsZAo+PiBpbnRyb2R1Y2UgYSBkaWZm
ZXJlbnQgYmVoYXZpb3Igb2YgZm9yIGNvdW50Lgo+IAo+IFNpbmNlIHRoaXMgcmVtb3ZlcyBhbiBl
cnJvciBjb25kaXRpb24sIEkgdGhpbmsgdGhpcyBpcyBhbiBva2F5IGNoYW5nZQo+IHRvIGhhcHBl
biwgd2l0aG91dCAuLi4KPiAKPj4gQXJlIHdlIGhhcHB5IHdpdGggdGhhdCwgb3Igc2hhbGwgd2Ug
YWRkIGEgY2hlY2sgKChpbnQpY291bnQpID4gMD8KPiAKPiAuLi4gYW55IHN1Y2ggZXh0cmEgY2hl
Y2suIFRoaXMgYWxzbyBpc24ndCBnb2luZyB0byBpbnRyb2R1Y2UgYW55IG5ldwo+IHJlYWwgcmlz
ayBvZiBhIGxvbmcgcnVubmluZyBvcGVyYXRpb24gb3Igc29tZSBzdWNoIC0gaWYgMkdiIG9mIGlu
cHV0Cj4gZGF0YSBhcmUgZmluZSwgSSBjYW4ndCBzZWUgd2h5IDRHYiB3b3VsZG4ndCBiZSwgdG9v
LgoKRmFpciBwb2ludC4gSSB3aWxsIHVwZGF0ZSB0aGUgcHJvdG90eXBlIGFjY29yZGluZ2x5LgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
