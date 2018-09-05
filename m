From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v1] xen: avoid crash in disable_hotplug_cpu
Date: Wed, 5 Sep 2018 14:04:01 +0200
Message-ID: <92e9c7f0-598d-b20c-4847-320e01f6ec06__1845.39294937185$1536148974$gmane$org@suse.com>
References: <20180905104039.13512-1-olaf@aepfle.de>
 <7630aac8-8588-6e42-0807-f98b66ce37b5@suse.com>
 <20180905135019.56b303da.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=evre=lt=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fxWXX-0005LF-KN
 for xen-devel@lists.xenproject.org; Wed, 05 Sep 2018 12:04:07 +0000
In-Reply-To: <20180905135019.56b303da.olaf@aepfle.de>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, open list <linux-kernel@vger.kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDkvMTggMTM6NTAsIE9sYWYgSGVyaW5nIHdyb3RlOgo+IEFtIFdlZCwgNSBTZXAgMjAx
OCAxMjo1NTo1OCArMDIwMAo+IHNjaHJpZWIgSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PjoKPiAKPj4gdGhlIGxhc3QgY3B1Cj4gCj4gV2hpY2ggb25lIGlzIHRoZSAibGFzdCIgb25lPyBJ
IG1lYW4sIGlmIGNwdSMwIG5ldmVyIGNhbiBiZSBvZmZsaW5lZCB0aGFuIHBlcmhhcHMgdGhlIGNv
ZGUgc2hvdWxkIGNoZWNrIGZvciBqdXN0IHRoYXQgYW5kIHJldHVybiBlYXJseS4gQnV0IGlmIGNw
dSMwIGNvdWxkIGJlIGRpc2FibGVkIHdoaWxlIHNvbWUgb3RoZXIgY3B1IGlzIHRoZSByZW1haW5p
bmcgY3B1LCBzb21lIG90aGVyIGNoZWNrIGlzIG5lZWRlZCBJIHRoaW5rLgoKbnVtX29ubGluZV9j
cHVzKCkgPT0gMQoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
