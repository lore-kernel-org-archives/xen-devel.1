From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 11:49:30 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807191139460.19154@sstabellini-ThinkPad-X260>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
 <5B50D9420200007800137603@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gv/7=kd=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fgDzc-0001Rn-VD
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 18:49:37 +0000
In-Reply-To: <5B50D9420200007800137603@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, Ian.Jackson@eu.citrix.com, christopher.w.clark@gmail.com, tim@xen.org, julien.grall@arm.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCAxOSBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4+IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDcvMTkvMTggNzowMCBQTSA+Pj4KPiA+
T24gVGh1LCAxOSBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5c3RlbXMuY29t
Pgo+ID4+ID4gLS0tCj4gPj4gPiBQbGVhc2UgdXNlIG15IGdtYWlsIGFkZHJlc3MgZm9yIGFueSBj
b3JyZXNwb25kZW5jZSB0byBtZS4KPiA+PiAKPiA+PiBJIHRoaW5rIGl0IGlzIGdlbmVyYWxseSBj
b25zaWRlcmVkIGJhZCBwcmFjdGljZSB0byBoYXZlIEZyb206IGFuZCBTLW8tYgo+ID4+IGRpZmZl
ci4KPiA+Cj4gPldoeT8gVGhhdCBpcyBwZXJmZWN0bHkgZmluZS4gU2lnbmVkLW9mZi1ieSBpcyBh
Ym91dCBjb3B5cmlnaHQgb2YgdGhlCj4gPmNvZGUgd2hpbGUgRnJvbTogaXMgYWJvdXQgYXV0aG9y
c2hpcC4gCj4gCj4gV2VsbCwgaW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgQ2hyaXN0b3BoZXIgaGFk
IGV2ZW4gYXNrZWQgdGhhdCBjb21tdW5pY2F0aW9uCj4gdG8gZ28gdG8gdGhlIG1haWwgYWRkcmVz
cyBoZSBzZW50IGZyb20uIEhvdyBpcyBhbnlvbmUgZ29pbmcgdG8ga25vdyB0aGF0IGlmCj4ganVk
Z2luZyBqdXN0IGZyb20gdGhlIGV2ZW50dWFsIGNvbW1pdCBpbiBnaXQ/CgpZZWFoLCB0aGF0IGJp
dCBvZiBpbmZvcm1hdGlvbiBpcyBsb3N0IGluIHRoZSBjb21taXQgbWVzc2FnZSwKdW5mb3J0dW5h
dGVseS4gQXQgdGhhdCBwb2ludCwgdGhlIHBhdGNoIGlzIGFscmVhZHkgY29tbWl0dGVkLCBzbyBp
dCBpcwp1c3VhbGx5IG5vdCBhIGJpZyBkZWFsLgoKCj4gQmVzaWRlcyB0aGF0IC0gaG93IGRvZXMg
YW55b25lIGtub3cgd2hldGhlciB0aGUgdHdvIGFyZSBhY3R1YWxseSBhZGRyZXNzZXMKPiBvZiB0
aGUgc2FtZSBwZXJzb24/CgpJIGRvbid0IHRoaW5rIHRoZXkgaGF2ZSB0byBiZSB0aGUgc2FtZSBw
ZXJzb24uIFdoYXQgbWF0dGVycyBpcyB0aGUKU2lnbmVkLW9mZi1ieSBsaW5lLCB0aGUgYXV0aG9y
IGlzIG9ubHkgdG8gZ2l2ZSBjcmVkaXRzIHRvIHdob20gZGlkIHRoZQp3b3JrLiBJdCBjb3VsZCBi
ZSBhIHBzZXVkb255bS4gV2hpbGUgdGhlIFNpZ25lZC1vZmYtYnkgaGFzIHRvIGJlIGEgcmVhbApw
ZXJzb24uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
