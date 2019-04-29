From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/arm: skip first page when RAM starts at
 0x0
Date: Mon, 29 Apr 2019 10:51:53 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904291008070.27577@sstabellini-ThinkPad-X260>
References: <1556214715-22030-1-git-send-email-sstabellini@kernel.org>
 <981e7b3f-464b-d37c-e03e-22408ae65f85@arm.com>
 <5CC2CB8C02000078002295AA@prv1-mh.provo.novell.com>
 <e23e0f33-82c6-c592-06d9-8581c5400761@arm.com>
 <5CC2D27C02000078002295F6@prv1-mh.provo.novell.com>
 <43510317-ca8a-ed23-835a-86a28286b919@arm.com>
 <5CC3283A0200007800229832@prv1-mh.provo.novell.com>
 <72a0eee1-1d29-2368-3737-d37f7a4926c6@arm.com>
 <alpine.DEB.2.10.1904261621360.24598@sstabellini-ThinkPad-X260>
 <5CC6A47E0200007800229D67@prv1-mh.provo.novell.com>
 <10687f88-fb6b-721c-c6e8-a1ab06023616@arm.com>
 <5CC72125020000780022A20F@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gZM=S7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLARj-0004Uu-LN
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 17:52:07 +0000
In-Reply-To: <5CC72125020000780022A20F@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, 206497@studenti.unimore.it, xen-devel <xen-devel@lists.xenproject.org>, nd@arm.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCAyOSBBcHIgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IE9uIDI5LjA0LjE5
IGF0IDE3OjU0LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+ID4gQW55d2F5LCBJIGFs
c28gdGVzdGVkIHRoZSBjaGFuZ2Ugc3VnZ2VzdGVkIGJ5IFN0ZWZhbm8uIFRoaXMgd2lsbCBzdWJz
dGFudGlhbGx5IAo+ID4gaW5jcmVhc2UgdGhlIHNpemUgb2YgdGhlIGZyYW1ldGFibGUgb24gcGxh
dGZvcm0gd2hlcmUgdGhlIFJBTSBkb2VzIG5vdCBzdGFydCAKPiA+IGF0IDAuCj4gPiAKPiA+IEZv
ciBpbnN0YW5jZSwgb24gRm91bmRhdGlvbiBNb2RlbCB0aGUgUkFNIHN0YXJ0cyBhdCAyR0IuIEFz
IHdlIGRvbid0IGNvbXByZXNzIAo+ID4gYW55IG9mIHRoZSBmaXJzdCAzMSBiaXRzLCB0aGUgZnJh
bWV0YWJsZSB3aWxsIG5vdyBiZSAyOE1CIGJpZ2dlciB0aGFuIHdlIAo+ID4gY3VycmVudGx5IGhh
dmUgKDExMk1CIHVwIGZyb20gODRNQikuCj4gPiAKPiA+IFNvIEkgdGhpbmsgd2hhdCB3ZSB3YW50
IGlzOgo+ID4gCj4gPiBucl9wZHhzID0gcGZuX3RvX3BkeChlbmQgLSAxKSAtIHBmbl90b19wZHgo
c3RhcnQpICsgMTsKPiA+IGZyYW1lX3RhYmxlX2Jhc2VfcGR4ID0gcGZuX3RvX3BkeChzdGFydCk7
Cj4gCj4gWWVzLCBpZiB0aGVyZSdzIG9ubHkgYSBzaW5nbGUgbWVtb3J5IHJhbmdlIGF0IDJHYiwg
dGhlbiBzdWJ0cmFjdGluZwo+IHRoZSBiYXNlIGFkZHJlc3Mgd2lsbCBvZiBjb3Vyc2UgeWllbGQg
YmV0dGVyIHJlc3VsdHMuIEJ1dCBpZiB0aGVyZSBhcmUKPiBtdWx0aXBsZSByZWdpb25zLCB0aGlu
Z3MgcmVhbGx5IGRlcGVuZCBvbiB0aGUgcGxhY2VtZW50IG9mIGFsbCBvZgo+IHRoZW0uCgpJZiB3
ZSBkbyBub3QgY29tcHJlc3MgYW55IFJBTSBhZGRyZXNzZXMgYmVsb3cgNEcsIHRoZW4gd2UgY2Fu
bm90CmNvbXBlbnNhdGUgZm9yIGFueSBob2xlcyBpbiB0aGF0IHJhbmdlLiBIb3dldmVyLCBhdCBs
ZWFzdCB3ZSBjYW4gc2FmZWx5CnNraXAgdGhlIGZpcnN0IFswLXN0YXJ0XSBsaWtlIEp1bGllbiBz
dWdnZXN0ZWQgaW4gdGhlIGNhbGN1bGF0aW9uIG9mCm5yX3BkeHMuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
