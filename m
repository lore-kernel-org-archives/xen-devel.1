Return-Path: <SRS0=M2I+=XV=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C2B5C4360D
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 07:44:33 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E42EF222C0
	for <xen-devel@archiver.kernel.org>; Thu, 26 Sep 2019 07:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E42EF222C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDORf-000879-RQ; Thu, 26 Sep 2019 07:44:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDORe-000874-Gr
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 07:44:10 +0000
X-Inumbo-ID: 6c481386-e031-11e9-9647-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6c481386-e031-11e9-9647-12813bfff9fa;
 Thu, 26 Sep 2019 07:44:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16C3DAEA5;
 Thu, 26 Sep 2019 07:44:08 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>
References: <CAMmSBy-seCk9rW3GM3Aij1O+F2AtmQR1Yrxb180Wndqd3hATcw@mail.gmail.com>
 <0bc03d80-0696-8c5b-2189-24509c7ea3e6@suse.com>
 <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f23f1805-52fa-7d0f-7423-35bf644277dd@suse.com>
Date: Thu, 26 Sep 2019 09:44:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy-41DseRA7MjY=Ux1r99VwFG7B2LHe-Udv+5KxURfbr2A@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Latest development (master) Xen fails to boot on HP
 ProLiant DL20 GEN10
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAwMDozMSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBKYW4sIFJvZ2Vy
LCB0aGFuayB5b3Ugc28gbXVjaCBmb3IgdGhlIGluaXRpYWwgaWRlYXMuIEkgdHJpZWQgYSBmZXcg
b2YKPiB0aG9zZSBhbmQgaGVyZSdzIHdoZXJlIEkgYW0uCj4gCj4gRmlyc3Qgb2YgYWxsLCBpdCBp
cyBkZWZpbml0ZWx5IHJlbGF0ZWQgdG8gQ1BVIGJyaW5nIHVwLiBBZGRpbmcKPiBjcHVpZGxlPTAg
dG8geGVuIGNvbW1hbmQgbGluZSBtYWRlIFhlbiBib290Lgo+IAo+IFRoZW4sIGEgZ29vZCBmcmll
bmQgb2YgbWluZSAod2hvIHlvdSBtYXkga25vdyBmcm9tIGFuY2llbnQgWGVuIGRheXMKPiA7LSkp
IHN1Z2dlc3RlZCB0aGF0IHRoaXMgY291bGQgYmUgcmVsYXRlZCB0byB0aGlzOgo+ICAgICAgaHR0
cHM6Ly93aWtpLnhlbnByb2plY3Qub3JnL3dpa2kvWGVuX3Bvd2VyX21hbmFnZW1lbnQKPiBzbyBJ
IHdlbnQgdG8gdGhlIEJJT1Mgc2V0dGluZ3MgYW5kIHF1aXRlIHRvIG15IHN1cnByaXNlIGFsbCBv
ZiB0aGVtCj4gd2VyZSBncmF5ZWQgb3V0IChub3QgdHdlYWthYmxlKS4KPiAKPiBUaGUgb25seSBv
bmUgdGhhdCB3YXNuJ3Qgd2FzIDJ4QVBJQyBzdXBwb3J0LiBTbyBqdXN0IGZvciBraWNrcyAtLSBJ
Cj4gZGlzYWJsZWQgdGhhdC4KPiAKPiBUaGF0LCBpbiB0dXJuLCBtYWRlIFhlbiBib290IGV2ZW4g
d2l0aG91dCBjcHVpZGxlPTAuIEknbSBhdHRhY2hpbmcgdGhhdCBsb2cuCgpJbnRlcmVzdGluZywg
YnV0IHVuZm9ydHVuYXRlbHkgdGhpcyBwYXJ0aWN1bGFyIGxvZyBpcyBvZiBubyByZWFsIHVzZQpm
b3IgaW52ZXN0aWdhdGlvbiBvZiB0aGUgaXNzdWUgKG90aGVyIHRoYW4ga25vd2luZyB0aGUgQ1BV
IG1vZGVsKS4gSQphbHNvIG5vdGljZSBpdCdzIGEgNC4xMi4wIGxvZywgd2hlbiB5b3VyIG9yaWdp
bmFsIHJlcG9ydCB3YXMgYWdhaW5zdApsYXRlc3QgbWFzdGVyLgoKPiBTbyBJIGd1ZXNzIGF0IHRo
aXMgcG9pbnQsIHlvdSBjb3VsZCBzYXkgdGhhdCBJIGhhdmUgYSBmdW5jdGlvbmFsCj4gc3lzdGVt
LCBidXQgSSdtIGN1cmlvdXMgd2hldGhlciB5b3UgZ3V5cyB3b3VsZCBiZSBpbnRlcmVzdGVkIHRv
IGxvb2sKPiBpbnRvIDJ4QVBJQyBzaXR1YXRpb24uCgpPZiBjb3Vyc2Ugd2UgZG8uIEFzIGEgbmV4
dCBzdGVwIEknZCBzdWdnZXN0IHJldmVydGluZyB0aGUgQklPUyBzZXR0aW5ncwpjaGFuZ2UgeW91
IGRpZCwgYW5kIGluc3RlYWQgdXNpbmcgdGhlICJ4MmFwaWM9MCIgWGVuIGNvbW1hbmQgbGluZSBv
cHRpb24uCgpBbmQgdGhlbiB3ZSBvZiBjb3Vyc2UgbmVlZCBhIGNvbXBsZXRlIGJvb3QgbG9nIChh
cyByZXF1ZXN0ZWQgZWFybGllcikgb2YKYSBwcm9ibGVtIGNhc2UuCgpGdXJ0aGVyIEknZCBzdWdn
ZXN0IG1vdmluZyBhd2F5IGZyb20gdGhlIGJsYWNrLWFuZC13aGl0ZSAiY3B1aWRsZT0iCm9wdGlv
biwgYW5kIGluc3RlYWQgbGltaXRpbmcgdXNlIG9mIGRlZXAgQyBzdGF0ZXMgKCJtYXhfY3N0YXRl
PSIpLiBJCndvdWxkbid0IGJlIHN1cnByaXNlZCBpZiB0aGlzIHdhcyB0aGUgaXNzdWU7IHdlJ2Qg
dGhlbiBoYXZlIHRvIGZpcnN0Cm9mIGFsbCBnbyB0aHJvdWdoIGVycmF0YSBmb3IgdGhlIHBhcnQg
eW91ciBzeXN0ZW0gaXMgdXNpbmcuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
