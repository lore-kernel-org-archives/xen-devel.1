From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v5 01/16] x86/mm: skip incrementing mfn if
 it is not a valid mfn
Date: Thu, 15 Mar 2018 16:06:59 +0000
Message-ID: <CAFLBxZbtyMb3bmtBGUo98MM-rMMfpjd70bFub1zGqvyD=CaQRg@mail.gmail.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-2-julien.grall@arm.com>
 <0c778b64-7eda-48fb-7eaf-8e766dfc334a@citrix.com>
 <5AAA344B02000078001B1EBE@prv-mh.provo.novell.com>
 <6529a09f-93fd-474d-358a-064f8a0948ee@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <6529a09f-93fd-474d-358a-064f8a0948ee@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <JBeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMTI6MTYgUE0sIEFuZHJldyBDb29wZXIKPGFuZHJldy5j
b29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+IE9uIDE1LzAzLzE4IDA3OjUyLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+Pj4gT24gMTQuMDMuMTggYXQgMTk6MzEsIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPiB3cm90ZToKPj4+IE9uIDE0LzAzLzE4IDE4OjE5LCBqdWxpZW4uZ3JhbGxAYXJtLmNv
bSB3cm90ZToKPj4+PiBGcm9tOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4+Cj4+
Pj4gVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCB0byBmaWxsIGluIHBhZ2UgdGFibGUgZW50cmllcyBp
bgo+Pj4+IHBvcHVsYXRlX3B0X3JhbmdlLiBTa2lwIGluY3JlbWVudGluZyBtZm4gaWYgaXQgaXMg
aW52YWxpZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJp
eC5jb20+Cj4+PiBSZW1pbmQgbWUgd2hhdCB0aGUgcHVycG9zZSBvZiB0aGlzIHBhdGNoIGlzPwo+
PiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIHRvIHN3aXRjaCBjYWxsZXJzIHRvIHBhc3MgSU5WQUxJ
RF9NRk4KPj4gaW5zdGVhZCBvZiB6ZXJvIGZvciBub24tcHJlc2VudCBtYXBwaW5ncy4gVGhlIGlu
Y3JlbWVudGluZwo+PiBmcm9tIHplcm8gd2FzIHdyb25nIGhlcmUgYWxyZWFkeSAoYnV0IGNvdWxk
bid0IGJlIGFzIGVhc2lseQo+PiBhdm9pZGVkLCB0byBub3QgY2F1c2UgcHJvYmxlbXMgd2l0aCBw
b3NzaWJsZSBsZWdpdGltYXRlIHVzZXMgb2YKPj4gTUZOIDApLCBidXQgaW5jcmVtZW50aW5nIChh
bmQgd3JhcHBpbmcpIGZyb20gSU5WQUxJRF9NRk4gaXMKPj4gKGltbykgZXZlbiB3b3JzZSwgd2hp
Y2ggaXMgd2h5IEkgaGFkIGFza2VkIHRoZSBjb252ZXJzaW9uIHRvCj4+IElOVkFMSURfTUZOIHRv
IG5vdCBiZSBkb25lIHdpdGhvdXQgdGhpcyBjaGFuZ2UuCj4KPiBZZXMuICBNeSByZXBseSB3YXMg
YSAoY2xlYXJseSB0b28pIHRoaW5seSB2ZWlsZWQgaGludCB0aGF0IGEgc2VudGVuY2UgdG8KPiB0
aGlzIGVmZmVjdCBzaG91bGQgYmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgoKWW91IG1lYW4gImEg
KGNsZWFybHkgbm90IHRoaW5seSBlbm91Z2gpIHZlaWxlZCBoaW50Ii4gOi0pCgpJIGFncmVlIHdp
dGggQW5keSByZSBib3RoIHRoZSBjb2RlIGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UuCgogLUdlb3Jn
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
