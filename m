Return-Path: <SRS0=w6oi=S3=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0A6C43218
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 16:22:52 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC5652077C
	for <xen-devel@archiver.kernel.org>; Thu, 25 Apr 2019 16:22:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC5652077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hJh8p-0006Mh-RQ; Thu, 25 Apr 2019 16:22:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tBju=S3=citrix.com=prvs=011b478a6=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1hJh8o-0006Mc-Vl
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 16:22:31 +0000
X-Inumbo-ID: 523965a0-6776-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 523965a0-6776-11e9-843c-bc764e045a96;
 Thu, 25 Apr 2019 16:22:29 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,394,1549929600"; d="scan'208";a="84420500"
To: Jan Beulich <JBeulich@suse.com>
References: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
 <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
 <3def1b27-f676-0fdf-1895-f44066466af9@citrix.com>
 <5CC1D6EE0200007800229263@prv1-mh.provo.novell.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <63e9d382-89af-e598-9923-e8e04278651a@citrix.com>
Date: Thu, 25 Apr 2019 17:22:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CC1D6EE0200007800229263@prv1-mh.provo.novell.com>
Content-Language: en-US
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
Message-ID: <20190425162227.zM0xyX21YrXpgYNoLxqJBvTKNFNuFJ7GtyCVJd1DOSQ@z>

T24gMjUvMDQvMjAxOSAxNjo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMjUuMDQuMTkg
YXQgMTY6NTAsIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMjUvMDQv
MjAxOSAxNDozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAyMy4wNC4xOSBhdCAxMzoz
NywgPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+ICB2b2lkIG1lbW9yeV90
eXBlX2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkKPj4+PiAgewo+Pj4+IC0gICAgaWYgKCBoYXNf
aW9tbXVfcHQoZCkgJiYgZC0+dmNwdSAmJiBkLT52Y3B1WzBdICkKPj4+PiArICAgIGlmICggKGhh
c19pb21tdV9wdChkKSB8fCBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoZCkpICYmIGQtPnZjcHUgJiYg
ZC0+dmNwdVswXSApCj4+Pj4gICAgICB7Cj4+Pj4gICAgICAgICAgcDJtX21lbW9yeV90eXBlX2No
YW5nZWQoZCk7Cj4+Pj4gICAgICAgICAgZmx1c2hfYWxsKEZMVVNIX0NBQ0hFKTsKPj4+Cj4+PiBX
b3VsZG4ndCBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoKSBhbG9uZSBzdWZmaWNlLCBib3RoIGhlcmUg
YW5kCj4+PiB0aGVyZT8gRXZlbiBpZiBhbnlvbmUgd2FzIHRvIHBhc3MtdGhyb3VnaCBhIGRldmlj
ZSB3aXRob3V0IGFueQo+Pj4gTU1JTyBvciBJL08gcG9ydCBCQVIsIHRoZSBtZW1vcnkgdHlwZSAo
d2hpY2ggaXMgYSBDUFUgc2lkZQo+Pj4gdGhpbmcgb25seSwgaS5lLiBkb2Vzbid0IGFmZmVjdCBE
TUEgYnkgdGhlIGRldmljZSkgc2hvdWxkbid0Cj4+PiBtYXR0ZXIgaW4gdGhhdCBjYXNlIChsZWF2
aW5nIGFzaWRlIHRoZSBmYWN0IHRoYXQgYSBCQVItbGVzcwo+Pj4gZGV2aWNlIGlzIHVubGlrZWx5
IHRvIGJlIERNQS1jYXBhYmxlLCB1bmxlc3MgdGhlIHByb2dyYW1taW5nCj4+PiBvZiB0aGUgRE1B
IG9wZXJhdGlvbnMgd2FzIHRvIGhhcHBlbiB0aHJvdWdoIHZlbmRvciBzcGVjaWZpYwo+Pj4gY29u
ZmlnIHNwYWNlIGFjY2Vzc2VzKS4KPj4KPj4gSSBkb24ndCB0aGluayBpdCdzIGNvcnJlY3QgaW4g
Y2FzZSBvZiBFUFQgc2hhcmluZyB3aXRoIElPTU1VIGFzIHRoZQo+PiBzZWN0aW9uIDMuNi41IG9m
IFZULWQgc3BlYyBpbXBsaWVzIHRoZXJlIGlzIGRpcmVjdCBlZmZlY3Qgb2YgY2FjaGluZwo+PiBp
bmZvcm1hdGlvbiBwcmVzZW50IGluIElPTU1VIHBhZ2UgdGFibGUgb24gZGV2aWNlIGFjY2Vzc2Vz
IHdpdGhpbgo+PiBwcm9jZXNzb3IgY29oZXJlbmN5IGRvbWFpbi4gU28gZXZlbiBpbiBjYXNlIHRo
ZXJlIGFyZSBubyBCQVJzIHBhc3NlZCB0bwo+PiB0aGUgZG9tYWluLCBkcml2ZXJzIGluc2lkZSBp
dCBhbmQgZGV2aWNlcyBvcGVyYXRpb24gb24gaXRzIG1lbW9yeSBjb3VsZAo+PiBzdGlsbCBoYXZl
IGFzc3VtcHRpb25zIG9uIGRldmljZSBtZW1vcnkgYWNjZXNzIHByb3BlcnRpZXMuCj4gCj4gQnV0
IHRoYXQncyBhIEZpcnN0LUxldmVsIFRyYW5zbGF0aW9uIHN1YnNlY3Rpb24uIEZvciB1cyByaWdo
dCBub3cKPiBzZWN0aW9uIDMuNy40IGlzIHJlbGV2YW50LCB3aGlsZSBpbiB0aGUgZnV0dXJlIDMu
OC40IG1heSBiZWNvbWUKPiByZWxldmFudCB0b28uIEFzIHBlciAzLjcuNCBhbGwgbGVhZiBwYWdl
IChhY3R1YWwgZGF0YSkgYWNjZXNzZXMKPiBhcmUgb2YgV0IgdHlwZSBhbnl3YXkuCj4gCj4gT25j
ZSAzLjguNCBiZWNvbWVzIGFwcGxpY2FibGUsIHdlJ2QgbGlrZWx5IGhhdmUgdG8gc3VwcG9ydCBJ
T01NVQo+IHNpZGUgTVRSUnMgYXMgd2VsbCwgb3IgZWxzZSB0aGUgTVRSUiBpbXBvc2VkIG1lbW9y
eSB0eXBlIHdvdWxkCj4gYmUgdW5pZm9ybWx5IFVDLCBhbGxvd2luZyBmb3Igb25seSBVQyBhbmQg
V0MgZWZmZWN0aXZlIG1lbW9yeQo+IHR5cGVzLgo+IAoKT2ggeWVzLCBzb3JyeSB0aGF0IEkgbWl4
ZWQgdGhlbSB1cC4gSW4gdGhhdCBjYXNlLCBwcm9iYWJseSB5ZXMgLSBzaW1wbHkKY2FjaGVfZmx1
c2hfcGVybWl0dGVkKCkgd291bGQgc3VmZmljZS4gQWx0aG91Z2ggdGhlcmUgYXJlIHRoaW5ncyB0
aGF0CkknbSBub3Qgc3VyZSBhYm91dDoKLSB3aGV0aGVyIGlvY2FwcyBhcmUgYWx3YXlzIHVzZWQg
Ynkgc29mdHdhcmUgaW4gRG9tMCB3aGVuIHBhc3NpbmcKdGhyb3VnaCBjZXJ0YWluIHBoeXNpY2Fs
IG1lbW9yeSBhbmQgd2hldGhlciB0aGVpciB1c2FnZSBpcyBlbmZvcmNlZCBieSBYZW4KLSB0aGVy
ZSBhcmUgY291bGQgYmUgYXNzdW1wdGlvbnMgZWxzZXdoZXJlIHRoYXQgd2l0aCBJT01NVSBjb250
ZXh0CmFzc2lnbmVkIGd1ZXN0IGNhY2hpbmcgY2hvaWNlIGlzIGluIGVmZmVjdCAtIHNpbmNlIHRo
YXQgZmFjdCBoYXMgYmVlbgpwZXJwZXR1YXRlZCBpbiBYZW4gY29kZSBmb3IgdmVyeSBsb25nIHRp
bWUKCklnb3IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
