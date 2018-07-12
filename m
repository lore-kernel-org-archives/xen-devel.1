From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/8] allow cpu_down() to be called earlier
Date: Thu, 12 Jul 2018 11:55:37 +0100
Message-ID: <20180712105537.dfqamaabtlbbs3qj@citrix.com>
References: <5B45F01B02000078001D30FF@prv1-mh.provo.novell.com>
 <5B45F2DC02000078001D3136@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ay1y=j4=citrix.com=prvs=72409e2aa=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fdZGA-0002Ef-00
 for xen-devel@lists.xenproject.org; Thu, 12 Jul 2018 10:55:42 +0000
Content-Disposition: inline
In-Reply-To: <5B45F2DC02000078001D3136@prv1-mh.provo.novell.com>
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

T24gV2VkLCBKdWwgMTEsIDIwMTggYXQgMDY6MDY6NTJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhlIGZ1bmN0aW9uJ3MgdXNlIG9mIHRoZSBzdG9wLW1hY2hpbmUgbG9naWMgaGFzIHNv
IGZhciBwcmV2ZW50ZWQgaXRzCj4gdXNlIGFoZWFkIG9mIHRoZSBwcm9jZXNzaW5nIG9mIHRoZSAi
b3JkaW5hcnkiIGluaXRjYWxscy4gU2luY2UgYXQgdGhpcwo+IGVhcmx5IHRpbWUgd2UncmUgaW4g
YSBjb250cm9sbGVkIGVudmlyb25tZW50IGFueXdheSwgdGhlcmUncyBubyBuZWVkIGZvcgo+IHN1
Y2ggYSBoZWF2eSB0b29sLiBBZGRpdGlvbmFsbHkgdGhpcyBvdWdodCB0byBoYXZlIGxlc3Mgb2Yg
YSBwZXJmb3JtYW5jZQo+IGltcGFjdCBlc3BlY2lhbGx5IG9uIGxhcmdlIHN5c3RlbXMsIGNvbXBh
cmVkIHRvIHRoZSBhbHRlcm5hdGl2ZSBvZgo+IG1ha2luZyBzdG9wLW1hY2hpbmUgZnVuY3Rpb25h
bGl0eSBhdmFpbGFibGUgZWFybGllci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
