From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC PATCH 08/12] libxl: Q35 support (new option
 device_model_machine)
Date: Wed, 21 Mar 2018 16:27:43 +0000
Message-ID: <20180321162743.trhk4f6olbbxoeaq@citrix.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <f553830567e76bd02fbeef431156d3189dd80aa7.1520867741.git.x1917x@gmail.com>
 <20180319170118.uf7uvyge63guo3aw@MacBook-Pro-de-Roger.local>
 <20180320081149.00003f2c@gmail.com>
 <20180320091110.e6l52uhzsycbqczm@MacBook-Pro-de-Roger.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=24tk=gl=citrix.com=prvs=6111f1d8b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eygj5-0006OB-OE
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 16:36:35 +0000
Content-Disposition: inline
In-Reply-To: <20180320091110.e6l52uhzsycbqczm@MacBook-Pro-de-Roger.local>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Alexey G <x1917x@gmail.com>, Anthony PERARD <anthony.perard@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMjAsIDIwMTggYXQgMDk6MTE6MTBBTSArMDAwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBUdWUsIE1hciAyMCwgMjAxOCBhdCAwODoxMTo0OUFNICsxMDAwLCBBbGV4
ZXkgRyB3cm90ZToKPiA+IE9uIE1vbiwgMTkgTWFyIDIwMTggMTc6MDE6MTggKzAwMDAKPiA+IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToKPiA+IAo+ID4gPk9u
IFR1ZSwgTWFyIDEzLCAyMDE4IGF0IDA0OjMzOjUzQU0gKzEwMDAsIEFsZXhleSBHZXJhc2ltZW5r
byB3cm90ZToKPiA+ID4+IFByb3ZpZGUgYSBuZXcgZG9tYWluIGNvbmZpZyBvcHRpb24gdG8gc2Vs
ZWN0IHRoZSBlbXVsYXRlZCBtYWNoaW5lCj4gPiA+PiB0eXBlLCBkZXZpY2VfbW9kZWxfbWFjaGlu
ZS4gSXQgaGFzIGZvbGxvd2luZyBwb3NzaWJsZSB2YWx1ZXM6Cj4gPiA+PiAtICJpNDQwIiAtIGk0
NDAgZW11bGF0aW9uIChkZWZhdWx0KQo+ID4gPj4gLSAicTM1IiAtIGVtdWxhdGUgYSBRMzUgbWFj
aGluZS4gQnkgZGVmYXVsdCwgdGhlIHN0b3JhZ2UgaW50ZXJmYWNlCj4gPiA+PiBpcyBBSENJLiAg
Cj4gPiA+Cj4gPiA+SSB3b3VsZCByYXRoZXIgbmFtZSB0aGlzIG1hY2hpbmVfY2hpcHNldCBvciBk
ZXZpY2VfbW9kZWxfY2hpcHNldC4KPiA+IAo+ID4gZGV2aWNlX21vZGVsXyBwcmVmaXggaXMgYSBt
dXN0IEkgdGhpbmsgLS0gbXVsdGlwbGUgZGV2aWNlIG1vZGVsIHJlbGF0ZWQKPiA+IG9wdGlvbnMg
aGF2ZSBuYW1lcyBzdGFydGluZyB3aXRoIGRldmljZV9tb2RlbF8uCj4gPiAKPiA+IGRldmljZV9t
b2RlbF9jaGlwc2V0Li4uIHdlbGwsIG1heWJlLCBidXQgd2UncmUgYWN0dWFsbHkgc3BlY2lmeWlu
ZyBhCj4gPiBRRU1VIG1hY2hpbmUgaGVyZS4gSW4gUUVNVSBtYWlsaW5nIGxpc3QgdGhlcmUgd2Fz
IGV2ZW4gYSBzdWdnZXN0aW9uCj4gPiB0byBhbGxvdyB0byBwYXNzIGEgbWFjaGluZSB2ZXJzaW9u
IG51bWJlciBoZXJlLCBsaWtlICJwYy1xMzUtMi4xMCIuCj4gPiBJIHRoaW5rIHNvbWUgb3Bpbmlv
bnMgYXJlIG5lZWRlZCBoZXJlLgo+IAo+IEknbSBub3Qgc3VyZSB3aGF0IGEgJ21hY2hpbmUnIGlz
IGluIFFFTVUgc3BlYWssIGJ1dCBpbiBteSBtaW5kIEkgd291bGQKPiBjb25zaWRlciBQQyBhIG1h
Y2hpbmUgKHZzIEFSTSBmb3IgZXhhbXBsZSkuCj4gCj4gSSB0aGluayAnY2hpcHNldCcgaXMgY2xl
YXJlciwgYnV0IGFnYWluIG90aGVycyBzaG91bGQgZXhwcmVzcyB0aGVpcgo+IG9waW5pb24uCgpB
SVVJIG1hY2hpbmUgaXMgYSBjb2xsZWN0aW9uIG9mIGNoaXBzZXQgYW5kIHBlcmlwaGVyYWxzLCBp
LmUuIGl0IGNvdmVycwptb3JlIHRoYW4gdGhlIGNoaXBzZXQgYWxvbmUuCgpDYyBBbnRob255IGZv
ciBjb3JyZWN0aW9uLgoKV2VpLgoKPiAKPiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
