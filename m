Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2A9C282CE
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:21:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7870220857
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 12:21:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7870220857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDpkS-00083x-Ce; Tue, 09 Apr 2019 12:21:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V/tf=SL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hDpkR-00083s-Ad
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 12:21:07 +0000
X-Inumbo-ID: f212315e-5ac1-11e9-af1b-4b3d24124444
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f212315e-5ac1-11e9-af1b-4b3d24124444;
 Tue, 09 Apr 2019 12:21:05 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 09 Apr 2019 06:21:04 -0600
Message-Id: <5CAC8E2C0200007800225CDC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 09 Apr 2019 06:21:00 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5C7E77D1020000780021BB0B@prv1-mh.provo.novell.com>
 <5C7E798E020000780021BB43@prv1-mh.provo.novell.com>
 <942c2ec5-69dc-634b-0935-b8713506d32e@arm.com>
 <5CA3898C0200007800223F9D@prv1-mh.provo.novell.com>
 <eca8d08b-41da-5e88-3303-a0b14adfe0be@arm.com>
 <5CAB5ACC0200007800225693@prv1-mh.provo.novell.com>
 <303adcc7-de60-f264-67f2-7bd05b2c4bec@arm.com>
In-Reply-To: <303adcc7-de60-f264-67f2-7bd05b2c4bec@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/3] memory: restrict
 XENMEM_remove_from_physmap to translated guests
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409122100.WTk-Ddg-ML7v23XBoZUkPJAdHbW731ZOrAhXvSYA-5I@z>

Pj4+IE9uIDA5LjA0LjE5IGF0IDExOjUwLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDA4LzA0LzIwMTkgMTU6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwOC4wNC4x
OSBhdCAxMzo0NywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IGRlLWFsbG9jYXRp
b24gc3RlcCBhc2lkZSwgSSBhbSBub3QgcmVhbGx5IGNvbnZpbmNlZCB5b3UgY2FuIHJldXNlCj4+
PiBndWVzdF9yZW1vdmVfcGFnZSgpIGhlcmUuIE9uIHg4NiwgdGhlIGZ1bmN0aW9uIHdpbGwgbm90
IHdvcmsgb24gY2VydGFpbgo+Pj4gcDJtIHR5cGVzLiBJcyBpdCB3aGF0IHdlIHJlYWxseSB3YW50
Pwo+PiAKPj4gSG1tLCBJJ20gY29uZnVzZWQuIEFmYWljcyB0aGUgb25seSB0d28gdHlwZXMgaXQg
cmVmdXNlcyBhIHJlcXVlc3QKPj4gZm9yIGFyZSBwMm1faW52YWxpZCBhbmQgcDJtX21taW9fZG0u
IFRoZXNlIHJlcHJlc2VudCBjYXNlcwo+PiB3aGVyZSB0aGVyZSdzIG5vIHAybSBlbnRyeSBhbnl3
YXksIGkuZS4gbm90aGluZyB0byByZW1vdmUuIEFtCj4+IEkgcGVyaGFwcyBvdmVybG9va2luZyBz
b21ldGhpbmcgeW91IHNlZT8KPj4gCj4+IE9yIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoZSBtZm5f
aW52YWxpZCgpIGNoZWNrICh3aGljaCBpc24ndCB4ODYtCj4+IHNwZWNpZmljKT8gVGhpcyBvdWdo
dCB0byBiZSBjb3ZlcmVkIGJ5IHRoZSBwMm1faXNfcGFnaW5nKCkgYW5kCj4+IHAybV9tbWlvX2Rp
cmVjdCBzcGVjaWFsIGNhc2VzIGEgZmV3IGxpbmVzIHVwIGZyb20gdGhlcmUuIE90aGVyCj4+IGNh
c2VzIHdpdGggaW52YWxpZCBNRk5zIHdvdWxkIGluZGVlZCByZXByZXNlbnQgYW4gZXJyb3IgY29u
ZGl0aW9uCj4+IGltby4KPiAKPiBJIGFtIHJlZmVycmluZyB0byBnZXRfcGFnZSguLi4pIHdoaWNo
IHdvdWxkIG5vdCB3b3JrIGZvciBmb3JlaWduIHBhZ2VzLgoKQWgsIHRoYXQncyBwYXJ0IG9mIHRo
ZSBkZS1hbGxvY2F0aW9uIHBvcnRpb24gb2YgdGhlIGNvZGUsIHdoaWNoIEkndmUKcHJldmlvdXNs
eSBpbmRpY2F0ZWQgd291bGQgbmVlZCB0byBiZSBza2lwcGVkIGluIHRoZSBjYXNlIGhlcmUuCgo+
PiBJbiB0aGUgZW5kIGl0J3MgYWN0dWFsbHkgcXVpdGUgdGhlIG9wcG9zaXRlIHRoYXQgSSdtIHRo
aW5raW5nOiBGb3IKPj4gdGhlIGNhbGxlciBpdCBzaG91bGRuJ3QsIGZvciBleGFtcGxlLCBtYXR0
ZXIgd2hldGhlciB0aGUKPj4gcmVxdWVzdGVkIHBhZ2Ugd2FzIHBhZ2VkIG91dC4gV2Ugd291bGRu
J3QgZXZlbiBjYWxsCj4+IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKSBpbiB0aGF0IGNhc2Us
IHdoaWxlCj4+IGd1ZXN0X3JlbW92ZV9wYWdlKCkgd291bGQgdGFrZSBjYXJlIG9mIGl0Lgo+IAo+
IEJ1dCB0aG9zZSBwYWdlcyBzaG91bGQgbmV2ZXIgYmUgcmVtb3ZlZCB2aWEgcGh5c21hcCwgSSBh
bSBjb3JyZWN0PwoKVGhlIGd1ZXN0IGlzIHVuYXdhcmUgb2YgcGFnaW5nLCBzbyBhcyBsb25nIGFz
IGl0J3MgcGVybWl0dGVkIHRvCnVzZSB0aGlzIGh5cGVyY2FsbCwgaXQgc2hvdWxkIG1ha2Ugbm8g
ZGlmZmVyZW5jZSB0byBpdCB3aGV0aGVyIGEKcGFnZSBpcyBhY3R1YWxseSBpbiBtZW1vcnkgYXQg
dGhlIHRpbWUgaXQgaXNzdWVzIHRoaXMgaHlwZXJjYWxsLgoKPiBBbnl3YXksIGd1ZXN0X3BoeXNt
YXBfcmVtb3ZlX3BhZ2UoKSB3b3VsZCBuZWVkIHNvbWUgcmV3b3JrIHRvIGRvIHRoZSBjb3JyZWN0
IAo+IHRoaW5ncyBmb3IgcGh5c21hcC4KCk9mIGNvdXJzZS4KCj4gSSB3aWxsIHdhaXQgYW4gc2Vl
IHlvdXIgcGF0Y2ggdG8gY29tbWVudC4KCldlbGwsIHRoZSByZWFzb24gZm9yIHRoZSBUQkQgaXRl
bSBpbiB0aGUgcGF0Y2ggaGVyZSB3YXMgcHJlY2lzZWx5CnRvIGZpZ3VyZSBvdXQgd2hldGhlciBj
cmVhdGluZyBzdWNoIGEgcGF0Y2ggd291bGQgbWFrZSBzZW5zZSwKb3Igd2hldGhlciB0aGUgY3Vy
cmVudCB1c2Ugb2YgZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFnZSgpIGlzCmNvcnJlY3QuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
