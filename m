From: Alistair Francis <alistair23@gmail.com>
Subject: Re: [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
Date: Fri, 17 May 2019 15:02:47 -0700
Message-ID: <CAKmqyKN5N6sQ4rpzGpSgCHRPU7Y490YT=3FhNXKWo3EA8zsXjg@mail.gmail.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
 <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
 <5CDE5414020000780022FED3@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Ke0=TR=gmail.com=alistair23@srs-us1.protection.inumbo.net>)
 id 1hRkyN-0006Y7-7P
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 22:05:03 +0000
Received: by mail-lj1-x242.google.com with SMTP id w1so7621289ljw.0
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2019 15:05:01 -0700 (PDT)
In-Reply-To: <5CDE5414020000780022FED3@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>, Alistair Francis <alistair.francis@wdc.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMTE6MjYgUE0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1
c2UuY29tPiB3cm90ZToKPgo+ID4+PiBPbiAxNi4wNS4xOSBhdCAyMTozMCwgPGFsaXN0YWlyMjNA
Z21haWwuY29tPiB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDE2LCAyMDE5IGF0IDM6MzIgQU0gSmFu
IEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPiA+Pgo+ID4+ID4+PiBPbiAxNi4w
NS4xOSBhdCAwMjowMiwgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4gd3JvdGU6Cj4gPj4gPiBN
YWtlIHRoZSBhc20vdnBsMDExLmggZGVwZW5kZW50IG9uIHRoZSBBUk0gYXJjaGl0ZWN0dXJlLgo+
ID4+Cj4gPj4gQnV0IHdlIG9ubHkgaGF2ZSB4ODYgYW5kIEFybSByaWdodCBub3cuIEEgd29yZCBt
b3JlIGFib3V0Cj4gPj4geW91ciBtb3RpdmF0aW9uIHdvdWxkIGhlbHAuCj4gPgo+ID4gQXMgdGhl
IGNvZGUgY3VycmVudGx5IGlzIG5vIG9uZSBjYW4gYWRkIGFub3RoZXIgYXJjaGl0ZWN0dXJlLiBU
aGlzIGlzCj4gPiBqdXN0IGEgZ2VuZXJhbCBmaXh1cCBhcyBhc3N1bWluZyBYZW4gd2lsbCBvbmx5
IGV2ZXIgc3VwcG9ydCB0d28gYXJjaHMKPiA+IHNlZW1zIHN0cmFuZ2UuCj4KPiBCdXQgdGhhdCdz
IHRoZW4gbm90IHRoZSBvbmx5IHBsYWNlLCBpcyBpdD8gSSdkIG5vdCBleHBlY3QgYSBzaW5nbGUs
Cj4gcmFuZG9tIGNoYW5nZSBvZiB0aGlzIGtpbmQgdG8gYmUgc2VudCBhbGwgb24gaXRzIG93biBp
biBzdWNoIGEKPiBjYXNlLgoKVGhpcyBpcyB0aGUgb25seSBjYXNlIHRoYXQgSSBoYXZlIHJ1biBp
bnRvIHdoZXJlIHRoZXJlIGlzbid0IGEgc2FuZQojZWxzZSBjb25kaXRpb24uIE1vc3Qgb3RoZXIg
I2lmZGVmcyBmYWxsIHRocm91Z2ggdG8gYW4gIlVuc3VwcG9ydGVkLi4iCm1lc3NhZ2UgaW4gdGhl
ICNlbHNlLgoKPgo+ID4+IEFsc28gSSBkb24ndCB0aGluayB5b3VyIENjIGxpc3QgaXMgd2lkZSBl
bm91Z2ggZm9yIHRoaXMgY2hhbmdlLgo+ID4KPiA+IEkgY291bGRuJ3QgZmluZCBhbnlvdGhlciBw
ZW9wbGUgaW4gdGhlIE1BSU5UQUlORVJTIGZpbGUsIHdobyBlbHNlIHNob3VsZCBJCj4gPiBDQz8K
Pgo+IFdlbGwsIGhvdyBkaWQgeW91IGxhbmQgYXQgQ2MtaW5nIHRoZSB0b29sIHN0YWNrIG1haW50
YWluZXJzIG9uCj4gdGhpcyBoeXBlcnZpc29yIGNoYW5nZT8gQW55d2F5IC0gdGhlcmUncyBhIHNl
Y3Rpb24gVEhFIFJFU1QKPiBhdCB0aGUgYm90dG9tIG9mIC4vTUFJTlRBSU5FUlMsIGFuZCB3ZSBh
bHNvIGhhdmUgdGhlIHR3bwo+IHNjcmlwdHMvKl9tYWludGFpbmVycy5wbCBzY3JpcHRzIHRvIGFp
ZCB5b3Ugd2l0aCBkZXRlcm1pbmluZwo+IHdobyB0byBDYy4KCkFoLCBzb3JyeS4gSSBqdXN0IGdy
ZXBwZWQgdGhlIGZpbGUgbmV4dCB0aW1lIEknbGwgbWFrZSBzdXJlIHRvIHR1cm4gdGhlIHNjcmlw
dC4KCkFsaXN0YWlyCgo+Cj4gSmFuCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
