From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Fri, 08 Feb 2019 03:51:49 -0700
Message-ID: <5C5D5F450200007800214FDD@prv1-mh.provo.novell.com>
References: <1549619775-4129-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7NEh=QP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gs3lE-0007jQ-17
 for xen-devel@lists.xenproject.org; Fri, 08 Feb 2019 10:51:56 +0000
In-Reply-To: <1549619775-4129-1-git-send-email-rcojocaru@bitdefender.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Razvan Cojocaru <rcojocaru@bitdefender.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAyLjE5IGF0IDEwOjU2LCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gSFZNT1BfYWx0cDJtX3NldF9kb21haW5fc3RhdGUgZG9lcyBub3QgZG9tYWluX3BhdXNl
KCksIHByZXN1bWFibHkKPiBvbiBwdXJwb3NlIChhcyBpdCB3YXMgb3JpZ2luYWxseSBzdXBwb3Nl
ZCB0byBjYXRlciB0byBhIGluLWd1ZXN0Cj4gYWdlbnQsIGFuZCBhIGRvbWFpbiBwYXVzaW5nIGl0
c2VsZiBpcyBub3QgYSBnb29kIGlkZWEpLgo+IAo+IFRoaXMgY2FuIGxlYWQgdG8gZG9tYWluIGNy
YXNoZXMgaW4gdGhlIHZteF92bWV4aXRfaGFuZGxlcigpIGNvZGUKPiB0aGF0IGNoZWNrcyBpZiB0
aGUgZ3Vlc3QgaGFzIHRoZSBhYmlsaXR5IHRvIHN3aXRjaCBFUFRQIHdpdGhvdXQgYW4KPiBleGl0
LiBUaGF0IGNvZGUgY2FuIF9fdm1yZWFkKCkgdGhlIGhvc3QgcDJtJ3MgRVBUX1BPSU5URVIKPiAo
YmVmb3JlIEhWTU9QX2FsdHAybV9zZXRfZG9tYWluX3N0YXRlICJmb3JfZWFjaF92Y3B1KCkiIGhh
cyBhCj4gY2hhbmNlIHRvIHJ1biBhbHRwMm1fdmNwdV9pbml0aWFsaXNlKCksIGJ1dCBhZnRlcgo+
IGQtPmFyY2guYWx0cDJtX2FjdGl2ZSBpcyBzZXQpLgo+IAo+IFdoaWxlIHRoZSBpbi1ndWVzdCBz
Y2VuYXJpbyBjb250aW51ZXMgdG8gcG9zZSBwcm9ibGVtcywgdGhpcwo+IHBhdGNoIGZpeGVzIHRo
ZSAiZXh0ZXJuYWwiIGNhc2UuCgpJT1cgeW91J3JlIHBhcGVyaW5nIG92ZXIgdGhlIHByb2JsZW0g
cmF0aGVyIHRoYW4gZml4aW5nIGl0LiBXaHkKZG9lcyBhbHRwMm1fYWN0aXZlIGdldCBzZXQgdG8g
dHJ1ZSBiZWZvcmUgYWN0dWFsbHkgaGF2aW5nIHNldCB1cApldmVyeXRoaW5nPyBTaG91bGRuJ3Qg
aXQgZ2V0IGNsZWFyZWQgZWFybHksIGJ1dCBzZXQgbGF0ZT8KCkphbgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
