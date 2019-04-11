Return-Path: <SRS0=7RrO=SN=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD7AC10F13
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:29:04 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCA7D2083E
	for <xen-devel@archiver.kernel.org>; Thu, 11 Apr 2019 13:29:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="q4gm2mXG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCA7D2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hEZkz-0003Oo-E5; Thu, 11 Apr 2019 13:28:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O6VX=SN=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hEZkx-0003Oj-Qq
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2019 13:28:43 +0000
X-Inumbo-ID: b94c341f-5c5d-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b94c341f-5c5d-11e9-92d7-bc764e045a96;
 Thu, 11 Apr 2019 13:28:42 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1554989322; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=/GXgriQ3Zxa+GnBfaz0UYaRYCqMuBofuCXk4hvxp16k=;
 b=q4gm2mXGoaPJcxqzroCfS1skX9OuXQh0veSYgPM6aHatKZV0tHIhMlzuIFznri5dtbiPk+M5
 LKzB0qGGP7/y8vQqiS7PpQMBrmkO2pB85ZvCVh+o/Yo1StX/JHNsVDCEY+mi/da50sQzFKwm
 psoIZZv4DIb2e5wxLaZkc8Jdhn8=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mxa.mailgun.org with ESMTP id 5caf4109.7f52824ff2b0-smtp-out-n02;
 Thu, 11 Apr 2019 13:28:41 -0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id h4so7365377wre.7
 for <xen-devel@lists.xenproject.org>; Thu, 11 Apr 2019 06:28:41 -0700 (PDT)
X-Gm-Message-State: APjAAAUme69B6CzscXfUqbJuPD/17oobZ/qygSVJrhEikiQcW/fTkIY/
 VYFGRXhU/eO9wYLVxtQ4VJ4IBvS3VC39Z3z1IUA=
X-Google-Smtp-Source: APXvYqyTu+zmZ3nAyECNJvTCkCsf41hN1ZHB+AHxwMplOWFDW4eySrxvj5/OZj1zA6EDstUz0nCPmM6+PT92AFgSstE=
X-Received: by 2002:adf:f70e:: with SMTP id r14mr31383340wrp.37.1554989320118; 
 Thu, 11 Apr 2019 06:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <28c52232-536f-d007-4072-fbce95b44d8c@citrix.com>
 <7a64b16b-b7df-2af8-219b-5d3c4a3bf381@bitdefender.com>
 <21a454d7-fc0e-5d44-9991-680582752989@citrix.com>
In-Reply-To: <21a454d7-fc0e-5d44-9991-680582752989@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 11 Apr 2019 07:28:03 -0600
X-Gmail-Original-Message-ID: <CABfawhkn-uSRtNWpSJKxoz0dFcxmDupVhOg1FxYWca9eRx1wTA@mail.gmail.com>
Message-ID:
 <CABfawhkn-uSRtNWpSJKxoz0dFcxmDupVhOg1FxYWca9eRx1wTA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v3 1/3] x86/mm: Introduce
 altp2m_get_gfn_type_access
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
Cc: "wei.liu2@citrix.com" <wei.liu2@citrix.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190411132803.0rxFuP7N2mox3f3ZKfzI0O5Zjc7pTNpEtWJFOP7_x-8@z>

T24gVGh1LCBBcHIgMTEsIDIwMTkgYXQgNjo1MCBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xMS8xOSAxOjE3IFBNLCBBbGV4YW5kcnUg
U3RlZmFuIElTQUlMQSB3cm90ZToKPiA+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4+PiBpbmRleCBiOWJiYjhmNDg1Li5kMzhk
N2MyOWNhIDEwMDY0NAo+ID4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+Pj4gKysr
IGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gPj4+IEBAIC0yNjI2LDYgKzI2MjYsNyBAQCBpbnQg
cDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgs
Cj4gPj4+ICAgICAgIG1mbl90IG1mbjsKPiA+Pj4gICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3Jk
ZXI7Cj4gPj4+ICAgICAgIGludCByYyA9IC1FSU5WQUw7Cj4gPj4+ICsgICAgYm9vbCBjb3BpZWRf
ZnJvbV9ob3N0cDJtOwo+ID4+Pgo+ID4+PiAgICAgICBpZiAoIGlkeCA+PSBNQVhfQUxUUDJNIHx8
IGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+ID4+PiAg
ICAgICAgICAgcmV0dXJuIHJjOwo+ID4+PiBAQCAtMjYzNiw3ICsyNjM3LDcgQEAgaW50IHAybV9j
aGFuZ2VfYWx0cDJtX2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4LAo+ID4+
PiAgICAgICBwMm1fbG9jayhocDJtKTsKPiA+Pj4gICAgICAgcDJtX2xvY2soYXAybSk7Cj4gPj4+
Cj4gPj4+IC0gICAgbWZuID0gYXAybS0+Z2V0X2VudHJ5KGFwMm0sIG9sZF9nZm4sICZ0LCAmYSwg
MCwgTlVMTCwgTlVMTCk7Cj4gPj4+ICsgICAgbWZuID0gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nl
c3MoYXAybSwgb2xkX2dmbiwgJnQsICZhLCAmcGFnZV9vcmRlciwgJmNvcGllZF9mcm9tX2hvc3Rw
Mm0pOwo+ID4+Cj4gPj4gQmVmb3JlLCBpZiBuZXdfZ2ZuIHdhcyBJTlZBTElEX0dGTiwgdGhlbiB0
aGUgaG9zdCBwMm0gd2Fzbid0IHJlYWQgYXQKPiA+PiBhbGwuICBOb3csIHRoZSBob3N0cDJtIHdp
bGwgaGF2ZSBfX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSBjYWxsZWQgd2l0aAo+ID4+IFAyTV9BTExP
QyB8IFAyTV9VTlNIQVJFLiAgSXMgdGhhdCBjaGFuZ2UgaW50ZW50aW9uYWwsIGFuZCBpZiBzbywg
d2h5Pwo+ID4KPiA+IFRoaXMgaGFzIGJlZW4gcmVxdWVzdGVkIGJ5IFRhbWFzIGluIHYyLgo+Cj4g
VGhhdCdzIG5pY2UsIGJ1dCAxKSB5b3Ugc3RpbGwgaGF2ZW4ndCBhbnN3ZXJlZCB0aGUgcXVlc3Rp
b24sIGFuZCAyKSBpdCdzCj4gbm90IGluIHRoZSBjaGFuZ2Vsb2cuCgpXaGF0IEkgcmVxdWVzdGVk
IHdhcyB0aGF0IGlmIHJlbWFwcGluZyBpcyBiZWluZyBkb25lIHRoZW4gYm90aCB0aGUgb2xkCmFu
ZCBuZXcgZ2ZuJ3Mgc2hvdWxkIGJlIHVuc2hhcmVkIGluIHRoZSBob3N0cDJtIGZvciBrZWVwaW5n
IHRoaW5ncwpjb25zaXN0ZW50LiBUaGUgcGFnZSB0eXBlIG9mIG9sZF9nZm4gd2FzIGFscmVhZHkg
Y2hlY2tlZCB3aGV0aGVyIGl0J3MKcDJtX3JhbV9ydyBhbmQgYmFpbCBpZiBpdCB3YXNuJ3Qgc28g
ZnVuY3Rpb25hbGl0eS13aXNlIHRoaXMganVzdApzaW1wbGlmaWVzIHRoaW5ncyBhcyBhIHVzZXIg
ZG9uJ3QgaGF2ZSB0byByZXF1ZXN0IHVuc2hhcmluZyBtYW51YWxseQpiZWZvcmUgcmVtYXBwaW5n
LiBOb3csIGlmIHRoZSBuZXdfZ2ZuIGlzIGludmFsaWQgaXQgc2hvdWxkbid0IHF1ZXJ5CnRoZSBo
b3N0cDJtIGFzIHRoYXQgaXMgZWZmZWN0aXZlbHkgYSByZXF1ZXN0IHRvIHJlbW92ZSB0aGUgZW50
cnkgZnJvbQp0aGUgYWx0cDJtLiBCdXQgcHJvdmlkZWQgdGhhdCBzY2VuYXJpbyBpcyB1c2VkIG9u
bHkgd2hlbiByZW1vdmluZwplbnRyaWVzIHRoYXQgd2VyZSBwcmV2aW91c2x5IHJlbWFwcGVkL2Nv
cGllZCB0byB0aGUgYWx0cDJtLCB0aG9zZQplbnRyaWVzIGFscmVhZHkgd2VudCB0aHJvdWdoIFAy
TV9BTExPQyB8IFAyTV9VTlNIQVJFIGJlZm9yZSwgc28gaXQKd29uJ3QgaGF2ZSBhbiBhZmZlY3Qu
IEJ1dCBpdCdzIGFsc28gcG9pbnRsZXNzLgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
