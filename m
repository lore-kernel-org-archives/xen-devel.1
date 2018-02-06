From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] make xen ocaml safe-strings compliant
Date: Tue, 6 Feb 2018 16:49:30 +0000
Message-ID: <20180206164930.hall3jh62vn4vrix@citrix.com>
References: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=y0p4=fa=citrix.com=prvs=56821041b=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1ej6R7-0001l6-RN
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2018 16:49:37 +0000
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.1801302254440.2952@austen3.home>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Michael Young <m.a.young@durham.ac.uk>
Cc: Wei Liu <wei.liu2@citrix.com>, John Thomson <git@johnthomson.fastmail.com.au>, Marcello Seri <marcello.seri@citrix.com>, Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBKYW4gMzAsIDIwMTggYXQgMTA6NTU6NDdQTSArMDAwMCwgTWljaGFlbCBZb3VuZyB3
cm90ZToKPiBYZW4gYnVpbHQgd2l0aCBvY2FtbCA0LjA2IGdpdmVzIGVycm9ycyBzdWNoIGFzCj4g
RXJyb3I6IFRoaXMgZXhwcmVzc2lvbiBoYXMgdHlwZSBieXRlcyBidXQgYW4gZXhwcmVzc2lvbiB3
YXMKPiAJZXhwZWN0ZWQgb2YgdHlwZSBzdHJpbmcKPiBhcyBCeXRlIGFuZCBzYWZlLXN0cmluZ3Mg
d2hpY2ggd2VyZSBpbnRyb2R1Y2VkIGluIDQuMDIgYXJlIHRoZQo+IGRlZmF1bHQgaW4gNC4wNi4K
PiBUaGlzIHBhdGNoIHdoaWNoIGlzIHBhcnRseSBieSBSaWNoYXJkIFcuTS4gSm9uZXMgb2YgUmVk
IEhhdAo+IGZyb20gaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0x
NTI2NzAzCj4gZml4ZXMgdGhlc2UgaXNzdWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwg
WW91bmcgPG0uYS55b3VuZ0BkdXJoYW0uYWMudWs+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBM
aW5kaWcgPGNocmlzdGlhbi5saW5kaWdAY2l0cml4LmNvbT4KClN0cmFuZ2VseSB0aGlzIGRvZXNu
J3QgYXBwbHkgdG8gc3RhZ2luZy4gQW5kIGFmdGVyIGV4YW1pbmluZyB0aGUKZG93bmxvYWRlZCBw
YXRjaCBJJ20gbm90IHN1cmUgaWYgbXkgbWFpbCBjbGllbnQgaXMgYWN0aW5nIHVwLiBEbyB5b3UK
aGF2ZSBhIGdpdCBicmFuY2ggdGhhdCBJIGNhbiBwdWxsIGZyb20/CgpXZWkuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
