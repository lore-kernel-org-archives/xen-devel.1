From: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 6/6] drop "domain_" prefix from struct
 domain's dirty CPU mask
Date: Fri, 19 Jan 2018 18:01:43 +0000
Message-ID: <20fddef7-402c-fbef-e50d-af4baa9efffa@citrix.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6225C902000078001A07D8@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=xqzm=eo=citrix.com=prvs=55088e0a4=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1ecb2D-0001Di-0J
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2018 18:05:01 +0000
In-Reply-To: <5A6225C902000078001A07D8@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMTkvMjAxOCAwNDowNyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSXQgYmVpbmcgYSBm
aWVsZCBvZiBzdHJ1Y3QgZG9tYWluIGlzIHN1ZmZpY2llbnQgdG8gcmVjb2duaXplIGl0cwo+IHB1
cnBvc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKUmV2aWV3ZWQtYnk6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
