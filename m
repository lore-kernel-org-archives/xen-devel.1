From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: correct EFLAGS.IF in SYSENTER frame
Date: Fri, 16 Mar 2018 10:26:10 -0600
Message-ID: <5AABFE3202000078001B2E9A@prv-mh.provo.novell.com>
References: <5AABDF1F02000078001B2D98@prv-mh.provo.novell.com>
 <8cafcb45-c571-e50c-9c37-778bb2fe0e18@citrix.com>
 <5AABEB1202000078001B2E21@prv-mh.provo.novell.com>
 <34c879e0-41f6-e111-e21c-7b05bcdbbc2a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewsBK-0003tP-LU
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 16:26:14 +0000
In-Reply-To: <34c879e0-41f6-e111-e21c-7b05bcdbbc2a@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDE2OjQyLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTYvMDMvMTggMTU6MDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNi4w
My4xOCBhdCAxNToyOSwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gU29t
ZXdoYXQgaW5kZXBlbmRlbnRseSBvZiB0aGlzIHBhdGNoLCBJIHRoaW5rIHdlIHNob3VsZCBhc3Nl
cnQgdGhhdAo+Pj4gZmxhZ3MgYXJlIGluIHRoZSBleHBlY3RlZCBzdGF0ZSBpbiB0aGUgcmV0dXJu
LXRvLWd1ZXN0IHBhdGgsIHNvIHdlCj4+PiBub3RpY2UgYWNjaWRlbnRhbCBicmVha2FnZSBsaWtl
IHRoaXMgbW9yZSBlYXNpbHkuCj4+IE5vdCBzdXJlIC0gbm90aGluZyB3YXMgYnJva2VuIGhlcmUg
YWZhaWN0LCB3ZSBqdXN0IHdhbnQgdG8gcGxheQo+PiBzYWZlLiBBbmQgYXMgc2FpZCB0aGUgZXhp
dCBwYXRocyBhbHJlYWR5IGZvcmNlIEVGTEFHUy5JRiB0byAxLgo+IAo+IEl0IGlzIG9ubHkgYmVj
YXVzZSBvZiB0aGUgcGVzc2ltaXN0aWMgYXBwcm9hY2ggaW4gYSBwcmV2aW91cyBYU0EgZml4Cj4g
dGhhdCB0aGlzIGlzbid0IGFuIFhTQSBpdHNlbGYuCgpUaGF0IHBsdXMgdGhlIHBhdGNoIG1vdmlu
ZyB0aGUgU1RJIGRpZG4ndCBnbyBhbnl3aGVyZSBvdGhlciB0aGFuCmludG8gc3RhZ2luZyBzbyBm
YXIuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
