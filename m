Return-Path: <SRS0=b7Gi=SO=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDFCC10F0E
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:29:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 204032084D
	for <xen-devel@archiver.kernel.org>; Fri, 12 Apr 2019 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 204032084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hExBP-0003bh-7c; Fri, 12 Apr 2019 14:29:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hExBN-0003bZ-GG
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 14:29:33 +0000
X-Inumbo-ID: 634a1fc1-5d2f-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 634a1fc1-5d2f-11e9-92d7-bc764e045a96;
 Fri, 12 Apr 2019 14:29:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 12 Apr 2019 08:29:31 -0600
Message-Id: <5CB0A0C90200007800226EB4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 12 Apr 2019 08:29:29 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190412042930.2867-1-tamas@tklengyel.com>
 <5CB07CB30200007800226E07@prv1-mh.provo.novell.com>
 <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
In-Reply-To: <CABfawhnByKWejmUUdCaCEpoE-TmdzwvQ=jVZxkz+mS8YuTRsfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mem_sharing: reorder when pages are
 unlocked and released
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190412142929.aPIaCf-zC0qKe3Jmt-io-V-WH4uwsSAOarxdcK-eukU@z>

Pj4+IE9uIDEyLjA0LjE5IGF0IDE1OjQxLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gRnJpLCBBcHIgMTIsIDIwMTkgYXQgNTo1NSBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+PiA+Pj4gT24gMTIuMDQuMTkgYXQgMDY6MjksIDx0YW1hc0B0a2xlbmd5
ZWwuY29tPiB3cm90ZToKPj4gPiBAQCAtOTg0LDcgKzk3Niw3IEBAIHN0YXRpYyBpbnQgc2hhcmVf
cGFnZXMoc3RydWN0IGRvbWFpbiAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPj4g
PiAgICAgICAgICAgKiBEb24ndCBjaGFuZ2UgdGhlIHR5cGUgb2Ygcm1hcCBmb3IgdGhlIGNsaWVu
dCBwYWdlLiAqLwo+PiA+ICAgICAgICAgIHJtYXBfZGVsKGdmbiwgY3BhZ2UsIDApOwo+PiA+ICAg
ICAgICAgIHJtYXBfYWRkKGdmbiwgc3BhZ2UpOwo+PiA+IC0gICAgICAgIHB1dF9wYWdlX2FuZF90
eXBlKGNwYWdlKTsKPj4gPiArICAgICAgICBwdXRfY291bnQrKzsKPj4KPj4gU2luY2UgdGhpcyBz
aXRzIGluIGEgd2hpbGUoKSwgLi4uCj4+Cj4+ID4gQEAgLTEwMDIsNyArOTk0LDkgQEAgc3RhdGlj
IGludCBzaGFyZV9wYWdlcyhzdHJ1Y3QgZG9tYWluICpzZCwgZ2ZuX3Qgc2dmbiwgc2hyX2hhbmRs
ZV90IHNoLAo+PiA+ICAgICAgLyogRnJlZSB0aGUgY2xpZW50IHBhZ2UgKi8KPj4gPiAgICAgIGlm
KHRlc3RfYW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJmNwYWdlLT5jb3VudF9pbmZvKSkK
Pj4gPiAgICAgICAgICBwdXRfcGFnZShjcGFnZSk7Cj4+ID4gLSAgICBwdXRfcGFnZShjcGFnZSk7
Cj4+ID4gKwo+PiA+ICsgICAgd2hpbGUocHV0X2NvdW50LS0pCj4+ID4gKyAgICAgICAgcHV0X3Bh
Z2VfYW5kX3R5cGUoY3BhZ2UpOwo+Pgo+PiAuLi4gcHV0X2NvdW50IG1heSBiZSB6ZXJvIGJlZm9y
ZSB0aGlzIHdoaWxlKCkuIEF0IHdoaWNoIHBvaW50IHRoZQo+PiBlYXJsaWVyIHB1dF9wYWdlKCkg
d291bGQgc3RpbGwgYmUgdW5zYWZlLgo+IAo+IFRoZSBwYWdlIHNob3VsZCBoYXZlIGF0IGxlYXN0
IG9uZSByZWZlcmVuY2UgaXQgZ290IGJlZm9yZSB3aGVuIHRoZQo+IHBhZ2Ugd2VudCB0aHJvdWdo
IHBhZ2VfbWFrZV9zaGFyYWJsZSBmdW5jdGlvbi4gV2UgYWxzbyB2ZXJpZmllZCB0aGF0Cj4gdGhl
IHBhZ2UgaXMgc3RpbGwgc2hhcmFibGUgc28gdGhhdCByZWZlcmVuY2UgaXMgc3RpbGwgdGhlcmUs
IHNvIHRoaXMKPiBjb3VudCBpcyBhdCBsZWFzdCAxLiBXZSBjb3VsZCBjZXJ0YWlubHkgYWRkIGFu
IEFTU0VSVChwdXRfY291bnQpCj4gYmVmb3JlIHRob3VnaC4KCkkgc2VlIC0gYmFjayB3aGVuIEkg
Y3JlYXRlZCB0aGUgY2hhbmdlIHlvdSdyZSBub3cgdHJ5aW5nIHRvIGZpeCwKSSB3YXMgd29uZGVy
aW5nIGJ1dCBjb3VsZG4ndCBmaW5kIGFueSBwcm9vZi4gU28geWVzLCBhZGRpbmcgYW4KQVNTRVJU
KCkgd291bGQgc3VyZWx5IGJlIGhlbHBmdWwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
