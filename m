From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] core-parking: interact with runtime
 SMT-disabling
Date: Fri, 12 Apr 2019 05:41:30 -0600
Message-ID: <5CB0796A0200007800226DDA@prv1-mh.provo.novell.com>
References: <5CAF2D310200007800226974@prv1-mh.provo.novell.com>
 <5CAF36E202000078002269BE@prv1-mh.provo.novell.com>
 <98ae3d6e-7c76-f093-22b4-22568142ac82@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UMhk=SO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hEuaj-0007Po-8G
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2019 11:43:33 +0000
In-Reply-To: <98ae3d6e-7c76-f093-22b4-22568142ac82@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDExLjA0LjE5IGF0IDIxOjA2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDQvMjAxOSAxMzo0NSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IFdoZW4gZGlz
YWJsaW5nIFNNVCBhdCBydW50aW1lLCBzZWNvbmRhcnkgdGhyZWFkcyBzaG91bGQgbm8gbG9uZ2Vy
IGJlCj4+IGNhbmRpZGF0ZXMgZm9yIGJyaW5naW5nIGJhY2sgdXAgaW4gcmVzcG9uc2UgdG8gX1BV
RCBBQ1BJIGV2ZW50cy4gUHVyZ2UKPj4gdGhlbSBmcm9tIHRoZSB0cmFja2luZyBhcnJheS4KPj4K
Pj4gRG9pbmcgc28gaW52b2x2ZXMgYWRkaW5nIGxvY2tpbmcgdG8gZ3VhcmQgYWNjb3VudGluZyBk
YXRhIGluIHRoZSBjb3JlCj4+IHBhcmtpbmcgY29kZS4gV2hpbGUgYWRkaW5nIHRoZSBkZWNsYXJh
dGlvbiBmb3IgdGhlIGxvY2sgdGFrZSB0aGUgbGliZXJ0eQo+PiB0byBkcm9wIHR3byB1bm5lY2Vz
c2FyeSBmb3J3YXJkIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucy4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IEkgY2FuIGNlcnRhaW5seSBhcHBy
ZWNpYXRlIHRoZXNlIGFyZ3VtZW50cywgYnV0IHN1cmVseSB0aGUgY29udmVyc2UgaXMKPiB0cnVl
LiAgV2hlbiBTTVQtZW5hYmxlIGlzIHVzZWQsIHRoZSBuZXdseS1vbmxpbmVkIHRocmVhZHMgYXJl
IG5vdwo+IGVsaWdpYmxlIHRvIGJlIHBhcmtlZC4KCkFuZCBub3RoaW5nIHdpbGwga2VlcCB0aGVt
IGZyb20gZ2V0dGluZyBwYXJrZWQuCgo+IEF0IHRoZSBtb21lbnQsIHRoaXMgbG9va3MgYXN5bWV0
cmljLgoKSXQgZG9lcywgYnV0IHRoYXQncyBhIHJlc3VsdCBvZiBjb3JlX3BhcmtpbmcuYyBvbmx5
IHJlY29yZGluZyBDUFVzCml0IGhhcyBwYXJrZWQsIG5vdCBvbmVzIGl0IGNvdWxkIHBhcmsuCgpK
YW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
