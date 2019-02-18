From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 V5 2/2] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Mon, 18 Feb 2019 04:19:24 -0700
Message-ID: <5C6A94BC0200007800217899@prv1-mh.provo.novell.com>
References: <1550245284-9321-1-git-send-email-rcojocaru@bitdefender.com>
 <1550245284-9321-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xuKF=QZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gvgxS-0008GW-1u
 for xen-devel@lists.xenproject.org; Mon, 18 Feb 2019 11:19:34 +0000
In-Reply-To: <1550245284-9321-2-git-send-email-rcojocaru@bitdefender.com>
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAyLjE5IGF0IDE2OjQxLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gSFZNT1BfYWx0cDJtX3NldF9kb21haW5fc3RhdGUgZG9lcyBub3QgZG9tYWluX3BhdXNl
KCksIHByZXN1bWFibHkKPiBvbiBwdXJwb3NlIChhcyBpdCB3YXMgb3JpZ2luYWxseSBzdXBwb3Nl
ZCB0byBjYXRlciB0byBhIGluLWd1ZXN0Cj4gYWdlbnQsIGFuZCBhIGRvbWFpbiBwYXVzaW5nIGl0
c2VsZiBpcyBub3QgYSBnb29kIGlkZWEpLgo+IAo+IFRoaXMgY2FuIGxlYWQgdG8gZG9tYWluIGNy
YXNoZXMgaW4gdGhlIHZteF92bWV4aXRfaGFuZGxlcigpIGNvZGUKPiB0aGF0IGNoZWNrcyBpZiB0
aGUgZ3Vlc3QgaGFzIHRoZSBhYmlsaXR5IHRvIHN3aXRjaCBFUFRQIHdpdGhvdXQgYW4KPiBleGl0
LiBUaGF0IGNvZGUgY2FuIF9fdm1yZWFkKCkgdGhlIGhvc3QgcDJtJ3MgRVBUX1BPSU5URVIKPiAo
YmVmb3JlIEhWTU9QX2FsdHAybV9zZXRfZG9tYWluX3N0YXRlICJmb3JfZWFjaF92Y3B1KCkiIGhh
cyBhCj4gY2hhbmNlIHRvIHJ1biBhbHRwMm1fdmNwdV9pbml0aWFsaXNlKCksIGJ1dCBhZnRlcgo+
IGQtPmFyY2guYWx0cDJtX2FjdGl2ZSBpcyBzZXQpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhenZh
biBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4KCkFja2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBbHNvIEkgYXNzdW1lIHlvdSBtZWFuIHRvIGhhdmUg
dGhlIHNhbWUganVzdGlmaWNhdGlvbiBoZXJlIGFzCnlvdSBoYXZlIGluIHBhdGNoIDEsIGFzIHRv
IDQuMTIgaW5jbHVzaW9uLiBBbmQgZm9yIHRoaXMgcmVhc29uCkknbSBhbHNvIENjLWluZyBKw7xy
Z2VuIGFnYWluLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
