Return-Path: <SRS0=0dJu=SH=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E65C4360F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:53:23 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 373FD2171F
	for <xen-devel@archiver.kernel.org>; Fri,  5 Apr 2019 10:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 373FD2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hCMSy-0006hj-33; Fri, 05 Apr 2019 10:53:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=KiBs=SH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hCMSw-0006hc-48
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2019 10:52:58 +0000
X-Inumbo-ID: f859ad9b-5790-11e9-92d7-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f859ad9b-5790-11e9-92d7-bc764e045a96;
 Fri, 05 Apr 2019 10:52:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 05 Apr 2019 04:52:56 -0600
Message-Id: <5CA733880200007800224D89@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 05 Apr 2019 04:52:56 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5C88F524020000780021E12C@prv1-mh.provo.novell.com>
 <5C88F9C7020000780021E17A@prv1-mh.provo.novell.com>
 <33c97290-3527-f07a-59ed-8f7cc174a50a@citrix.com>
In-Reply-To: <33c97290-3527-f07a-59ed-8f7cc174a50a@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/4] x86: relax a few get_gfn() invocations
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
Message-ID: <20190405105256.KkT3nGSYeaDELJKfAeYBo8e9kw8Pk8stY3dfzR2biYw@z>

Pj4+IE9uIDA1LjA0LjE5IGF0IDEyOjMwLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiAzLzEzLzE5IDEyOjM4IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gSW4gYSBmZXcg
Y2FzZXMgb25seSBhIHF1ZXJ5IGlzIGludGVuZGVkLCBpLmUuIHdpdGhvdXQgcG9wdWxhdGluZyBh
Cj4+IHBvc3NpYmxlIFBvRCBvciBwYWdlZCBvdXQgZW50cnksIHdoZW4gdGhlIGludGVudGlvbiBp
cyB0byByZXBsYWNlIHRoZQo+PiBjdXJyZW50IGVudHJ5IGFueXdheS4gVXNlIGdldF9nZm5fcXVl
cnkoKSB0aGVyZSBpbnN0ZWFkLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IAo+IFRoZSBmaXJzdCBvbmUgc2hvdWxkIGJlIGZpbmUsIGJ1dCBw
cmV0dHkgc3VyZSB0aGUgc2Vjb25kIHR3byB3aWxsCj4gbWlzLWZpcmUgZm9yIFBvRDogcDJtLT5w
b2QuZW50cnlfY291bnQgd29uJ3QgZ2V0IHVwZGF0ZWQuICBBcyBpdCBpcywKPiBpdCdzIHNvcnQt
b2YgbWlzZmlyaW5nIGFscmVhZHksIHNpbmNlIHRoZSAiZnJlZWQiIG1lbW9yeSB3b24ndCBiZQo+
IHJlY2xhaW1lZCBmb3IgdGhlIFBvRCBjYWNoZS4KCldlbGwsIGluIHRoZSAybmQgaW5zdGFuY2Ug
KHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUoKSkgd2UKY2FsbCBndWVzdF9waHlzbWFwX2FkZF9w
YWdlKCksIHdoaWNoIGlzIGEgdGhpbiB3cmFwcGVyIGFyb3VuZApndWVzdF9waHlzbWFwX2FkZF9l
bnRyeSgpLiBUaGF0IGZ1bmN0aW9uIGFscmVhZHkgZG9lcyBfc29tZV8KdXBkYXRpbmcgb2YgUG9E
IHN0YXRpc3RpY3MsIGJ1dCBxdWl0ZSBub3QgZW5vdWdoLCBJIGFncmVlLgoKVGhhbmtzIGZvciBu
b3RpY2luZyB0aGVzZSBpc3N1ZXMsIEkgd2l0aGRyYXcgdGhlIGxhdHRlciB0d28gcGFydHMsCmFu
ZCBJJ2xsIGNvbW1pdCBqdXN0IHRoZSBmaXJzdCBodW5rICh3aXRoIGEgc2xpZ2h0bHkgYWRqdXN0
ZWQKZGVzY3JpcHRpb24pLgoKPiBXaGljaCBwcm9iYWJseSBtZWFucyBpdCdzIHRpbWUgZm9yIHNv
bWUgc2VyaW91cyByZWZhY3RvcmluZyB0byBwcmV2ZW50Cj4gdGhpcyBzb3J0IG9mIGVycm9yIGZy
b20gY3JlZXBpbmcgaW4uICBwMm0tPnBvZC5lbnRyeV9jb3VudCBhY2NvdW50aW5nCj4gc2hvdWxk
IHByb2JhYmx5IGJlIG1vdmVkIGludG8gcDJtX2VudHJ5X21vZGlmeSgpLCBhbmQKClJpZ2h0LgoK
PiBwMm1fcG9kX2RlY3JlYXNlX3Jlc2VydmF0aW9uKCkgc2hvdWxkIHByb2JhYmx5IGJlIG1vdmVk
IHNvbWV3aGVyZSBlbHNlCj4gLS0gcGVyaGFwcyBndWVzdF9yZW1vdmVfcGFnZSgpIG9yIHNvbWV0
aGluZz8KClRoaXMgb25lIEknbSBsZXNzIHN1cmUgYWJvdXQgLSBpdCdzIG1lYW50IHRvIGF2b2lk
IGhhdmluZyB0byBnbwp0aHJvdWdoIGd1ZXN0X3JlbW92ZV9wYWdlKCkgZm9yIGV2ZXJ5IG9uZSBv
ZiB0aGUgcGFnZXMKYWZ0ZXIgYWxsLiBTaW5jZSBpdCBsYXllcnMgb24gdG9wIG9mIC0+c2V0X2Vu
dHJ5KCksIHBlcmhhcHMgaXRzCmNhbGwgc2l0ZSBjb3VsZCBiZSBsZWZ0IGFsb25lLCBidXQgaXRz
IHN0YXRpc3RpY3MgYWRqdXN0bWVudHMgbWF5Cm5lZWQgZHJvcHBpbmcgKG9yIG1vZGlmeWluZykg
d2hlbiB0aGUgZm9ybWVyIGNoYW5nZSBnZXRzCmRvbmUuCgpPdG9oIHdoZW4gdGhpbmdzIGFyZSBw
cm9wZXJseSBsYXllcmVkLCBwZXJoYXBzIGl0J3MgYmV0dGVyIG5vdAp0byBoYXZlIGFueSBzdWNo
ICJieXBhc3NlcyIsIGFuZCB0aGUgZnVuY3Rpb24gd291bGQgdGhlbiBiZXN0CmdvIGF3YXkgYWx0
b2dldGhlcj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
