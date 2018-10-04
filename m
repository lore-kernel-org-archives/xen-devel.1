From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v4] x86: use VMLOAD for PV context switch
Date: Thu, 4 Oct 2018 12:58:00 +0100
Message-ID: <3add91b0-5743-97e9-1b4f-d8fd15a47c05@citrix.com>
References: <5BAB385102000078001EBFD9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=mrpc=mq=citrix.com=prvs=80816b5da=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1g82Gb-0002QQ-4h
 for xen-devel@lists.xenproject.org; Thu, 04 Oct 2018 11:58:05 +0000
In-Reply-To: <5BAB385102000078001EBFD9@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjYvMDkvMTggMDg6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0xNjMwLDYgKzE2NDYs
NjYgQEAgc3RhdGljIHZvaWQgc3ZtX2luaXRfZXJyYXR1bV8zODMoY29uc3Qgcwo+ICAgICAgfQo+
ICB9Cj4gIAo+ICsjaWZkZWYgQ09ORklHX1BWCj4gK2Jvb2wgc3ZtX2xvYWRfc2Vncyh1bnNpZ25l
ZCBpbnQgbGR0X2VudHMsIHVuc2lnbmVkIGxvbmcgbGR0X2Jhc2UsCj4gKyAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgZnNfc2VsLCB1bnNpZ25lZCBsb25nIGZzX2Jhc2UsCj4gKyAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZ3Nfc2VsLCB1bnNpZ25lZCBsb25nIGdzX2Jhc2Us
Cj4gKyAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGdzX3NoYWRvdykKPiArewo+ICsg
ICAgdW5zaWduZWQgaW50IGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiArICAgIHN0cnVjdCB2
bWNiX3N0cnVjdCAqdm1jYiA9IHBlcl9jcHUoaG9zdF92bWNiX3ZhLCBjcHUpOwo+ICsKPiArICAg
IGlmICggdW5saWtlbHkoIXZtY2IpICkKPiArICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKwo+ICsg
ICAgaWYgKCAhbGR0X2Jhc2UgKQo+ICsgICAgewo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICog
VGhlIGFjdHVhbCBzdHJ1Y3R1cmUgZmllbGQgdXNlZCBoZXJlIHdhcyBhcmJpdHJhcmlseSBjaG9z
ZW4uCj4gKyAgICAgICAgICogRW1waXJpY2FsbHkgaXQgZG9lc24ndCBzZWVtIHRvIG1hdHRlciBt
dWNoIHdoaWNoIGVsZW1lbnQgaXMgdXNlZCwKPiArICAgICAgICAgKiBhbmQgYSBjbGVhciBleHBs
YW5hdGlvbiBvZiB0aGUgb3RoZXJ3aXNlIHBvb3IgcGVyZm9ybWFuY2UgaGFzIG5vdAo+ICsgICAg
ICAgICAqIGJlZW4gZm91bmQvcHJvdmlkZWQgc28gZmFyLgo+ICsgICAgICAgICAqLwo+ICsgICAg
ICAgIGFzbSB2b2xhdGlsZSAoICJwcmVmZXRjaCAlMCIgOjogIm0iICh2bWNiLT5sZHRyKSApOwoK
cHJlZmV0Y2h3KCkuCgpPdGhlcndpc2UsIFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
