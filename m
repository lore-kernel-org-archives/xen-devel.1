Return-Path: <SRS0=Lwft=US=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A92C31E49
	for <xen-devel@archiver.kernel.org>; Wed, 19 Jun 2019 12:57:27 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 513DC20645
	for <xen-devel@archiver.kernel.org>; Wed, 19 Jun 2019 12:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 513DC20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hda9G-0005gG-KQ; Wed, 19 Jun 2019 12:57:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hda9F-0005gB-71
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 12:57:09 +0000
X-Inumbo-ID: be85064d-9291-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id be85064d-9291-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 12:57:07 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 06:57:07 -0600
Message-Id: <5D0A31210200007800239AC0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 06:57:05 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
In-Reply-To: <20190619110250.18881-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDEzOjAyLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IElmIHRoZSBoeXBlcnZpc29yIGhhcyBiZWVuIGJ1aWx0IHdpdGggRUZJIHN1cHBvcnQgKGllOiBt
dWx0aWJvb3QyKS4KPiBUaGlzIGFsbG93cyB0byBwb3NpdGlvbiB0aGUgLnJlbG9jIHNlY3Rpb24g
Y29ycmVjdGx5IGluIHRoZSBvdXRwdXQKPiBiaW5hcnksIG9yIGVsc2UgdGhlIGxpbmtlciBtaWdo
dCBwbGFjZSAucmVsb2MgYmVmb3JlIHRoZSAudGV4dAo+IHNlY3Rpb24uCj4gCj4gTm90ZSB0aGF0
IHRoZSAucmVsb2Mgc2VjdGlvbiBpcyBtb3ZlZCBiZWZvcmUgLmJzcyBmb3IgdHdvIHJlYXNvbnM6
IGluCj4gb3JkZXIgZm9yIHRoZSByZXN1bHRpbmcgYmluYXJ5IHRvIG5vdCBjb250YWluIGFueSBz
ZWN0aW9uIHdpdGggZGF0YQo+IGFmdGVyIC5ic3MsIHNvIHRoYXQgdGhlIGZpbGUgc2l6ZSBjYW4g
YmUgc21hbGxlciB0aGFuIHRoZSBsb2FkZWQKPiBtZW1vcnkgc2l6ZSwgYW5kIGJlY2F1c2UgdGhl
IGRhdGEgaXQgY29udGFpbnMgaXMgcmVhZC1vbmx5LCBzbyBpdAo+IGJlbG9uZ3Mgd2l0aCB0aGUg
b3RoZXIgc2VjdGlvbnMgY29udGFpbmluZyByZWFkLW9ubHkgZGF0YS4KCldoaWxlIHRoaXMgbWF5
IGJlIGZpbmUgZm9yIEVMRiwgSSdtIGFmcmFpZCBpdCB3b3VsZCBiZSBjYWxsaW5nIGZvcgpzdWJ0
bGUgaXNzdWVzIHdpdGggeGVuLmVmaSAoaS5lLiB0aGUgUEUgYmluYXJ5KTogVGhlcmUgYSAucmVs
b2MKc2VjdGlvbiBpcyBnZW5lcmFsbHkgZXhwZWN0ZWQgdG8gY29tZSBhZnRlciAibm9ybWFsIiBk
YXRhCnNlY3Rpb25zLgoKT24gdGhlIHdob2xlLCBzZWVpbmcgYWxsIHRoZXNlIGFkanVzdG1lbnRz
IGZvciBhIGxpbmtlciBiZWhhdmlvcgpJJ20gdGVtcHRlZCB0byBjYWxsIGJ1Z2d5LCBJJ20gbm90
IHN1cmUgd2hldGhlciB3ZSBzaG91bGRuJ3QKaW5zdGVhZCBkZWNsYXJlIHRoaXMgbGlua2VyIHZl
cnNpb24gYXMgdW51c2FibGUgd2l0aCBYZW4uIEkgY2FuJ3QKaW1hZ2luZSB0aGF0IHRoZXkncmUg
Z29pbmcgdG8gbGVhdmUgaXQgYXMgaXQgaXMgcmlnaHQgbm93LgoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
