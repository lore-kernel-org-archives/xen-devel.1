Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431F6C10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 11:50:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1941120850
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 11:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1941120850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEuhD-0008Bg-Ca; Fri, 12 Apr 2019 11:50:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEuhC-0008Bb-3J
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 11:50:14 +0000
X-Inumbo-ID: 20f4cffe-5d19-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 20f4cffe-5d19-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 11:50:12 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 12 Apr 2019 05:48:11 -0600
Message-Id: <5CB07AFB0200007800226DF6@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 12 Apr 2019 05:48:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5C5A8F750200007800214217@prv1-mh.provo.novell.com>
 <f25d83e3-e74d-713a-4601-f2a9aef2aba0@citrix.com>
 <5C5ABCE202000078002143AE@prv1-mh.provo.novell.com>
 <c55c91dd-7436-5882-8086-506e2548efed@citrix.com>
 <5CAEED4902000078002267E4@prv1-mh.provo.novell.com>
 <2845f3ee-e548-33bf-519b-0201562ed559@citrix.com>
In-Reply-To: <2845f3ee-e548-33bf-519b-0201562ed559@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/HVM: correctly deal with benign
 exceptions when combining two
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412114811.Ebj814pSiV9JyyVzzsvJQZ5pW2t99Bl3oYXc_EUpDkQ@z>

Pj4+IE9uIDExLjA0LjE5IGF0IDE1OjM5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDQvMjAxOSAwODozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdvdWxkIHlv
dSBtaW5kIGhlbHBpbmcgbWUgbWFrZSB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuICNBQwo+PiBkZWxp
dmVyeSAoYW5kIGl0cyBlbXVsYXRpb24pIGFuZCBYU0EtMTcwLCBiZWluZyBhYm91dCBWTSBlbnRy
eQo+PiB3aXRoIG5vbi1jYW5vbmljYWwgJXJpcD8KPiAKPiBBaCAtIHRoYXQgd2Fzbid0IHRoZSBj
b25uZWN0aW9uIEkgd2FzIHRyeWluZyB0byBtYWtlLgo+IAo+IEJlY2F1c2Ugb3VyIGVtdWxhdGlv
biBvZiBldmVudCBkZWxpdmVyeSBpcyBjdXJyZW50bHkgc3BlY2lmaWMgdG8gU1ZNLAo+IGFuZCBk
b2Vzbid0IHBlcmZvcm0gYWxpZ25tZW50IGNoZWNraW5nLCBYZW4gd2lsbCBuZXZlciBlbmQgdXAg
aW4gYSBjYXNlCj4gd2VyZSAjQUMgd2lsbCBiZSBkZWxpdmVyZWQgc2Vjb25kLgo+IAo+IElmIHlv
dSByZWNhbGwsIHRoZSBpbmplY3Rpb24gc3VwcG9ydCB1c2VkIHRvIGJlIGNvbW1vbiwgdGhlbiBt
b3ZlZCB0bwo+IGJlaW5nIFNWTSBzcGVjaWZpYy4gIElmIGl0IHdlcmUgdG8gbW92ZSBiYWNrIHRv
IGJlaW5nIGNvbW1vbiwgd2UgY291bGQKPiBmaXggWFNBLTE3MCB3aGlsZSBtYWludGFpbmluZyBh
cmNoaXRlY3R1cmFsbHkgY29ycmVjdCBiZWhhdmlvdXIsIGJ5Cj4gZnVsbHkgZW11bGF0aW5nIHRo
ZSBldmVudCBpbmplY3Rpb24sIHdoaWNoIHdvdWxkIGJ5cGFzcyB0aGUgaW5jb3JyZWN0Cj4gVk1F
bnRyeSBjb25zaXN0ZW5jeSBjaGVjayB3aGljaCBjYXVzZXMgWFNBLTE3MCBpbiB0aGUgZmlyc3Qg
cGxhY2UuCgpPaCwgSSBzZWUgLSB5b3UgbWVhbiBiZWNhdXNlIGJ5IGVtdWxhdGluZyB0aGUgaW5q
ZWN0aW9uIHdlJ2QKYXZvaWQgdGhlIGhhcmR3YXJlIGV2ZXIgc2VlaW5nIHRoZSBub24tY2Fub25p
Y2FsICVyaXAuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
