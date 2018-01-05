From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 01/44] passthrough/vtd: Don't DMA to the
 stack in queue_invalidate_wait()
Date: Fri, 5 Jan 2018 09:33:58 +0000
Message-ID: <461920c4-7c3e-8118-cae0-f97033a8d1ce@citrix.com>
References: <1515097329-31902-1-git-send-email-andrew.cooper3@citrix.com>
 <1515097329-31902-2-git-send-email-andrew.cooper3@citrix.com>
 <5A4F5192020000780019B485@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A4F5192020000780019B485@prv-mh.provo.novell.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDEvMjAxOCAwOToyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDQuMDEuMTgg
YXQgMjE6MjEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gRE1BLWluZyB0
byB0aGUgc3RhY2sgaXMgZ2VuZXJhbGx5IGNvbnNpZGVyZWQgYmFkIHByYWN0aWNlLiAgSW4gdGhp
cyBjYXNlLCBpZiBhCj4+IHRpbWVvdXQgb2NjdXJzIGJlY2F1c2Ugb2YgYSBzbHVnZ2lzaCBkZXZp
Y2Ugd2hpY2ggaXMgcHJvY2Vzc2luZyB0aGUgcmVxdWVzdCwKPj4gdGhlIGNvbXBsZXRpb24gbm90
aWZpY2F0aW9uIHdpbGwgY29ycnVwdCB0aGUgc3RhY2sgb2YgYSBzdWJzZXF1ZW50IGRlZXBlciBj
YWxsCj4+IHRyZWUuCj4+Cj4+IFBsYWNlIHRoZSBwb2xsX3Nsb3QgaW4gYSBwZXJjcHUgYXJlYSBh
bmQgRE1BIHRvIHRoYXQgaW5zdGVhZC4KPj4KPj4gTm90ZTogVGhpcyBjaGFuZ2UgZG9lcyBub3Qg
YWRkcmVzcyBvdGhlciBpc3N1ZXMgd2l0aCB0aGUgY3VycmVudAo+PiBpbXBsZW1lbnRhdGlvbiwg
c3VjaCBhcyBvbmNlIGEgdGltZW91dCBoYXMgYmVlbiBzdWZmZXJlZCwgc3Vic2VxdWVudAo+PiBj
b21wbGV0aW9ucyBjYW4ndCBiZSBjb3JyZWxhdGVkIHdpdGggdGhlaXIgcmVxdWVzdHMuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPgo+PiBKdWxp
ZW46IFRoaXMgd2FudHMgYmFja3BvcnRpbmcgdG8gYWxsIHJlbGVhc2VzLCBhbmQgdGhlcmVmb3Jl
IHNob3VsZCBiZQo+PiBjb25zaWRlcmVkIGZvciA0LjEwIGF0IHRoaXMgcG9pbnQuCj4gSW50ZXJl
c3RpbmcgcmVtYXJrIGF0IHRoaXMgcG9pbnQgaW4gdGltZSA7LSkKCk9vcHMgeWVzLsKgIFRoaXMg
bWlnaHQgbGVhayB0aGUgcG9pbnQgYXQgd2hpY2ggSSBzaGVsdmVkIHRoZSBwbGFuLgoKV2l0aCB0
aGlzIGFsbCBvdXQgaW4gdGhlIG9wZW4gbm93LCBvYnNlcnZhbnQgcGVvcGxlIG1pZ2h0IG5vdGlj
ZSBub3cKbWFueSBvZiBteSA0LjEwIHBhdGNoZXMgYXJlIHJlbGV2YW50IHRvIHRoZSBpc3N1ZXMg
YXQgaGFuZC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
