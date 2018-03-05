From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 1/2] x86: report if PCID and INVPCID are
	supported
Date: Mon, 5 Mar 2018 11:31:44 +0000
Message-ID: <20180305113144.ufxdqcef5i3aqg62@citrix.com>
References: <20180305095032.30062-1-wei.liu2@citrix.com>
 <20180305095032.30062-2-wei.liu2@citrix.com>
 <5A9D362002000078001AE74F@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yt/y=f3=citrix.com=prvs=595ca3bc4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1esoLf-0006Fm-QM
 for xen-devel@lists.xenproject.org; Mon, 05 Mar 2018 11:32:07 +0000
Content-Disposition: inline
In-Reply-To: <5A9D362002000078001AE74F@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXIgMDUsIDIwMTggYXQgMDQ6MjA6NDhBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDA1LjAzLjE4IGF0IDEwOjUwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2
L3NldHVwLmMKPiA+IEBAIC0xNzAxLDYgKzE3MDEsMTMgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4g
X19zdGFydF94ZW4odW5zaWduZWQgbG9uZyBtYmlfcCkKPiA+ICAgICAgICAgICAgIGNwdV9oYXNf
bnggPyBYRU5MT0dfSU5GTyA6IFhFTkxPR19XQVJOSU5HICJXYXJuaW5nOiAiLAo+ID4gICAgICAg
ICAgICAgY3B1X2hhc19ueCA/ICIiIDogIm5vdCAiKTsKPiA+ICAKPiA+ICsKPiA+ICsgICAgcHJp
bnRrKFhFTkxPR19JTkZPCj4gPiArICAgICAgICAgICAiUENJRCAoUHJvY2Vzcy1Db250ZXh0IElE
ZW50aWZpZXIpICVzc3VwcG9ydGVkXG4iLAo+ID4gKyAgICAgICAgICAgY3B1X2hhc19wY2lkID8g
IiIgOiAibm90ICIpOwo+ID4gKwo+ID4gKyAgICBwcmludGsoWEVOTE9HX0lORk8gIklOVlBDSUQg
JXNzdXBwb3J0ZWRcbiIsIGNwdV9oYXNfaW52cGNpZCA/ICIiIDogIm5vdCAiKTsKPiAKPiBEbyB3
ZSByZWFsbHkgbmVlZCB0aGlzPyBXZSBsb2cgYSBtZXNzYWdlIGZvciBOWCBhcyBhbiBleGNlcHRp
b24sCj4gd2UgZG9uJ3QgZG8gc28gZm9yIG90aGVyIGZlYXR1cmVzIChhbmQgdGhpbmdzIHdvdWxk
IGdldCBwcmV0dHkKPiB1bndpZWxkeSBpZiB3ZSBkaWQpLgo+IAoKSSdtIG5vdCB0b28gZnVzcyBy
ZWFsbHkuIEl0IGhlbHBlZCBtZSB0byBwaWNrIGEgbWFjaGluZSB3aGVuIEkgZGlkbid0CmhhdmUg
dGhlIGV4YWN0IHNwZWMgb2YgdGhlIHBvb2wgb2YgbWFjaGluZXMuIFRoZSBzYW1lIGluZm9ybWF0
aW9uIGNhbgpjZXJ0YWlubHkgYmUgb2J0YWluZWQgZnJvbSBoYXJkd2FyZSBjcHVpZCBpbmZvLgoK
T24gYW5vdGhlciBub3RlLCB3aGF0IGlzIHRoZSBtb3N0IHJlbGlhYmxlIHdheSB0byBleHRyYWN0
IGhhcmR3YXJlIGNwdWlkCmluZm8gZnJvbSBYZW4/IEFJVUkgbm93IGNwdWlkIGZhdWx0aW5nIGNh
biBiZSBlbmFibGVkIGZvciBib3RoIFBWIGFuZApIVk0gZ3Vlc3RzIHNvIHJ1bm5pbmcgY3B1aWQg
aW4gUFYgZ3Vlc3RzIG1pZ2h0IG5vdCByZXR1cm4gdGhlIHJlYWwgYml0cwood2hpY2ggaXMgYSBn
b29kIHRoaW5nKS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
