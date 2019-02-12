From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 V4] x86/altp2m: fix
 HVMOP_altp2m_set_domain_state race
Date: Tue, 12 Feb 2019 05:57:09 -0700
Message-ID: <5C62C2A50200007800215E39@prv1-mh.provo.novell.com>
References: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SUj=QT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gtXch-00061F-69
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 12:57:15 +0000
In-Reply-To: <1549971734-12795-1-git-send-email-rcojocaru@bitdefender.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEyLjAyLjE5IGF0IDEyOjQyLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gSFZNT1BfYWx0cDJtX3NldF9kb21haW5fc3RhdGUgZG9lcyBub3QgZG9tYWluX3BhdXNl
KCksIHByZXN1bWFibHkKPiBvbiBwdXJwb3NlIChhcyBpdCB3YXMgb3JpZ2luYWxseSBzdXBwb3Nl
ZCB0byBjYXRlciB0byBhIGluLWd1ZXN0Cj4gYWdlbnQsIGFuZCBhIGRvbWFpbiBwYXVzaW5nIGl0
c2VsZiBpcyBub3QgYSBnb29kIGlkZWEpLgo+IAo+IFRoaXMgY2FuIGxlYWQgdG8gZG9tYWluIGNy
YXNoZXMgaW4gdGhlIHZteF92bWV4aXRfaGFuZGxlcigpIGNvZGUKPiB0aGF0IGNoZWNrcyBpZiB0
aGUgZ3Vlc3QgaGFzIHRoZSBhYmlsaXR5IHRvIHN3aXRjaCBFUFRQIHdpdGhvdXQgYW4KPiBleGl0
LiBUaGF0IGNvZGUgY2FuIF9fdm1yZWFkKCkgdGhlIGhvc3QgcDJtJ3MgRVBUX1BPSU5URVIKPiAo
YmVmb3JlIEhWTU9QX2FsdHAybV9zZXRfZG9tYWluX3N0YXRlICJmb3JfZWFjaF92Y3B1KCkiIGhh
cyBhCj4gY2hhbmNlIHRvIHJ1biBhbHRwMm1fdmNwdV9pbml0aWFsaXNlKCksIGJ1dCBhZnRlcgo+
IGQtPmFyY2guYWx0cDJtX2FjdGl2ZSBpcyBzZXQpLgo+IAo+IFRoaXMgcGF0Y2ggcmVvcmdhbml6
ZXMgdGhlIGNvZGUgc28gdGhhdCBkLT5hcmNoLmFsdHAybV9hY3RpdmUKPiBpcyBzZXQgdG8gdHJ1
ZSBvbmx5IGFmdGVyIGFsbCB0aGUgaW5pdCB3b3JrIGhhcyBiZWVuIGRvbmUsIGFuZAo+IHRvIGZh
bHNlIGJlZm9yZSB0aGUgdW5pbml0IHdvcmsgYmVnaW5zLiBUaGlzIHJlcXVpcmVkIGFkZGluZwo+
IGEgbmV3IGJvb2wgcGFyYW1ldGVyIGFsdHAybV92Y3B1X3VwZGF0ZV9wMm0oKSwgd2hpY2ggcmVs
aWVkCj4gb24gZC0+YXJjaC5hbHRwMm1fYWN0aXZlIGJlaW5nIHNldCBiZWZvcmUgaXQncyBjYWxs
ZWQuCj4gCj4gV2hpbGUgYXQgaXQsIEkndmUgY2hhbmdlZCBhIGNvdXBsZSBvZiBib29sX3QncyB0
byBib29sJ3MuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVA
Yml0ZGVmZW5kZXIuY29tPgoKRlRSIC0gdGhpcyBsb29rcyBva2F5IHRvIG1lIG5vdy4gQnV0IEkg
ZG9uJ3QgZmVlbCBxdWFsaWZpZWQgdG8KZ2l2ZSBhbiBSLWIsIHNvIGp1c3QgZm9yIHRoZSBwYXJ0
cyB3aGVyZSBpdCdzIGFwcGxpY2FibGUKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
