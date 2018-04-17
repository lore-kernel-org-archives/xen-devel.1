From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/4] xen: xen-pciback: Replace GFP_ATOMIC
 with GFP_KERNEL in pcistub_probe
Date: Tue, 17 Apr 2018 11:09:31 -0400
Message-ID: <0f8ebdb1-7450-dcdb-380a-a223bdd212e7__48382.8925797299$1523977593$gmane$org@oracle.com>
References: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=beq8=hg=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f8SCv-000718-82
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 15:07:45 +0000
In-Reply-To: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jia-Ju Bai <baijiaju1990@gmail.com>, jgross@suse.com, gregkh@linuxfoundation.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDQvMDkvMjAxOCAxMTowMyBBTSwgSmlhLUp1IEJhaSB3cm90ZToKPiBwY2lzdHViX3Byb2Jl
KCkgaXMgbmV2ZXIgY2FsbGVkIGluIGF0b21pYyBjb250ZXh0Lgo+IFRoaXMgZnVuY3Rpb24gaXMg
b25seSBzZXQgYXMgIi5wcm9iZSIgaW4gc3RydWN0IHBjaV9kcml2ZXIuCj4KPiBEZXNwaXRlIG5l
dmVyIGdldHRpbmcgY2FsbGVkIGZyb20gYXRvbWljIGNvbnRleHQsCj4gcGNpc3R1Yl9wcm9iZSgp
IGNhbGxzIGttYWxsb2MoKSB3aXRoIEdGUF9BVE9NSUMsCj4gd2hpY2ggZG9lcyBub3Qgc2xlZXAg
Zm9yIGFsbG9jYXRpb24uCj4gR0ZQX0FUT01JQyBpcyBub3QgbmVjZXNzYXJ5IGFuZCBjYW4gYmUg
cmVwbGFjZWQgd2l0aCBHRlBfS0VSTkVMLAo+IHdoaWNoIGNhbiBzbGVlcCBhbmQgaW1wcm92ZSB0
aGUgcG9zc2liaWxpdHkgb2Ygc3VjZXNzZnVsIGFsbG9jYXRpb24uCj4KPiBUaGlzIGlzIGZvdW5k
IGJ5IGEgc3RhdGljIGFuYWx5c2lzIHRvb2wgbmFtZWQgRENOUyB3cml0dGVuIGJ5IG15c2VsZi4K
PiBBbmQgSSBhbHNvIG1hbnVhbGx5IGNoZWNrIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSmlhLUp1
IEJhaSA8YmFpamlhanUxOTkwQGdtYWlsLmNvbT4KPgoKCkFwcGxpZWQgdGhlIHNlcmllcyBhbmQg
dGhlIGV4dHJhIHBhdGNoIHRvIGZvci1saW51cy00LjE3CgotYm9yaXMKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
