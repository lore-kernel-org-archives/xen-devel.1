From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH 0/5] x86: more power-efficient CPU parking
Date: Wed, 29 Aug 2018 01:08:43 -0600
Message-ID: <5B86467B02000078001E2D9E@prv1-mh.provo.novell.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuuar-0003oW-MQ
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 07:08:45 +0000
In-Reply-To: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
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
YWl0LWZvci1TSVBJIHN0YXRlIGFmdGVyIG9mZmxpbmluZwo+IAo+IEphbgo+IAo+IAoKCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
