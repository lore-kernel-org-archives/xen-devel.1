From: Tamas K Lengyel <tamas@tklengyel.com>
Subject: Re: [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Thu, 25 Apr 2019 07:33:40 -0600
Message-ID: <CABfawhk1_gH-eni0rtve4jeqAJdSKbHP69PDawyCvqYq-E8Cvg@mail.gmail.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
 <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
 <5CC196A20200007800229009@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cKnJ=S3=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hJeW4-0007ar-LU
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:34:20 +0000
Received: by mail-wr1-f51.google.com with SMTP id s18so5548607wrp.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 06:34:18 -0700 (PDT)
In-Reply-To: <5CC196A20200007800229009@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNToxNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Cj4gPj4+IE9uIDE1LjA0LjE5IGF0IDE5OjUxLCA8dGFtYXNAdGtsZW5n
eWVsLmNvbT4gd3JvdGU6Cj4gPiBTaW1wbHkgY2hhbmdpbmcgdG8gZ2V0X3BhZ2Ugd2l0aCBkb21f
Y293IGlzIG5vdCBlbm91Z2gsIEkgcmFuIGludG8KPiA+IGlzc3VlcyB3aGVyZSB0aGUgc3lzdGVt
IHN0aWxsIGRlYWRsb2NrcyBkdWUgdG8gdGhlIG9yZGVyaW5nIG9mCj4gPiBwdXRfcGFnZV9hbmRf
dHlwZSBiZWluZyBjYWxsZWQgYmVmb3JlIG1lbV9zaGFyaW5nX3BhZ2VfdW5sb2NrLiBTbyB0aGUK
PiA+IG9yZGVyaW5nIHN0aWxsIGhhcyB0byBiZSBjaGFuZ2VkLgo+Cj4gRGVhZCBsb2NrcyBiZWNh
dXNlIG9mIHRoZSBvcmRlcmluZyBvZiByZWxlYXNlcyAob3IgbG9ja3Mgb3IgYWxpa2UpLAo+IG5v
dCBhY3F1aXJlcz8gVGhhdCBsb29rcyBzdXNwaWNpb3VzIHRvIG1lLCBpLmUuIHN1Z2dlc3RzIHll
dAo+IGFub3RoZXIgcHJvYmxlbSBlbHNld2hlcmUuCgpGV0lXIHBhZ2VfbG9jayBoYXMgdGhpcyB3
YXJuaW5nOgoKICogV2UgbXVzdCBuZXZlciBjYWxsIF9wdXRfcGFnZV90eXBlKCkgd2hpbGUgaG9s
ZGluZyBhIHBhZ2VfbG9jaygpIGZvcgogKiB0aGF0IHBhZ2U7IGRvaW5nIHNvIG1heSBjYXVzZSBh
IGRlYWRsb2NrIHVuZGVyIHRoZSByaWdodAogKiBjb25kaXRpb25zLgoKVGhhdCBzYWlkLCBJJ20g
d29ya2luZyBvbiBnZXR0aW5nIHJpZCBvZiB1c2luZyBwYWdlX2xvY2sgYWx0b2dldGhlcgpiZWNh
dXNlIGl0IGp1c3Qgb3Zlci1jb21wbGljYXRlcyB0aGluZ3MgZm9yIG5vIGdvb2QgcmVhc29uLiBT
aG91bGQgYmUKYWJsZSB0byBzZW5kIHRoZSBuZXcgcGF0Y2hlcyB0b2RheS4KClRhbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
