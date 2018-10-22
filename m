From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] arm: fix Dom0 creation after ef72c93df9
Date: Mon, 22 Oct 2018 14:42:07 +0100
Message-ID: <e769b46c-bdfa-ee9f-d64c-cacb5c4ba1eb@arm.com>
References: <20181022134021.30090-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=k625=nc=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1gEaTE-0006mW-Ff
 for xen-devel@lists.xenproject.org; Mon, 22 Oct 2018 13:42:12 +0000
In-Reply-To: <20181022134021.30090-1-wei.liu2@citrix.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

SGkgV2VpLAoKT24gMTAvMjIvMTggMjo0MCBQTSwgV2VpIExpdSB3cm90ZToKPiBBUk0gRG9tMCBj
cmVhdGlvbiB3YXMgYnJva2VuIGJ5IHRoZSBzYWlkIGNvbW1pdCBiZWNhdXNlIEFSTSBuZWl0aGVy
Cj4gcHJvdmlkZWQgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0IG5vciBoYWQgQ09ORklHX1BWIHNl
dC4KPiAKPiBTZXQgWEVOX0RPTUNUTF9DREZfaHZtX2d1ZXN0IGZsYWcgZm9yIEFSTSBEb20wIHRv
IGZpeCB0aGUgaXNzdWUuIEFsc28KPiBzZXQgWEVOX0RPTUNUTF9DREZfaGFwIHdoaWxlIGF0IGl0
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpBY2tl
ZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApK
dWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
