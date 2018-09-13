From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v4 1/7] x86/p2m/pod: make it build with
 !CONFIG_HVM
Date: Thu, 13 Sep 2018 10:56:02 -0600
Message-ID: <CABfawhm6fZ_RW+g5H3pB8CXZg_at+jD1uc2jmCpqjk_ins0zBQ@mail.gmail.com>
References: <cover.f883694550a3da3b95e2bf2a6f6777297b851b43.1536856592.git-series.wei.liu2@citrix.com>
 <692c143f75c48c83b7011147b1861e2c9b5f87f3.1536856592.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ekk3=l3=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1g0Uv5-0002hZ-9g
 for xen-devel@lists.xenproject.org; Thu, 13 Sep 2018 16:56:43 +0000
Received: by mail-ed1-f65.google.com with SMTP id d8-v6so5226884edv.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Sep 2018 09:56:42 -0700 (PDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com.
 [209.85.221.52])
 by smtp.gmail.com with ESMTPSA id f19-v6sm1899031eda.49.2018.09.13.09.56.39
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Sep 2018 09:56:40 -0700 (PDT)
Received: by mail-wr1-f52.google.com with SMTP id v16-v6so6920773wro.11
 for <xen-devel@lists.xenproject.org>; Thu, 13 Sep 2018 09:56:39 -0700 (PDT)
In-Reply-To: <692c143f75c48c83b7011147b1861e2c9b5f87f3.1536856592.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Razvan Cojocaru <rcojocaru@bitdefender.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi92bV9ldmVudC5jIGIveGVuL2NvbW1vbi92bV9ldmVu
dC5jCj4gaW5kZXggNDc5M2FhYy4uNTBkNWViYyAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL3Zt
X2V2ZW50LmMKPiArKysgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKPiBAQCAtNjMwLDggKzYzMCw2
IEBAIGludCB2bV9ldmVudF9kb21jdGwoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHhlbl9kb21j
dGxfdm1fZXZlbnRfb3AgKnZlYywKPiAgICAgICAgICB7Cj4gICAgICAgICAgY2FzZSBYRU5fVk1f
RVZFTlRfRU5BQkxFOgo+ICAgICAgICAgIHsKPiAtICAgICAgICAgICAgc3RydWN0IHAybV9kb21h
aW4gKnAybSA9IHAybV9nZXRfaG9zdHAybShkKTsKPiAtCj4gICAgICAgICAgICAgIHJjID0gLUVP
UE5PVFNVUFA7Cj4gICAgICAgICAgICAgIC8qIGh2bSBmaXhtZTogcDJtX2lzX2ZvcmVpZ24gdHlw
ZXMgbmVlZCBhZGRyZXNzaW5nICovCj4gICAgICAgICAgICAgIGlmICggaXNfaHZtX2RvbWFpbiho
YXJkd2FyZV9kb21haW4pICkKPiBAQCAtNjQ3LDEwICs2NDUsMTIgQEAgaW50IHZtX2V2ZW50X2Rv
bWN0bChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgeGVuX2RvbWN0bF92bV9ldmVudF9vcCAqdmVj
LAo+ICAgICAgICAgICAgICBpZiAoIHVubGlrZWx5KG5lZWRfaW9tbXUoZCkpICkKPiAgICAgICAg
ICAgICAgICAgIGJyZWFrOwo+Cj4gKyNpZmRlZiBDT05GSUdfSFZNCgpBZ2FpbiwgcGxlYXNlIGRv
bid0IHB1dCBDT05GSUdfSFZNIGluIGNvbW1vbiBjb2RlLiBJZiBwMm0tPnBvZCBpcyBub3cKY29u
ZGl0aW9uYWxseSBhdmFpbGFibGUgd2Ugd2lsbCBuZWVkIGEgcDJtIHdyYXBwZXIgZnVuY3Rpb24g
dGhhdCBpcwphcmNoLWF3YXJlLgoKPiAgICAgICAgICAgICAgcmMgPSAtRVhERVY7Cj4gICAgICAg
ICAgICAgIC8qIERpc2FsbG93IHBhZ2luZyBpbiBhIFBvRCBndWVzdCAqLwo+IC0gICAgICAgICAg
ICBpZiAoIHAybS0+cG9kLmVudHJ5X2NvdW50ICkKPiArICAgICAgICAgICAgaWYgKCBwMm1fZ2V0
X2hvc3RwMm0oZCktPnBvZC5lbnRyeV9jb3VudCApCj4gICAgICAgICAgICAgICAgICBicmVhazsK
PiArI2VuZGlmCgpUaGFua3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
