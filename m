From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/6] x86/emul: dedup hvmemul_cpuid() and
 pv_emul_cpuid()
Date: Wed, 14 Nov 2018 00:47:17 -0700
Message-ID: <5BEBD30502000078001FBCA7@prv1-mh.provo.novell.com>
References: <1541416867-30253-1-git-send-email-andrew.cooper3@citrix.com>
 <1541416867-30253-7-git-send-email-andrew.cooper3@citrix.com>
 <5BE1B58C02000078001F8BB8@prv1-mh.provo.novell.com>
 <2b95ed09-cf3c-d60f-d511-a579de9d108d@citrix.com>
 <5BE1BE5702000078001F8C19@prv1-mh.provo.novell.com>
 <2b9b0947-6b85-42ef-61c8-4147fd7b88dc@citrix.com>
 <5BE9373702000078001FAB51@prv1-mh.provo.novell.com>
 <20181114002020.GA3640@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20181114002020.GA3640@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Brian Woods <brian.woods@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDAxOjIwLCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBOb3YgMTIsIDIwMTggYXQgMDE6MTc6NTlBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAwOS4xMS4xOCBhdCAxODoxNiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+IHdyb3RlOgo+PiA+IExXUCBkb2Vzbid0IGV4aXN0IGFueSBtb3JlLCBldmVuIG9uIHRoZSBo
YXJkd2FyZSBpdCB1c2VkIHRvIGV4aXN0IG9uLiAKPj4gPiBJdCB3YXMgbmV2ZXIgaW1wbGVtZW50
ZWQgb24gRmFtMTdoLCBhbmQgd2FzIHJlbW92ZWQgZnJvbSBGYW0xNS8xNmggaW4gYQo+PiA+IG1p
Y3JvY29kZSB1cGRhdGUgdG8gbWFrZSByb29tIHRvIGltcGxlbWVudCBJQlBCIGZvciBTcGVjdHJl
IHYyIG1pdGlnYXRpb25zLgo+PiA+IAo+PiA+IEkgcmVjb21tZW5kIHdlIHB1cmdlIHRoZSBzdXBw
b3J0IGNvbXBsZXRlbHkuCj4+IAo+PiBJIGNlcnRhaW5seSBkb24ndCBtaW5kOyBJJ2QgcHJlZmVy
IHRob3VnaCBpZiBzdWNoIGEgd2l0aGRyYXdhbCBvZgo+PiBmdW5jdGlvbmFsaXR5IGNhbWUgYWN0
dWFsbHkgZnJvbSBBTUQuIEJyaWFuPwo+IAo+IExXUCBzdXBwb3J0IGlzbid0IGVuYWJsZWQgb24g
RjE1aCBzeXN0ZW0gd2l0aCB0aGUgbGF0ZXN0IFVjb2RlIGFuZCBpdAo+IGlzbid0IGF2YWlsYWJs
ZSBvbiBGMTdoLiAgSSBkb24ndCBzZWUgYW55IHJlYXNvbiB0byBrZWVwIGl0IGlmIGl0J3MKPiBo
YW1wZXJpbmcgY2xlYW51cCBhbmQgcmVmb3JtYXR0aW5nLgoKT2theSwgdGhpcyBjb25maXJtcyB5
b3VyIGFncmVlbWVudCB3aXRoIHRoZSByZW1vdmFsIHBsYW5zLCBidXQgaXMKdGhlcmUgYW55IGNo
YW5jZSB0aGUgcGF0Y2ggcmVtb3ZpbmcgaXQgY291bGQgYWN0dWFsbHkgY29tZSBmcm9tCmFuIEFN
RCBwZXJzb24sIGFzIHN1Z2dlc3RlZCBhYm92ZT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
