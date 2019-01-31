From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v6 02/15] argo: introduce the argo_op
 hypercall boilerplate
Date: Wed, 30 Jan 2019 20:14:17 -0800
Message-ID: <CACMJ4GZrscrb_NBQo=E7z1FJTrBtda74shNcvRX2W5oo0+H7gA@mail.gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
 <1548295503-15946-3-git-send-email-christopher.w.clark@gmail.com>
 <ce2446ef-61ea-379f-8133-cb5a511f2557@arm.com>
 <CACMJ4GYiPhma+tKVefFSHqroVeEj+pGaQN2h2AnH=gtDDoJhww@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8IWo=QH=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gp3kG-0005v7-C0
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 04:14:32 +0000
Received: by mail-lj1-x242.google.com with SMTP id g11-v6so1478009ljk.3
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jan 2019 20:14:30 -0800 (PST)
In-Reply-To: <CACMJ4GYiPhma+tKVefFSHqroVeEj+pGaQN2h2AnH=gtDDoJhww@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBKYW4gMjUsIDIwMTkgYXQgMTA6NTUgQU0gQ2hyaXN0b3BoZXIgQ2xhcmsKPGNocmlz
dG9waGVyLncuY2xhcmtAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSmFuIDI0LCAyMDE5
IGF0IDI6MDggQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4g
Pgo+ID4gSGksCj4gPgo+ID4gT24gMjQvMDEvMjAxOSAwMjowNCwgQ2hyaXN0b3BoZXIgQ2xhcmsg
d3JvdGU6Cj4gPiA+IFByZXNlbmNlIGlzIGdhdGVkIHVwb24gQ09ORklHX0FSR08uCj4gPiA+Cj4g
PiA+IFJlZ2lzdGVycyB0aGUgaHlwZXJjYWxsIHByZXZpb3VzbHkgcmVzZXJ2ZWQgZm9yIHRoaXMu
Cj4gPiA+IFRha2VzIDUgYXJndW1lbnRzLCBkb2VzIG5vdGhpbmcgYW5kIHJldHVybnMgLUVOT1NZ
Uy4KPiA+ID4KPiA+ID4gV2lsbCBiZSBhdm9pZGluZyBhIGNvbXBhdCBBQkkgYnkgdXNpbmcgZml4
ZWQtc2l6ZSB0eXBlcyBpbiBoeXBlcmNhbGwgb3BzIHNvCj4gPiA+IEhZUEVSQ0FMTCwgcmF0aGVy
IHRoYW4gQ09NUEFUX0NBTEwsIGlzIHRoZSBjb3JyZWN0IG1hY3JvIGZvciB0aGUgaHlwZXJjYWxs
Cj4gPiA+IHRhYmxlcy4KPiA+ID4KPiA+ID4gRXZlbiB0aG91Z2ggaGFuZGxlcyB3aWxsIGJlIHVz
ZWQgZm9yICh1cCB0bykgdHdvIG9mIHRoZSBhcmd1bWVudHMgdG8gdGhlCj4gPiA+IGh5cGVyY2Fs
bCwgdGhlcmUgd2lsbCBiZSBubyBuZWVkIGZvciBhbnkgWExBVF8qIHRyYW5zbGF0aW9uIGZ1bmN0
aW9ucwo+ID4gPiBiZWNhdXNlIHRoZSByZWZlcmVuY2VkIGRhdGEgc3RydWN0dXJlcyBoYXZlIGJl
ZW4gY29uc3RydWN0ZWQgdG8gYmUgZXhhY3RseQo+ID4gPiB0aGUgc2FtZSBzaXplIGFuZCBiaXQg
cGF0dGVybiBvbiBib3RoIDMyLWJpdCBhbmQgNjQtYml0IGd1ZXN0cywgYW5kIHBhZGRlZAo+ID4g
PiB0byBiZSBpbnRlZ2VyIG11bHRpcGxlcyBvZiAzMiBiaXRzIGluIHNpemUuIFRoaXMgbWVhbnMg
dGhhdCB0aGUgc2FtZQo+ID4gPiBjb3B5X3RvX2d1ZXN0IGFuZCBjb3B5X2Zyb21fZ3Vlc3QgbG9n
aWMgY2FuIGJlIHJlbGllZCB1cG9uIHRvIHBlcmZvcm0gYXMKPiA+ID4gcmVxdWlyZWQgd2l0aG91
dCBhbnkgZnVydGhlciBpbnRlcnZlbnRpb24uIFRlc3RpbmcgY29tbXVuaWNhdGlvbiB3aXRoIDMy
Cj4gPiA+IGFuZCA2NCBiaXQgZ3Vlc3RzIGhhcyBjb25maXJtZWQgdGhpcyB3b3JrcyBhcyBpbnRl
bmRlZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlz
dG9waGVyLmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KPiA+ID4gQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+ID4KPiA+ID4gdjIgQ29weXJpZ2h0IGxpbmU6IGFkZCAy
MDE5Cj4gPiA+IHYyIGZlZWRiYWNrICMzIEphbjogZHJvcCAibWVzc2FnZSIgZnJvbSBhcmdvX21l
c3NhZ2Vfb3AKPiA+ID4gdjIgZmVlZGJhY2sgIzMgSmFuOiBhZGQgQWNrZWQtYnkKPiA+ID4gdjEg
ZmVlZGJhY2sgIzE1IEphbjogaGFuZGxlIHVwcGVyLWhhbHZlcyBvZiBoeXBlcmNhbGwgYXJncwo+
ID4gPiB2MSBmZWVkYmFjayAjMTUgSmFuOiB1c2UgdW5zaWduZWQgd2hlcmUgbmVnYXRpdmUgdmFs
dWVzIGltcG9zc2libGUKPiA+ID4gLS0tCj4gPiA+ICAgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVy
Y2FsbF9wYWdlLlMgfCAgMiArLQo+ID4gPiAgIHhlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMg
ICAgICAgIHwgIDMgKysrCj4gPiA+ICAgeGVuL2FyY2gveDg2L2h5cGVyY2FsbC5jICAgICAgICAg
ICAgfCAgMyArKysKPiA+ID4gICB4ZW4vYXJjaC94ODYvcHYvaHlwZXJjYWxsLmMgICAgICAgICB8
ICAzICsrKwo+ID4KPiA+IFNvcnJ5IGZvciBub3RpY2luZyBxdWl0ZSBsYXRlIGluIHRoZSBwcm9j
ZXNzLiBEb24ndCB5b3UgbmVlZCB0byBhZGQgdGhlCj4gPiBoeXBlcmNhbGwgaW4geGVuL2FyY2gv
YXJtL3RyYXBzLmM/Cj4KCkFkZGluZyB0aGlzIGxvb2tlZCBmaW5lLCBzbyBJJ3ZlIGFkZGVkIHRo
ZSBBUk0gaHlwZXJjYWxsIHRhYmxlIGVudHJ5IHRvCnRoaXMgcGF0Y2guCgpDaHJpc3RvcGhlcgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
