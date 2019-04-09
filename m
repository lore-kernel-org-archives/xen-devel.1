Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4D5C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:45:16 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EADA2070D
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 13:45:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="vxn/S4qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EADA2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDr3Y-00006D-67; Tue, 09 Apr 2019 13:44:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9agV=SL=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hDr3X-000068-J5
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 13:44:55 +0000
X-Inumbo-ID: a7999ea8-5acd-11e9-9cd4-f7146d9a0fc0
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a7999ea8-5acd-11e9-9cd4-f7146d9a0fc0;
 Tue, 09 Apr 2019 13:44:54 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1554817494; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=2rcEQwULpqLj+Tzv10RYv4LvEJYpdmr35ylrQn81/PY=;
 b=vxn/S4qm5aC4s4Cx9dIJ8GwXaijL/Xk6VN/IvcMExenJi0AnK5pnZ/KjLNRVQSfEKFafNU7x
 9KWbe13YoyGBriSE0nfDudoA/6TMfZhUg+mB9v5HQ4dBgbYSXG4RvXrQ68lms+v/xbmcRy1R
 ulyq2KG/IFW+ILs+u/BZjgTuP+M=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mxa.mailgun.org with ESMTP id 5caca1d5.7fd1948eab30-smtp-out-n02;
 Tue, 09 Apr 2019 13:44:53 -0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id k11so21011646wro.5
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 06:44:52 -0700 (PDT)
X-Gm-Message-State: APjAAAVlkG/2L++lJg36ynQX+yHTM8YA9gWaCFWr6Ph8BJrg0J4UUGs5
 F2sxlhy5AU6GvEsqflEYWSze5ZyZJgvV1qOdGnI=
X-Google-Smtp-Source: APXvYqwIKU9MS+c6jWaF1iN/K9AsorFKizOaoQX6XHHLwHfBZZCaQJ18AeX5dvt8sOqiOLATuwVBEDnhlWvdKXRKgTc=
X-Received: by 2002:adf:f70e:: with SMTP id r14mr23124469wrp.37.1554817492031; 
 Tue, 09 Apr 2019 06:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <20190409120324.13940-2-aisaila@bitdefender.com>
In-Reply-To: <20190409120324.13940-2-aisaila@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 9 Apr 2019 07:44:15 -0600
X-Gmail-Original-Message-ID: <CABfawh=SF2Mjq-F+29RjYYc3H5wvYc7YdSOt=NNCKzKXtr=Wbw@mail.gmail.com>
Message-ID:
 <CABfawh=SF2Mjq-F+29RjYYc3H5wvYc7YdSOt=NNCKzKXtr=Wbw@mail.gmail.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Subject: Re: [Xen-devel] [PATCH v3 2/3] x86/mm: Introduce
 altp2m_set_entry_by_page_order
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
Message-ID: <20190409134415.Tenxy0OaloLxUDocENr0_SZz5EcNkcm5C1ECXOVwMTQ@z>

T24gVHVlLCBBcHIgOSwgMjAxOSBhdCA2OjA0IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCjxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIG1vdmVzIGNvbW1v
biBjb2RlIGZyb20gcDJtX3NldF9hbHRwMm1fbWVtX2FjY2VzcygpIGFuZAo+IHAybV9jaGFuZ2Vf
YWx0cDJtX2dmbigpIGludG8gb25lIGZ1bmN0aW9uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5k
cnUgSXNhaWxhIDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYyB8ICAyICstCj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmggICAg
fCAxMSArKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5j
IGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+IGluZGV4IGJmNjdkZGIxNWEuLjZhMjI1
MTI1NTUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiBAQCAtMjc5LDcgKzI3OSw3IEBAIGludCBw
Mm1fc2V0X2FsdHAybV9tZW1fYWNjZXNzKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwMm1fZG9t
YWluICpocDJtLAo+ICAgICAgICAgIGdmbl90IGdmbjIgPSBfZ2ZuKGdmbl9sICYgbWFzayk7Cj4g
ICAgICAgICAgbWZuX3QgbWZuMiA9IF9tZm4obWZuX3gobWZuKSAmIG1hc2spOwo+Cj4gLSAgICAg
ICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5vdCBzYWZlIHRvIHJlbWFwIHRvIGEgc2hhcmVk
IGVudHJ5ICovCj4gKyAgICAgICAvKiBOb3RlOiBjdXJyZW50bHkgaXQgaXMgbm90IHNhZmUgdG8g
cmVtYXAgdG8gYSBzaGFyZWQgZW50cnkgKi8KClRoaXMgbG9va3MgbGlrZSBhbiB1bnJlbGF0ZWQg
Y2hhbmdlLiBBbmQgSSBndWVzcyB0aGlzIGNvbW1lbnQgc2hvdWxkCmFsc28gYmUgZml4ZWQgYXMg
dGhpcyBpcyB0aGUgbWVtX2FjY2VzcyBzZXR0aW5nIGZ1bmN0aW9uLCBub3QgdGhlCnJlbWFwIGZ1
bmN0aW9uLgoKPiAgICAgICAgICBpZiAoIHQgIT0gcDJtX3JhbV9ydyApCj4gICAgICAgICAgICAg
IHJldHVybiAtRVNSQ0g7Cj4KPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9wMm0u
aCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiBpbmRleCA2ZGUxNTQ2ZDc2Li45MGE2YzEz
NWE3IDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmgKPiArKysgYi94ZW4v
aW5jbHVkZS9hc20teDg2L3AybS5oCj4gQEAgLTQ2Nyw2ICs0NjcsMTcgQEAgc3RhdGljIGlubGlu
ZSBtZm5fdCBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2VzcygKPiAgICAgIHJldHVybiBtZm47Cj4g
IH0KPgo+ICtzdGF0aWMgaW5saW5lIGludCBhbHRwMm1fc2V0X2VudHJ5X2J5X3BhZ2Vfb3JkZXIo
Cj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqYXAybSwgdW5zaWduZWQgbG9uZyBnZm4sICBtZm5f
dCBtZm4sCj4gKyAgICB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlciwgcDJtX3R5cGVfdCB0LCBwMm1f
YWNjZXNzX3QgYSkKPiArewo+ICsgICAgdW5zaWduZWQgbG9uZyBtYXNrID0gfigoMVVMIDw8IHBh
Z2Vfb3JkZXIpIC0gMSk7Cj4gKyAgICBnZm5fdCBnZm4yID0gX2dmbihnZm4gJiBtYXNrKTsKPiAr
ICAgIG1mbl90IG1mbjIgPSBfbWZuKG1mbl94KG1mbikgJiBtYXNrKTsKPiArCj4gKyAgICByZXR1
cm4gYXAybS0+c2V0X2VudHJ5KGFwMm0sIGdmbjIsIG1mbjIsIHBhZ2Vfb3JkZXIsIHQsIGEsIDEp
Owo+ICt9Cj4gKwo+ICAvKiBTeW50YWN0aWMgc3VnYXI6IG1vc3QgY2FsbGVycyB3aWxsIHVzZSBv
bmUgb2YgdGhlc2UuICovCj4gICNkZWZpbmUgZ2V0X2dmbihkLCBnLCB0KSAgICAgICAgIGdldF9n
Zm5fdHlwZSgoZCksIChnKSwgKHQpLCBQMk1fQUxMT0MpCj4gICNkZWZpbmUgZ2V0X2dmbl9xdWVy
eShkLCBnLCB0KSAgIGdldF9nZm5fdHlwZSgoZCksIChnKSwgKHQpLCAwKQo+IC0tCj4gMi4xNy4x
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
