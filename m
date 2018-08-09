From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC PATCH v2 01/17] libxl: fix qemu-trad cmdline
 for no sdl/vnc case
Date: Thu, 9 Aug 2018 10:19:25 +0100
Message-ID: <20180809091925.th7b6ejh25z55xjb@citrix.com>
References: <cover.f20f4d9289206c83fc15e632ed8ec76ac4e8c8cd.1533608042.git-series.marmarek@invisiblethingslab.com>
 <7b254e7464fe461e84f73ea3c146fb5a7909ea3d.1533608042.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cugt=ky=citrix.com=prvs=752bb2a90=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fnh6P-00052P-54
 for xen-devel@lists.xenproject.org; Thu, 09 Aug 2018 09:19:29 +0000
Content-Disposition: inline
In-Reply-To: <7b254e7464fe461e84f73ea3c146fb5a7909ea3d.1533608042.git-series.marmarek@invisiblethingslab.com>
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

T24gVHVlLCBBdWcgMDcsIDIwMTggYXQgMDQ6MTY6MDZBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFdoZW4gcWVtdSBpcyBydW5uaW5nIGluIHN0dWJkb21haW4s
IGFueSBhdHRlbXB0IHRvIGluaXRpYWxpemUgdm5jL3NkbAo+IHRoZXJlIHdpbGwgY3Jhc2ggaXQg
KG9uIGZhaWxlZCBhdHRlbXB0IHRvIGxvYWQgYSBrZXltYXAgZnJvbSBhIGZpbGUpLiBJZgo+IHZm
YiBpcyBwcmVzZW50LCBhbGwgdGhvc2UgY2FzZXMgYXJlIHNraXBwZWQuIEJ1dCBzaW5jZQo+IGIw
NTNmMGM0YzllNTMzZjNkOTc4MzdjZjg5N2ViOTIwYjgzNTVlZDMgImxpYnhsOiBkbyBub3Qgc3Rh
cnQgZG9tMCBxZW11Cj4gZm9yIHN0dWJkb21haW4gd2hlbiBub3QgbmVlZGVkIiBpdCBpcyBwb3Nz
aWJsZSB0byBjcmVhdGUgYSBzdHViZG9tYWluCj4gd2l0aG91dCB2ZmIgYW5kIGNvbnRyYXJ5IHRv
IHRoZSBjb21tZW50IC12bmMgbm9uZSBkbyB0cmlnZ2VyIFZOQwo+IGluaXRpYWxpemF0aW9uIGNv
ZGUgKGp1c3Qgc2tpcHMgZXhwb3NpbmcgaXQgZXh0ZXJuYWxseSkuCj4gQ2hhbmdlIHRoZSBpbXBs
aWNpdCBTREwgYXZvaWRpbmcgbWV0aG9kIHRvIC1ub2dyYXBoaWNzIG9wdGlvbiwgdXNlZCB3aGVu
Cj4gbm9uZSBvZiBTREwgb3IgVk5DIGlzIGVuYWJsZWQuCgpVcmdoLi4uCgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhp
bmdzbGFiLmNvbT4KPiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwu
Y29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
