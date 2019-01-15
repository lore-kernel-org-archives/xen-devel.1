From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 4/5] xen/arm: use the physical number of gic
 lines for boot domains
Date: Tue, 15 Jan 2019 12:56:42 +0000
Message-ID: <0c948ed9-5986-09c0-59ba-5d4e694c8ec4@arm.com>
References: <alpine.DEB.2.10.1812050923160.527@sstabellini-ThinkPad-X260>
 <1544030891-11906-4-git-send-email-sstabellini@kernel.org>
 <8519371e-894b-88a3-ac71-b8367d93d9d3@arm.com>
 <alpine.DEB.2.10.1901031104000.800@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <alpine.DEB.2.10.1901031104000.800@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Achin.Gupta@arm.com, andrii_anisov@epam.com, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDEvMy8xOSA3OjA3IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6
Cj4gT24gTW9uLCAyNCBEZWMgMjAxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4g
T24gMTIvNS8xOCA1OjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+PiBXZSBkb24n
dCBoYXZlIGEgY2xlYXIgd2F5IHRvIGtub3cgaG93IG1hbnkgdmlydHVhbCBTUElzIHdlIG5lZWQg
Zm9yIHRoZQo+Pj4gYm9vdCBkb21haW5zLiBGb3Igc2ltcGxpY2l0eSwgYWxsb2NhdGUgYXMgbWFu
eSBhcyBuYXRpdmVseSBzdXBwb3J0ZWQsCj4+PiBqdXN0IGxpa2UgZm9yIGRvbTAuCj4+Cj4+IFRo
aXMgd2lsbCBwb3RlbnRpYWxseSBhbGxvY2F0ZSBhIGxvdCBvZiB1bnVzZWQgaW50ZXJydXB0cyBh
bmQgYSB3YXN0ZSBvZgo+PiBtZW1vcnkuIFNvIGlzIGl0IHRoZSBjb3JyZWN0IHNvbHV0aW9uPwo+
Pgo+PiBGb3IgaW5zdGFuY2UsIHdlIHdvdWxkIHJlcXVlc3QgdGhlIHVzZXIgdG8gcHJvdmlkZSB0
aGUgbnVtYmVyIG9mIGludGVycnVwdHMuCj4gCj4gVW5mb3J0dW5hdGVseSwgdGhpcyBoYXMgdG8g
aGFwcGVuIG11Y2ggZWFybGllciB0aGFuIHdoZW4gd2UgcGFyc2UgdXNlcgo+IHN1cHBsaWVkIGRl
dmljZSB0cmVlIG9wdGlvbnMuIFdlIGNvdWxkIG1ha2UgaXQgYW4gaHlwZXJ2aXNvciBjb21tYW5k
Cj4gbGluZSBwYXJhbWV0ZXIgYnV0IGl0IHdvdWxkIGJlIG5hc3R5LgoKV2h5IGRvZXMgdGhpcyB2
YWx1ZSBuZWVkcyB0byBiZSBpbiB0aGUgc3VwcGxpZWQgZGV2aWNlLXRyZWUuIENhbid0IGl0IGJl
IApwYXJ0IG9mIHRoZSBub2RlIGluIHRoZSBob3N0IERUPwoKPiAKPiBHaXZlbiB0aGF0IHRoaXMg
ZmVhdHVyZSBpcyBhaW1lZCBhdCBwYXJ0aXRpb25pbmcgc2NlbmFyaW9zIHdoZXJlIHRoZQo+IG51
bWJlciBvZiBWTXMgaXMgbG93LCB0aGUgaW5jcmVhc2VkIG1lbW9yeSBvdmVyaGVhZCBpcyBub3Qg
YSBiaWcgaXNzdWUuCgpQbGVhc2Ugd3JpdGUgaXQgZG93biBpbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
CgoKPiAKPiAoSWYgeW91IHJlY2FsbCB3ZSBicmllZmx5IGRpc2N1c3NlZCB0aGlzIHRvcGljIGF0
IHRoZSBsYXN0IExpbmFybwo+IENvbm5lY3QsIHRoaXMgd2FzIHRoZSBjb25jbHVzaW9uLikKPiAK
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
