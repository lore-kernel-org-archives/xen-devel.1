From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] x86/mem_sharing: reorder when pages
 are unlocked and released
Date: Thu, 25 Apr 2019 08:03:54 -0600
Message-ID: <5CC1BE4A02000078002291B3@prv1-mh.provo.novell.com>
References: <20190412194712.1602-1-tamas@tklengyel.com>
 <3c3ff047-5026-8b4a-c980-822fb730eaea@citrix.com>
 <CABfawhnkt8i5VYEp2ySes9oBc6=pvrU-vcQ7G0UiuVNpW+g1QQ@mail.gmail.com>
 <F6EF77CA-6EF8-4B5A-AEA7-C6284D371ECD@citrix.com>
 <CABfawhkBp6WtQ-2W=MEUfWYhO68JnOj6V7O3ekTcBggJQEJGBA@mail.gmail.com>
 <5CC196A20200007800229009@prv1-mh.provo.novell.com>
 <CABfawhk1_gH-eni0rtve4jeqAJdSKbHP69PDawyCvqYq-E8Cvg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeyn-0001vJ-Pn
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 14:04:01 +0000
In-Reply-To: <CABfawhk1_gH-eni0rtve4jeqAJdSKbHP69PDawyCvqYq-E8Cvg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjA0LjE5IGF0IDE1OjMzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgNToxNCBBTSBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pgo+PiA+Pj4gT24gMTUuMDQuMTkgYXQgMTk6NTEsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPiB3cm90ZToKPj4gPiBTaW1wbHkgY2hhbmdpbmcgdG8gZ2V0X3BhZ2Ugd2l0aCBk
b21fY293IGlzIG5vdCBlbm91Z2gsIEkgcmFuIGludG8KPj4gPiBpc3N1ZXMgd2hlcmUgdGhlIHN5
c3RlbSBzdGlsbCBkZWFkbG9ja3MgZHVlIHRvIHRoZSBvcmRlcmluZyBvZgo+PiA+IHB1dF9wYWdl
X2FuZF90eXBlIGJlaW5nIGNhbGxlZCBiZWZvcmUgbWVtX3NoYXJpbmdfcGFnZV91bmxvY2suIFNv
IHRoZQo+PiA+IG9yZGVyaW5nIHN0aWxsIGhhcyB0byBiZSBjaGFuZ2VkLgo+Pgo+PiBEZWFkIGxv
Y2tzIGJlY2F1c2Ugb2YgdGhlIG9yZGVyaW5nIG9mIHJlbGVhc2VzIChvciBsb2NrcyBvciBhbGlr
ZSksCj4+IG5vdCBhY3F1aXJlcz8gVGhhdCBsb29rcyBzdXNwaWNpb3VzIHRvIG1lLCBpLmUuIHN1
Z2dlc3RzIHlldAo+PiBhbm90aGVyIHByb2JsZW0gZWxzZXdoZXJlLgo+IAo+IEZXSVcgcGFnZV9s
b2NrIGhhcyB0aGlzIHdhcm5pbmc6Cj4gCj4gICogV2UgbXVzdCBuZXZlciBjYWxsIF9wdXRfcGFn
ZV90eXBlKCkgd2hpbGUgaG9sZGluZyBhIHBhZ2VfbG9jaygpIGZvcgo+ICAqIHRoYXQgcGFnZTsg
ZG9pbmcgc28gbWF5IGNhdXNlIGEgZGVhZGxvY2sgdW5kZXIgdGhlIHJpZ2h0Cj4gICogY29uZGl0
aW9ucy4KCk9oLCBvZiBjb3Vyc2UuIEkgb25jZSBhZ2FpbiBmb3Jnb3QgdGhhdAptZW1fc2hhcmlu
Z19wYWdlX3VubG9jaygpIGNhbGxzIHBhZ2VfdW5sb2NrKCkuCgo+IFRoYXQgc2FpZCwgSSdtIHdv
cmtpbmcgb24gZ2V0dGluZyByaWQgb2YgdXNpbmcgcGFnZV9sb2NrIGFsdG9nZXRoZXIKPiBiZWNh
dXNlIGl0IGp1c3Qgb3Zlci1jb21wbGljYXRlcyB0aGluZ3MgZm9yIG5vIGdvb2QgcmVhc29uLiBT
aG91bGQgYmUKPiBhYmxlIHRvIHNlbmQgdGhlIG5ldyBwYXRjaGVzIHRvZGF5LgoKT2gsIHRoYXQn
cyBnb29kIG5ld3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
