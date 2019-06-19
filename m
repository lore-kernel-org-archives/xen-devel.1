Return-Path: <SRS0=Lwft=US=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97C5C31E49
	for <xen-devel@archiver.kernel.org>; Wed, 19 Jun 2019 06:39:00 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADCCC2084A
	for <xen-devel@archiver.kernel.org>; Wed, 19 Jun 2019 06:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADCCC2084A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdUEp-0005Hk-JJ; Wed, 19 Jun 2019 06:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdUEn-0005Hf-OP
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 06:38:29 +0000
X-Inumbo-ID: d64f3caa-925c-11e9-a2c6-6f85a9cde014
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d64f3caa-925c-11e9-a2c6-6f85a9cde014;
 Wed, 19 Jun 2019 06:38:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 00:38:23 -0600
Message-Id: <5D09D85A0200007800239800@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 00:38:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B84F8020000780021F248@prv1-mh.provo.novell.com>
 <3ac4dbdd-24fb-a5e8-5848-93cfe4374a49@citrix.com>
 <5CFF80500200007800236EFA@prv1-mh.provo.novell.com>
 <b76883f0-871c-9387-3eee-649aa084d3c6@citrix.com>
In-Reply-To: <b76883f0-871c-9387-3eee-649aa084d3c6@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v8 30/50] x86emul: support AVX512{F,
 _VBMI2} compress/expand insns
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
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE4LjA2LjE5IGF0IDE4OjI0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDYvMjAxOSAxMToyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDEw
LjA2LjE5IGF0IDE2OjUxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+PiBP
biAxNS8wMy8yMDE5IDEwOjU2LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiArI2lmIF9fR05VQ19f
ID4gNyAvKiBjYW4ndCBjaGVjayBmb3IgX19BVlg1MTJWQk1JMl9fIGhlcmUgKi8KPj4+IFdoeSBu
b3Q/Cj4+IEJlY2F1c2UgdGhhdCB3b3VsZCByZXF1aXJlIHBhc3NpbmcgLW1hdng1MTJ2Ym1pMiAo
b3IgZW5hYmxpbmcgdGhlCj4+IGZlYXR1cmUgdmlhICNwcmFnbWEpIHdoaWNoIGluIHR1cm4gd291
bGQgbmVlZCBnYXRpbmcgb24gY29tcGlsZXIKPj4gdmVyc2lvbiwgb3IgZWxzZSB0aGUgaGFybmVz
cyBjb3VsZG4ndCBiZSBidWlsdCB3aXRoIGdjYzcgYXQgYWxsIGFueW1vcmUuCj4gCj4gSXMgdGhh
dCByZWFsbHkgYSBwcm9ibGVtPyAgV2UgYWxyZWFkeSByZXF1aXJlIGEKPiBwcmFjdGljYWxseS1i
bGVlZGluZy1lZGdlIGJpbnV0aWxzLgoKIkJsZWVkaW5nIGVkZ2UiIHdvdWxkIGJlIDIuMzIgb3Ig
bmV3ZXIuIHtldmV4fSBzdXBwb3J0IHdhcyBhZGRlZCBpbgoyLjI5LCB3aGljaCBzb3J0IG9mIG1h
dGNoZXMgdXAgd2l0aCBnY2MgNy4KCj4gSXJyZXNwZWN0aXZlLCBhcmUgeW91IHNheWluZyB0aGF0
IF9fQVZYNTEyVkJNSTJfXyByZWFsbHkgaXMgY29uZGl0aW9uYWwKPiBvbiAtbWF2eDUxMnZibWky
IGJlaW5nIHBhc3NlZD8KClllcy4gSG93IGVsc2Ugd291bGQgeW91IGV4cGVjdCB0aGluZ3MgdG8g
d29yaz8KCj4gSWYgc28sIHdoYXQncyB3cm9uZyB3aXRoIHVzaW5nIGNjLW9wdGlvbiB0byBnYWlu
IGl0IGNvbmRpdGlvbmFsbHk/CgpXZSBkb24ndCB3YW50IHRvIGVuYWJsZSBhbGwgc29ydHMgb2Yg
QVZYLSBhbmQgQVZYNTEyLWlzbXMgaW4gdGhlCmNvbXBpbGF0aW9uLiBCZXNpZGVzIG91ciBpbmxp
bmUgYXNzZW1ibHkgd2Ugc3BlY2lmaWNhbGx5IHdhbnQgdGhlCmNvbXBpbGVyIHRvIG9ubHkgcHJv
ZHVjZSBnZW5lcmljIGNvZGUuIEl0IHdhcyBpbnRlbnRpb25hbCBhZnRlciBhbGwKdGhhdCBmb3Ig
dGhlIG1haW4gaGFybmVzcyBvYmplY3Qgd2UndmUgbmV2ZXIgYWRkZWQgYW55Ci1tPGV4dGVuc2lv
bj4gb3B0aW9uLgoKPj4+PiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4+Pj4gKysrIGIv
eGVuL3Rvb2xzL2dlbi1jcHVpZC5weQo+Pj4+IEBAIC0yNjYsMTAgKzI2NiwxMCBAQCBkZWYgY3J1
bmNoX251bWJlcnMoc3RhdGUpOgo+Pj4+ICAgICAgICAgICAgICAgICAgICBBVlg1MTJCVywgQVZY
NTEyVkwsIEFWWDUxMl80Vk5OSVcsIEFWWDUxMl80Rk1BUFMsCj4+Pj4gICAgICAgICAgICAgICAg
ICAgIEFWWDUxMl9WUE9QQ05URFFdLAo+Pj4+ICAKPj4+PiAtICAgICAgICAjIEFWWDUxMiBleHRl
bnNpb25zIGFjdGluZyBzb2xlbHkgb24gdmVjdG9ycyBvZiBieXRlcy93b3JkcyBhcmUgbWFkZQo+
Pj4+ICsgICAgICAgICMgQVZYNTEyIGV4dGVuc2lvbnMgYWN0aW5nIChzb2xlbHkpIG9uIHZlY3Rv
cnMgb2YgYnl0ZXMvd29yZHMgYXJlIG1hZGUKPj4gQmVjYXVzZSBWQk1JMiBkb2Vzbid0IGFjdCBf
c29sZWx5XyBvbiB2ZWN0b3JzIG9mIGJ5dGVzL3dvcmRzLgo+PiBUaGVyZSBhcmUgYWxzbyBzaGlm
dCBpbnNucyBhY3Rpbmcgb24gdmVjdG9ycyBvZiBkd29yZHMvcXdvcmRzLgo+IAo+IEluIHdoaWNo
IGNhc2UgSSdkIGV4cGVjdCBzL3NvbGVseS8vIGhlcmUuICBQdXR0aW5nIHNvbGVseSBpbiBicmFj
a2V0cwo+IGRvZXNuJ3QgY29udmV5IGFueSBpbmZvcm1hdGlvbiByZWxldmFudCB0byAibm90IHJl
YWxseSBzb2xlbHkgYW55IG1vcmUiLgoKV2VsbCwgb2theS4KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
