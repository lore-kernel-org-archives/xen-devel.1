From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen/pt: use address_space_memory object for
 memory region hooks
Date: Tue, 17 Apr 2018 15:37:23 +0100
Message-ID: <20180417143723.GN2208__35515.6233454638$1523975773$gmane$org@perard>
References: <c7d408cb-454c-2322-3812-a7cacecdbe5f@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3xac=hg=citrix.com=prvs=63880a4e9=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1f8Rjb-0003Yf-Er
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 14:37:27 +0000
Content-Disposition: inline
In-Reply-To: <c7d408cb-454c-2322-3812-a7cacecdbe5f@citrix.com>
 <635d45e1-2d97-6313-2348-1e2bc9061d8b@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-devel@nongnu.org, ross.lagerwall@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMTcsIDIwMTggYXQgMDM6MTg6NTVQTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gT24gMTcvMDQvMTggMTU6MTUsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gT24g
RnJpLCBBcHIgMDYsIDIwMTggYXQgMTA6MjE6MjNQTSArMDEwMCwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4gPj4gVGhlIGlzc3VlIHRoYXQgdGhlIG9yaWdpbmFsIHBhdGNoIHRyaWVkIHRvIHdvcmth
cm91bmQgKHVuZXZlbiBudW1iZXIgb2YKPiA+PiByZWdpb25fYWRkL2RlbCBjYWxscyBvbiBkZXZp
Y2UgYXR0YWNoL2RldGFjaCkgd2FzIGZpeGVkIGluIGxhdGVyIFFFTVUKPiA+PiB2ZXJzaW9ucy4K
PiA+IAo+ID4gRG8geW91IGtub3cgd2hlbiB0aGUgaXNzdWUgd2FzIGZpeGVkPwo+ID4gCj4gCj4g
SSBoYXZlbid0IHRyYWNrZWQgZG93biBhIHBhcnRpY3VsYXIgdmVyc2lvbiBidXQgdGhlIHByZXZp
b3VzIGJlaGF2aW9yIG9mCj4gbWVtb3J5X2xpc3RlbmVyX3VucmVnaXN0ZXIoKSB3YXMgdG8gcmVt
b3ZlIHRoZSBsaXN0ZW5lciBmcm9tIHRoZSBsaXN0Cj4gd2l0aG91dCBjYWxsaW5nIHRoZSBjYWxs
YmFjay4gSXQgaGFzIGNoYW5nZWQgc2luY2UgdGhlbiBhbmQgbm93IHRoZQo+IGNhbGxiYWNrIGlz
IGNhbGxlZCBpbiBsaXN0ZW5lcl9kZWxfYWRkcmVzc19zcGFjZSgpLgoKT24gVHVlLCBBcHIgMTcs
IDIwMTggYXQgMDM6Mjk6NDJQTSArMDEwMCwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gSSB0aGlu
ayBpdCdzIHRoaXMgY29tbWl0Ogo+IAo+IGNvbW1pdCBkMjU4MzZjYWZkNzUwODA5MGQyMTFlOTdh
Y2ZjMGFiYzVhZTg4ZGFhCj4gQXV0aG9yOiBQZXRlciBYdSA8cGV0ZXJ4QHJlZGhhdC5jb20+Cj4g
RGF0ZTogICBNb24gSmFuIDIyIDE0OjAyOjQ0IDIwMTggKzA4MDAKPiAKPiAgICAgbWVtb3J5OiBk
byBleHBsaWNpdCBjbGVhbnVwIHdoZW4gcmVtb3ZlIGxpc3RlbmVycwoKCkkgdGhpbmsgdGhlc2Ug
aW5mb3JtYXRpb24gb3VnaHQgdG8gYmUgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBpbgpwYXJ0aWN1
bGFyIHRoZSBmYWN0IHRoYXQgdGhlIGNhbGxiYWNrIHdhc24ndCBjYWxsIG9uIGRldGFjaC4gQW5k
IHdpdGgKdGhlIGNvbW1pdCBtZXNzYWdlIHVwZGF0ZWQsIHlvdSBjYW4gYWRkIG15OgpBY2tlZC1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgot
LSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
