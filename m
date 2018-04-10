From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH 1/4] xen: xen-pciback: Replace GFP_ATOMIC
 with GFP_KERNEL in pcistub_probe
Date: Tue, 10 Apr 2018 10:27:29 -0400
Message-ID: <b07f0a27-f09d-1617-ab9e-ebbc761cb3a4@oracle.com>
References: <1523286216-26345-1-git-send-email-baijiaju1990@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=nhop=g7=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1f5uDO-0007Jc-B1
 for xen-devel@lists.xenproject.org; Tue, 10 Apr 2018 14:25:42 +0000
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
IEJhaSA8YmFpamlhanUxOTkwQGdtYWlsLmNvbT4KCldoYXQgYWJvdXQgdXNlIG9mIEdGUF9BVE9N
SUMgaW4gcGNpc3R1Yl9yZWdfYWRkKCk/CgotYm9yaXMKCj4gLS0tCj4gIGRyaXZlcnMveGVuL3hl
bi1wY2liYWNrL3BjaV9zdHViLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMveGVuL3hlbi1wY2li
YWNrL3BjaV9zdHViLmMgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9wY2lfc3R1Yi5jCj4gaW5k
ZXggOWU0ODBmZC4uOTVlNmRkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFj
ay9wY2lfc3R1Yi5jCj4gKysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svcGNpX3N0dWIuYwo+
IEBAIC01NzcsNyArNTc3LDcgQEAgc3RhdGljIGludCBwY2lzdHViX3Byb2JlKHN0cnVjdCBwY2lf
ZGV2ICpkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICppZCkKPiAgCQl9Cj4gIAo+ICAJ
CWlmICghbWF0Y2gpIHsKPiAtCQkJcGNpX2Rldl9pZCA9IGttYWxsb2Moc2l6ZW9mKCpwY2lfZGV2
X2lkKSwgR0ZQX0FUT01JQyk7Cj4gKwkJCXBjaV9kZXZfaWQgPSBrbWFsbG9jKHNpemVvZigqcGNp
X2Rldl9pZCksIEdGUF9LRVJORUwpOwo+ICAJCQlpZiAoIXBjaV9kZXZfaWQpIHsKPiAgCQkJCWVy
ciA9IC1FTk9NRU07Cj4gIAkJCQlnb3RvIG91dDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
