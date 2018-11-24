From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] mm: make opt_bootscrub non-init
Date: Sat, 24 Nov 2018 11:46:05 +0000
Message-ID: <20181124114605.edwwe253rptmuamb@zion.uk.xensource.com>
References: <20181123143002.79743-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=cekd=od=citrix.com=prvs=859443b5d=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gQWO6-0000fw-7e
 for xen-devel@lists.xenproject.org; Sat, 24 Nov 2018 11:46:14 +0000
Content-Disposition: inline
In-Reply-To: <20181123143002.79743-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBOb3YgMjMsIDIwMTggYXQgMDM6MzA6MDJQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IExMVk0gY29kZSBnZW5lcmF0aW9uIGNhbiBhdHRlbXB0IHRvIGxvYWQgZnJvbSBh
IHZhcmlhYmxlIGluIHRoZSBuZXh0Cj4gY29uZGl0aW9uIG9mIGFuIGV4cHJlc3Npb24gdW5kZXIg
Y2VydGFpbiBjaXJjdW1zdGFuY2VzLCB0aHVzIHR1cm5pbmcKPiB0aGUgZm9sbG93aW5nIGNvbmRp
dGlvbjoKPiAKPiBpZiAoIHN5c3RlbV9zdGF0ZSA8IFNZU19TVEFURV9hY3RpdmUgJiYgb3B0X2Jv
b3RzY3J1YiA9PSBCT09UU0NSVUJfSURMRSApCj4gCj4gSW50bzoKPiAKPiAweGZmZmY4MmQwODAy
MjM5NjcgPCsxMDM+OiBjbXBsICAgJDB4MywweDM3YjAzMiglcmlwKSAjIDB4ZmZmZjgyZDA4MDU5
ZTlhMCA8c3lzdGVtX3N0YXRlPgo+IDB4ZmZmZjgyZDA4MDIyMzk2ZSA8KzExMD46IHNldGIgICAt
MHgyOSglcmJwKQo+IDB4ZmZmZjgyZDA4MDIyMzk3MiA8KzExND46IGNtcGwgICAkMHgyLDB4MjI4
YThiKCVyaXApICMgMHhmZmZmODJkMDgwNDRjNDA0IDxvcHRfYm9vdHNjcnViPgo+IAo+IFN1Y2gg
Y29kZSB3aWxsIHRyaWdnZXIgYSBwYWdlIGZhdWx0IGlmIHN5c3RlbV9zdGF0ZSA+PQo+IFNZU19T
VEFURV9hY3RpdmUgYmVjYXVzZSBvcHRfYm9vdHNjcnViIHdpbGwgYmUgdW5tYXBwZWQuCj4gCj4g
Rml4IHRoaXMgYnkgbWFraW5nIG9wdF9ib290c2NydWIgbm9uLWluaXQsIHRodXMgcHJldmVudGlu
ZyB0aGUgcGFnZQo+IGZhdWx0LiBUaGUgTExWTSBidWcgd2l0aCB0aGUgZGlzY3Vzc2lvbiBhYm91
dCB0aGlzIGlzc3VlIGNhbiBiZSBmb3VuZAo+IGF0Ogo+IAo+IGh0dHBzOi8vYnVncy5sbHZtLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9Mzk3MDcKPiAKPiBJIGhhdmVuJ3QgYmVlbiBhYmxlIHRvIGZpbmQg
YW55IG90aGVyIGluc3RhbmNlcyBvZiBzdWNoIGNvbmRpdGlvbmFsCj4gZXhwcmVzc2lvbiB0aGF0
IHVzZXMgc3lzdGVtX3N0YXRlIHRvZ2V0aGVyIHdpdGggYW4gaW5pdCB2YXJpYWJsZSBvcgo+IGZ1
bmN0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
