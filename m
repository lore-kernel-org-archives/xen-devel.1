From: chenbaodong <chenbaodong@mxnavi.com>
Subject: Re: [PATCH] xen: make tracebuffer configurable
Date: Mon, 3 Jun 2019 18:41:24 +0800
Message-ID: <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
 <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXkPD-0001J1-Ul
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:41:31 +0000
In-Reply-To: <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Ck9uIDYvMy8xOSAxNjozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMDMuMDYuMTkgYXQg
MDU6MDcsIDxjaGVuYmFvZG9uZ0BteG5hdmkuY29tPiB3cm90ZToKPj4gT24gNS8zMS8xOSAxOTox
MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAzMC4wNS4xOSBhdCAxMjoxNywgPGNoZW5i
YW9kb25nQG14bmF2aS5jb20+IHdyb3RlOgo+Pj4+IERlZmF1bHQ6IGVuYWJsZWQuCj4+Pj4gQ2Fu
IGJlIGRpc2FibGVkIGZvciBzbWFsbGVyIGNvZGUgZm9vdHByaW50Lgo+Pj4gQnV0IHlvdSdyZSBh
d2FyZSB0aGF0IHdlJ3JlLCBmb3Igbm93IGF0IGxlYXN0LCB0cnlpbmcgdG8gbGltaXQgdGhlCj4+
PiBudW1iZXIgb2YgaW5kZXBlbmRlbnRseSBzZWxlY3RhYmxlIGNvbmZpZyBvcHRpb25zPyBPbmVz
IGRlcGVuZGluZwo+Pj4gb24gRVhQRVJUIGFyZSBzb3J0IG9mIGFuIGV4Y2VwdGlvbiBpbiBjZXJ0
YWluIGNhc2VzLgo+PiBMaW1pdCB0aGUgbnVtYmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJs
ZSBjb25maWcgc291bmRzIGdvb2QgdG8gbWUuCj4+Cj4+IERvZXMgdGhlIGZvbGxvd2luZyBsb29r
cyBnb29kPwo+Pgo+PiArY29uZmlnIEhBU19UUkFDRUJVRkZFUgo+PiArICAgICAgIGJvb2wgIkVu
YWJsZS9EaXNhYmxlIHRyYWNlYnVmZmVyIiAgaWYgRVhQRVJUID0gInkiCj4+ICsgICAgICAgLS0t
aGVscC0tLQo+PiArICAgICAgICAgRW5hYmxlIG9yIGRpc2FibGUgdHJhY2VidWZmZXIgZnVuY3Rp
b24uCj4+ICsgICAgICAgICBYZW4gaW50ZXJuYWwgcnVubmluZyBzdGF0dXModHJhY2UgZXZlbnQp
IHdpbGwgYmUgc2F2ZWQgdG8KPj4gdHJhY2UgbWVtb3J5Cj4+ICsgICAgICAgICB3aGVuIGVuYWJs
ZWQuCj4+ICsKPiBUaGUgRVhQRVJUIGFkZGl0aW9uIG1ha2UgaW50cm9kdWNpbmcgdGhpcyBmaW5l
IGJ5IG1lLiBCdXQgaXRzIG5hbWUKPiBpcyBzdGlsbCB3cm9uZywgYW5kIHRoZSBoZWxwIHRleHQg
YWxzbyBuZWVkcyBmdXJ0aGVyIGltcHJvdmVtZW50IGltby4KCkhpIEphbiwgdGhhbmtzIGZvciB5
b3VyIGtpbmRseSByZXZpZXcgYW5kIGZlZWRiYWNrLgoKRm9yIHRoaXMsIHdvdWxkIHlvdSBwbGVh
c2UgZ2l2ZSB5b3VyIHN1Z2dlc3Rpb25zIGFib3V0IHRoZSBuYW1lIGFuZCBoZWxwIAp0ZXh0PwoK
Pgo+IEphbgo+Cj4KPiAuCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
