From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 3/4] x86: reduce code duplication in
 guest_remove_page()
Date: Tue, 20 Nov 2018 17:06:58 +0000
Message-ID: <8054a1ab-8065-4502-16c3-6d05bbf48d88@citrix.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5BF4340B02000078001FE273@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwHA=N7=citrix.com=prvs=8552da0fd=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gP9a7-0006Oo-G3
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 17:12:59 +0000
In-Reply-To: <5BF4340B02000078001FE273@prv1-mh.provo.novell.com>
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

T24gMjAvMTEvMjAxOCAxNjoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gUXVpdGUgYSBiaXQgb2Yg
ZHVwbGljYXRlIGNvZGUgaGFzIGFjY3VtdWxhdGVkIG9uIHRoZSAicGFnaW5nIiB0eXBlcwo+IHNw
ZWNpYWwgY2FzZSBwYXRoLiBSZS11c2Ugd2hhdCBjYW4gYmUgcmUtdXNlZCBmcm9tIHRoZSBjb21t
b24gcGF0aC4KPgo+IFNpbmNlIGl0IG5lZWRzIHRvdWNoaW5nIGFueXdheSwgc2xpZ2h0bHkgcmUt
Zm9ybWF0IGFuZCBleHRlbmQgdGhlCj4gZ2RwcmludGsoKSBvbiB0aGUgY29tbW9uIHBhdGggYXMg
d2VsbC4KPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CkRvZXNuJ3QgdGhpcyBuZWdhdGUgdGhlIHByZXZpb3VzIHBhdGNoP8KgIEknbSBhZnJhaWQgdGhh
dCBJJ20gcmF0aGVyCmNvbmZ1c2VkLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
