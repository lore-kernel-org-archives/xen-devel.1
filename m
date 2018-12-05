From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/2] x86: reduce code duplication in
 guest_remove_page()
Date: Wed, 5 Dec 2018 20:03:46 +0000
Message-ID: <af63db1c-1f20-24da-c8cd-9c04ad818b60@citrix.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5C07F95A0200007800203354@prv1-mh.provo.novell.com>
 <5C07F9FE020000780020336A@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9KzC=OO=citrix.com=prvs=870f008d4=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gUdOf-00006G-FS
 for xen-devel@lists.xenproject.org; Wed, 05 Dec 2018 20:03:49 +0000
In-Reply-To: <5C07F9FE020000780020336A@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMTIvMjAxOCAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUXVpdGUgYSBiaXQgb2Yg
ZHVwbGljYXRlIGNvZGUgaGFzIGFjY3VtdWxhdGVkIG9uIHRoZSAicGFnaW5nIiB0eXBlcwo+IHNw
ZWNpYWwgY2FzZSBwYXRoLiBSZS11c2Ugd2hhdCBjYW4gYmUgcmUtdXNlZCBmcm9tIHRoZSBjb21t
b24gcGF0aC4KPgo+IFNpbmNlIGl0IG5lZWRzIHRvdWNoaW5nIGFueXdheSwgc2xpZ2h0bHkgcmUt
Zm9ybWF0IGFuZCBleHRlbmQgdGhlCj4gZ2RwcmludGsoKSBvbiB0aGUgY29tbW9uIHBhdGggYXMg
d2VsbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
