From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 3/3] libxc: do not return a value from
 xc_cpuid_policy
Date: Thu, 28 Jun 2018 08:31:49 +0100
Message-ID: <20180628073149.pvt6nesc423uprvi@citrix.com>
References: <20180627143214.35751-1-roger.pau@citrix.com>
 <20180627143214.35751-4-roger.pau@citrix.com>
 <20180627144930.majmqtalvc67o62k@citrix.com>
 <20180628072932.ydur2tfprkyokkhw@mac.bytemobile.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dpmo=jo=citrix.com=prvs=7101e345a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fYRPF-0007XF-9o
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 07:31:53 +0000
Content-Disposition: inline
In-Reply-To: <20180628072932.ydur2tfprkyokkhw@mac.bytemobile.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMDk6Mjk6MzJBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBXZWQsIEp1biAyNywgMjAxOCBhdCAwMzo0OTozMFBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMjcsIDIwMTggYXQgMDQ6MzI6MTRQTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gPiBOb25lIG9mIHRoZSBjYWxsZWQgZnVuY3Rpb25z
IHJldHVybiBhbnkgZXJyb3JzLCBzbyB0aGVyZSdzIG5vIHBvaW50IGluCj4gPiA+IHJldHVybmlu
ZyBhbiBpbnQgZnJvbSB4Y19jcHVpZF9wb2xpY3kuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IAo+ID4gV2hhdCBp
cyB0aGUgcGxhbiBmb3IgdGhpcyBmdW5jdGlvbj8gSSBleHBlY3QgaXQgKGFuZCBpdHMgY2hpbGRy
ZW4pIHRvIGdvCj4gPiBhd2F5IHNvb24/Cj4gCj4gVGhpcyBpcyBsaWtlbHkgdG8gZ28gYXdheSB3
aXRoIGZ1cnRoZXIgY3B1aWQgd29yay4KPiAKPiA+IFlvdSBjYW4gYWxzbyBkZWxldGUgeGNoLCBJ
IHRoaW5rLiBJdCBpcyBub3QgdXNlZC4KPiAKPiBSaWdodCwgSSBsZWZ0IGl0IGJlY2F1c2UgYWxs
IHRoZSB4Y19jcHVpZF8qIHRha2UgeGNoIGFzIHRoZSBmaXJzdAo+IHBhcmFtZXRlci4gSWYgSSBy
ZW1vdmUgaXQgaGVyZSBJIHdpbGwgaGF2ZSB0byByZW1vdmUgaXQgZnJvbSB0aGUKPiBfaW50ZWws
IF9hbWQsIF9odm0gYW5kIF9wdiBoZWxwZXJzLgoKSWYgdGhpcyBhbmQgaXRzIGxlYWYgZnVuY3Rp
b25zIGFyZSBnb2luZyBhd2F5IHNvb24taXNoIEknbSBmaW5lIHdpdGgKbGVzcyBjb2RlIGNodXJu
LgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
