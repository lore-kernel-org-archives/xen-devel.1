Return-Path: <SRS0=xXFq=X4=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF74CC4CED1
	for <xen-devel@archiver.kernel.org>; Thu,  3 Oct 2019 17:09:21 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858B320865
	for <xen-devel@archiver.kernel.org>; Thu,  3 Oct 2019 17:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858B320865
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG4ay-0003bc-Az; Thu, 03 Oct 2019 17:08:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iG4ax-0003bX-Mc
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 17:08:51 +0000
X-Inumbo-ID: 769baf9e-e600-11e9-9bee-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 769baf9e-e600-11e9-9bee-bc764e2007e4;
 Thu, 03 Oct 2019 17:08:47 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BD1F1000;
 Thu,  3 Oct 2019 10:08:47 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C03C23F739;
 Thu,  3 Oct 2019 10:08:46 -0700 (PDT)
To: Brian Woods <brian.woods@xilinx.com>
References: <20191002003228.GA3940@xilinx.com>
 <48c9fc54-553e-3b6b-bad2-dbad35991df0@arm.com>
 <b02aeec5-b90f-d330-a504-0ab0e6ff86c9@arm.com>
 <20191002185617.GA2644@xilinx.com>
 <75d64b52-7bea-3349-e45f-44c8bce86d6e@arm.com>
 <20191002212249.GB2644@xilinx.com> <20191002232017.GC2644@xilinx.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ade177bc-003f-edcc-47fe-d1014d638990@arm.com>
Date: Thu, 3 Oct 2019 18:08:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002232017.GC2644@xilinx.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Errors with Loading Xen at a Certain Address
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8xMC8yMDE5IDAwOjIwLCBCcmlhbiBXb29kcyB3cm90ZToKPiBPbiBXZWQsIE9j
dCAwMiwgMjAxOSBhdCAwMjoyMjo0OVBNIC0wNzAwLCBCcmlhbiBXb29kcyB3cm90ZToKPj4gT24g
V2VkLCBPY3QgMDIsIDIwMTkgYXQgMDg6NTk6MjhQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+Pj4gSGksCj4+Pgo+Pj4gT24gMTAvMi8xOSA3OjU2IFBNLCBCcmlhbiBXb29kcyB3cm90ZToK
Pj4+Cj4+PiBIbW1tLCB0aGUgZmlyc3QgZS1tYWlsIGRpZG4ndCBsYW5kIGluIG15IGluYm94IGRp
cmVjdGx5IChJIGhhdmUgYSBmaWx0ZXIKPj4+IHNlbmQgdG8gYSBzZXBhcmF0ZSBkaXJlY3Rvcnkg
YW55IGUtbWFpbCBJIG5vdCBDQ2VkIG9uKS4gRGlkIHlvdSBCQ0MgbWUgYnkKPj4+IGFueSBjaGFu
Z2U/Cj4+IFRoYXQncyBvZGQuICBJIGtub3cgSSBjb3BpZWQgeW91ciBhbmQgU3RlZmFubydzIGVt
YWlsIGFkZHJlc3NlcyBmcm9tIHRoZQo+PiBNQUlOVEFJTkVSUyBmaWxlIGJ1dCB1bmRlciBteSBz
ZW50IGVtYWlscyBpdCBzaG93cyBpdCBoYXMgaGF2aW5nIG5vCj4+IENDcy4uLiAgUEVCQ0FLIEkg
Z3Vlc3MuICBNeSBhcG9sb2dpZXMuCj4+Pgo+Pj4gTGV0IHNlZSB0cnkgdG8gdHJvdWJsZXNob290
IGl0IGZpcnN0IDopLgo+Pj4KPj4+IFdlbGwsIGFueSBhdHRhY2htZW50IHlvdSBzZW5kIG9uIHRo
ZSBNTCB3aWxsIHN0b3JlIHRvIGVhY2ggc3Vic2NyaWJlcnMKPj4+IG1haWxib3guIEkgbGV0IHlv
dSBkbyB0aGUgbWF0aCBoZXJlIDspCj4+Pgo+Pj4gU28geWVhaCwgcGFzdGViaW4gaXMgYWx3YXlz
IHRoZSBwcmVmZXJyZWQgd2F5IHdoZW4geW91IGhhdmUgdG8gc2VuZCB0aGUgZnVsbAo+Pj4gbG9n
Lgo+Pj4KPj4+IFRoYW5rIHlvdSBmb3IgdGhlIGxvZy4gU28gdGhhdCdzIHByb2JhYmx5IG5vdCBh
IGRvdWJsZS1pbml0IHRoZW4uCj4+Pgo+Pj4gTG9va2luZyBiYWNrIGF0IHRoZSBsb2csIHRoZSB2
YWx1ZXMgbG9vayBxdWl0ZSBzYW5lLiBTbyBJIGFtIG5vdCBlbnRpcmVseQo+Pj4gc3VyZSB3aGF0
IGlzIGhhcHBlbmluZy4KPj4+Cj4+PiBJIHdvdWxkIGNoZWNrIHRoYXQgdGhlIGZyYW1ldGFibGUg
aXMgY29ycmVjdGx5IHplcm9lZC4gWW91IGNvdWxkIGFkZCBhIHByaW50Cj4+PiBhdCB0aGUgZW5k
IG9mIHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MoLi4uKSB0byBkdW1wIHRoZSBjb3VudF9pbmZv
IGZvciB0aGUKPj4+IHBhZ2UuIFNvbWV0aGluZyBsaWtlOgo+Pj4gICAgICAgbWZuX3RvX3BhZ2Uo
X21mbigweDAxNTMzKSktPmNvdW50X2luZm87Cj4+Pgo+Pj4gSWYgaXQgaXMgY29ycmVjdGx5IGlu
aXRpYWxpemVkLCBpdCBzaG91bGQgYmUgemVyby4KPj4+Cj4+PiBUaGUgbmV4dCBzdGVwIHdvdWxk
IGJlIHRvIGFkZCBhIHNpbWlsYXIgcHJpbnQgaW4gc3RhcnRfeGVuKCkKPj4+ICh4ZW4vYXJjaC9h
cm0vc2V0dXAuYykgYW5kIHNlZSB3aGVyZSB0aGUgdmFsdWUgaXMgbm90IDAgYW55bW9yZS4KPj4+
Cj4+PiBDaGVlcnMsCj4+Pgo+Pj4gLS0gCj4+PiBKdWxpZW4gR3JhbGwKPj4KPj4gSSdsbCBnbyBh
aGVhZCBhZGQgdGhvc2UgYW5kIHNlZSBpZiB0aGF0IGxlYWRzIHRvIGFueXRoaW5nLgo+Pgo+PiAt
LSAKPj4gQnJpYW4gV29vZHMKPiAKPiBPaywgSSBhZGRlZDoKPiAJcHJpbnRrKCJCV19ERUJVRzog
MDEgY291bnRfaW5mbz0weCUwMTZseFxuIiwKPiAJICAgIG1mbl90b19wYWdlKF9tZm4oMHgwMTUz
MykpLT5jb3VudF9pbmZvKTsKPiBJbiBzb21lIHBsYWNlcy4gIEknbSBub3Qgc3VyZSBhYm91dCBz
b21lIG9mIHRoZSBlYXJsaWVyIG9uZXMgKHRoZSBvbmVzCj4gYmVmb3JlIHRoZSBVQVJUIGlzIHNl
dCB1cCksICBidXQgYWxsIG9mIHRoZSBvbmVzIGFmdGVyd2FyZHMgdGhhdAo+IGFjdHVhbGx5IGdl
dCBvdXRwdXQgYXJlOgo+IAlCV19ERUJVRzogMTEgY291bnRfaW5mbz0weDAxODAwMDAwMDAwMDAw
MDAKPiAKPiBJcyBpdCB3b3J0aCB0cnlpbmcgdG8gZmlndXJlIG91dCB3aGVyZSB0aGUgcHJpbnRr
IGJ1ZmZlciBpcyBhbmQgcmVhZGluZwo+IGl0IHJlYWxseSBlYXJseSBvbj8KPiAKCklmIHlvdSBo
YXZlbid0IGVuYWJsZSBFQVJMWV9QUklOVEsgaW4gWGVuLCB0aGVuIHlvdSBtYXkgd2FudCB0byBk
byBpdC4gVGhpcyAKd291bGQgaGVscCB5b3UgdG8gdW5kZXJzdGFuZCB3aGVyZSB0aGUgcGFnZS0+
Y291bnRfaW5mbyBpcyBub3QgemVyb2VkLgoKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
