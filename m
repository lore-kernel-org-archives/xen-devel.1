From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v3 1/6] libxl: do not attach xen-pciback to
 HVM domain, if stubdomain is in use
Date: Mon, 28 Jan 2019 14:24:18 +0000
Message-ID: <20190128142418.fcj3p74a4g6pbjsl@zion.uk.xensource.com>
References: <cover.3de8cf7a339b8395cb449f8f3d44fee884ce04fa.1548469645.git-series.marmarek@invisiblethingslab.com>
 <f1477baa622f642fc268879684fc88d6d1a002c0.1548469645.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=eoWa=QE=citrix.com=prvs=9248dae56=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1go7pr-0001Rb-6H
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 14:24:27 +0000
Content-Disposition: inline
In-Reply-To: <f1477baa622f642fc268879684fc88d6d1a002c0.1548469645.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU2F0LCBKYW4gMjYsIDIwMTkgYXQgMDM6MzE6MTJBTSArMDEwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IEhWTSBkb21haW5zIHVzZSBJT01NVSBhbmQgZGV2aWNlIG1v
ZGVsIGFzc2lzdGFuY2UgZm9yIGNvbW11bmljYXRpbmcgd2l0aAo+IFBDSSBkZXZpY2VzLCB4ZW4t
cGNpZnJvbnQvcGNpYmFjayBpc24ndCBkaXJlY3RseSBuZWVkZWQgYnkgSFZNIGRvbWFpbi4KPiBC
dXQgcGNpYmFjayBzZXJ2ZSBhbHNvIHNlY29uZCBmdW5jdGlvbiAtIGl0IHJlc2V0IHRoZSBkZXZp
Y2Ugd2hlbiBpdCBpcwo+IGRlYXNzaWduZWQgZnJvbSB0aGUgZ3Vlc3QgYW5kIGZvciB0aGlzIHJl
YXNvbiBwY2liYWNrIG5lZWRzIHRvIGJlIHVzZWQKPiB3aXRoIEhWTSBkb21haW4gdG9vLgo+IFdo
ZW4gSFZNIGRvbWFpbiBoYXMgZGV2aWNlIG1vZGVsIGluIHN0dWJkb21haW4sIGF0dGFjaGluZyB4
ZW4tcGNpYmFjayB0bwo+IHRoZSB0YXJnZXQgZG9tYWluIGl0c2VsZiBtYXkgcHJldmVudCBhdHRh
Y2hpbmcgeGVuLXBjaWJhY2sgdG8gdGhlCj4gKFBWKSBzdHViZG9tYWluLCBlZmZlY3RpdmVseSBi
cmVha2luZyBQQ0kgcGFzc3Rocm91Z2guCj4gCj4gRml4IHRoaXMgYnkgYXR0YWNoaW5nIHBjaWJh
Y2sgb25seSB0byBvbmUgZG9tYWluOiBpZiBQViBzdHViZG9tYWluIGlzIGluCj4gdXNlLCBsZXQg
aXQgYmUgc3R1YmRvbWFpbiAodGhlIGNvbW1pdCBwcmV2ZW50cyBhdHRhY2hpbmcgZGV2aWNlIHRv
IHRhcmdldAo+IEhWTSBpbiB0aGlzIGNhc2UpOyBvdGhlcndpc2UsIGF0dGFjaCBpdCB0byB0aGUg
dGFyZ2V0IGRvbWFpbi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8Oz
cmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+CgpBY2tlZC1ieTogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
