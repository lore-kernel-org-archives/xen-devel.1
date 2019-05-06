Return-Path: <SRS0=pwZ6=TG=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 749FCC04A6B
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 14:26:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B9D720675
	for <xen-devel@archiver.kernel.org>; Mon,  6 May 2019 14:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B9D720675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNeZI-0000ch-QB; Mon, 06 May 2019 14:26:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DZ7u=TG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNeZH-0000cZ-1A
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 14:26:11 +0000
X-Inumbo-ID: dd7f2da6-700a-11e9-b6e3-7fb7b1abad4f
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd7f2da6-700a-11e9-b6e3-7fb7b1abad4f;
 Mon, 06 May 2019 14:25:59 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 06 May 2019 08:25:57 -0600
Message-Id: <5CD043EF020000780022C382@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 06 May 2019 08:25:51 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DF710200007800229EC5@prv1-mh.provo.novell.com>
 <20190506135203.by4dre24krtuy3up@Air-de-Roger>
In-Reply-To: <20190506135203.by4dre24krtuy3up@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 8/9] x86/IRQ: make fixup_irqs() skip
 unconnected internally used interrupts
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190506142551.Fh1xM7YMoDNuI3AqHLpyeTEGKV1GfONgaP5xFpb6tnc@z>

Pj4+IE9uIDA2LjA1LjE5IGF0IDE1OjUyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIE1vbiwgQXByIDI5LCAyMDE5IGF0IDA1OjI2OjQxQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaXJxLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2ly
cS5jCj4+IEBAIC0yNDEyLDggKzI0MTIsMjAgQEAgdm9pZCBmaXh1cF9pcnFzKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgYgo+PiAgICAgICAgICB2ZWN0b3IgPSBpcnFfdG9fdmVjdG9yKGlycSk7Cj4+
ICAgICAgICAgIGlmICggdmVjdG9yID49IEZJUlNUX0hJUFJJT1JJVFlfVkVDVE9SICYmCj4+ICAg
ICAgICAgICAgICAgdmVjdG9yIDw9IExBU1RfSElQUklPUklUWV9WRUNUT1IgKQo+PiArICAgICAg
ICB7Cj4+ICAgICAgICAgICAgICBjcHVtYXNrX2FuZChkZXNjLT5hcmNoLmNwdV9tYXNrLCBkZXNj
LT5hcmNoLmNwdV9tYXNrLCBtYXNrKTsKPj4gIAo+PiArICAgICAgICAgICAgLyoKPj4gKyAgICAg
ICAgICAgICAqIFRoaXMgY2FuIGluIHBhcnRpY3VsYXIgaGFwcGVuIHdoZW4gcGFya2luZyBzZWNv
bmRhcnkgdGhyZWFkcwo+PiArICAgICAgICAgICAgICogZHVyaW5nIGJvb3QgYW5kIHdoZW4gdGhl
IHNlcmlhbCBjb25zb2xlIHdhbnRzIHRvIHVzZSBhIFBDSSBJUlEuCj4+ICsgICAgICAgICAgICAg
Ki8KPj4gKyAgICAgICAgICAgIGlmICggZGVzYy0+aGFuZGxlciA9PSAmbm9faXJxX3R5cGUgKQo+
IAo+IEkgZm91bmQgaXQgd2VpcmQgdGhhdCBhIGlycSBoYXMgYSB2ZWN0b3IgYXNzaWduZWQgKGlu
IHRoaXMgY2FzZSBhCj4gaGlnaC1wcmlvcml0eSB2ZWN0b3IpIGJ1dCBubyBpcnEgdHlwZSBzZXQu
Cj4gCj4gU2hvdWxkbid0IHRoZSB2ZWN0b3IgYmUgYXNzaWduZWQgd2hlbiB0aGUgdHlwZSBpcyBz
ZXQ/CgpJbiBnZW5lcmFsIEkgd291bGQgYWdyZWUsIGJ1dCB0aGUgd2F5IHRoZSBzZXJpYWwgY29u
c29sZSBJUlEKZ2V0cyBzZXQgdXAgaXMgZGlmZmVyZW50IC0gc2VlIHNtcF9pbnRyX2luaXQoKS4g
V2hlbiBpdCdzIGEgUENJCklSUSAoSU8tQVBJQyBwaW4gMTYgb3IgYWJvdmUpLCB3ZSdsbCBrbm93
IGhvdyB0byBwcm9ncmFtCnRoZSBJTy1BUElDIFJURSAoZWRnZS9sZXZlbCwgYWN0aXZpdHkgaGln
aC9sb3cpIG9ubHkgd2hlbgpEb20wIGJvb3RzLCBhbmQgaGVuY2Ugd2UgZG9uJ3Qgc2V0IC0+aGFu
ZGxlciBlYXJseS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
