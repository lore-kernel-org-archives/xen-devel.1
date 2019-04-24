From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xenbus: drop useless LIST_HEAD in
 xenbus_write_watch() and xenbus_file_write()
Date: Wed, 24 Apr 2019 14:50:04 -0400
Message-ID: <f6ceb91a-394f-21a1-472e-8fb53d2f7cec__15812.6997923077$1556131896$gmane$org@oracle.com>
References: <20190416040651.186468-1-maowenan@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=E0+D=S2=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1hJMyf-00011Y-DU
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2019 18:50:41 +0000
In-Reply-To: <20190416040651.186468-1-maowenan@huawei.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Mao Wenan <maowenan@huawei.com>, jgross@suse.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gNC8xNi8xOSAxMjowNiBBTSwgTWFvIFdlbmFuIHdyb3RlOgo+IERyb3AgTElTVF9IRUFEIHdo
ZXJlIHRoZSB2YXJpYWJsZSBpdCBkZWNsYXJlcyBpcyBuZXZlciB1c2VkLgo+Cj4gVGhlIGRlY2xh
cmF0aW9ucyB3ZXJlIGludHJvZHVjZWQgd2l0aCB0aGUgZmlsZSwgYnV0IHRoZSBkZWNsYXJlZAo+
IHZhcmlhYmxlcyB3ZXJlIG5vdCB1c2VkLgo+Cj4gRml4ZXM6IDExMDdiYTg4NWU0NjkoInhlbjog
YWRkIHhlbmZzIHRvIGFsbG93IHVzZXJtb2RlIDwtPiBYZW4gaW50ZXJhY3Rpb24iKQo+IFNpZ25l
ZC1vZmYtYnk6IE1hbyBXZW5hbiA8bWFvd2VuYW5AaHVhd2VpLmNvbT4KCgpBcHBsaWVkIHRvIGZv
ci1saW51cy01LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
