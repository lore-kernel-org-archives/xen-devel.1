From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH 4/6] xen-netfront: add range check for Tx
 response id
Date: Tue, 1 May 2018 11:05:16 +0100
Message-ID: <20180501100516.vjhop37we2rcrvyo__28445.4418848783$1525169048$gmane$org@citrix.com>
References: <cover.7ee732ab822b728ec486a3118ec12e9c06f0f325.1525122026.git-series.marmarek@invisiblethingslab.com>
 <960c6d6300fd3450ae9fb1de1c412bef7dbae992.1525122026.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bnqk=hu=citrix.com=prvs=6529cf07e=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fDS9x-000286-9e
 for xen-devel@lists.xenproject.org; Tue, 01 May 2018 10:05:21 +0000
Content-Disposition: inline
In-Reply-To: <960c6d6300fd3450ae9fb1de1c412bef7dbae992.1525122026.git-series.marmarek@invisiblethingslab.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, "open
 list:NETWORKING DRIVERS" <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBBcHIgMzAsIDIwMTggYXQgMTE6MDE6NDhQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IFR4IHJlc3BvbnNlIElEIGlzIGZldGNoZWQgZnJvbSBzaGFy
ZWQgcGFnZSwgc28gbWFrZSBzdXJlIGl0IGlzIHNhbmUKPiBiZWZvcmUgdXNpbmcgaXQgYXMgYW4g
YXJyYXkgaW5kZXguCj4gCj4gQ0M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2Zm
LWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5n
c2xhYi5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL25l
dC94ZW4tbmV0ZnJvbnQuYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCj4gaW5kZXggOTM0
YjhhNC4uNTVjOWIyNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL25ldC94ZW4tbmV0ZnJvbnQuYwo+
ICsrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRmcm9udC5jCj4gQEAgLTM5NCw2ICszOTQsNyBAQCBz
dGF0aWMgdm9pZCB4ZW5uZXRfdHhfYnVmX2djKHN0cnVjdCBuZXRmcm9udF9xdWV1ZSAqcXVldWUp
Cj4gIAkJCQljb250aW51ZTsKPiAgCj4gIAkJCWlkICA9IHR4cnNwLmlkOwo+ICsJCQlCVUdfT04o
aWQgPj0gTkVUX1RYX1JJTkdfU0laRSk7CgpJdCBpcyBiZXR0ZXIgdG8gdXNlIEFSUkFZX1NJWkUg
aGVyZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
