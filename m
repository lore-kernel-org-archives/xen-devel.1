Return-Path: <SRS0=IYHG=ZK=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF31C432C0
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 14:20:12 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3F120659
	for <xen-devel@archiver.kernel.org>; Mon, 18 Nov 2019 14:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3F120659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWhsg-0006Hl-SL; Mon, 18 Nov 2019 14:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2ywg=ZK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iWhsg-0006Hg-49
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 14:19:54 +0000
X-Inumbo-ID: 7c8d6c94-0a0e-11ea-a2d9-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c8d6c94-0a0e-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 14:19:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C189AB2B2;
 Mon, 18 Nov 2019 14:19:51 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
Date: Mon, 18 Nov 2019 15:19:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191118140302.GL72134@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMjAxOSAxNTowMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gTW9uLCBO
b3YgMTgsIDIwMTkgYXQgMDE6MjY6NDZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9u
IDE4LjExLjIwMTkgMTE6MTYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPj4+IEBAIC0xOTU0LDQ4
ICsxOTUyLDI4IEBAIHN0YXRpYyB2b2lkIF9fdm14X2RlbGl2ZXJfcG9zdGVkX2ludGVycnVwdChz
dHJ1Y3QgdmNwdSAqdikKPj4+ICAgICAgICogMi4gVGhlIHRhcmdldCB2Q1BVIGlzIHRoZSBjdXJy
ZW50IHZDUFUgYW5kIHdlJ3JlIGluIG5vbi1pbnRlcnJ1cHQKPj4+ICAgICAgICogY29udGV4dC4K
Pj4+ICAgICAgICovCj4+PiAtICAgIGlmICggcnVubmluZyAmJiAoaW5faXJxKCkgfHwgKHYgIT0g
Y3VycmVudCkpICkKPj4+IC0gICAgewo+Pj4gKyAgICBpZiAoIHZjcHVfcnVubmFibGUodikgJiYg
diAhPSBjdXJyZW50ICkKPj4KPj4gSSdtIGFmcmFpZCB5b3UgbmVlZCB0byBiZSBtb3JlIGNhcmVm
dWwgd2l0aCB0aGUgcnVubmluZyB2cyBydW5uYWJsZQo+PiBkaXN0aW5jdGlvbiBoZXJlLiBUaGUg
Y29tbWVudCBhYm92ZSBoZXJlIGJlY29tZXMgc3RhbGUgd2l0aCB0aGUKPj4gY2hhbmdlIChhbHNv
IHdydCB0aGUgcmVtb3ZhbCBvZiBpbl9pcnEoKSwgd2hpY2ggSSdtIGF0IGxlYXN0IHVuZWFzeQo+
PiBhYm91dCksIGFuZCB0aGUgbmV3IGNvbW1lbnRhcnkgYmVsb3cgYWxzbyBsYXJnZWx5IHNheXMv
YXNzdW1lcwo+PiAicnVubmluZyIsIG5vdCAicnVubmFibGUiLgo+IAo+IEkndmUgbWlzc2VkIHRv
IGZpeCB0aGF0IGNvbW1lbnQsIHdpbGwgdGFrZSBjYXJlIGluIHRoZSBuZXh0IHZlcnNpb24uCj4g
Tm90ZSBhbHNvIHRoYXQgdGhlIGNvbW1lbnQgaXMgcXVpdGUgcG9pbnRsZXNzLCBpdCBvbmx5IHN0
YXRlcyB3aGF0IHRoZQo+IGNvZGUgYmVsb3cgaXMgc3VwcG9zZWQgdG8gZG8sIGJ1dCBkb2Vzbid0
IGdpdmUgYW55IHJlYXNvbmluZyBhcyB0byB3aHkKPiBpbl9pcnEgaXMgcmVsZXZhbnQgaGVyZS4K
Ckl0J3MgbWFpbiAidmFsdWUiIGlzIHRvIHJlZmVyIHRvIHZjcHVfa2ljaygpLCB3aGljaCBoYXMg
Li4uCgo+IFRCSCBJJ20gbm90IHN1cmUgb2YgdGhlIHBvaW50IG9mIHRoZSBpbl9pcnEgY2hlY2ss
IEkgZG9uJ3QgdGhpbmsgaXQncwo+IHJlbGV2YW50IGZvciB0aGUgY29kZSBoZXJlLgoKLi4uIGEg
c2ltaWxhciBpbl9pcnEoKSBjaGVjay4gU2FkbHkgdGhhdCBvbmUsIHdoaWxlIGhhdmluZyBhIGJp
Z2dlcgpjb21tZW50LCBhbHNvIGRvZXNuJ3QgZXhwbGFpbiB3aGF0IGl0J3MgbmVlZGVkIGZvci4g
SXQgbG9va3MgbGlrZSBJCnNob3VsZCByZWNhbGwgdGhlIHJlYXNvbiwgYnV0IEknbSBzb3JyeSAt
IEkgZG9uJ3QgcmlnaHQgbm93LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
