From: Vasilis Liaskovitis <vliaskovitis@suse.com>
Subject: Re: [PATCH v1 1/4] xen: add hypercall for getting
 parameters at runtime
Date: Mon, 18 Mar 2019 16:44:53 +0100
Message-ID: <bc2190c092ead3c29167b0ca3417e01afcfdec2f.camel@suse.com>
References: <5C8FA508020000780021FE6B@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PVPW=RV=suse.com=vliaskovitis@srs-us1.protection.inumbo.net>)
 id 1h5uSB-00053q-40
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2019 15:45:31 +0000
In-Reply-To: <5C8FA508020000780021FE6B@suse.com>
References: =?UTF-8?Q?=3C20190306125832=2E9390=C2=84?=
 =?UTF-8?Q?1=C2=84vliaskovitis=40suse=2Ec?= =?UTF-8?Q?om=3E?=
 =?UTF-8?Q?=09=20=3C20190306125832=2E939?=
 =?UTF-8?Q?0=C2=842=C2=84vliaskovitis=40suse?= =?UTF-8?Q?=2Ecom=3E?=
 =?UTF-8?Q?=09=20=3C5C89313F0200007800?= =?UTF-8?Q?21E497=40suse=2Ecom=3E?=
 =?UTF-8?Q?=09=20=3Ccea582cc2d10bfff1f?= =?UTF-8?Q?3932df582d7369a59609a?=
 =?UTF-8?Q?4=2Ecamel=40suse=2Ecom=3E?=
 =?UTF-8?Q?=09=20=3C5C8FA5080200007800?= =?UTF-8?Q?21FE6B=40suse=2Ecom=3E?=
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, Daniel de Graaf <dgdegra@tycho.nsa.gov>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyMDE5LTAzLTE4IGF0IDE1OjAyICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4gPiBGcm9tIHRoZSByZXR1cm4gdmFsdWUgb2Ygc3RyY21wKCk/IEkgZG9uJ3QgdGhpbmsgc28s
IGJlY2F1c2UKPiA+ID4gPiB5b3UKPiBtYXkgaGF2ZSBydW4gcGFzdCBhbGwgdGFibGUgZW50cmll
cy4gSW5zdGVhZCBpdCdzIHRoYXQgcHJvcGVydHkKPiB0aGF0IHlvdSBjYW4gdXNlLCBpLmUuIGNo
ZWNraW5nIHdoZXRoZXIgLi4uCj4gCj4gPiA+ID4gKyAgICAgICAgZm9yICggcGFyYW0gPSBzdGFy
dDsgcGFyYW0gPCBlbmQ7IHBhcmFtKysgKQo+IAo+IC4uLiB0aGUgbG9vcCBlbmQgY29uZGl0aW9u
IHdhcyBoaXQuCgpyaWdodC4KCj4gCj4gPiA+IEknbSBhbHNvCj4gPiA+IHVuY29udmluY2VkIHRo
aXMgaXMgYXBwcm9wcmlhdGUgaWYgdGhlIHZhbHVlIGlzIGFjdHVhbGx5Cj4gPiA+IGEgc2lnbmVk
IHF1YW50aXR5Lgo+ID4gCj4gPiBpc24ndCBPUFRfVUlOVCBvbmx5IGZvciB1bnNpZ25lZCBpbnRl
Z2Vycz8KPiAKPiBZb3UnbGwgbm90aWNlIHRoYXQgdGhlcmUncyBubyBPUFRfSU5UIG9yIE9QVF9T
SU5ULiBPUFRfVUlOVAo+IG1heSBiZSBzbGlnaHRseSBtaXNsZWFkaW5nIGFzIGEgbmFtZS4gT3Rv
aCB3ZSBwcm9iYWJseSBkb24ndAo+IGhhdmUgdmVyeSBtYW55IHNpZ25lZCBpbnRlZ2VyIG9wdGlv
bnMuCgpJIHNlZS4gQXNzdW1pbmcgYW4gdW5zaWduZWQgcGFyYW1ldGVyIGlzIHByb2JsZW1hdGlj
IHRoZW4uCgpEb2Vzbid0IHRoZSAuZGF0YS5wYXJhbSBzZWN0aW9uIChiZXR3ZWVuIF9fcGFyYW1f
c3RhcnQgYW5kIF9fcGFyYW1fZW5kKQpvbmx5IGluY2x1ZGUgcnVudGltZSBwYXJhbWV0ZXJzLCBv
ZiB3aGljaCB0aGUgaW50ZWdlciBvbmVzIGFyZSBhbGwKdW5zaWduZWQgaW50ZWdlcnMgYXQgdGhl
IG1vbWVudD8gT3Igd291bGQgeW91IGxpa2UgdG8gc2VlIHRoaXMKZnVuY3Rpb25hbGl0eSBldmVu
dHVhbGx5IHVzZWQgZm9yIGFsbCBwYXJhbWV0ZXJzLCBpbmNsdWRpbmcgbm9uLXJ1bnRpbWUgCmFz
IHdlbGw/Cgo+ID4gCj4gPiB3aXRoIHRoZSBuZXcgZ2V0X2Z1bmMgcHJvdG90eXBlIGJlaW5nOgo+
ID4gCj4gPiAgICAgICAgICAgICBjb25zdCBjaGFyICooKmdldF9mdW5jKSh2b2lkKTsKPiA+IAo+
ID4gcmV0dXJuaW5nIGEgc3RyaW5nIHdpdGggdGhlIGN1cnJlbnQgdmFsdWUgb2YgdGhlIHBhcmFt
ZXRlci4KPiAKPiBBbmQgd2hlcmUgd291bGQgdGhlIHN0b3JhZ2UgbGl2ZSBmb3IgdGhlIHN0cmlu
Zz8KCkkgd2FzIHRoaW5raW5nIHRoZXNlIGN1c3RvbSBmdW5jdGlvbnMgd291bGQgcmV0dXJuIHN0
YXRpYyBzdHJpbmdzLCBhcwpsb2dsdmxfc3RyKCkgZG9lcywgYW5kIHRoZXNlIHdvdWxkIGV2ZW50
dWFsbHkgYmUgY29waWVkIGludG8gdGhlIHVzZXIKcHJvdmlkZWQgdmFsdWVzW10gYnVmZmVyIHZp
YSBzbnByaW50ZiBpbiBnZXRfcGFyYW1zKCkuCgo+IAo+ID4gZS5nLiB0aGUgZnVuY3Rpb24gZm9y
IGxvZ2x2bCwgZ3Vlc3RfbG9nbHZsIGNvdWxkIHJldHVybiBvdXRwdXQKPiA+IHVzaW5nCj4gPiBs
b2dsdmxfc3RyKCkgOiAgIk5vdGhpbmciLCAiRXJyb3JzIiwgIkVycm9ycyBhbmQgd2FybmluZ3Mi
IGV0Yy4KPiA+IAo+ID4gQW4gYWx0ZXJuYXRpdmUgcHJvdG90eXBlIGNvdWxkIGJlOgo+ID4gCj4g
PiAgICAgICAgICAgICBpbnQgKCpnZXRfZnVuYykoY2hhciAqb3V0cHV0KTsKPiA+IAo+ID4gaWYg
d2Ugd2FudCB0aGUgZnVuY3Rpb24gdG8gd3JpdGUgdGhlIGN1cnJlbnQgcGFyYW1ldGVyIHZhbHVl
IGludG8gYQo+ID4gY2FsbGVyLXByb3ZpZGVkIGJ1ZmZlciwgYW5kIHBvc3NpYmx5IHJldHVybiBl
cnJvciBjb2Rlcy4KPiAKPiBBbmQgaG93IHdvdWxkIHRoZSBjYWxsZWUga25vdyBob3cgbXVjaCBz
cGFjZSB0aGVyZSBpcz8KCnllcywgYW4gZXh0cmEgc2l6ZSBhcmd1bWVudCB3b3VsZCBiZSBuZWVk
ZWQgZnJvbSB0aGUgY2FsbGVyIGhlcmUuCgpMZXQgbWUga25vdyBpZiBlaXRoZXIgb2YgdGhlc2Ug
b3IgYSBkaWZmZXJlbnQgYXBwcm9hY2ggaXMgcHJlZmVycmVkLgoKPiA+IAo+IFlvdSBjZXJ0YWlu
bHkgc2hvdWxkbid0IGFjY2VzcyB0aGVtIGZyb20gc3lzY3RsLmMuIFlvdSBzaG91bGQKPiBzaW1w
bHkgbWFrZSBnZXRfcGFyYW1zKCkgYWNjZXNzIHRoZW0gaW5zdGVhZCBvZiB3aGF0IGl0cwo+IG9u
bHkgY2FsbGVyIHBhc3NlcywgYXQgd2hpY2ggcG9pbnQgdGhlIGZ1bmN0aW9uIHNob3VsZCBiZQo+
IHJlbmFtZWQgdG8gaXQgb25seSBjYWxsZXIncyBuYW1lLgoKLi4uIG9mIGNvdXJzZS4KCgp0aGFu
a3MsCgotIFZhc2lsaXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
