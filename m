From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH V3 1/3] x86/altp2m: propagate ept.ad changes
 to all active altp2ms
Date: Tue, 30 Oct 2018 10:14:03 -0600
Message-ID: <5BD8834B02000078001F66B2@prv1-mh.provo.novell.com>
References: <1540816837-8936-1-git-send-email-rcojocaru@bitdefender.com>
 <1540816837-8936-2-git-send-email-rcojocaru@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=kgbc=nk=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHWee-0001ou-Ao
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 16:14:08 +0000
In-Reply-To: <1540816837-8936-2-git-send-email-rcojocaru@bitdefender.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjEwLjE4IGF0IDEzOjQwLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gVGhpcyBwYXRjaCBpcyBhIHByZS1yZXF1aXNpdGUgZm9yIGZpeGluZyB0aGUgbG9nZGly
dHkgVkdBIGlzc3VlCj4gKGRpc3BsYXkgZnJlZXplcyB3aGVuIHN3aXRjaGluZyB0byBhIG5ldyBh
bHRwMm0gdmlldyBlYXJseSBpbiBhCj4gZG9tYWluJ3MgbGlmZXRpbWUpLCBidXQgc2VudCBzZXBh
cmF0ZWx5IGZvciBlYXNpZXIgcmV2aWV3Lgo+IFRoZSBuZXcgZXB0X3NldF9hZF9zeW5jKCkgZnVu
Y3Rpb24gaGFzIGJlZW4gYWRkZWQgdG8gdXBkYXRlIGFsbAo+IGFjdGl2ZSBhbHRwMm1zJyBlcHQu
YWQuIE5ldyBhbHRwMm1zIHdpbGwgaW5oZXJpdCB0aGUgaG9zdHAybSdzCj4gZXB0LmFkIHZhbHVl
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhenZhbiBDb2pvY2FydSA8cmNvam9jYXJ1QGJpdGRlZmVu
ZGVyLmNvbT4KPiBTdWdnZXN0ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0
cml4LmNvbT4KCkknbSBva2F5IHdpdGggdGhlIGNvZGUgY2hhbmdlcyBub3csIGJ1dCBJIHRoaW5r
IHRoZSBhbHRlcmVkIGxvY2tpbmcKd291bGQgZGVzZXJ2ZSBhIHNlbnRlbmNlIGluIHRoZSBkZXNj
cmlwdGlvbi4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
