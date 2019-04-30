From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v3 2/4] x86/mem_sharing: introduce and use
 page_lock_memshr instead of page_lock
Date: Tue, 30 Apr 2019 17:03:37 +0100
Message-ID: <b6b753ed-baa3-832f-5d40-e26d0a25a36a@citrix.com>
References: <20190426172138.14669-1-tamas@tklengyel.com>
 <20190426172138.14669-2-tamas@tklengyel.com>
 <5CC715D7020000780022A158@prv1-mh.provo.novell.com>
 <CABfawhmuCWcixtbcvs-7Psc3JGaUrWs50Dr4-aKgHVMYJXp+Rw@mail.gmail.com>
 <5CC7F611020000780022A3DF@prv1-mh.provo.novell.com>
 <CABfawhnjK-6KtLQx_bKngHg6+nHdjEMDYoSGErOGL5581JyZHw@mail.gmail.com>
 <5CC80AE3020000780022A44D@prv1-mh.provo.novell.com>
 <3c95a2b1-11bf-faff-5c55-99e517c56a48@citrix.com>
 <5CC8646F020000780022A89E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=m7Se=TA=citrix.com=prvs=016bbe1f6=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1hLVES-0007sB-9k
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 16:03:48 +0000
In-Reply-To: <5CC8646F020000780022A89E@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gNC8zMC8xOSA0OjA2IFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAzMC4wNC4xOSBh
dCAxNjo0MywgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IE9uIDQvMzAvMTkg
OTo0NCBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMC4wNC4xOSBhdCAxMDoyOCwg
PHRhbWFzQHRrbGVuZ3llbC5jb20+IHdyb3RlOgo+Pj4+IE9uIFR1ZSwgQXByIDMwLCAyMDE5IGF0
IDE6MTUgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3cm90ZToKPj4+Pj4gSSd2
ZSBvdXRsaW5lZCBhIHNvbHV0aW9uIGFscmVhZHk6IE1ha2UgYSBtZW0tc2hhcmluZyBwcml2YXRl
IHZhcmlhbnQKPj4+Pj4gb2YgcGFnZV97LHVufWxvY2soKSwgZGVyaXZlZCBmcm9tIHRoZSBQViBv
bmVzIChidXQgd2l0aCBwaWVjZXMKPj4+Pj4gZHJvcHBlZCB5b3UgZG9uJ3Qgd2FudC9uZWVkKS4K
Pj4+Pgo+Pj4+IFdlbGwsIHRoYXQncyB3aGF0IEkgYWxyZWFkeSBkaWQgaGVyZSBpbiB0aGlzIHBh
dGNoLiBObz8KPj4+Cj4+PiBObyAtIHlvdSd2ZSByZXRhaW5lZCBhIHNoYXJlZCBfcGFnZV97LHVu
fWxvY2soKSwgd2hlcmVhcyBteQo+Pj4gc3VnZ2VzdGlvbiB3YXMgdG8gaGF2ZSBhIGNvbXBsZXRl
bHkgaW5kZXBlbmRlbnQgcGFpciBvZgo+Pj4gZnVuY3Rpb25zIGluIG1lbV9zaGFyaW5nLmMuIFRo
ZSBvbmx5IHRoaW5nIG5lZWRlZCBieSBib3RoIFBWCj4+PiBhbmQgSFZNIHdvdWxkIHRoZW4gYmUg
dGhlIFBHVF9sb2NrZWQgZmxhZy4KPj4KPj4gQnV0IGl0IHdhc24ndCBvYnZpb3VzIHRvIG1lIGhv
dyB0aGUgaW1wbGVtZW50YXRpb25zIG9mIHRoZSBhY3R1YWwgbG9jawo+PiBmdW5jdGlvbiB3b3Vs
ZCBiZSBiZSBkaWZmZXJlbnQuICBBbmQgdGhlcmUncyBubyBwb2ludCBpbiBoYXZpbmcgdHdvCj4+
IGlkZW50aWNhbCBpbXBsZW1lbnRhdGlvbnM7IGluIGZhY3QsIGl0IHdvdWxkIGJlIGhhcm1mdWwu
Cj4gCj4gVGhlIG1haW4gZGlmZmVyZW5jZSB3b3VsZCBiZSB0aGUgb25lIHRoYXQgVGFtYXMgaXMg
YWZ0ZXIgLSBub3QKPiBkb2luZyB0aGUgY2hlY2tpbmcgdGhhdCB3ZSBkbyBmb3IgUFYuIFdoZXRo
ZXIgb3RoZXIgYml0cyBjb3VsZAo+IGJlIGRyb3BwZWQgZm9yIGEgbWVtLXNoYXJpbmcgc3BlY2lh
bCB2YXJpYW50IEkgZG9uJ3Qga25vdyAoeWV0KS4KClRoZSAiY2hlY2tpbmciIGJlaW5nIHRoYXQg
dGhlIHR5cGUgY291bnQgZG9lc24ndCBnbyB0byAwPwoKSXQncyBub3QganVzdCBwYWdlX2xvY2so
KSB0aGF0IGRvZXMgdGhhdCBjaGVja2luZzsgaXQncyBhbHNvCl9wdXRfcGFnZV90eXBlKCkuICBX
ZSBjYW4ndCByZWFsbHkgY2hhbmdlIG9uZSBidXQgbGVhdmUgdGhlIG90aGVyIGFsb25lLgoKVGhl
IGFwcHJvYWNoIEknbSBleHBsb3Jpbmcgbm93IGlzIHRvIGhhdmUgX3B1dF9wYWdlX3R5cGUoKSBv
bmx5IHNwaW4gb24KdGhlIGxhc3QgcGFnZSByZWZlcmVuY2UgaWYgdGhlIHR5cGUgPD0gUEdUX2w0
X3BhZ2VfdGFibGUgKGkuZS4sIGlmCl9wdXRfZmluYWxfcGFnZV90eXBlKCkgd291bGQgYmUgY2Fs
bGVkIGZvciB0aGlzIHR5cGUpLgoKVGhvdWdodHM/CgogLUdlb3JnZQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
