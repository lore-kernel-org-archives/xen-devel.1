From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] shim: Fix generation of compat/callback.i:
 allow redef of OBJECT vars
Date: Thu, 19 Jul 2018 12:34:59 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1807191233140.19154@sstabellini-ThinkPad-X260>
References: <1531956796-7465-1-git-send-email-christopher.w.clark@gmail.com>
 <5B5036A802000078001D5AE3@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807190955250.19154@sstabellini-ThinkPad-X260>
 <5B50D9420200007800137603@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1807191139460.19154@sstabellini-ThinkPad-X260>
 <5B50E13E020000780013763E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gv/7=kd=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1fgEhd-0006Cn-Sj
 for xen-devel@lists.xenproject.org; Thu, 19 Jul 2018 19:35:05 +0000
In-Reply-To: <5B50E13E020000780013763E@prv1-mh.provo.novell.com>
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
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDcvMTkvMTggODo0OSBQTSA+Pj4KPiA+
T24gVGh1LCAxOSBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4+IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gMDcvMTkvMTggNzowMCBQTSA+Pj4K
PiA+PiA+T24gVGh1LCAxOSBKdWwgMjAxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xhcms2QGJhZXN5
c3RlbXMuY29tPgo+ID4+ID4+ID4gLS0tCj4gPj4gPj4gPiBQbGVhc2UgdXNlIG15IGdtYWlsIGFk
ZHJlc3MgZm9yIGFueSBjb3JyZXNwb25kZW5jZSB0byBtZS4KPiA+PiA+PiAKPiA+PiA+PiBJIHRo
aW5rIGl0IGlzIGdlbmVyYWxseSBjb25zaWRlcmVkIGJhZCBwcmFjdGljZSB0byBoYXZlIEZyb206
IGFuZCBTLW8tYgo+ID4+ID4+IGRpZmZlci4KPiA+PiA+Cj4gPj4gPldoeT8gVGhhdCBpcyBwZXJm
ZWN0bHkgZmluZS4gU2lnbmVkLW9mZi1ieSBpcyBhYm91dCBjb3B5cmlnaHQgb2YgdGhlCj4gPj4g
PmNvZGUgd2hpbGUgRnJvbTogaXMgYWJvdXQgYXV0aG9yc2hpcC4gCj4gPj4gCj4gPj4gV2VsbCwg
aW4gdGhpcyBwYXJ0aWN1bGFyIGNhc2UgQ2hyaXN0b3BoZXIgaGFkIGV2ZW4gYXNrZWQgdGhhdCBj
b21tdW5pY2F0aW9uCj4gPj4gdG8gZ28gdG8gdGhlIG1haWwgYWRkcmVzcyBoZSBzZW50IGZyb20u
IEhvdyBpcyBhbnlvbmUgZ29pbmcgdG8ga25vdyB0aGF0IGlmCj4gPj4ganVkZ2luZyBqdXN0IGZy
b20gdGhlIGV2ZW50dWFsIGNvbW1pdCBpbiBnaXQ/Cj4gPgo+ID5ZZWFoLCB0aGF0IGJpdCBvZiBp
bmZvcm1hdGlvbiBpcyBsb3N0IGluIHRoZSBjb21taXQgbWVzc2FnZSwKPiA+dW5mb3J0dW5hdGVs
eS4gQXQgdGhhdCBwb2ludCwgdGhlIHBhdGNoIGlzIGFscmVhZHkgY29tbWl0dGVkLCBzbyBpdCBp
cwo+ID51c3VhbGx5IG5vdCBhIGJpZyBkZWFsLgo+IAo+IFdoYXQgaWYgdGhlcmUgaXMgYW4gaXNz
dWUgd2l0aCB0aGUgY2hhbmdlLCBvciBzaW1wbHkgYSBxdWVzdGlvbiBhYm91dCBpdD8KPiBJJ2Qg
ZXhwZWN0IHRvIGJlIGFibGUgdG8gZ2V0IGluIHRvdWNoIHdpdGggdGhlIGF1dGhvciBieSB1c2lu
ZyB0aGUgcHJvdmlkZWQKPiBlbWFpbCBhZGRyZXNzLCBhdCBsZWFzdCBpZiB0aGUgY29tbWl0IGlz
bid0IG92ZXJseSBvbGQgeWV0LgoKVGhpbmtpbmcgYWJvdXQgaXQsIHRoZSBGcm9tOiBlbWFpbCBh
ZGRyZXNzIHdpbGwgZW5kIHVwIGluIHRoZSBBdXRob3I6CmZpZWxkIG9mIHRoZSBjb21taXQuIFNv
IGFjdHVhbGx5LCB0aGUgaW5mb3JtYXRpb24gd2lsbCBiZSByZXRhaW5lZC4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
