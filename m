From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 2/6] x86: distinguish CPU offlining from
 CPU removal
Date: Wed, 18 Jul 2018 09:49:41 +0100
Message-ID: <20180718084941.zyu4gtsyq65rgtkg@citrix.com>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF81102000078001D53D4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ab30=kc=citrix.com=prvs=730fbb136=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ffi9a-0007o5-6H
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 08:49:46 +0000
Content-Disposition: inline
In-Reply-To: <5B4EF81102000078001D53D4@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDI6MTk6MjlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gSW4gb3JkZXIgdG8gYmUgYWJsZSB0byBzZXJ2aWNlICNNQyBvbiBvZmZsaW5lZCBDUFVz
LCB0aGUgR0RULCBJRFQsCj4gc3RhY2ssIGFuZCBwZXItQ1BVIGRhdGEgKHdoaWNoIGluY2x1ZGVz
IHRoZSBUU1MpIG5lZWQgdG8gYmUga2VwdAo+IGFsbG9jYXRlZC4gVGhleSBzaG91bGQgb25seSBi
ZSBmcmVlZCB1cG9uIENQVSByZW1vdmFsICh3aGljaCB3ZQo+IGN1cnJlbnRseSBkb24ndCBzdXBw
b3J0LCBzbyBzb21lIGNvZGUgaXMgYmVjb21pbmcgZWZmZWN0aXZlbHkgZGVhZAo+IGZvciB0aGUg
bW9tZW50KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
