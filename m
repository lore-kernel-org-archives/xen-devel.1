From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] xen: Introduce an xmemdup() helper
Date: Mon, 09 Jul 2018 06:40:35 -0600
Message-ID: <5B4357C302000078001D2525@prv1-mh.provo.novell.com>
References: <1531132188-20564-1-git-send-email-andrew.cooper3@citrix.com>
 <1531132188-20564-2-git-send-email-andrew.cooper3@citrix.com>
 <5B434ECC02000078001D24BF@prv1-mh.provo.novell.com>
 <3f0b227e-94f3-6502-74a9-b8b3e8ecd093@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3f0b227e-94f3-6502-74a9-b8b3e8ecd093@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjA3LjE4IGF0IDE0OjA4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDkvMDcvMTggMTM6MDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwOS4w
Ny4xOCBhdCAxMjoyOSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gLS0t
IGEveGVuL2FyY2gveDg2L2NwdWlkLmMKPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9jcHVpZC5jCj4+
PiBAQCAtNzAzLDE2ICs3MDMsMTcgQEAgdm9pZCByZWNhbGN1bGF0ZV9jcHVpZF9wb2xpY3koc3Ry
dWN0IGRvbWFpbiAqZCkKPj4+ICAKPj4+ICBpbnQgaW5pdF9kb21haW5fY3B1aWRfcG9saWN5KHN0
cnVjdCBkb21haW4gKmQpCj4+PiAgewo+Pj4gLSAgICBkLT5hcmNoLmNwdWlkID0geG1hbGxvYyhz
dHJ1Y3QgY3B1aWRfcG9saWN5KTsKPj4+ICsgICAgc3RydWN0IGNwdWlkX3BvbGljeSAqcCA9Cj4+
PiArICAgICAgICB4bWVtZHVwKGlzX3B2X2RvbWFpbihkKSA/ICYgcHZfbWF4X2NwdWlkX3BvbGlj
eQo+PiBTdHJheSBibGFuayAoc2FtZSBiZWxvdyBpbiB0aGUgTVNSIGVxdWl2YWxlbnQpLgo+IAo+
IFRoYXQgd2FzIHRoZSB2aXN1YWxseSBsaW5lIHVwIHRoZSBfbWF4X2NwdWlkX3BvbGljeSB3aXRo
IGh2bSBiZWxvdy4KPiAKPiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSAiPyAgJnB2XyIgd2l0aCBh
IGRvdWJsZSBzcGFjZSBiZWZvcmUgdGhlICYuCgpFaXRoZXIgd2F5IGxvb2tzIGEgbGl0dGxlIHN0
cmFuZ2UgdG8gbWUsIGJ1dCBpZiB5b3UgcHJlZmVyIHRvIGhhdmUgdGhpbmdzCmFsaWduZWQgdGhp
cyB3YXksIHRoZW4gSSdsbCBsZWF2ZSBpdCB0byB5b3Ugd2hpY2ggb2YgdGhlIHR3byBvcHRpb25z
IHlvdQpwaWNrIChJIGhhdmUgb25seSBhIHZlcnkgc2xpZ2h0IHByZWZlcmVuY2UgdG8gdGhlIGFs
dGVybmF0aXZlIHlvdSd2ZQpubyBzdWdnZXN0ZWQpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
