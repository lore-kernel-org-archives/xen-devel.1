Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A72C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:27:49 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C42720674
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 15:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="NUxjAgbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C42720674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDseo-0000w3-6w; Tue, 09 Apr 2019 15:27:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9agV=SL=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hDsem-0000vy-QT
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 15:27:28 +0000
X-Inumbo-ID: fb391f1c-5adb-11e9-92d7-bc764e045a96
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fb391f1c-5adb-11e9-92d7-bc764e045a96;
 Tue, 09 Apr 2019 15:27:27 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1554823647; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=5or1ll2j0yfR3sCJ2yr9CSOqiKT2+hBeau8rqhE0aAM=;
 b=NUxjAgbA5QLBqt/LEwzamvVT+bcDSk4TEghi2JCuFsLv4wHQgoZguEHHUp23Z+5/OzcgiAGs
 97eBEYRXbfDnss1Q+hnIIerHmc7FNF2CE1freOH4/4MfhmV86vyqazo+vBG6+1Ioo27mIRyH
 TWoLutKkjp6LAigP3sRcZS+A5Bo=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mxa.mailgun.org with ESMTP id 5cacb9de.7f91d9cd15f0-smtp-out-n01;
 Tue, 09 Apr 2019 15:27:26 -0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id g3so21434659wrx.9
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 08:27:25 -0700 (PDT)
X-Gm-Message-State: APjAAAVkZ2SOwCxlO/EQ/BRADmh2L/9Hw6AUV2rLBTGxfwzPNIn1cx6t
 /1vE1mrnZvBxPeQai6adSV5pV/5rUvhB9eTkX3A=
X-Google-Smtp-Source: APXvYqwig290hn/83etJqW1caBLdPIdezIa6RuBOQoUa9qG6JaSJM22LeH9OZ/48VlZQZ/wl+ydQyNIAYCLu5jyMt7w=
X-Received: by 2002:adf:f5c7:: with SMTP id k7mr22412113wrp.197.1554823644688; 
 Tue, 09 Apr 2019 08:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <CABfawhmyTGNmLP5=c5pWeUiRaSPpwUUw_9SjXoJPr2ZANep41w@mail.gmail.com>
 <d01821fb-f68d-1816-21c4-4d77cb4b7cb6@bitdefender.com>
 <CABfawh=o1nCabm3CSyndoJE6UQKENvOKquhKWPhJEah1BFYJ-Q@mail.gmail.com>
 <4b433392-0484-5660-d795-365aa95af250@bitdefender.com>
In-Reply-To: <4b433392-0484-5660-d795-365aa95af250@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 9 Apr 2019 09:26:48 -0600
X-Gmail-Original-Message-ID: <CABfawhmg2GCC7uj2sX2NNO2QDHzSSHFRzU60tGJ2dPALRGxHrA@mail.gmail.com>
Message-ID:
 <CABfawhmg2GCC7uj2sX2NNO2QDHzSSHFRzU60tGJ2dPALRGxHrA@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190409152648.p7TmTSjbE_OGm3JfA6IuWE7wUJovs_k5Uvq-nKyRwUE@z>

T24gVHVlLCBBcHIgOSwgMjAxOSBhdCA4OjQ4IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCjxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMDkuMDQuMjAxOSAxNzoz
NywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gT24gVHVlLCBBcHIgOSwgMjAxOSBhdCA4OjAz
IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCj4gPiA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
IHdyb3RlOgo+ID4+Cj4gPj4KPiA+Pgo+ID4+IE9uIDA5LjA0LjIwMTkgMTY6NDgsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+Pj4gT24gVHVlLCBBcHIgOSwgMjAxOSBhdCA2OjA0IEFNIEFsZXhh
bmRydSBTdGVmYW4gSVNBSUxBCj4gPj4+IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6
Cj4gPj4+Pgo+ID4+Pj4gVGhpcyBwYXRjaCBtb3ZlcyBjb21tb24gY29kZSBmcm9tIHAybV9zZXRf
YWx0cDJtX21lbV9hY2Nlc3MoKSBhbmQKPiA+Pj4+IHAybV9jaGFuZ2VfYWx0cDJtX2dmbigpIGlu
dG8gb25lIGZ1bmN0aW9uCj4gPj4+Pgo+ID4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElz
YWlsYSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gPj4+Pgo+ID4+Pj4gLS0tCj4gPj4+PiBD
aGFuZ2VzIHNpbmNlIFYyOgo+ID4+Pj4gICAgICAgICAgIC0gQ2hhbmdlIHZhciBuYW1lIGZyb20g
Zm91bmRfaW5faG9zdHAybSB0byBjb3BpZWRfZnJvbV9ob3N0cDJtCj4gPj4+PiAgICAgICAgICAg
LSBNb3ZlIHRoZSB0eXBlIGNoZWNrIGZyb20gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSB0
byB0aGUKPiA+Pj4+ICAgICAgICAgICBjYWxsZXJzLgo+ID4+Pj4gLS0tCj4gPj4+PiAgICB4ZW4v
YXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIHwgMzIgKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
LQo+ID4+Pj4gICAgeGVuL2FyY2gveDg2L21tL3AybS5jICAgICAgICB8IDQxICsrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4+Pj4gICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9w
Mm0uaCAgICB8IDE5ICsrKysrKysrKysrKysrKysrCj4gPj4+PiAgICAzIGZpbGVzIGNoYW5nZWQs
IDQ5IGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9ucygtKQo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9h
Y2Nlc3MuYwo+ID4+Pj4gaW5kZXggNTZjMDZhNGZjNi4uYmY2N2RkYjE1YSAxMDA2NDQKPiA+Pj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+Pj4+IEBAIC0yNjUsMzEgKzI2NSwyNyBAQCBpbnQgcDJt
X3NldF9hbHRwMm1fbWVtX2FjY2VzcyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcDJtX2RvbWFp
biAqaHAybSwKPiA+Pj4+ICAgICAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlcjsKPiA+Pj4+ICAg
ICAgICB1bnNpZ25lZCBsb25nIGdmbl9sID0gZ2ZuX3goZ2ZuKTsKPiA+Pj4+ICAgICAgICBpbnQg
cmM7Cj4gPj4+PiArICAgIGJvb2wgY29waWVkX2Zyb21faG9zdHAybTsKPiA+Pj4+Cj4gPj4+PiAt
ICAgIG1mbiA9IGFwMm0tPmdldF9lbnRyeShhcDJtLCBnZm4sICZ0LCAmb2xkX2EsIDAsIE5VTEws
IE5VTEwpOwo+ID4+Pj4gKyAgICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2VzcyhhcDJt
LCBnZm4sICZ0LCAmb2xkX2EsICZwYWdlX29yZGVyLCAmY29waWVkX2Zyb21faG9zdHAybSk7Cj4g
Pj4+Pgo+ID4+Pj4gLSAgICAvKiBDaGVjayBob3N0IHAybSBpZiBubyB2YWxpZCBlbnRyeSBpbiBh
bHRlcm5hdGUgKi8KPiA+Pj4+ICAgICAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApCj4gPj4+PiAr
ICAgICAgICByZXR1cm4gLUVTUkNIOwo+ID4+Pj4gKwo+ID4+Pj4gKyAgICAvKiBJZiB0aGlzIGlz
IGEgc3VwZXJwYWdlLCBjb3B5IHRoYXQgZmlyc3QgKi8KPiA+Pj4+ICsgICAgaWYgKCBwYWdlX29y
ZGVyICE9IFBBR0VfT1JERVJfNEsgJiYgY29waWVkX2Zyb21faG9zdHAybSApCj4gPj4+PiAgICAg
ICAgewo+ID4+Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gfigoMVVMIDw8IHBhZ2Vf
b3JkZXIpIC0gMSk7Cj4gPj4+PiArICAgICAgICBnZm5fdCBnZm4yID0gX2dmbihnZm5fbCAmIG1h
c2spOwo+ID4+Pj4gKyAgICAgICAgbWZuX3QgbWZuMiA9IF9tZm4obWZuX3gobWZuKSAmIG1hc2sp
Owo+ID4+Pj4KPiA+Pj4+IC0gICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhocDJt
LCBnZm5fbCwgJnQsICZvbGRfYSwKPiA+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBQMk1fQUxMT0MgfCBQMk1fVU5TSEFSRSwgJnBhZ2Vfb3JkZXIsIDApOwo+ID4+Pj4g
KyAgICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRvIGEg
c2hhcmVkIGVudHJ5ICovCj4gPj4+PiArICAgICAgICBpZiAoIHQgIT0gcDJtX3JhbV9ydyApCj4g
Pj4+PiArICAgICAgICAgICAgcmV0dXJuIC1FU1JDSDsKPiA+Pj4+Cj4gPj4+PiAtICAgICAgICBy
YyA9IC1FU1JDSDsKPiA+Pj4+IC0gICAgICAgIGlmICggIW1mbl92YWxpZChtZm4pIHx8IHQgIT0g
cDJtX3JhbV9ydyApCj4gPj4+PiArICAgICAgICByYyA9IGFwMm0tPnNldF9lbnRyeShhcDJtLCBn
Zm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBvbGRfYSwgMSk7Cj4gPj4+PiArICAgICAgICBpZiAo
IHJjICkKPiA+Pj4+ICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiA+Pj4+IC0KPiA+Pj4+IC0g
ICAgICAgIC8qIElmIHRoaXMgaXMgYSBzdXBlcnBhZ2UsIGNvcHkgdGhhdCBmaXJzdCAqLwo+ID4+
Pj4gLSAgICAgICAgaWYgKCBwYWdlX29yZGVyICE9IFBBR0VfT1JERVJfNEsgKQo+ID4+Pj4gLSAg
ICAgICAgewo+ID4+Pj4gLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFzayA9IH4oKDFVTCA8
PCBwYWdlX29yZGVyKSAtIDEpOwo+ID4+Pj4gLSAgICAgICAgICAgIGdmbl90IGdmbjIgPSBfZ2Zu
KGdmbl9sICYgbWFzayk7Cj4gPj4+PiAtICAgICAgICAgICAgbWZuX3QgbWZuMiA9IF9tZm4obWZu
X3gobWZuKSAmIG1hc2spOwo+ID4+Pj4gLQo+ID4+Pj4gLSAgICAgICAgICAgIHJjID0gYXAybS0+
c2V0X2VudHJ5KGFwMm0sIGdmbjIsIG1mbjIsIHBhZ2Vfb3JkZXIsIHQsIG9sZF9hLCAxKTsKPiA+
Pj4+IC0gICAgICAgICAgICBpZiAoIHJjICkKPiA+Pj4+IC0gICAgICAgICAgICAgICAgcmV0dXJu
IHJjOwo+ID4+Pj4gLSAgICAgICAgfQo+ID4+Pj4gICAgICAgIH0KPiA+Pj4+Cj4gPj4+PiAgICAg
ICAgLyoKPiA+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJj
aC94ODYvbW0vcDJtLmMKPiA+Pj4+IGluZGV4IGI5YmJiOGY0ODUuLmQzOGQ3YzI5Y2EgMTAwNjQ0
Cj4gPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+Pj4+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYwo+ID4+Pj4gQEAgLTI2MjYsNiArMjYyNiw3IEBAIGludCBwMm1fY2hhbmdl
X2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwKPiA+Pj4+ICAg
ICAgICBtZm5fdCBtZm47Cj4gPj4+PiAgICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXI7Cj4g
Pj4+PiAgICAgICAgaW50IHJjID0gLUVJTlZBTDsKPiA+Pj4+ICsgICAgYm9vbCBjb3BpZWRfZnJv
bV9ob3N0cDJtOwo+ID4+Pj4KPiA+Pj4+ICAgICAgICBpZiAoIGlkeCA+PSBNQVhfQUxUUDJNIHx8
IGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+ID4+Pj4g
ICAgICAgICAgICByZXR1cm4gcmM7Cj4gPj4+PiBAQCAtMjYzNiw3ICsyNjM3LDcgQEAgaW50IHAy
bV9jaGFuZ2VfYWx0cDJtX2dmbihzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4LAo+
ID4+Pj4gICAgICAgIHAybV9sb2NrKGhwMm0pOwo+ID4+Pj4gICAgICAgIHAybV9sb2NrKGFwMm0p
Owo+ID4+Pj4KPiA+Pj4+IC0gICAgbWZuID0gYXAybS0+Z2V0X2VudHJ5KGFwMm0sIG9sZF9nZm4s
ICZ0LCAmYSwgMCwgTlVMTCwgTlVMTCk7Cj4gPj4+PiArICAgIG1mbiA9IGFsdHAybV9nZXRfZ2Zu
X3R5cGVfYWNjZXNzKGFwMm0sIG9sZF9nZm4sICZ0LCAmYSwgJnBhZ2Vfb3JkZXIsICZjb3BpZWRf
ZnJvbV9ob3N0cDJtKTsKPiA+Pj4+Cj4gPj4+PiAgICAgICAgaWYgKCBnZm5fZXEobmV3X2dmbiwg
SU5WQUxJRF9HRk4pICkKPiA+Pj4+ICAgICAgICB7Cj4gPj4+PiBAQCAtMjY0NiwzNyArMjY0Nywy
NyBAQCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVk
IGludCBpZHgsCj4gPj4+PiAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4+Pj4gICAgICAgIH0KPiA+
Pj4+Cj4gPj4+PiAtICAgIC8qIENoZWNrIGhvc3QgcDJtIGlmIG5vIHZhbGlkIGVudHJ5IGluIGFs
dGVybmF0ZSAqLwo+ID4+Pj4gLSAgICBpZiAoICFtZm5fdmFsaWQobWZuKSApCj4gPj4+PiAtICAg
IHsKPiA+Pj4+IC0gICAgICAgIG1mbiA9IF9fZ2V0X2dmbl90eXBlX2FjY2VzcyhocDJtLCBnZm5f
eChvbGRfZ2ZuKSwgJnQsICZhLAo+ID4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFAyTV9BTExPQywgJnBhZ2Vfb3JkZXIsIDApOwo+ID4+Pj4gKyAgICBpZiAoICFtZm5f
dmFsaWQobWZuKSB8fCAodCAhPSBwMm1fcmFtX3J3ICYmIGNvcGllZF9mcm9tX2hvc3RwMm0pICkK
PiA+Pj4KPiA+Pj4gSXMgdGhpcyBjaGVjayBjb3JyZWN0PyBXaHkgZG8geW91IHdhbnQgdG8gZ2V0
IG91dCBvbmx5IHdoZW4gdHlwZSBpcwo+ID4+PiBub24tcncgKmFuZCogaXQncyBjb3BpZWQgZnJv
bSB0aGUgaG9zdHAybT8gWW91IGNvdWxkIGhhdmUgbm9uLXJ3Cj4gPj4+IGVudHJpZXMgbGlrZSBt
bWlvIGluIHRoZSBhbHRwMm0gdGhhdCB3ZXJlIGxhemlseSBjb3BpZWQgYW5kIEkgZG9uJ3QKPiA+
Pj4gdGhpbmsgd2Ugd2FudCB0byBhbGxvdyByZW1hcHBpbmcgdG8gdGhvc2UgZWl0aGVyLgo+ID4+
Cj4gPj4gSSBqdXN0IGNvcGllZCB0aGUgZnVuY3Rpb25hbGl0eS4gSWYgdGhpcyBpcyBuZWVkZWQg
SSB3aWxsIGFkZCBhIHx8IHQgIT0KPiA+PiBwMm1fbW1pb19kbSBhbmQgcDJtX21taW9fZGlyZWN0
Lgo+ID4KPiA+IE15IHByb2JsZW0gaXMgd2l0aCB0aGUgJiYgY29waWVkX2Zvcm1faG9zdHAybSBw
YXJ0LiBXaHkgaXMgdGhhdCBhIGNyaXRlcmlhPwo+Cj4gVGhlICh0ICE9IHAybV9yYW1fcncpIGNo
ZWNrIHdhcyBkb25lIG9ubHkgZm9yIHRoZSBnZXQgZnJvbSBob3N0cDJtLgo+Cj4gSWYgeW91IHRo
aW5rIHRoYXQgSSBzaG91bGQgZG8gdGhlIGNoZWNrIGZvciBhbGwgbWZucyAoaG9zdHAyIGFuZCBh
bHRwMm0pCj4gdGhlbiBJIGNhbiBkcm9wIHRoZSBjb3BpZWRfZnJvbV9ob3N0cDJtIGJvb2wgYW5k
IGFkZCBtbWlvIGNoZWNrLgoKSSB0aGluayB5b3Ugc2hvdWxkIGp1c3QgZHJvcCB0aGUgJiYgY29w
aWVkX2Zyb21faG9zdHAybSBwYXJ0IG9mIGl0LgpSZW1hcHBpbmdzIHNob3VsZCBvbmx5IGJlIGFs
bG93ZWQgZm9yIHAybV9yYW1fcncgdHlwZSwgbm8gbWF0dGVyIHdoaWNoCnAybSBpdHMgY29taW5n
IGZyb20uCgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
