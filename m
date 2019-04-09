Return-Path: <SRS0=7ods=SL=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 419A0C10F0E
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:38:20 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE872084B
	for <xen-devel@archiver.kernel.org>; Tue,  9 Apr 2019 14:38:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=tklengyel.com header.i=@tklengyel.com header.b="TS8g7yHT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE872084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tklengyel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hDrsk-0004ql-Uq; Tue, 09 Apr 2019 14:37:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9agV=SL=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hDrsi-0004qg-Qi
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2019 14:37:48 +0000
X-Inumbo-ID: 09f9f9b0-5ad5-11e9-aa56-6f53d226343f
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09f9f9b0-5ad5-11e9-aa56-6f53d226343f;
 Tue, 09 Apr 2019 14:37:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1554820665; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=CHNPKFtXfnju3wqPz6DrbmncI3GEcM4VCjXdblfsB18=;
 b=TS8g7yHTtvrpK4jplGtlo5GCMyXcRIpIuZ50UsXMkaOlBEiR+FhWLH9t9Lz4zfWLhHMgRVQP
 Jt5xjhOmS82vkSvEBl8HhuqwPA69/+OLpBmhufxiE7pALW1X5p+zgDTrBMHR37yzo0G2TlGQ
 huSm5OhjSuwuX7qGo4v2MN+qrbY=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mxa.mailgun.org with ESMTP id 5cacae38.7fa5fbfd32f0-smtp-out-n01;
 Tue, 09 Apr 2019 14:37:44 -0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id r4so21225543wrq.8
 for <xen-devel@lists.xenproject.org>; Tue, 09 Apr 2019 07:37:44 -0700 (PDT)
X-Gm-Message-State: APjAAAUZP+9Tq9G4Nh7bK4lLesG8PbG12nxcHPPaDFy/gg1jIWnhWrtD
 GCuflLOTNUFW7gzYXbkjs1NAddGxx72Do5nQnaE=
X-Google-Smtp-Source: APXvYqyZiKg3EinOE56bh4QxgGTCU51rbGV/tGgPhfNRTkjxHRTLgos/9fYOJTMU5TXlvPya6z4jm4XLCWrSCN8ZJ5Y=
X-Received: by 2002:adf:f70e:: with SMTP id r14mr23317696wrp.37.1554820663849; 
 Tue, 09 Apr 2019 07:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190409120324.13940-1-aisaila@bitdefender.com>
 <CABfawhmyTGNmLP5=c5pWeUiRaSPpwUUw_9SjXoJPr2ZANep41w@mail.gmail.com>
 <d01821fb-f68d-1816-21c4-4d77cb4b7cb6@bitdefender.com>
In-Reply-To: <d01821fb-f68d-1816-21c4-4d77cb4b7cb6@bitdefender.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Tue, 9 Apr 2019 08:37:07 -0600
X-Gmail-Original-Message-ID: <CABfawh=o1nCabm3CSyndoJE6UQKENvOKquhKWPhJEah1BFYJ-Q@mail.gmail.com>
Message-ID:
 <CABfawh=o1nCabm3CSyndoJE6UQKENvOKquhKWPhJEah1BFYJ-Q@mail.gmail.com>
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
Message-ID: <20190409143707.FDHSso7pSyhfnJEaKwjdE9gBDjk-aE1HLNbsQfZFEYY@z>

T24gVHVlLCBBcHIgOSwgMjAxOSBhdCA4OjAzIEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCjxh
aXNhaWxhQGJpdGRlZmVuZGVyLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMDkuMDQuMjAxOSAxNjo0
OCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+ID4gT24gVHVlLCBBcHIgOSwgMjAxOSBhdCA2OjA0
IEFNIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBCj4gPiA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+
IHdyb3RlOgo+ID4+Cj4gPj4gVGhpcyBwYXRjaCBtb3ZlcyBjb21tb24gY29kZSBmcm9tIHAybV9z
ZXRfYWx0cDJtX21lbV9hY2Nlc3MoKSBhbmQKPiA+PiBwMm1fY2hhbmdlX2FsdHAybV9nZm4oKSBp
bnRvIG9uZSBmdW5jdGlvbgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWls
YSA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+Cj4gPj4KPiA+PiAtLS0KPiA+PiBDaGFuZ2VzIHNp
bmNlIFYyOgo+ID4+ICAgICAgICAgIC0gQ2hhbmdlIHZhciBuYW1lIGZyb20gZm91bmRfaW5faG9z
dHAybSB0byBjb3BpZWRfZnJvbV9ob3N0cDJtCj4gPj4gICAgICAgICAgLSBNb3ZlIHRoZSB0eXBl
IGNoZWNrIGZyb20gYWx0cDJtX2dldF9nZm5fdHlwZV9hY2Nlc3MoKSB0byB0aGUKPiA+PiAgICAg
ICAgICBjYWxsZXJzLgo+ID4+IC0tLQo+ID4+ICAgeGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3Mu
YyB8IDMyICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KPiA+PiAgIHhlbi9hcmNoL3g4Ni9t
bS9wMm0uYyAgICAgICAgfCA0MSArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiA+PiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvcDJtLmggICAgfCAxOSArKysrKysrKysrKysrKysr
Kwo+ID4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA0MyBkZWxldGlvbnMo
LSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jIGIv
eGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ID4+IGluZGV4IDU2YzA2YTRmYzYuLmJmNjdk
ZGIxNWEgMTAwNjQ0Cj4gPj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ID4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiA+PiBAQCAtMjY1LDMxICsyNjUs
MjcgQEAgaW50IHAybV9zZXRfYWx0cDJtX21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgc3Ry
dWN0IHAybV9kb21haW4gKmhwMm0sCj4gPj4gICAgICAgdW5zaWduZWQgaW50IHBhZ2Vfb3JkZXI7
Cj4gPj4gICAgICAgdW5zaWduZWQgbG9uZyBnZm5fbCA9IGdmbl94KGdmbik7Cj4gPj4gICAgICAg
aW50IHJjOwo+ID4+ICsgICAgYm9vbCBjb3BpZWRfZnJvbV9ob3N0cDJtOwo+ID4+Cj4gPj4gLSAg
ICBtZm4gPSBhcDJtLT5nZXRfZW50cnkoYXAybSwgZ2ZuLCAmdCwgJm9sZF9hLCAwLCBOVUxMLCBO
VUxMKTsKPiA+PiArICAgIG1mbiA9IGFsdHAybV9nZXRfZ2ZuX3R5cGVfYWNjZXNzKGFwMm0sIGdm
biwgJnQsICZvbGRfYSwgJnBhZ2Vfb3JkZXIsICZjb3BpZWRfZnJvbV9ob3N0cDJtKTsKPiA+Pgo+
ID4+IC0gICAgLyogQ2hlY2sgaG9zdCBwMm0gaWYgbm8gdmFsaWQgZW50cnkgaW4gYWx0ZXJuYXRl
ICovCj4gPj4gICAgICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgKQo+ID4+ICsgICAgICAgIHJldHVy
biAtRVNSQ0g7Cj4gPj4gKwo+ID4+ICsgICAgLyogSWYgdGhpcyBpcyBhIHN1cGVycGFnZSwgY29w
eSB0aGF0IGZpcnN0ICovCj4gPj4gKyAgICBpZiAoIHBhZ2Vfb3JkZXIgIT0gUEFHRV9PUkRFUl80
SyAmJiBjb3BpZWRfZnJvbV9ob3N0cDJtICkKPiA+PiAgICAgICB7Cj4gPj4gKyAgICAgICAgdW5z
aWduZWQgbG9uZyBtYXNrID0gfigoMVVMIDw8IHBhZ2Vfb3JkZXIpIC0gMSk7Cj4gPj4gKyAgICAg
ICAgZ2ZuX3QgZ2ZuMiA9IF9nZm4oZ2ZuX2wgJiBtYXNrKTsKPiA+PiArICAgICAgICBtZm5fdCBt
Zm4yID0gX21mbihtZm5feChtZm4pICYgbWFzayk7Cj4gPj4KPiA+PiAtICAgICAgICBtZm4gPSBf
X2dldF9nZm5fdHlwZV9hY2Nlc3MoaHAybSwgZ2ZuX2wsICZ0LCAmb2xkX2EsCj4gPj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFAyTV9BTExPQyB8IFAyTV9VTlNIQVJFLCAm
cGFnZV9vcmRlciwgMCk7Cj4gPj4gKyAgICAgICAgLyogTm90ZTogY3VycmVudGx5IGl0IGlzIG5v
dCBzYWZlIHRvIHJlbWFwIHRvIGEgc2hhcmVkIGVudHJ5ICovCj4gPj4gKyAgICAgICAgaWYgKCB0
ICE9IHAybV9yYW1fcncgKQo+ID4+ICsgICAgICAgICAgICByZXR1cm4gLUVTUkNIOwo+ID4+Cj4g
Pj4gLSAgICAgICAgcmMgPSAtRVNSQ0g7Cj4gPj4gLSAgICAgICAgaWYgKCAhbWZuX3ZhbGlkKG1m
bikgfHwgdCAhPSBwMm1fcmFtX3J3ICkKPiA+PiArICAgICAgICByYyA9IGFwMm0tPnNldF9lbnRy
eShhcDJtLCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBvbGRfYSwgMSk7Cj4gPj4gKyAgICAg
ICAgaWYgKCByYyApCj4gPj4gICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPj4gLQo+ID4+IC0g
ICAgICAgIC8qIElmIHRoaXMgaXMgYSBzdXBlcnBhZ2UsIGNvcHkgdGhhdCBmaXJzdCAqLwo+ID4+
IC0gICAgICAgIGlmICggcGFnZV9vcmRlciAhPSBQQUdFX09SREVSXzRLICkKPiA+PiAtICAgICAg
ICB7Cj4gPj4gLSAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFzayA9IH4oKDFVTCA8PCBwYWdl
X29yZGVyKSAtIDEpOwo+ID4+IC0gICAgICAgICAgICBnZm5fdCBnZm4yID0gX2dmbihnZm5fbCAm
IG1hc2spOwo+ID4+IC0gICAgICAgICAgICBtZm5fdCBtZm4yID0gX21mbihtZm5feChtZm4pICYg
bWFzayk7Cj4gPj4gLQo+ID4+IC0gICAgICAgICAgICByYyA9IGFwMm0tPnNldF9lbnRyeShhcDJt
LCBnZm4yLCBtZm4yLCBwYWdlX29yZGVyLCB0LCBvbGRfYSwgMSk7Cj4gPj4gLSAgICAgICAgICAg
IGlmICggcmMgKQo+ID4+IC0gICAgICAgICAgICAgICAgcmV0dXJuIHJjOwo+ID4+IC0gICAgICAg
IH0KPiA+PiAgICAgICB9Cj4gPj4KPiA+PiAgICAgICAvKgo+ID4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvbW0vcDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiA+PiBpbmRleCBiOWJi
YjhmNDg1Li5kMzhkN2MyOWNhIDEwMDY0NAo+ID4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0u
Ywo+ID4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ID4+IEBAIC0yNjI2LDYgKzI2MjYs
NyBAQCBpbnQgcDJtX2NoYW5nZV9hbHRwMm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVk
IGludCBpZHgsCj4gPj4gICAgICAgbWZuX3QgbWZuOwo+ID4+ICAgICAgIHVuc2lnbmVkIGludCBw
YWdlX29yZGVyOwo+ID4+ICAgICAgIGludCByYyA9IC1FSU5WQUw7Cj4gPj4gKyAgICBib29sIGNv
cGllZF9mcm9tX2hvc3RwMm07Cj4gPj4KPiA+PiAgICAgICBpZiAoIGlkeCA+PSBNQVhfQUxUUDJN
IHx8IGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQo+ID4+
ICAgICAgICAgICByZXR1cm4gcmM7Cj4gPj4gQEAgLTI2MzYsNyArMjYzNyw3IEBAIGludCBwMm1f
Y2hhbmdlX2FsdHAybV9nZm4oc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCwKPiA+
PiAgICAgICBwMm1fbG9jayhocDJtKTsKPiA+PiAgICAgICBwMm1fbG9jayhhcDJtKTsKPiA+Pgo+
ID4+IC0gICAgbWZuID0gYXAybS0+Z2V0X2VudHJ5KGFwMm0sIG9sZF9nZm4sICZ0LCAmYSwgMCwg
TlVMTCwgTlVMTCk7Cj4gPj4gKyAgICBtZm4gPSBhbHRwMm1fZ2V0X2dmbl90eXBlX2FjY2Vzcyhh
cDJtLCBvbGRfZ2ZuLCAmdCwgJmEsICZwYWdlX29yZGVyLCAmY29waWVkX2Zyb21faG9zdHAybSk7
Cj4gPj4KPiA+PiAgICAgICBpZiAoIGdmbl9lcShuZXdfZ2ZuLCBJTlZBTElEX0dGTikgKQo+ID4+
ICAgICAgIHsKPiA+PiBAQCAtMjY0NiwzNyArMjY0NywyNyBAQCBpbnQgcDJtX2NoYW5nZV9hbHRw
Mm1fZ2ZuKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgsCj4gPj4gICAgICAgICAg
IGdvdG8gb3V0Owo+ID4+ICAgICAgIH0KPiA+Pgo+ID4+IC0gICAgLyogQ2hlY2sgaG9zdCBwMm0g
aWYgbm8gdmFsaWQgZW50cnkgaW4gYWx0ZXJuYXRlICovCj4gPj4gLSAgICBpZiAoICFtZm5fdmFs
aWQobWZuKSApCj4gPj4gLSAgICB7Cj4gPj4gLSAgICAgICAgbWZuID0gX19nZXRfZ2ZuX3R5cGVf
YWNjZXNzKGhwMm0sIGdmbl94KG9sZF9nZm4pLCAmdCwgJmEsCj4gPj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFAyTV9BTExPQywgJnBhZ2Vfb3JkZXIsIDApOwo+ID4+ICsg
ICAgaWYgKCAhbWZuX3ZhbGlkKG1mbikgfHwgKHQgIT0gcDJtX3JhbV9ydyAmJiBjb3BpZWRfZnJv
bV9ob3N0cDJtKSApCj4gPgo+ID4gSXMgdGhpcyBjaGVjayBjb3JyZWN0PyBXaHkgZG8geW91IHdh
bnQgdG8gZ2V0IG91dCBvbmx5IHdoZW4gdHlwZSBpcwo+ID4gbm9uLXJ3ICphbmQqIGl0J3MgY29w
aWVkIGZyb20gdGhlIGhvc3RwMm0/IFlvdSBjb3VsZCBoYXZlIG5vbi1ydwo+ID4gZW50cmllcyBs
aWtlIG1taW8gaW4gdGhlIGFsdHAybSB0aGF0IHdlcmUgbGF6aWx5IGNvcGllZCBhbmQgSSBkb24n
dAo+ID4gdGhpbmsgd2Ugd2FudCB0byBhbGxvdyByZW1hcHBpbmcgdG8gdGhvc2UgZWl0aGVyLgo+
Cj4gSSBqdXN0IGNvcGllZCB0aGUgZnVuY3Rpb25hbGl0eS4gSWYgdGhpcyBpcyBuZWVkZWQgSSB3
aWxsIGFkZCBhIHx8IHQgIT0KPiBwMm1fbW1pb19kbSBhbmQgcDJtX21taW9fZGlyZWN0LgoKTXkg
cHJvYmxlbSBpcyB3aXRoIHRoZSAmJiBjb3BpZWRfZm9ybV9ob3N0cDJtIHBhcnQuIFdoeSBpcyB0
aGF0IGEgY3JpdGVyaWE/CgpUYW1hcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
