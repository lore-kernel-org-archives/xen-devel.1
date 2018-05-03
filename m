From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH for-4.11] x86/dom0: add extra RAM regions as
 RESERVED for PVH memory map
Date: Thu, 3 May 2018 12:15:18 +0100
Message-ID: <20180503111518.ac2z7fo6f2lei7vx@MacBook-Pro-de-Roger.local>
References: <20180503095640.58090-1-roger.pau@citrix.com>
 <20180503205514.00002a56@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=61fa=hw=citrix.com=prvs=654947d1e=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fECDD-0003u8-Dh
 for xen-devel@lists.xenproject.org; Thu, 03 May 2018 11:15:47 +0000
Content-Disposition: inline
In-Reply-To: <20180503205514.00002a56@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Alexey G <x1917x@gmail.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMDMsIDIwMTggYXQgMDg6NTU6MTRQTSArMTAwMCwgQWxleGV5IEcgd3JvdGU6
Cj4gT24gVGh1LCAzIE1heSAyMDE4IDEwOjU2OjQwICswMTAwCj4gUm9nZXIgUGF1IE1vbm5lIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gPldoZW4gcnVubmluZyBhcyBQVkggRG9t
MCB0aGUgbmF0aXZlIG1lbW9yeSBtYXAgaXMgdXNlZCBpbiBvcmRlciB0bwo+ID5jcmFmdCBhIHRh
aWxvcmVkIG1lbW9yeSBtYXAgZm9yIERvbTAgdGFraW5nIGludG8gYWNjb3VudCBpdCdzIG1lbW9y
eQo+ID5saW1pdC4KPiA+Cj4gPkRvbTAgbWVtb3J5IGlzIGFsd2F5cyBnb2luZyB0byBiZSBzbWFs
bGVyIHRoYW4gdGhlIHRvdGFsIGFtb3VudAo+ID5vZiBtZW1vcnkgcHJlc2VudCBvbiB0aGUgaG9z
dCwgc28gaW4gb3JkZXIgdG8gcHJldmVudCBEb20wIGZyb20KPiA+cmVsb2NhdGluZyBQQ0kgQkFS
cyBvdmVyIFJBTSByZWdpb25zIG1hcmsgYWxsIHRoZSBSQU0gcmVnaW9ucyBub3QKPiA+YXZhaWxh
YmxlIHRvIERvbTAgYXMgUkVTRVJWRUQgaW4gdGhlIG1lbW9yeSBtYXAuCj4gPi0tLQo+ID5OQjog
SSBoYXZlbid0IHNlZW4gYW55IHN5c3RlbSB3aGVyZSBEb20wIHdvdWxkIHJlbG9jYXRlIHRoZSBC
QVJzIG92ZXIKPiA+UkFNIHJlZ2lvbnMsIGJ1dCBBRkFJQ1QgZ2l2ZW4gdGhlIGN1cnJlbnQgbWVt
b3J5IG1hcCBwcm92aWRlZCB0byBEb20wCj4gPnRoaXMgaXMgYSBwb3NzaWJpbGl0eSB0aGF0IHNo
b3VsZCBiZSBhdm9pZGVkLgo+IAo+IEd1ZXN0IE9TZXMgdHlwaWNhbGx5IHVzZSBpbmZvcm1hdGlv
biBmcm9tIEFDUEkgdG8gbGVhcm4gd2hlcmUgUENJCj4gQkFScyBjYW4gKG9yIGNhbm5vdCkgYmUg
cmVsb2NhdGVkLgoKSSB0aGluayBpdCdzIGJldHRlciB0byBiZSBzYWZlIHRoYW4gc29ycnksIHNv
IElNTyB0aGUgaG9zdCBSQU0gcmVnaW9ucwpzaG91bGQgYmUgYWRkZWQgdG8gdGhlIG1lbW9yeSBt
YXAgYXMgUkVTRVJWRUQuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
