From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/mm: don't crash on unknown memory types
 in page_get_ram_type
Date: Fri, 21 Sep 2018 15:41:28 +0200
Message-ID: <20180921134128.p3vclyxghc434pad@mac.bytemobile.com>
References: <20180921105953.3066-1-roger.pau@citrix.com>
 <5BA4DE4F02000078001EA958@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gjdu=md=citrix.com=prvs=7959a86e1=roger.pau@srs-us1.protection.inumbo.net>)
 id 1g3Lgf-0002wr-5b
 for xen-devel@lists.xenproject.org; Fri, 21 Sep 2018 13:41:37 +0000
Content-Disposition: inline
In-Reply-To: <5BA4DE4F02000078001EA958@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBTZXAgMjEsIDIwMTggYXQgMDY6MDQ6MzFBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIxLjA5LjE4IGF0IDEyOjU5LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdy
b3RlOgo+ID4gLS0tIGEveGVuL2FyY2gveDg2L21tLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9t
bS5jCj4gPiBAQCAtNDY1LDcgKzQ2NSw3IEBAIHVuc2lnbmVkIGludCBwYWdlX2dldF9yYW1fdHlw
ZShtZm5fdCBtZm4pCj4gPiAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgCj4gPiAgICAgICAgICBk
ZWZhdWx0Ogo+ID4gLSAgICAgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJMRSgpOwo+ID4gKyAgICAg
ICAgICAgIHR5cGUgfD0gUkFNX1RZUEVfVU5LTk9XTjsKPiA+ICAgICAgICAgIH0KPiA+ICAgICAg
fQo+IAo+IFRoZSBsYXRlc3Qgbm93IHRoZXJlIHNob3VsZCBiZSBhICJicmVhayIuIEknbSBoYXBw
eSB0byBhZGQgdGhhdCB3aGlsZQo+IGNvbW1pdHRpbmc7IHdpdGggaXQKPiBSZXZpZXdlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKU3VyZSwgdGhhbmtzLgoKUm9nZXIuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
