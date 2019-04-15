Return-Path: <SRS0=MmA3=SR=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD6BFC10F0E
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 09:38:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B549A20675
	for <xen-devel@archiver.kernel.org>; Mon, 15 Apr 2019 09:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B549A20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=citrix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hFy3k-0006rb-DW; Mon, 15 Apr 2019 09:37:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=n0ti=SR=citrix.com=prvs=001605e3c=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hFy3j-0006rW-5X
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2019 09:37:51 +0000
X-Inumbo-ID: 21e6eb95-5f62-11e9-92d7-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 21e6eb95-5f62-11e9-92d7-bc764e045a96;
 Mon, 15 Apr 2019 09:37:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,353,1549929600"; d="scan'208";a="83560937"
Date: Mon, 15 Apr 2019 10:36:32 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Kevin Buckley <kevin.buckley.ecs.vuw.ac.nz@gmail.com>
Message-ID: <20190415093632.GN30543@zion.uk.xensource.com>
References: <CABwOO=dhCrnZpRNpLr7rDrNdSh9GCH=fqq_50+YScWT4BE-xjQ@mail.gmail.com>
 <20190411102843.GE30543@zion.uk.xensource.com>
 <CABwOO=cOxxk7sbscGRzZ1LuiH8JJnCoBJ2d19ZmaSeu5DBi6iw@mail.gmail.com>
 <20190415092358.GM30543@zion.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190415092358.GM30543@zion.uk.xensource.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen commit 9b0bc91b3 possibly removed too much info
 from README
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190415093632.q58WbSp_uQx7PjFSXbtADcaY9l4pc9jwXM159NkcHj0@z>

T24gTW9uLCBBcHIgMTUsIDIwMTkgYXQgMTA6MjM6NThBTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiA+IDIpCj4gPiAKPiA+IEluIHRoZSB0b3AtbGV2ZWwgSU5TVEFMTCBmaWxlLCB3ZSByZWFkCj4g
PiAKPiA+IC0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0t
LS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tCj4gPiBTTUJJT1NfUkVMX0RBVEU9bW0vZGQv
eXl5eQo+ID4gVkdBQklPU19SRUxfREFURT0iZGQgTW9uIHl5eXkiCj4gPiAKPiA+IER1cmluZyB0
b29scyBidWlsZCBleHRlcm5hbCByZXBvcyB3aWxsIGJlIGNsb25lZCBpbnRvIHRoZSBzb3VyY2Ug
dHJlZS4KPiA+IFRoaXMgdmFyaWFibGUgY2FuIGJlIHVzZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJl
bnQgZ2l0IGJpbmFyeSB0byBiZSB1c2VkLgo+ID4gR0lUPQo+ID4gCj4gPiBEdXJpbmcgdG9vbHMg
YnVpbGQgZXh0ZXJuYWwgcmVwb3Mgd2lsbCBiZSBjbG9uZWQgaW50byB0aGUgc291cmNlIHRyZWUu
Cj4gPiBEdXJpbmcgc3R1YmRvbSBidWlsZCBleHRlcm5hbCBwYWNrYWdlcyB3aWxsIGJlIGRvd25s
b2FkZWQgaW50byB0aGUKPiA+IHNvdXJjZSB0cmVlLiBUaGVzZSB2YXJpYWJsZXMgY2FuIGJlIHVz
ZWQgdG8gcG9pbnQgdG8gYSBkaWZmZXJlbnQKPiA+IGxvY2F0aW9ucy4KPiA+IFhFTl9FWFRGSUxF
U19VUkw9Cj4gPiBPVk1GX1VQU1RSRUFNX1VSTD0KPiA+IC0tLS04PC0tLS0tLS0tODwtLS0tLS0t
LTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0tLS0tLTg8LS0tLS0tLS04PC0tLS0tLS0tODwtLS0t
Cj4gPiAKPiA+IElzIHRoYXQgc2Vjb25kCj4gPiAKPiA+ICAgIER1cmluZyB0b29scyBidWlsZCBl
eHRlcm5hbCByZXBvcyB3aWxsIGJlIGNsb25lZCBpbnRvIHRoZSBzb3VyY2UgdHJlZS4KPiA+IAo+
ID4gYWJvdmUgdGhlCj4gPiAKPiA+ICAgIER1cmluZyBzdHViZG9tIGJ1aWxkCj4gCj4gVGhpcyBp
cyBhIGJpdCB4ZW4gc3BlY2lmaWMgLS0gd2UgY29uc2lkZXIgc3R1YmRvbSBhbmQgdG9vbHMgdHdv
IHNlcGFyYXRlCj4gY29tcG9uZW50cyBpbnNpZGUgeGVuLmdpdCBiZWNhdXNlIHRoZXkgaGF2ZSB0
aGVpciBvd24gZGlyZWN0b3JpZXMuCj4gCj4gVGhhdCBzZW50ZW5jZSBjYW4gaW5kZWVkIGJlIHNp
bXBsaWZpZWQuIEkgd2lsbCBzdWJtaXQgYSBwYXRjaCBmb3IgdGhhdC4KCk9oIHdhaXQsIEkgZG9u
J3QgdGhpbmsgdGhlcmUgaXMgYW55dGhpbmcgdG8gZml4IHRoZXJlLiBUaG9zZSBzZW50ZW5jZXMK
bG9vayByZXBldGl0aXZlIGJ1dCB0aGV5IGRvIHNheSBkaWZmZXJlbnQgdGhpbmdzOiBpbiB0b29s
cyBjYXNlLCBpdCBzYXlzCiJyZXBvcyB3aWxsIGJlIGNsb25lZCI7IGluIHN0dWJkb20gY2FzZSwg
aXQgc2F5cyAiZXh0ZXJuYWwgcGFja2FnZXMKd2lsbCBiZSBkb3dubG9hZGVkLiBTbyB0aGV5IGRv
IHJlZmxlY3QgY29ycmVjdGx5IHdoYXQgd2lsbCBoYXBwZW4uCgpXZWkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
