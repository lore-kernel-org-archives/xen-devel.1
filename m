From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH 0/5] x86: more power-efficient CPU parking
Date: Wed, 03 Apr 2019 04:12:26 -0600
Message-ID: <5CA4870A0200007800224351@prv1-mh.provo.novell.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC1F1@prv1-mh.provo.novell.com>
 <5B61C21202000078001F8805@prv1-mh.provo.novell.com>
 <5B61C21202000000000FC6BD@prv1-mh.provo.novell.com>
 <5B61C212020000780020B6D8@prv1-mh.provo.novell.com>
 <5B61C21202000000000FF27E@prv1-mh.provo.novell.com>
 <5B61C2120200007800224310@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=57ha=SF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hBcsh-00006F-EM
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2019 10:12:31 +0000
In-Reply-To: <5B61C2120200007800224310@prv1-mh.provo.novell.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDE2OjIyLCAgd3JvdGU6Cj4gV2hlbiBwdXR0aW5nIENQVXMgdG8g
c2xlZXAgcGVybWFuZW50bHksIHdlIHNob3VsZCB0cnkgdG8gcHV0IHRoZW0gaW50bwo+IHRoZSBt
b3N0IHBvd2VyIGNvbnNlcnZpbmcgc3RhdGUgcG9zc2libGUuIEZvciBub3cgaXQgaXMgdW5jbGVh
ciB3aGV0aGVyLAo+IGVzcGVjaWFsbHkgaW4gYSBkZWVwIEMtc3RhdGUsIHRoZSBQLXN0YXRlIGFs
c28gbWF0dGVycywgc28gdGhpcyBzZXJpZXMgb25seQo+IGFycmFuZ2VzIGZvciB0aGUgQy1zdGF0
ZSBzaWRlIG9mIHRoaW5ncyAocGx1cyBzb21lIGNsZWFudXApLgo+IAo+IDE6IHg4Ni9jcHVpZGxl
OiByZXBsYWNlIGEgcG9pbnRsZXNzIE5VTEwgY2hlY2sKPiAyOiB4ODYvaWRsZTogcmUtYXJyYW5n
ZSBkZWFkLWlkbGUgaGFuZGxpbmcKPiAzOiB4ODYvY3B1aWRsZTogcHVzaCBwYXJrZWQgQ1BVcyBp
bnRvIGRlZXBlciBzbGVlcCBzdGF0ZXMgd2hlbiBwb3NzaWJsZQo+IDQ6IHg4Ni9jcHVpZGxlOiBj
bGVhbiB1cCBDeCBkdW1waW5nCj4gNTogeDg2OiBwbGFjZSBub24tcGFya2VkIENQVXMgaW50byB3
YWl0LWZvci1TSVBJIHN0YXRlIGFmdGVyIG9mZmxpbmluZwoKU28gcGF0Y2ggNSBpcyB1bmRlcnN0
YW5kYWJseSBjb250cm92ZXJzaWFsLCBhbmQgSSdtIGV4cGxpY2l0bHkKZXhjbHVkaW5nIGl0IGZy
b20gdGhlIHBpbmcuIFBhdGNoIDEgaGFzIGdvbmUgaW4gbG9uZyBhZ28gYW5kCnBhdGNoIDQgaGFz
IGJlZW4gYWNrZWQuIFdoaWxlIHRoZXJlIHdhcyBzb21lIGZlZWRiYWNrIG9uCjIgKGFsYmVpdCBz
dGFsbGVkIHRoZW4gYWZ0ZXIgbXkgcmVwbHkpLCBJIGRvbid0IHRoaW5rIEkndmUgaGFkIGFueQpz
dWJzdGFudGlhbCBmZWVkYmFjayBvbiAzIHRob3VnaCwgeWV0IF90aGV5XyBhcmUgc3VwcG9zZWQg
dG8KcHJvdmlkZSB0aGUgbWFpbiBpbXByb3ZlbWVudCBoZXJlLiBQYXRjaCA1IHJlYWxseSB3YXMg
bWVhbnQKdG8gYmUgbW9yZSBvcHRpb25hbCB0aGFuIEkgaGFkIGV4cHJlc3NlZCwgaGVuY2UgaXRz
IHBsYWNlbWVudApldmVuIGFmdGVyIHRoZSBwdXJlIGNsZWFudXAgcGF0Y2ggNC4KClRoZSBzZXJp
ZXMgaGFzIGJlZW4gcGVuZGluZyBmb3Igd2VsbCBvdmVyIGhhbGYgYSB5ZWFyIG5vdywKeWV0IG90
aGVyIHRoYW4gZm9yIHRoZSBpbmRpcmVjdCBjYWxsIHBhdGNoaW5nIHNlcmllcyAod2hlcmUgaXQK
YWxyZWFkeSBkb2Vzbid0IGZlZWwgcmVhbGx5IHdlbGwpIEkgZG9uJ3Qgd2FudCB0byBwcm9wb3Nl
CnNpbXBseSBjb21taXR0aW5nIHRoaXMgaW4gdGhlIGFic2VuY2VzIG9mIHN1ZmZpY2llbnQgZmVl
ZGJhY2suCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
