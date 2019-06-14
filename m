Return-Path: <SRS0=aUBB=UN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CC5C31E4B
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 15:57:02 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD37D2168B
	for <xen-devel@archiver.kernel.org>; Fri, 14 Jun 2019 15:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD37D2168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hboZP-0008Vk-EF; Fri, 14 Jun 2019 15:56:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hboZN-0008Va-Kb
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 15:56:49 +0000
X-Inumbo-ID: 023843b4-8ebd-11e9-a8a2-fb47a2b3af95
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 023843b4-8ebd-11e9-a8a2-fb47a2b3af95;
 Fri, 14 Jun 2019 15:56:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 14 Jun 2019 09:56:44 -0600
Message-Id: <5D03C3B90200007800238676@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 14 Jun 2019 09:56:41 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5C80F130020000780021C602@prv1-mh.provo.novell.com>
 <5C80F32C020000780021C626@prv1-mh.provo.novell.com>
 <5C80F32C0200000000103FF7@prv1-mh.provo.novell.com>
 <5C80F32C0200007800232900@prv1-mh.provo.novell.com>
 <5C80F32C0200000000104D67@prv1-mh.provo.novell.com>
 <5C80F32C0200007800238665@prv1-mh.provo.novell.com>
In-Reply-To: <5C80F32C0200007800238665@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH 2/2] x86/mtrr: fix build with gcc9
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
Cc: Charles Arnold <CARNOLD@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjAzLjE5IGF0IDExOjMyLCAgd3JvdGU6Cj4gZ2VuZXJpYy5jOiBJbiBmdW5jdGlv
biDigJhwcmludF9tdHJyX3N0YXRl4oCZOgo+IGdlbmVyaWMuYzoyMTA6MTE6IGVycm9yOiDigJgl
MCpseOKAmSBkaXJlY3RpdmUgb3V0cHV0IGJldHdlZW4gMSBhbmQgMTA3Mzc0MTgyMyAKPiBieXRl
cyBtYXkgY2F1c2UgcmVzdWx0IHRvIGV4Y2VlZCDigJhJTlRfTUFY4oCZIFstV2Vycm9yPWZvcm1h
dC1vdmVyZmxvdz1dCj4gICAyMTAgfCAgICBwcmludGsoIiVzICAldSBiYXNlICUwKiJQUkl4NjQi
MDAwIG1hc2sgJTAqIlBSSXg2NCIwMDAgJXNcbiIsCj4gICAgICAgfCAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn4KPiBnZW5lcmljLmM6MjEwOjQ0OiBub3RlOiBmb3JtYXQgc3RyaW5nIGlzIGRl
ZmluZWQgaGVyZQo+ICAgMjEwIHwgICAgcHJpbnRrKCIlcyAgJXUgYmFzZSAlMCoiUFJJeDY0IjAw
MCBtYXNrICUwKiJQUkl4NjQiMDAwICVzXG4iLAo+IGdlbmVyaWMuYzoyMTA6MTE6IG5vdGU6IGRp
cmVjdGl2ZSBhcmd1bWVudCBpbiB0aGUgcmFuZ2UgWzAsIAo+IDQ1MDM1OTk2MjczNzA0OTVdCj4g
ICAyMTAgfCAgICBwcmludGsoIiVzICAldSBiYXNlICUwKiJQUkl4NjQiMDAwIG1hc2sgJTAqIlBS
SXg2NCIwMDAgJXNcbiIsCj4gICAgICAgfCAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn4KPiBn
ZW5lcmljLmM6MjEwOjExOiBub3RlOiBhc3N1bWluZyBkaXJlY3RpdmUgb3V0cHV0IG9mIDEgYnl0
ZQo+IAo+IFJlc3RyaWN0IHRoZSB3aWR0aCBvZiB0aGUgdmFyaWFibGUgIndpZHRoIiBjb250cm9s
bGluZyB0aGUgbnVtYmVyIG9mCj4gYWRkcmVzcyBkaWdpdHMgb3V0cHV0Lgo+IAo+IFJlcG9ydGVk
LWJ5OiBDaGFybGVzIEFybm9sZCA8Y2Fybm9sZEBzdXNlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpUaGlzIG9uZSdzIHN0aWxsIHBlbmRpbmcg
Zm9yIHVzIHRvIGJ1aWxkIGNsZWFubHkgd2l0aCBnY2MgOS4gSSBrbm93CnlvdSdkIGxpa2UgaXQg
YmUgZG9uZSBkaWZmZXJlbnRseSwgYnV0IEknbSBub3QgaGFwcHkgd2l0aCB0aGUKaW1wbGljYXRp
b25zIG9mIHlvdXIgc3VnZ2VzdGlvbiwgYW5kIEkndmUgZXhwbGFpbmVkIHdoeS4gSSB3b3VsZAoo
aGVzaXRhbnRseSwgaS5lLiBqdXN0IHRvIGdldCB0aGUgYnVpbGQgaXNzdWUgb3V0IG9mIHRoZSB3
YXkpIGFjawp5b3VyIHZhcmlhbnQgaWYgeW91IHN1Ym1pdHRlZCBpdCwgYnV0IEknZCBhcHByZWNp
YXRlIGlmIHlvdSB3b3VsZApyZS1jb25zaWRlciB3aGV0aGVyIHlvdSBjb3VsZCBsaXZlIHdpdGgg
Z29pbmcgd2l0aCB0aGUgb25lIGhlcmUuCgpKYW4KCj4gLS0tIGEveGVuL2FyY2gveDg2L2NwdS9t
dHJyL2dlbmVyaWMuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHUvbXRyci9nZW5lcmljLmMKPiBA
QCAtMTgyLDcgKzE4Miw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9maXhlZCh1bnNpZ25l
ZAo+ICBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfbXRycl9zdGF0ZShjb25zdCBjaGFyICpsZXZl
bCkKPiAgewo+ICAJdW5zaWduZWQgaW50IGk7Cj4gLQlpbnQgd2lkdGg7Cj4gKwl1bnNpZ25lZCBj
aGFyIHdpZHRoOyAvKiBnY2M5IGRvZXNuJ3QgbGlrZSBwbGFpbiAiaW50IiBoZXJlICovCj4gIAo+
ICAJcHJpbnRrKCIlc01UUlIgZGVmYXVsdCB0eXBlOiAlc1xuIiwgbGV2ZWwsCj4gIAkgICAgICAg
bXRycl9hdHRyaWJfdG9fc3RyKG10cnJfc3RhdGUuZGVmX3R5cGUpKTsKPiAKPiAKCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
