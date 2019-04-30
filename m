From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
Date: Tue, 30 Apr 2019 15:43:21 +0100
Message-ID: <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m7Se=TA=citrix.com=prvs=016bbe1f6=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hLTyf-0000ii-Cw
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 14:43:25 +0000
In-Reply-To: <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Tamas K Lengyel <tamas@tklengyel.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8zMC8xOSA5OjQ0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4wNC4xOSBh
dCAxMDoyOCwgPHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+PiBPbiBUdWUsIEFwciAzMCwg
MjAxOSBhdCAxOjE1IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+
Pgo+Pj4+Pj4gT24gMjkuMDQuMTkgYXQgMTg6MzUsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPiB3cm90
ZToKPj4+PiBPbiBNb24sIEFwciAyOSwgMjAxOSBhdCA5OjE4IEFNIEphbiBCZXVsaWNoIDxKQmV1
bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4+IE9uIDI2LjA0LjE5IGF0IDE5OjIxLCA8dGFt
YXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0uYwo+
Pj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tLmMKPj4+Pj4+IEBAIC0yMDMwLDEyICsyMDMwLDEx
IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCAKPj4gY3VycmVudF9sb2NrZWRfcGFnZV9uZV9jaGVjayhz
dHJ1Y3QgcGFnZV9pbmZvICpwYWdlKSB7Cj4+Pj4+PiAgI2RlZmluZSBjdXJyZW50X2xvY2tlZF9w
YWdlX25lX2NoZWNrKHgpIHRydWUKPj4+Pj4+ICAjZW5kaWYKPj4+Pj4+Cj4+Pj4+PiAtaW50IHBh
Z2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+Pj4+Pj4gKyNpZiBkZWZpbmVkKENPTkZJ
R19QVikgfHwgZGVmaW5lZChDT05GSUdfSEFTX01FTV9TSEFSSU5HKQo+Pj4+Pj4gK3N0YXRpYyBp
bnQgX3BhZ2VfbG9jayhzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKQo+Pj4+Pgo+Pj4+PiBBcyBwZXIg
YWJvdmUsIHBlcnNvbmFsbHkgSSdtIGFnYWluc3QgaW50cm9kdWNpbmcKPj4+Pj4gcGFnZV97LHVu
fWxvY2tfbWVtc2hyKCksIGFzIHRoYXQgbWFrZXMgdGhlIGFidXNlIGV2ZW4gbW9yZQo+Pj4+PiBs
b29rIGxpa2UgcHJvcGVyIHVzZS4gQnV0IGlmIHRoaXMgd2FzIHRvIGJlIGtlcHQgdGhpcyB3YXks
IG1heSBJCj4+Pj4+IGFzayB0aGF0IHlvdSBzd2l0Y2ggaW50IC0+IGJvb2wgaW4gdGhlIHJldHVy
biB0eXBlcyBhdCB0aGlzIG9jY2FzaW9uPwo+Pj4+Cj4+Pj4gU3dpdGNoaW5nIHRoZW0gdG8gYm9v
bCB3b3VsZCBiZSBmaW5lLiBSZXBsYWNpbmcgdGhlbSB3aXRoIHNvbWV0aGluZwo+Pj4+IHNhbmVy
IGlzIHVuZm9ydHVuYXRlbHkgb3V0LW9mLXNjb3BlIGF0IHRoZSBtb21lbnQuIFVubGVzcyBzb21l
b25lIGhhcwo+Pj4+IGEgc3BlY2lmaWMgc29sdXRpb24gdGhhdCBjYW4gYmUgcHV0IGluIHBsYWNl
LiBJIGRvbid0IGhhdmUgb25lLgo+Pj4KPj4+IEkndmUgb3V0bGluZWQgYSBzb2x1dGlvbiBhbHJl
YWR5OiBNYWtlIGEgbWVtLXNoYXJpbmcgcHJpdmF0ZSB2YXJpYW50Cj4+PiBvZiBwYWdlX3ssdW59
bG9jaygpLCBkZXJpdmVkIGZyb20gdGhlIFBWIG9uZXMgKGJ1dCB3aXRoIHBpZWNlcwo+Pj4gZHJv
cHBlZCB5b3UgZG9uJ3Qgd2FudC9uZWVkKS4KPj4KPj4gV2VsbCwgdGhhdCdzIHdoYXQgSSBhbHJl
YWR5IGRpZCBoZXJlIGluIHRoaXMgcGF0Y2guIE5vPwo+IAo+IE5vIC0geW91J3ZlIHJldGFpbmVk
IGEgc2hhcmVkIF9wYWdlX3ssdW59bG9jaygpLCB3aGVyZWFzIG15Cj4gc3VnZ2VzdGlvbiB3YXMg
dG8gaGF2ZSBhIGNvbXBsZXRlbHkgaW5kZXBlbmRlbnQgcGFpciBvZgo+IGZ1bmN0aW9ucyBpbiBt
ZW1fc2hhcmluZy5jLiBUaGUgb25seSB0aGluZyBuZWVkZWQgYnkgYm90aCBQVgo+IGFuZCBIVk0g
d291bGQgdGhlbiBiZSB0aGUgUEdUX2xvY2tlZCBmbGFnLgoKQnV0IGl0IHdhc24ndCBvYnZpb3Vz
IHRvIG1lIGhvdyB0aGUgaW1wbGVtZW50YXRpb25zIG9mIHRoZSBhY3R1YWwgbG9jawpmdW5jdGlv
biB3b3VsZCBiZSBiZSBkaWZmZXJlbnQuICBBbmQgdGhlcmUncyBubyBwb2ludCBpbiBoYXZpbmcg
dHdvCmlkZW50aWNhbCBpbXBsZW1lbnRhdGlvbnM7IGluIGZhY3QsIGl0IHdvdWxkIGJlIGhhcm1m
dWwuCgogLUdlb3JnZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
