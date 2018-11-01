From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [RFC PATCH v2 07/17] libxl: add save/restore
 support for qemu-xen in stubdomain
Date: Thu, 1 Nov 2018 17:41:48 +0000
Message-ID: <23515.15068.905887.216094@mariner.uk.xensource.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <b13d7decb6d5d3b1d3a3e97348707f2180e46020.1533608042.git-series.marmarek@invisiblethingslab.com>
 <23515.13241.636952.929175@mariner.uk.xensource.com>
 <20181101171623.GC2580@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rvhc=nm=citrix.com=prvs=836b135c8=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gIGyf-0003nk-8s
 for xen-devel@lists.xenproject.org; Thu, 01 Nov 2018 17:41:53 +0000
In-Reply-To: <20181101171623.GC2580@mail-itl>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIlJlOiBbUkZDIFBBVENIIHYyIDA3
LzE3XSBsaWJ4bDogYWRkIHNhdmUvcmVzdG9yZSBzdXBwb3J0IGZvciBxZW11LXhlbiBpbiBzdHVi
ZG9tYWluIik6Cj4gT24gVGh1LCBOb3YgMDEsIDIwMTggYXQgMDU6MTE6MjFQTSArMDAwMCwgSWFu
IEphY2tzb24gd3JvdGU6Cj4gPiBJIHRoaW5rIHRoaXMgaGFyZGNvZGVkIGZkIGlzIHRyb3VibGVz
b21lLiAgRm9yIGV4YW1wbGUsIHdlIGRvbid0IGhhdmUKPiA+IGFueXdoZXJlIHRvIHdyaXRlIGRv
d24gdGhlIGxpc3Qgb2YgaGFyZGNvZGVkIGZkcyBiZWluZyB1c2VkIGxpa2UgdGhpcy4KPiA+IEkg
bWVhbiwgbGlieGwgYW5kIHRoZSBMaW51eCBxZW11IHN0dWJkb20gd3JhcHBlciBzY3JpcHQgYXJl
IGFsbG93ZWQgdG8KPiA+IGNvb3BlcmF0ZSwgYnV0IGF0IGxlYXN0IHRoaXMgbmVlZHMgYSBjbGVh
ciBjb21tZW50IGluIHRoZSB3cmFwcGVyCj4gPiBzY3JpcHQsIGFuZCBhIHJlZmVyZW5jZSBoZXJl
IHRvIHRoZSBpbi10cmVlIGxvY2F0aW9uIG9mIHRoZSBzY3JpcHQuCj4gCj4gVGhpcyBpcyBleGFj
dGx5IHdoYXQgSSdtIHdyaXRpbmcgYWJvdXQgaW4gY292ZXIgbGV0dGVyLiBBbmQgaW5kZWVkIHNv
bWUKPiAjZGVmaW5lIHdvdWxkIGJlIGhlbHBmdWwgaGVyZS4KCk9oLiAgSSBzZWUsIHRoZSBzY3Jp
cHQgaXNuJ3QgaW4gdGhpcyBzZXJpZXMuICBJdCdzIGluIHlvdXIgc2VwYXJhdGUKZ2l0IHJlcG8u
ICBJIHNlZSBub3cuICBJIHRoaW5rIGEgcmVmZXJlbmNlIHRvIHRoZSBkb2N1bWVudCBpcyBtb3Jl
CmltcG9ydGFudCB0aGFuIGEgI2RlZmluZS4KCj4gPiBJJ20gbWlzc2luZyB0aGUgY29kZSB3aGlj
aCBpcyB0cmFuc2ZlcnMgdGhlIGRhdGEgZnJvbSB0aGUKPiA+IHN0YXRlLT5zYXZlZF9zdGF0ZSB0
byB0aGUgY29uc29sZS4gIEFtIEkganVzdCBiZWluZyBkaW0gPwo+IAo+IFRoaXMgaXMgZG9uZSBi
eSBleGlzdGluZyBjb2RlIGJ5IGNvbm5lY3RpbmcgU1RVQkRPTV9DT05TT0xFX1JFU1RPUkUgdG8K
PiB0aGF0IGZpbGUuIFNlZSBsaWJ4bF9kbS5jOnNwYXduX3N0dWJfbGF1bmNoX2RtLgoKQWguICBS
aWdodC4KClRCSCBJIGZlZWwgSSBhbSBub3QgZ2l2aW5nIHlvdSBhIHZlcnkgaGlnaCBxdWFsaXR5
IG9mIHJldmlldy4gIEkgc2VlbQp0byBiZSBhIGJpdCBkaW0gdG9kYXkuICBNeSBhcG9sb2dpZXMg
aWYgdGhpcyBpcyBmcnVzdHJhdGluZyBmb3IgeW91LgpCdXQgSSBkaWRuJ3Qgd2FudCB0byBsZXQg
YWxsIG9mIHRoaXMgc2l0IGFueSBsb25nZXIuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
