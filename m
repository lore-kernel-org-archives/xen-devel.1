Return-Path: <SRS0=31Bo=UK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682F9C4321A
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 12:46:36 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E2920896
	for <xen-devel@archiver.kernel.org>; Tue, 11 Jun 2019 12:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E2920896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hagAT-0007gw-Qj; Tue, 11 Jun 2019 12:46:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TTh1=UK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hagAS-0007gm-Am
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 12:46:24 +0000
X-Inumbo-ID: eadfee21-8c46-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id eadfee21-8c46-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 12:46:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 11 Jun 2019 06:46:22 -0600
Message-Id: <5CFFA29A0200007800237059@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 11 Jun 2019 06:46:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68FA70200007800231B3E@prv1-mh.provo.novell.com>
 <057b0642-c56f-2a0f-98d4-ff2c9184a4d2@citrix.com>
In-Reply-To: <057b0642-c56f-2a0f-98d4-ff2c9184a4d2@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] x86: allow limiting the max C-state
 sub-state
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDEwLjA2LjE5IGF0IDE4OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjMvMDUvMjAxOSAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZyb206IFJv
c3MgTGFnZXJ3YWxsIDxyb3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgo+Pgo+PiBBbGxvdyBsaW1p
dGluZyB0aGUgbWF4IEMtc3RhdGUgc3ViLXN0YXRlIGJ5IGFwcGVuZGluZyB0byB0aGUgbWF4X2Nz
dGF0ZQo+PiBjb21tYW5kLWxpbmUgcGFyYW1ldGVyLiBFLmcuIG1heF9jc3RhdGU9MSwwCj4+IFRo
ZSBsaW1pdCBvbmx5IGFwcGxpZXMgdG8gdGhlIGhpZ2hlc3QgbGVnYWwgQy1zdGF0ZS4gRm9yIGV4
YW1wbGU6Cj4+ICBtYXhfY3N0YXRlID0gMSwgbWF4X2NzdWJzdGF0ZSA9IDAgPT0+IEMwLCBDMSBv
a2F5LCBidXQgbm90IEMxRQo+PiAgbWF4X2NzdGF0ZSA9IDEsIG1heF9jc3Vic3RhdGUgPSAxID09
PiBDMCwgQzEgYW5kIEMxRSBva2F5LCBidXQgbm90IEMyCj4+ICBtYXhfY3N0YXRlID0gMiwgbWF4
X2NzdWJzdGF0ZSA9IDAgPT0+IEMwLCBDMSwgQzFFLCBDMiBva2F5LCBidXQgbm90IEMzCj4+ICBt
YXhfY3N0YXRlID0gMiwgbWF4X2NzdWJzdGF0ZSA9IDEgPT0+IEMwLCBDMSwgQzFFLCBDMiBva2F5
LCBidXQgbm90IEMzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxh
Z2Vyd2FsbEBjaXRyaXguY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gCj4gSXMgdGhpcyBvbmx5IHVzZWZ1bCBpbiBwcmFjdGljZSBmb3IgbGlt
aXRpbmcgQzFFID8KClRoaXMgbWF5IGhhdmUgYmVlbiB0aGUgb3JpZ2luYWwgcHJpbWFyeSBnb2Fs
LCBidXQgaWYgeW91IGxvb2sKYXQgdGhlIHRhYmxlcyBpbiBtd2FpdC1pZGxlLmMgeW91J2xsIGZp
bmQgZnVydGhlciBzdWItc3RhdGVzLgoKPj4gLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvY3B1X2lk
bGUuYwo+PiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCj4+IEBAIC0xMDQsNyAr
MTA0LDE3IEBAIGJvb2wgbGFwaWNfdGltZXJfaW5pdCh2b2lkKQo+PiAgCj4+ICB2b2lkICgqX19y
ZWFkX21vc3RseSBwbV9pZGxlX3NhdmUpKHZvaWQpOwo+PiAgdW5zaWduZWQgaW50IG1heF9jc3Rh
dGUgX19yZWFkX21vc3RseSA9IFVJTlRfTUFYOwo+PiAtaW50ZWdlcl9wYXJhbSgibWF4X2NzdGF0
ZSIsIG1heF9jc3RhdGUpOwo+PiArdW5zaWduZWQgaW50IG1heF9jc3Vic3RhdGUgX19yZWFkX21v
c3RseSA9IFVJTlRfTUFYOwo+PiArCj4+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9jc3RhdGUo
Y29uc3QgY2hhciAqcykKPj4gK3sKPj4gKyAgICBtYXhfY3N0YXRlID0gc2ltcGxlX3N0cnRvdWwo
cywgJnMsIDApOwo+PiArICAgIGlmICggKnMgPT0gJywnICkKPj4gKyAgICAgICAgbWF4X2NzdWJz
dGF0ZSA9IHNpbXBsZV9zdHJ0b3VsKHMgKyAxLCAmcywgMCk7Cj4gCj4gWW91IGNhbiBwYXNzIE5V
TEwgZm9yIGVuZHAsIHNlZWluZyBhcyBpdCBpc24ndCB1c2VkLgoKQWggeWVzLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
