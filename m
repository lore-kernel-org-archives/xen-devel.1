From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 0/3] x86/mm-locks: add a bias to control
 domain lock levels
Date: Fri, 21 Dec 2018 02:50:26 -0700
Message-ID: <5C1CB76202000078002086F9@prv1-mh.provo.novell.com>
References: <20181221094105.83881-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hr/k=O6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gaHRu-0006BQ-LU
 for xen-devel@lists.xenproject.org; Fri, 21 Dec 2018 09:50:30 +0000
In-Reply-To: <20181221094105.83881-1-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjEyLjE4IGF0IDEwOjQxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEhlbGxvLAo+IAo+IFRoZSBmb2xsb3dpbmcgc2VyaWVzIGF0dGVtcHRzIHRvIGZpeCBhIG1tIGxv
Y2sgbGV2ZWwgaXNzdWUgdGhhdCBwcmV2ZW50cwo+IHVzaW5nIHBhZ2luZ19sb2dfZGlydHlfb3Ag
ZnJvbSBhIHBhZ2luZyBEb20wIChsaWtlIGEgUFZIIERvbTApLiBUaGUKPiBkaXNjdXNzaW9uIHRo
YXQgbGVhZCB0byB0aGlzIHNlcmllcyBjYW4gYmUgZm91bmQgYXQ6Cj4gCj4gaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE4LTEyL21zZzAxMTk3
Lmh0bWwgCj4gCj4gUm9nZXIgUGF1IE1vbm5lICgzKToKPiAgIHg4Ni9tbS1sb2NrczogcmVtb3Zl
IHRyYWlsaW5nIHdoaXRlc3BhY2UKPiAgIHg4Ni9tbS1sb2NrczogY29udmVydCBzb21lIG1hY3Jv
cyB0byBpbmxpbmUgZnVuY3Rpb25zCgpZb3UgY291bGQgaGF2ZSBjaGVja2VkIHRoZSB0cmVlIGJl
Zm9yZSBzZW5kaW5nIC0gSSd2ZSBjb21taXR0ZWQKdGhlc2UgdHdvIGluIHRoZSBtb3JuaW5nLgoK
SmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
