Return-Path: <SRS0=7THE=S4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2940C43218
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 07:10:14 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7F81206BA
	for <xen-devel@archiver.kernel.org>; Fri, 26 Apr 2019 07:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7F81206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJuzc-00016X-Ni; Fri, 26 Apr 2019 07:09:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D5Za=S4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJuzb-00016S-OD
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2019 07:09:55 +0000
X-Inumbo-ID: 4a4fe0b4-67f2-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4a4fe0b4-67f2-11e9-843c-bc764e045a96;
 Fri, 26 Apr 2019 07:09:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 26 Apr 2019 01:09:53 -0600
Message-Id: <5CC2AEBC0200007800229534@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 26 Apr 2019 01:09:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Igor Druzhinin" <igor.druzhinin@citrix.com>
References: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
 <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
 <3def1b27-f676-0fdf-1895-f44066466af9@citrix.com>
 <5CC1D6EE0200007800229263@prv1-mh.provo.novell.com>
 <63e9d382-89af-e598-9923-e8e04278651a@citrix.com>
In-Reply-To: <63e9d382-89af-e598-9923-e8e04278651a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/mtrr: recalculate P2M type for domains
 with iocaps
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190426070948.iJ0oWb5ra2Df14qyx75fBVl1apO9qzImdB-9nX7kkwM@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDE4OjIyLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQWx0aG91Z2ggdGhlcmUgYXJlIHRoaW5ncyB0aGF0IEknbSBub3Qgc3VyZSBhYm91dDoK
PiAtIHdoZXRoZXIgaW9jYXBzIGFyZSBhbHdheXMgdXNlZCBieSBzb2Z0d2FyZSBpbiBEb20wIHdo
ZW4gcGFzc2luZwo+IHRocm91Z2ggY2VydGFpbiBwaHlzaWNhbCBtZW1vcnkgYW5kIHdoZXRoZXIg
dGhlaXIgdXNhZ2UgaXMgZW5mb3JjZWQgYnkgWGVuCgpJJ20gYWZyYWlkIEknbSBzdHJ1Z2dsaW5n
IHRvIHVuZGVyc3RhbmQgd2hhdCBleGFjdGx5IHlvdSBtZWFuLgpQYXNzaW5nIHRocm91Z2ggYSBk
ZXZpY2Ugd2l0aG91dCBhbHNvIHJlZ2lzdGVyaW5nIHRoZSBCQVJzCmZvciB1c2UgYnkgdGhlIHRh
cmdldCBndWVzdCBzaW1wbHkgd291bGRuJ3QgeWllbGQgYSBmdW5jdGlvbmluZwpkZXZpY2UgKGlu
IHRoZSBndWVzdCkuIEFyZ3VhYmx5IGl0IHNob3VsZG4ndCBiZSBhIHNlcGFyYXRlCmRvbWN0bCwg
YnV0IHRoYXQncyBob3cgdGhlIHBlb3BsZSBvcmlnaW5hbGx5IGltcGxlbWVudGluZwpwYXNzLXRo
cm91Z2ggY2hvc2UgdG8gc3RydWN0dXJlIHRoaW5ncy4gSXQgaGFzIHRoZSBhZHZhbnRhZ2UKb2Yg
ZGV2aWNlcyB3b3JraW5nIHdoZXJlIERvbTAga25vd3MgYWJvdXQgZXh0cmEgcmVzb3VyY2VzCihN
TUlPIG9yIEkvTyBwb3J0cykgd2hlbiBYZW4gZG9lc24ndC4gSXQgaGFzIHRoZQpkaXNhZHZhbnRh
Z2Ugb2YgYmVpbmcgZGVwZW5kZW50IG9uIFhlbiwgRG9tMCBrZXJuZWwsIGFuZAp0aGUgdG9vbCBz
dGFjayBpbnRlcmFjdGluZyBjb3JyZWN0bHkgKHJhdGhlciB0aGFuIGFsbCBsb2dpYyBiZWluZwpp
biBhIHNpbmdsZSBjb21wb25lbnQpLgoKVGhlcmUgd2FzIGEgc2ltaWxhcmx5IG9kZCBhcnJhbmdl
bWVudCBpbiB0aGUgb3JpZ2luYWwKaW1wbGVtZW50YXRpb24gb2YgTVNJLVgsIHdoZXJlIFhlbiBk
ZXBlbmRlZCB1cG9uIERvbTAKcmVwb3J0aW5nIHRoZSBNU0ktWCB0YWJsZSBiYXNlLiBOb3dhZGF5
cyB3ZSByZWFkIHRoZSBCQVIKb3Vyc2VsdmVzIGFuZCBzaW1wbHkgY2hlY2sgdGhhdCB0aGUgdmFs
dWUgbWF0Y2hlcyB3aGF0CkRvbTAgaGFzIHBhc3NlZC4KCj4gLSB0aGVyZSBhcmUgY291bGQgYmUg
YXNzdW1wdGlvbnMgZWxzZXdoZXJlIHRoYXQgd2l0aCBJT01NVSBjb250ZXh0Cj4gYXNzaWduZWQg
Z3Vlc3QgY2FjaGluZyBjaG9pY2UgaXMgaW4gZWZmZWN0IC0gc2luY2UgdGhhdCBmYWN0IGhhcyBi
ZWVuCj4gcGVycGV0dWF0ZWQgaW4gWGVuIGNvZGUgZm9yIHZlcnkgbG9uZyB0aW1lCgpBZ3JlZWQg
LSB0aGVyZSdzIGEgY2VydGFpbiBjaGFuY2UgdGhhdCBvdGhlciBwbGFjZXMgaW4gWGVuIGhhdmUK
c2ltaWxhciBsb2dpYy4gQnV0IHRoZXJlJ3MgYW4gZXF1YWwgY2hhbmNlIHRoYXQgb3RoZXIgcGxh
Y2VzIGluClhlbiBzaW1pbGFybHkgY2hlY2sgb25seSBvbmUgb2YgdGhlIHR3bywgd2hlbiwgaW4g
dGhlIHNwaXJpdCBvZiB5b3VyCnBhdGNoLCB0aGV5IHJlYWxseSBtZWFuIHRvIGNoZWNrIGJvdGgu
IFRoaXMgY291bGQgb25seSBiZSBjbGFyaWZpZWQKYnkgZG9pbmcgYSBmdWxsIGF1ZGl0LgoKSmFu
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
