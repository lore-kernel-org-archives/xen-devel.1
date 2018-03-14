From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v2 1/4] x86/PVHv2: Add memory map pointer to
 hvm_start_info struct
Date: Wed, 14 Mar 2018 13:28:41 -0400
Message-ID: <c157766a-f80d-bafc-e135-c0be8827c1d9@oracle.com>
References: <1520983900-13977-1-git-send-email-maran.wilson@oracle.com>
 <1520983900-13977-2-git-send-email-maran.wilson@oracle.com>
 <5AA8E37602000078001B1579@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5AA8E37602000078001B1579@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Maran Wilson <maran.wilson@oracle.com>
Cc: andrew.cooper3@citrix.com, xen-devel@lists.xen.org, wei.liu2@citrix.com, ian.jackson@eu.citrix.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMTQvMjAxOCAwMzo1NSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTQuMDMu
MTggYXQgMDA6MzEsIDxtYXJhbi53aWxzb25Ab3JhY2xlLmNvbT4gd3JvdGU6Cj4+ICsgKiBGb3Ig
eDg2IGltcGxlbWVudGF0aW9ucyBhdCBsZWFzdCwgdGhlIHZhbHVlcyB1c2VkIGluIHRoZSB0eXBl
IGZpZWxkIHdpbGwKPj4gKyAqIG1hdGNoIHRoZSBBZGRyZXNzIFJhbmdlIFR5cGVzIGFzIGRlZmlu
ZWQgaW4gc2VjdGlvbiAxNSAoU3lzdGVtIEFkZHJlc3MKPj4gKyAqIE1hcCBJbnRlcmZhY2VzKSBv
ZiB0aGUgQUNQSSBTcGVjaWZpY2F0aW9uIChodHRwOi8vdWVmaS5vcmcvc3BlY2lmaWNhdGlvbnMp
Cj4+ICsgKiB3aGVyZToKPj4gKyAqICAgICBBZGRyZXNzUmFuZ2VNZW1vcnkgPSAxIChFODIwX1JB
TSkKPj4gKyAqICAgICBBZGRyZXNzUmFuZ2VSZXNlcnZlZCA9IDIgKEU4MjBfUkVTRVJWRUQpCj4+
ICsgKiAgICAgQWRkcmVzc1JhbmdlQUNQSSA9IDMgKEU4MjBfQUNQSSkKPj4gKyAqICAgICBBZGRy
ZXNzUmFuZ2VOVlMgPSA0IChFODIwX05WUykKPj4gKyAqICAgICBBZGRyZXNzUmFuZ2VVbnVzYWJs
ZSA9IDUgKEU4MjBfVU5VU0FCTEUpCj4+ICsgKiAgICAgQWRkcmVzc1JhbmdlRGlzYWJsZWQgPSA2
IChFODIwX0RJU0FCTEVEKQo+PiArICogICAgIEFkZHJlc3NSYW5nZVBlcnNpc3RlbnRNZW1vcnkg
PSA3IChFODIwX1BNRU0pCj4gV291bGQgeW91IG1pbmQgd2FpdGluZyBmb3IgYSBkaXNjdXNzaW9u
IHRvIHNldHRsZSBiZWZvcmUgc2VuZGluZwo+IG91dCBuZXcgcGF0Y2ggdmVyc2lvbnM/IEFzIGlu
ZGljYXRlZCBpbiBhbiBlYXJsaWVyIHJlcGx5IHRvIHYxLCBJCj4gY29uc2lkZXIgdGhpcyBzdGls
bCBpbnN1ZmZpY2llbnQuIEFuZCBubywgSSdtIG5vdCBhc2tpbmcgZm9yIHlvdSB0bwo+IGFkZCBy
ZWR1bmRhbnQgYW5kIHBvdGVudGlhbGx5IGNvbmZsaWN0aW5nIGRlZmluaXRpb25zIG9mIEU4MjBf
KiwKPiBidXQgaW5zdGVhZCB5b3Ugd2FudCB0byB1c2UgWGVuIHNwZWNpZmljIG9uZXMgKHByZWZp
eGVkIGUuZy4KPiBieSBYRU5fSFZNX01FTU1BUF9UWVBFXykuCgpTaW5jZSB3ZSB3aWxsIG5vdyBo
YXZlIGEgbm9uLVhlbiB1c2VyIG9mIHRoaXMgaW50ZXJmYWNlIHBlcmhhcHMKUFZIX01FTU1BUF9U
WVBFXyA/CgotYm9yaXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
