From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Subject: Re: Fix VGA logdirty related display freezes with altp2m
Date: Thu, 18 Oct 2018 14:08:33 -0600
Message-ID: <CABfawhmTCUqUV264hEjQWABohR42ezHPWBhL0GVT4cKuiDjyGg@mail.gmail.com>
References: <1539857272-4660-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=2kzf=m6=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1gDEbZ-00061D-Vu
 for xen-devel@lists.xenproject.org; Thu, 18 Oct 2018 20:09:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id e4-v6so35049896wrs.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Oct 2018 13:09:11 -0700 (PDT)
In-Reply-To: <1539857272-4660-1-git-send-email-rcojocaru@bitdefender.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBPY3QgMTgsIDIwMTggYXQgNDowOSBBTSBSYXp2YW4gQ29qb2NhcnUKPHJjb2pvY2Fy
dUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiBUaGlzIHNlcmllcyBhaW1z
IHRvIHByZXZlbnQgdGhlIGRpc3BsYXkgZnJvbSBmcmVlemluZyB3aGVuCj4gZW5hYmxpbmcgYWx0
cDJtIGFuZCBzd2l0Y2hpbmcgdG8gYSBuZXcgdmlldyAoYW5kIGFzc29ydGVkIHByb2JsZW1zCj4g
d2hlbiByZXNpemluZyB0aGUgZGlzcGxheSkuCj4KPiBUaGUgZmlyc3QgcGF0Y2ggcHJvcGFnYXRl
cyBlcHQuYWQgY2hhbmdlcyB0byBhbGwgYWN0aXZlIGFsdHAybXMsCj4gYW5kIHRoZSBzZWNvbmQg
b25lIGFsbG9jYXRlcyBhIG5ldyBsb2dkaXJ0eSByYW5nZXNldCBmb3IgZWFjaAo+IG5ldyBhbHRw
Mm0sIGFuZCBwcm9wYWdhdGVzICh1bmRlciBsb2NrKSBjaGFuZ2VzIHRvIGFsbCBwMm1zLgo+Cj4g
VGhlIGZpcnN0IHBhdGNoIGlzIHRoZSBzYW1lIGFzOgo+IFtQQVRDSCBWNF0geDg2L2FsdHAybTog
cHJvcGFnYXRlIGVwdC5hZCBjaGFuZ2VzIHRvIGFsbCBhY3RpdmUgYWx0cDJtcwo+IGJ1dCBhcyBp
dCBpcyBub3cgcmVxdWlyZWQgZm9yIHRoZSBzZWNvbmQgb25lIHRvIGFwcGx5IGNsZWFubHksIGl0
Cj4gaGFzIGJlZW4gcmVzZW50IGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMuCj4KPiBbUEFUQ0ggMS8y
XSB4ODYvYWx0cDJtOiBwcm9wYWdhdGUgZXB0LmFkIGNoYW5nZXMgdG8gYWxsIGFjdGl2ZSBhbHRw
Mm1zCj4gW1BBVENIIDIvMl0geDg2L2FsdHAybTogZml4IGRpc3BsYXkgZnJvemVuIHdoZW4gc3dp
dGNoaW5nIHRvIGEgbmV3CgpIaSBSYXp2YW4sCkkgd291bGQgYmUgaGFwcHkgdG8gZ2l2ZSB0aGlz
IGEgc3BpbiwgY2FuIHlvdSBwdXNoIGl0IGFzIGEgZ2l0IGJyYW5jaCBzb21ld2hlcmU/CgpUaGFu
a3MsClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
