From: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [Qemu-block] [PATCH] xen-block: Replace
 qdict_put_obj() by qdict_put() where appropriate
Date: Thu, 14 Mar 2019 15:38:08 +0100
Message-ID: <20190314143808.GB17866@linux.fritz.box>
References: <20190313174433.12966-1-armbru@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5+gI=RR=redhat.com=kwolf@srs-us1.protection.inumbo.net>)
 id 1h4RUt-000534-3v
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:38:15 +0000
Content-Disposition: inline
In-Reply-To: <20190313174433.12966-1-armbru@redhat.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Markus Armbruster <armbru@redhat.com>
Cc: sstabellini@kernel.org, qemu-block@nongnu.org, qemu-devel@nongnu.org, paul.durrant@citrix.com, anthony.perard@citrix.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

QW0gMTMuMDMuMjAxOSB1bSAxODo0NCBoYXQgTWFya3VzIEFybWJydXN0ZXIgZ2VzY2hyaWViZW46
Cj4gUGF0Y2ggY3JlYXRlZCBtZWNoYW5pY2FsbHkgYnkgcmVydW5uaW5nOgo+IAo+ICAgICAkIHNw
YXRjaCAtLXNwLWZpbGUgc2NyaXB0cy9jb2NjaW5lbGxlL3FvYmplY3QuY29jY2kgXAo+ICAgICAg
ICAgICAgICAtLW1hY3JvLWZpbGUgc2NyaXB0cy9jb2NjaS1tYWNyby1maWxlLmggXAo+ICAgICAg
ICAgICAgICAtLWRpciBody9ibG9jayAtLWluLXBsYWNlCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFy
a3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPgoKUmV2aWV3ZWQtYnk6IEtldmluIFdv
bGYgPGt3b2xmQHJlZGhhdC5jb20+CgpXaGljaCB0cmVlIHNob3VsZCB0aGlzIGdvIHRocm91Z2g/
IFRoZSBYZW4gb25lPwoKS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
