From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 4/6] replace vCPU's dirty CPU mask by
	numeric ID
Date: Mon, 22 Jan 2018 09:44:10 +0000
Message-ID: <ae0e33f1-9afa-2344-51b0-eb6276039f07@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A62257A02000078001A0791@prv-mh.provo.novell.com>
 <e841050d-ab7e-5486-3e4c-2b6cdd574ed0@citrix.com>
 <5A65BF6602000078001A0F24@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=zvfe=er=hermes.cam.ac.uk=amc96@srs-us1.protection.inumbo.net>)
 id 1edYeJ-0003u0-Iz
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 09:44:19 +0000
In-Reply-To: <5A65BF6602000078001A0F24@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, GeorgeDunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMjAxOCAwOTozOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTkuMDEuMTgg
YXQgMTg6NDgsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gT24gMTkvMDEv
MTggMTY6MDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4gQXQgbW9zdCBvbmUgYml0IGNhbiBiZSBz
ZXQgaW4gdGhlIG1hc2tzLCBzbyBlc3BlY2lhbGx5IG9uIGxhcmdlciBzeXN0ZW1zCj4+PiBpdCdz
IHF1aXRlIGEgYml0IG9mIHVubmVjZXNzYXJ5IG1lbW9yeSBhbmQgcHJvY2Vzc2luZyBvdmVyaGVh
ZCB0byB0cmFjawo+Pj4gdGhlIGluZm9ybWF0aW9uIGFzIGEgbWFzay4gU3RvcmUgdGhlIG51bWVy
aWMgSUQgb2YgdGhlIHJlc3BlY3RpdmUgQ1BVCj4+PiBpbnN0ZWFkLCBvciBOUl9DUFVTIGlmIG5v
IGRpcnR5IHN0YXRlIGV4aXN0cy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4+IERlZmluaXRlbHkgKzEgZm9yIHRoaXMgY2hhbmdlLgo+Pgo+
PiBIb3dldmVyLCB0aGUgY29tcGFyaXNvbiBhZ2FpbnN0IG5yX2NwdV9pZHMgaXNuJ3QgY29tcGxl
dGVseSBvYnZpb3VzIGFzCj4+IHRvIGl0cyBmdW5jdGlvbi4gIEhvdyBhYm91dCBpbnRyb2R1Y2lu
ZyBhIHByZWRpY2F0ZSBzdWNoIGFzIHZjcHVfZGlydHkoKQo+PiB3aGljaCB3cmFwcyB0aGUgdXNl
IG9mIHRoZSBpZD8KPiBJIGNhbiBkbyB0aGF0Lgo+Cj4+IEFsc28sIHlvdSdkIGdldCBiZXR0ZXIg
Y29kZSBieSB1c2luZyBOUl9DUFVTIHdoaWNoIGlzIGEgY29tcGlsZS10aW1lCj4+IGNvbnN0YW50
LCByYXRoZXIgdGhhbiBucl9jcHVfaWRzIHdoaWNoIHdvdWxkIGJlIGEgbWVtb3J5IHJlYWQuCj4g
SSBkaWQgY29uc2lkZXIgaXQsIGJ1dCBkZWNpZGVkIHRoYXQgdGhlIGNoZWNrIGJlaW5nIG1vcmUg
dGlnaHQgd2hlbgo+IHVzaW5nIG5yX2NwdV9pZHMgaXMgcHJlZmVyYWJsZS4gVGhlIGNoZWNrcyBz
aXQgaW4gQVNTRVJUKClzIG9ubHkKPiBhbnl3YXksIGkuZS4gSSBkb24ndCB0aGluayBwZXJmb3Jt
YW5jZSBtYXR0ZXJzIG11Y2guCgpUaGUgcHJvYmxlbSBpcyBub3QgcGVyZm9ybWFuY2Ugb2YgdGhl
IGFzc2VydGlvbnMsIGJ1dCByYXRoZXIgaG93IG9idmlvdXMKdGhlIGNvZGUgaXMgY29uY2Vybmlu
ZyBpdHMgZnVuY3Rpb24uwqAgTWl4aW5nIHRoZSB1c2Ugb2YgbnJfY3B1X2lkcyBhbmQKTlJfQ1BV
UyBtYWtlcyB0aGluZ3MgbGVzcyBvYnZpb3VzLgoKQWxzbywgb24gZnVydGhlciBjb25zaWRlcmF0
aW9uLCBhICNkZWZpbmUgVkNQVV9DTEVBTiAofjB1KSBjb25zdGFudAptaWdodCBiZSBiZXR0ZXIg
dGhhbiBOUl9DUFVTIGZvciBjb21wYXJpc29ucywgYXMgaXQgY2FuIGJlIHVzZWQgYXMgYQppbW04
IHJhdGhlciB0aGFuIG5lZWRpbmcgdG8gYmUgaW1tMzIsIGFuZCB3b3VsZCBjZXJ0YWlubHkgaGVs
cCB0aGUKY2xhcml0eSBvZiB0aGUgbG9naWMuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
