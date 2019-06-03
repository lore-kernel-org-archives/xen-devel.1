From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: make tracebuffer configurable
Date: Mon, 03 Jun 2019 04:54:11 -0600
Message-ID: <5CF4FC53020000780023490D@prv1-mh.provo.novell.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
 <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
 <5CF4DAC90200007800234711@prv1-mh.provo.novell.com>
 <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXkbf-0002K4-W8
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 10:54:24 +0000
In-Reply-To: <058c6adb-0cba-0825-264a-f31d24ba21fe@mxnavi.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Baodong Chen <chenbaodong@mxnavi.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA2LjE5IGF0IDEyOjQxLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6
Cgo+IE9uIDYvMy8xOSAxNjozMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDAzLjA2LjE5
IGF0IDA1OjA3LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+PiBPbiA1LzMxLzE5
IDE5OjEwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+PiBPbiAzMC4wNS4xOSBhdCAxMjoxNywg
PGNoZW5iYW9kb25nQG14bmF2aS5jb20+IHdyb3RlOgo+Pj4+PiBEZWZhdWx0OiBlbmFibGVkLgo+
Pj4+PiBDYW4gYmUgZGlzYWJsZWQgZm9yIHNtYWxsZXIgY29kZSBmb290cHJpbnQuCj4+Pj4gQnV0
IHlvdSdyZSBhd2FyZSB0aGF0IHdlJ3JlLCBmb3Igbm93IGF0IGxlYXN0LCB0cnlpbmcgdG8gbGlt
aXQgdGhlCj4+Pj4gbnVtYmVyIG9mIGluZGVwZW5kZW50bHkgc2VsZWN0YWJsZSBjb25maWcgb3B0
aW9ucz8gT25lcyBkZXBlbmRpbmcKPj4+PiBvbiBFWFBFUlQgYXJlIHNvcnQgb2YgYW4gZXhjZXB0
aW9uIGluIGNlcnRhaW4gY2FzZXMuCj4+PiBMaW1pdCB0aGUgbnVtYmVyIG9mIGluZGVwZW5kZW50
bHkgc2VsZWN0YWJsZSBjb25maWcgc291bmRzIGdvb2QgdG8gbWUuCj4+Pgo+Pj4gRG9lcyB0aGUg
Zm9sbG93aW5nIGxvb2tzIGdvb2Q/Cj4+Pgo+Pj4gK2NvbmZpZyBIQVNfVFJBQ0VCVUZGRVIKPj4+
ICsgICAgICAgYm9vbCAiRW5hYmxlL0Rpc2FibGUgdHJhY2VidWZmZXIiICBpZiBFWFBFUlQgPSAi
eSIKPj4+ICsgICAgICAgLS0taGVscC0tLQo+Pj4gKyAgICAgICAgIEVuYWJsZSBvciBkaXNhYmxl
IHRyYWNlYnVmZmVyIGZ1bmN0aW9uLgo+Pj4gKyAgICAgICAgIFhlbiBpbnRlcm5hbCBydW5uaW5n
IHN0YXR1cyh0cmFjZSBldmVudCkgd2lsbCBiZSBzYXZlZCB0bwo+Pj4gdHJhY2UgbWVtb3J5Cj4+
PiArICAgICAgICAgd2hlbiBlbmFibGVkLgo+Pj4gKwo+PiBUaGUgRVhQRVJUIGFkZGl0aW9uIG1h
a2UgaW50cm9kdWNpbmcgdGhpcyBmaW5lIGJ5IG1lLiBCdXQgaXRzIG5hbWUKPj4gaXMgc3RpbGwg
d3JvbmcsIGFuZCB0aGUgaGVscCB0ZXh0IGFsc28gbmVlZHMgZnVydGhlciBpbXByb3ZlbWVudCBp
bW8uCj4gCj4gSGkgSmFuLCB0aGFua3MgZm9yIHlvdXIga2luZGx5IHJldmlldyBhbmQgZmVlZGJh
Y2suCj4gCj4gRm9yIHRoaXMsIHdvdWxkIHlvdSBwbGVhc2UgZ2l2ZSB5b3VyIHN1Z2dlc3Rpb25z
IGFib3V0IHRoZSBuYW1lIGFuZCBoZWxwIAo+IHRleHQ/CgpBcyBmYXIgYXMgdGhlIG5hbWUgaXMg
Y29uY2VybmVkLCB0aGUgSEFTXyBzaG91bGQgYmUgZHJvcHBlZC4KSSdtIGFmcmFpZCBJIGRvbid0
IGhhdmUgYSBwYXJ0aWN1bGFyIHN1Z2dlc3Rpb24gZm9yIHRoZSBoZWxwIHRleHQuCgpKYW4KCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
