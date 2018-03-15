From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Implementaiton of cc-option in Config.mk
Date: Thu, 15 Mar 2018 05:29:39 -0600
Message-ID: <5AAA673302000078001B2104@prv-mh.provo.novell.com>
References: <20180314171128.52ln4efljqd56mnu@citrix.com>
 <5AAA40AB02000078001B1F71@prv-mh.provo.novell.com>
 <20180315112202.7u56metqc2h5iw24@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=ovtz=gf=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewR4t-0006Qh-Hg
 for xen-devel@lists.xenproject.org; Thu, 15 Mar 2018 11:29:47 +0000
In-Reply-To: <20180315112202.7u56metqc2h5iw24@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDEyOjIyLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBNYXIgMTUsIDIwMTggYXQgMDI6NDU6MTVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4+ID4+PiBPbiAxNC4wMy4xOCBhdCAxODoxMSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiA+IFRoZSBpbXBsZW1lbnRhdGlvbiBvZiBjYy1vcHRpb24gKGdyZXBwaW5nIHRoZSBv
cHRpb24gYmVpbmcgdGVzdGVkIGluCj4+ID4gb3V0cHV0KSBpbiBDb25maWcubWsgbm93IG1ha2Vz
IGl0IG5vdCBwb3NzaWJsZSB0byBkZXRlY3QgaWYgLU9nIGlzCj4+ID4gc3VwcG9ydGVkIGJlY2F1
c2UgIi1PZyIgZG9lc24ndCBhcHBlYXIgaW4gdGhlIG91dHB1dCBpZiBpdCBpcyBub3QKPj4gPiBz
dXBwb3J0ZWQuIEkgc3VzcGVjdCB0aGVyZSB3aWxsIGJlIG90aGVyIG9wdGlvbnMgdGhhdCBjYy1v
cHRpb24gY2FuJ3Qgd29yawo+PiA+IHdpdGguCj4+ID4gCj4+ID4gSXQgaXMgaW1wbGVtZW50ZWQg
bGlrZSB0aGF0IGJlY2F1c2Ugd2UgdHJ5IHRvIGRldGVjdCAtV25vLSogb3B0aW9uLiBCdXQKPj4g
PiB3aHkgaXMgdGhhdCBpbXBvcnRhbnQ/IENhbid0IHdlIGp1c3QgaWdub3JlIC1Xbm8tKiBpZiB0
aGV5IGFyZW4ndAo+PiA+IHN1cHBvcnRlZD8KPj4gCj4+IFdlbGwsIHRoZSBleHBsYW5hdGlvbiBm
b3IgaXRzIGJlaGF2aW9yIGlzIGdpdmVuIGluIHRoZSBjb21tZW50Cj4+IG5leHQgdG8gaXRzIGRl
ZmluaXRpb246Cj4gCj4gWWVhaCwgSSBrbm93IHRoYXQuIEknbSBqdXN0IG5vdCBzdXJlIHdoeSBu
b25leGlzdGVudCAtV25vLSogc2hvdWxkIGJlCj4gcmVqZWN0ZWQuIElmIHRoZXJlIGlzIG5vIGNv
cnJlc3BvbmRpbmcgLVcqIG9wdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UsCj4gLVduby0qIHNob3Vs
ZG4ndCBjYXVzZSBhbnkgZGlmZmVyZW5jZSBpbiB0aGUgZW5kIHJlc3VsdC4KClRoZSBwcm9ibGVt
IGlzIHRoYXQgYXQgbGVhc3Qgc29tZSBjb21waWxlciB2ZXJzaW9ucyBlcnJvciBvbiB1bmtub3du
Ci1Xbm8tKiB0aGUgZmlyc3QgdGltZSB0aGV5IHByb2R1Y2Ugc29tZSAob3RoZXIpIHdhcm5pbmcu
IEhlbmNlIHdlCmNhbid0IGJsaW5kbHkgcGFzcyAtV25vLSouCgpKYW4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
