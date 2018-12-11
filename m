From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/2] x86/dom0: rename paging function
Date: Tue, 11 Dec 2018 16:19:36 +0100
Message-ID: <20181211151936.yr6s3dokmmpkgt5w@mac>
References: <20181205145500.11989-1-roger.pau@citrix.com>
 <20181205145500.11989-2-roger.pau@citrix.com>
 <5C0FD3030200007800205203@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b1i+=OU=citrix.com=prvs=876dbbe9b=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gWjrM-0001Kh-Mv
 for xen-devel@lists.xenproject.org; Tue, 11 Dec 2018 15:22:08 +0000
Content-Disposition: inline
In-Reply-To: <5C0FD3030200007800205203@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, andrei.semenov@bertin.fr, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBEZWMgMTEsIDIwMTggYXQgMDg6MDg6NTFBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjEyLjE4IGF0IDE1OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gVG8gbm90ZSBpdCdzIGNhbGN1bGF0aW5nIHRoZSBhcHByb3hpbWF0ZSBhbW91bnQg
b2YgbWVtb3J5IHJlcXVpcmVkIGJ5Cj4gPiBzaGFkb3cgcGFnaW5nLgo+IAo+IEkgZG9uJ3QgdW5k
ZXJzdGFuZCB0aGlzIGxvZ2ljLCBhbmQgLi4uCj4gCj4gPiBAQCAtMzI1LDcgKzMyNSw3IEBAIHVu
c2lnbmVkIGxvbmcgX19pbml0IGRvbTBfY29tcHV0ZV9ucl9wYWdlcygKPiA+ICAgICAgICAgICAg
ICBicmVhazsKPiA+ICAKPiA+ICAgICAgICAgIC8qIFJlc2VydmUgbWVtb3J5IGZvciBzaGFkb3cg
b3IgSEFQLiAqLwo+ID4gLSAgICAgICAgYXZhaWwgLT0gZG9tMF9wYWdpbmdfcGFnZXMoZCwgbnJf
cGFnZXMpOwo+ID4gKyAgICAgICAgYXZhaWwgLT0gZG9tMF9zaGFkb3dfcGFnZXMoZCwgbnJfcGFn
ZXMpOwo+ID4gICAgICB9Cj4gCj4gLi4uIHRoZSBjb21tZW50IGhlcmUgKGFuZCBsYWNrIG9mIGNv
bmRpdGlvbmFsIHJlc3RyaWN0aW5nIHRoZQo+IGNvZGUgdG8gc2hhZG93IG1vZGUpIGFwcGVhciB0
byBzdXBwb3J0IG1lOiBIYXZlIHlvdQo+IGJlZW4gbWlzbGVhZCBieSB0aGUgZnVuY3Rpb24gaGF2
aW5nIGEgY29tbWVudCByZWZlcnJpbmcKPiB0byBsaWJ4bF9nZXRfcmVxdWlyZWRfc2hhZG93X21l
bW9yeSgpPyBJIHRoaW5rIGlmIGFueXRoaW5nCj4gdGhhdCBsaWJ4bCBmdW5jdGlvbiB3b3VsZCB3
YW50IHRvIGJlIHJlbmFtZWQgKHRvIHJlcGxhY2UKPiAic2hhZG93IiBieSBzb21ldGhpbmcgbW9y
ZSBnZW5lcmljIGluIGl0cyBuYW1lKS4KCkJ1dCB0aGUgbG9naWMgaW4gZG9tMF9zaGFkb3dfcGFn
ZXMgdG8gY2FsY3VsYXRlIHRoZSBzaXplIG9mIHRoZSBwYWdpbmcKbWVtb3J5IHBvb2wgaXMgc3Bl
Y2lmaWNhbGx5IGZvciBzaGFkb3cgQUZBSUNULCBJIGRvbid0IHRoaW5rIEhBUCBuZWVkcwp0byB0
YWtlIHRoZSBudW1iZXIgb2YgdkNQVXMgaW50byBhY2NvdW50LCBzaW5jZSB0aGVyZSdzIG9ubHkg
YQpzaW5nbGUgcDJtIGZvciB0aGUgd2hvbGUgZG9tYWluLiBPVE9IIHNoYWRvdyBuZWVkcyB0byB0
YWtlIHRoZSBudW1iZXIKb2YgdkNQVXMgaW50byBhY2NvdW50IGJlY2F1c2UgZWFjaCBvbmUgd2ls
bCBoYXZlIGEgZGlmZmVyZW50IHNoYWRvdy4KCk5vdGUgdGhhdCBwYXRjaCAyIGluIHRoaXMgc2Vy
aWVzIGFkZHMgYSBmdW5jdGlvbiB0byBjYWxjdWxhdGUgdGhlIHNpemUKb2YgdGhlIHBhZ2luZyBt
ZW1vcnkgcG9vbCBmb3IgSEFQLCBhbmQgYSBjb25kaXRpb25hbCBpcyBhZGRlZCB0byB0aGUKZXhw
cmVzc2lvbiBhYm92ZSB0aGF0IHRha2VzIGludG8gYWNjb3VudCB3aGV0aGVyIHNoYWRvdyBvciBI
QVAgaXMgaW4KdXNlIHdoZW4gc3VidHJhY3RpbmcgZnJvbSB0aGUgYW1vdW50IG9mIGF2YWlsYWJs
ZSBtZW1vcnkuCgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
