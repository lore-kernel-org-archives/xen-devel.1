From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/HVM: don't give the wrong impression of
 WRMSR succeeding
Date: Tue, 27 Feb 2018 01:39:56 -0700
Message-ID: <5A95276C02000078001AC104@prv-mh.provo.novell.com>
References: <5A8ED75E02000078001AA6A4@prv-mh.provo.novell.com>
 <4a278c80-0009-b875-c7ec-ea3333ae83b0@citrix.com>
 <5A8EF37002000078001AA7AB@prv-mh.provo.novell.com>
 <2aa2cf71-64e1-a810-f194-a4a62279a1ce@oracle.com>
 <5A8FD6FA02000078001AAB69@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=8ygc=fv=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eqant-0004Kv-Nl
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2018 08:40:05 +0000
In-Reply-To: <5A8FD6FA02000078001AAB69@prv-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjAyLjE4IGF0IDA4OjU1LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDIyLjAyLjE4IGF0IDIzOjE2LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdyb3Rl
Ogo+PiBPbiAwMi8yMi8yMDE4IDEwOjQ0IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9u
IDIyLjAyLjE4IGF0IDE1OjUzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+
Pj4gT24gMjIvMDIvMTggMTM6NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiAuLi4gZm9yIHVu
a25vd24gTVNSczogd3Jtc3JfaHlwZXJ2aXNvcl9yZWdzKCkncyBjb21tZW50IGNsZWFybHkgc2F5
cwo+Pj4+PiB0aGF0IHRoZSBmdW5jdGlvbiByZXR1cm5zIDAgZm9yIHVucmVjb2duaXplZCBNU1Jz
LCBzbwo+Pj4+PiB7c3ZtLHZteH1fbXNyX3dyaXRlX2ludGVyY2VwdCgpIHNob3VsZCBub3QgY29u
dmVydCB0aGlzIGludG8gc3VjY2Vzcy4KPj4+Pj4KPj4+Pj4gQXQgdGhlIHRpbWUgaXQgd2VudCBp
biwgY29tbWl0IDAxM2UzNGY1YTYgKCJ4ODY6IGhhbmRsZSBwYWdlZCBnZm4gaW4KPj4+Pj4gd3Jt
c3JfaHlwZXJ2aXNvcl9yZWdzIikgd2FzIHByb2JhYmx5IG9rYXksIHNpbmNlIHByaW9yIHRvIHRo
YXQgdGhlCj4+Pj4+IHJldHVybiB2YWx1ZSB3YXNuJ3QgY2hlY2tlZCBhdCBhbGwuIEJ1dCB0aGF0
J3Mgbm90IGhvdyB3ZSB3YW50IHRoaW5ncwo+Pj4+PiB0byBiZSBoYW5kbGVkIG5vd2FkYXlzLgo+
Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
Cj4+Pj4gSSBhZ3JlZSBpbiBwcmluY2lwbGUsIGJ1dCB0aGlzIGRvZXMgaGF2ZSBhIGxhcmdlIHBv
dGVudGlhbCByaXNrIGZvcgo+Pj4+IGd1ZXN0cy4gIEFueSB1bmtub3duIE1TUiB3aGljaCBndWVz
dHMgZG9uJ3QgY2hlY2sgZm9yICNHUCBmYXVsdHMgZnJvbQo+Pj4+IHdpbGwgbm93IGNhdXNlIHRo
ZSBndWVzdHMgdG8gY3Jhc2guCj4+Pj4KPj4+PiBUaGF0IHNhaWQsIGl0IGlzIHRoZSBjb3JyZWN0
IGRpcmVjdGlvbiB0byBnbyBsb25nLXRlcm0sIGFuZCB3ZSd2ZSBnb3QgdG8KPj4+PiB0aHJvdyB0
aGUgc3dpdGNoIHNvbWUgdGltZSwgYnV0IEkgZXhwZWN0IHRoaXMgd2lsbCBjYXVzZSBwcm9ibGVt
cyBpbiB0aGUKPj4+PiBzaG9ydCB0ZXJtLCBlc3BlY2lhbGx5IGZvciBtaWdyYXRlZC1pbiBndWVz
dHMuCj4+PiBUaGlua2luZyBhYm91dCB0aGlzIGFnYWluLCB0aGUgUkRNU1Igc2lkZSBvZiB0aGlu
Z3MgYWxyZWFkeSByYWlzZXMKPj4+ICNHUCBmb3IgaW5hY2Nlc3NpYmxlIE1TUnMuIFdlIG9idmlv
dXNseSBjYW4ndCBkbyBhIHByb2JpbmcgV1JNU1IKPj4+IGluIHtzdm0sdm14fV9tc3Jfd3JpdGVf
aW50ZXJjZXB0KCksIGJ1dCBjb3VsZG4ndCB3ZSByZG1zcl9zYWZlKCkKPj4+IGluIHRoZSAiY2Fz
ZSAwOiIgYmxvY2ssIHRyZWF0aW5nIHRoZSByZXN1bHQgYXMgdGhlIHZlcmRpY3Qgd2hldGhlciB0
bwo+Pj4gcmFpc2UgI0dQIHRvIHRoZSBndWVzdD8gQXMgdGhlIHJlYWQgcGF0aCBkb2VzIHRoaXMg
YW55d2F5LCB3ZSdyZQo+Pj4gbm90IGV4cG9zaW5nIG91cnNlbHZlcyB0byBuZXcgcmlza3MuCj4+
IAo+PiBXaGF0IGFib3V0IHdyaXRlLW9ubHkgTVNScz8KPiAKPiBCYWQgbHVjayAoSSdtIHNvcnJ5
IHRvIHNheSBzbywgYnV0IHdlIGhhdmUgYW4gYWN0dWFsIGJ1ZyB0byBmaXggaGVyZSkuCj4gSWYg
d2UgZmluZCBhbnkgc3VjaCBpcyB1c2VkLCB3ZSdsbCBoYXZlIHRvIGFkZCBpbmRpdmlkdWFsIGNh
c2UgbGFiZWxzLgoKU2luY2UgaXQgd2Fzbid0IGNsZWFyIHdpdGggeW91ciBxdWVzdGlvbiBhYm92
ZSBhbmQgeW91IGVhcmxpZXIKZ2l2ZW4gUi1iLCBJIGhhZCBkcm9wcGVkIHRoZSBsYXR0ZXIgZnJv
bSB2Mi4gQ291bGQgeW91IGNsYXJpZnkKd2hldGhlciBJIG1heSByZWluc3RhdGUgaXQ/CgpUaGFu
a3MsIEphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
