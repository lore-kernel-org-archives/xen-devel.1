Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58425C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:49:28 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA682077C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 15:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AA682077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJgcX-0002AT-Fu; Thu, 25 Apr 2019 15:49:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJgcW-0002AO-82
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 15:49:08 +0000
X-Inumbo-ID: a7fc163e-6771-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a7fc163e-6771-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 15:49:06 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 25 Apr 2019 09:49:05 -0600
Message-Id: <5CC1D6EE0200007800229263@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 25 Apr 2019 09:49:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Igor Druzhinin" <igor.druzhinin@citrix.com>
References: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
 <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
 <3def1b27-f676-0fdf-1895-f44066466af9@citrix.com>
In-Reply-To: <3def1b27-f676-0fdf-1895-f44066466af9@citrix.com>
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
Message-ID: <20190425154902.2SnjWNvta_56XQokL_TwXAvLyNMn64gGly7pkVtJzuk@z>

Pj4+IE9uIDI1LjA0LjE5IGF0IDE2OjUwLCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjUvMDQvMjAxOSAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIz
LjA0LjE5IGF0IDEzOjM3LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiAg
dm9pZCBtZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCj4+PiAgewo+Pj4gLSAg
ICBpZiAoIGhhc19pb21tdV9wdChkKSAmJiBkLT52Y3B1ICYmIGQtPnZjcHVbMF0gKQo+Pj4gKyAg
ICBpZiAoIChoYXNfaW9tbXVfcHQoZCkgfHwgY2FjaGVfZmx1c2hfcGVybWl0dGVkKGQpKSAmJiBk
LT52Y3B1ICYmIGQtPnZjcHVbMF0gKQo+Pj4gICAgICB7Cj4+PiAgICAgICAgICBwMm1fbWVtb3J5
X3R5cGVfY2hhbmdlZChkKTsKPj4+ICAgICAgICAgIGZsdXNoX2FsbChGTFVTSF9DQUNIRSk7Cj4+
IAo+PiBXb3VsZG4ndCBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoKSBhbG9uZSBzdWZmaWNlLCBib3Ro
IGhlcmUgYW5kCj4+IHRoZXJlPyBFdmVuIGlmIGFueW9uZSB3YXMgdG8gcGFzcy10aHJvdWdoIGEg
ZGV2aWNlIHdpdGhvdXQgYW55Cj4+IE1NSU8gb3IgSS9PIHBvcnQgQkFSLCB0aGUgbWVtb3J5IHR5
cGUgKHdoaWNoIGlzIGEgQ1BVIHNpZGUKPj4gdGhpbmcgb25seSwgaS5lLiBkb2Vzbid0IGFmZmVj
dCBETUEgYnkgdGhlIGRldmljZSkgc2hvdWxkbid0Cj4+IG1hdHRlciBpbiB0aGF0IGNhc2UgKGxl
YXZpbmcgYXNpZGUgdGhlIGZhY3QgdGhhdCBhIEJBUi1sZXNzCj4+IGRldmljZSBpcyB1bmxpa2Vs
eSB0byBiZSBETUEtY2FwYWJsZSwgdW5sZXNzIHRoZSBwcm9ncmFtbWluZwo+PiBvZiB0aGUgRE1B
IG9wZXJhdGlvbnMgd2FzIHRvIGhhcHBlbiB0aHJvdWdoIHZlbmRvciBzcGVjaWZpYwo+PiBjb25m
aWcgc3BhY2UgYWNjZXNzZXMpLgo+IAo+IEkgZG9uJ3QgdGhpbmsgaXQncyBjb3JyZWN0IGluIGNh
c2Ugb2YgRVBUIHNoYXJpbmcgd2l0aCBJT01NVSBhcyB0aGUKPiBzZWN0aW9uIDMuNi41IG9mIFZU
LWQgc3BlYyBpbXBsaWVzIHRoZXJlIGlzIGRpcmVjdCBlZmZlY3Qgb2YgY2FjaGluZwo+IGluZm9y
bWF0aW9uIHByZXNlbnQgaW4gSU9NTVUgcGFnZSB0YWJsZSBvbiBkZXZpY2UgYWNjZXNzZXMgd2l0
aGluCj4gcHJvY2Vzc29yIGNvaGVyZW5jeSBkb21haW4uIFNvIGV2ZW4gaW4gY2FzZSB0aGVyZSBh
cmUgbm8gQkFScyBwYXNzZWQgdG8KPiB0aGUgZG9tYWluLCBkcml2ZXJzIGluc2lkZSBpdCBhbmQg
ZGV2aWNlcyBvcGVyYXRpb24gb24gaXRzIG1lbW9yeSBjb3VsZAo+IHN0aWxsIGhhdmUgYXNzdW1w
dGlvbnMgb24gZGV2aWNlIG1lbW9yeSBhY2Nlc3MgcHJvcGVydGllcy4KCkJ1dCB0aGF0J3MgYSBG
aXJzdC1MZXZlbCBUcmFuc2xhdGlvbiBzdWJzZWN0aW9uLiBGb3IgdXMgcmlnaHQgbm93CnNlY3Rp
b24gMy43LjQgaXMgcmVsZXZhbnQsIHdoaWxlIGluIHRoZSBmdXR1cmUgMy44LjQgbWF5IGJlY29t
ZQpyZWxldmFudCB0b28uIEFzIHBlciAzLjcuNCBhbGwgbGVhZiBwYWdlIChhY3R1YWwgZGF0YSkg
YWNjZXNzZXMKYXJlIG9mIFdCIHR5cGUgYW55d2F5LgoKT25jZSAzLjguNCBiZWNvbWVzIGFwcGxp
Y2FibGUsIHdlJ2QgbGlrZWx5IGhhdmUgdG8gc3VwcG9ydCBJT01NVQpzaWRlIE1UUlJzIGFzIHdl
bGwsIG9yIGVsc2UgdGhlIE1UUlIgaW1wb3NlZCBtZW1vcnkgdHlwZSB3b3VsZApiZSB1bmlmb3Jt
bHkgVUMsIGFsbG93aW5nIGZvciBvbmx5IFVDIGFuZCBXQyBlZmZlY3RpdmUgbWVtb3J5CnR5cGVz
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
