Return-Path: <SRS0=qwBA=TO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5CEBC04AB4
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 11:30:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C12FF208CA
	for <xen-devel@archiver.kernel.org>; Tue, 14 May 2019 11:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C12FF208CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQVcx-0001cD-92; Tue, 14 May 2019 11:29:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQVcw-0001c8-6P
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:29:46 +0000
X-Inumbo-ID: 92c17d85-763b-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 92c17d85-763b-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 11:29:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 05:29:44 -0600
Message-Id: <5CDAA6A5020000780022E8AC@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 05:29:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <5CD3F266020000780022D0F3@prv1-mh.provo.novell.com>
 <1c8b7f5f-09d7-6e38-1e78-9528c1f0a756@arm.com>
 <5CDA8EF0020000780022E756@prv1-mh.provo.novell.com>
 <d270589f-4076-ee40-d316-2939f67d7c0b@arm.com>
In-Reply-To: <d270589f-4076-ee40-d316-2939f67d7c0b@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190514112941.I2PwDUlnufkBaHAAvgU9xqk_X7iyaJ5I4784P_EWqdE@z>

Pj4+IE9uIDE0LjA1LjE5IGF0IDEzOjIzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDE0LzA1LzIwMTkgMTA6NDgsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNC4wNS4x
OSBhdCAxMTozNSwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+IE9uIGEgc2ltaWxh
ciB0b3BpYywgaG93IGRvZXMgS2V4ZWMgd29ya3Mgb24gWGVuPyBEbyB3ZSByZXNldCB0aGUKPj4+
IGRvbWFpbiBhcyB3ZWxsPwo+PiAKPj4gTm8sIGhvdyBjb3VsZCB3ZT8gV2hhdCBnZXRzIGludm9r
ZWQgaXNuJ3QgWGVuIGluIHRoZSBjb21tb24gY2FzZSwKPj4gYnV0IHNvbWUgb3RoZXIgKHR5cGlj
YWxseSBiYXJlIG1ldGFsKSBPUyBsaWtlIExpbnV4Lgo+IAo+IEl0IGlzIG5vdCB3aGF0IEkgYXNr
ZWQuIFdoYXQgSSBhc2tlZCBpcyB3aGV0aGVyIFhlbiBpcyBpbnZvbHZlZCB3aGVuIGEgZ3Vlc3Qg
Cj4ga2VybmVsIGlzIGtleGVjaW5nIHRvIGFub3RoZXIga2VybmVsLgoKSSBkb24ndCB0aGluayBJ
J3ZlIGV2ZXIgaGVhcmQgb2Ygc3VjaCBhIHRoaW5nIChvdXRzaWRlIG9mIHBlcmhhcHMKdXNpbmcg
ZG9tYWluIHJlc2V0KSwgc28gSSBkb24ndCB0aGluayBJIGNhbiBhbnN3ZXIgdGhlIChvcmlnaW5h
bGx5CmFtYmlndW91cykgcXVlc3Rpb24gdGhlbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
