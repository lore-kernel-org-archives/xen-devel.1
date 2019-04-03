From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/4] xen/console: Properly buffer domU
 output when using CONSOLEIO_write
Date: Wed, 3 Apr 2019 12:41:27 +0100
Message-ID: <20190403114127.GX14641@zion.uk.xensource.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Rv1=SF=citrix.com=prvs=9892ef700=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hBeGx-0007Vc-6I
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 11:41:39 +0000
Content-Disposition: inline
In-Reply-To: <20190402164238.1815-2-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBBcHIgMDIsIDIwMTkgYXQgMDU6NDI6MzVQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IFRoZSBvdXRwdXQgd2lsbCBiZSBidWZmZXJlZCBpZiB0aGUgYnVmZmVyIHByb3ZpZGVk
IGJ5IHRoZSBEb21VIGRvZXMgbm90Cj4gY29udGFpbiBhIG5ld2xpbmUuIFRoaXMgY2FuIGFsc28g
aGFwcGVuIGlmIGJ1ZmZlciBwcm92aWRlZCBieSBEb21VIGlzCj4gc3BsaXQgaW4gbXVsdGlwbGUg
cGFydCAoWGVuIGNhbiBvbmx5IHByb2Nlc3MgMTI3IGNoYXJhY3RlcnMgYXQgdGhlIHRpbWUpLgo+
IAo+IEFzIFhlbiB3aWxsIHJlbW92ZSBhbnkgbm9uLXByaW50YWJsZSBjaGFyYWN0ZXJzLCB0aGUg
b3V0cHV0IGJ1ZmZlciBtYXkKPiBiZSBzbWFsbGVyIHRoYW4gdGhlIGJ1ZmZlciBwcm92aWRlZC4g
SG93ZXZlciwgWGVuIHdpbGwgYnVmZmVyIHVzaW5nIHRoZQo+IG9yaWdpbmFsIGxlbmd0aC4gVGhp
cyBtZWFucyB0aGF0IHRoZSBOVUwgY2hhcmFjdGVyIGFuZCBnYXJiYWdnZSB3aWxsIGJlCj4gY29w
aWVkIGluIHRoZSBpbnRlcm5hbCBidWZmZXIuCj4gCj4gT25jZSB0aGUgbmV3bGluZSBpcyBmb3Vu
ZCBvciB0aGUgaW50ZXJuYWwgYnVmZmVyIGlzIGZ1bGwsIG9ubHkgcGFydCBvZgo+IHRoZSBpbnRl
cm5hbCBidWZmZXIgd2lsbCBlbmQgdXAgdG8gYmUgcHJpbnRlZC4KPiAKPiBBbiBlYXN5IHdheSB0
byByZXByb2R1Y2UgaXQgaXM6Cj4gCj4gSFlQRVJWSVNPUl9jb25zb2xlaW8oQ09OU09MRUlPX3dy
aXRlLCAiXDMzIiwgMSk7Cj4gSFlQRVJWSVNPUl9jb25zb2xlaW8oQ09OU09MRUlPX3dyaXRlLCAi
ZCIsIDEpOwo+IEhZUEVSVklTT1JfY29uc29sZWlvKENPTlNPTEVJT193cml0ZSwgIlxuIiwgMSk7
Cj4gCj4gSW4gdGhlIGN1cnJlbnQgY29kZSwgdGhlIGNoYXJhY3RlciAnZCcgd2lsbCBub3QgYmUg
cHJpbnRlZC4KPiAKPiBUaGlzIHByb2JsZW0gY2FuIGJlIHNvbHZlZCBieSBjb21wdXRpbmcgdGhl
IHNpemUgb2YgdGhlIG91dHB1dCBidWZmZXIKPiAoaS5lIHRoZSBidWZmZXIgd2l0aG91dCB0aGUg
bm9uLXByaW50YWJsZSBjaGFyYWN0ZXJzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
