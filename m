From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC for next] xen: make grant table
 configurable
Date: Fri, 18 Jan 2019 00:48:42 -0700
Message-ID: <5C4184DA020000780020EEA6@prv1-mh.provo.novell.com>
References: <20190117123054.809-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gkOtP-0008QE-4j
 for xen-devel@lists.xenproject.org; Fri, 18 Jan 2019 07:48:43 +0000
In-Reply-To: <20190117123054.809-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDEzOjMwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
LS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnCj4gQEAg
LTExLDYgKzExLDE3IEBAIGNvbmZpZyBDT01QQVQKPiAgY29uZmlnIENPUkVfUEFSS0lORwo+ICAJ
Ym9vbAo+ICAKPiArY29uZmlnIEdSQU5UX1RBQkxFCj4gKwlib29sICJHcmFudCB0YWJsZSBzdXBw
b3J0Igo+ICsJZGVmYXVsdCB5Cj4gKwktLS1oZWxwLS0tCj4gKwkgIEdyYW50IHRhYmxlIHByb3Zp
ZGVzIGEgZ2VuZXJpYyBtZWNoYW5pc20gdG8gbWVtb3J5IHNoYXJpbmcKPiArCSAgYmV0d2VlbiBk
b21haW5zLiBUaGlzIHNoYXJlZCBtZW1vcnkgaW50ZXJmYWNlIHVuZGVycGlucyB0aGUKPiArCSAg
c3BsaXQgZGV2aWNlIGRyaXZlcnMgZm9yIGJsb2NrIGFuZCBuZXR3b3JrIElPIGluIGEgY2xhc3Np
Ywo+ICsJICBYZW4gc2V0dXAuCgpJIGNhbiBzZWUgcmVhc29ucyB3aHkgb25lIG1heSB3YW50IHRo
aXMgKGFsb25nIHRoZSBsaW5lcyBvZiBTSUxPCm1vZGUpLCBidXQgaXQnbGwgcHJvZHVjZSBhbiBl
bnRpcmVseSBBQkktaW5jb21wYXRpYmxlIGh5cGVydmlzb3IuCk1vc3QgZnJvbnQtL2JhY2tlbmQg
ZHJpdmVyIHBhaXJzIHdvbid0IHdvcmsgd2l0aG91dCBpdC4gSSdtIG5vdApzdXJlIHRoZSB0b29s
IHN0YWNrIGlzIHByZXBhcmVkIHRvIGFjdCBvbiBzdWNoIGEgaHlwZXJ2aXNvci4gSSdtCnByZXR0
eSBzdXJlIGF0IGxlYXN0IFhlbm9MaW51eCBkZXJpdmF0aXZlcyBCVUcoKSB1cG9uIGVycm9yCnJl
dHVybnMgZnJvbSBjZXJ0YWluIGdudHRhYiBoeXBlcmNhbGxzLgoKQXMgc3VjaCBhcyB3ZWxsIGFz
IHRvIGJlIHdpdGhpbiBvdXIgZ2VuZXJhbCBsaW5lIG9mIHdoYXQgS2NvbmZpZwpvcHRpb25zIHdl
IHBlcm1pdCwgSSB0aGluayBmb3IgdGhlIHRpbWUgYmVpbmcgdGhlIHByb21wdCBuZWVkcwp0byBk
ZXBlbmQgb24gRVhQRVJUID0gInkiLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
