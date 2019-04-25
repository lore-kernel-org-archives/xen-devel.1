From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 7/7] xen/arm: mm: Flush the TLBs even if a
 mapping failed in create_xen_entries
Date: Thu, 25 Apr 2019 21:03:11 +0300
Message-ID: <24101c05-5613-6819-af3c-82937ad319df@gmail.com>
References: <20190417175815.16905-1-julien.grall@arm.com>
 <20190417175815.16905-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+mKo=S3=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hJiiJ-0006g2-Sa
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 18:03:15 +0000
Received: by mail-lj1-x243.google.com with SMTP id i186so451802lji.9
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2019 11:03:14 -0700 (PDT)
In-Reply-To: <20190417175815.16905-8-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxNy4wNC4xOSAyMDo1OCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IGNyZWF0ZV94ZW5fZW50cmllcyB3aWxsIG9ubHkgZmx1c2ggdGhlIFRMQnMgaWYgdGhlIGZ1bGwK
PiByYW5nZSBoYXMgc3VjY2Vzc2Z1bGx5IGJlZW4gdXBkYXRlZC4gVGhpcyBtYXkgbGVhZCB0byBs
ZWF2ZSB1bndhbnRlZAo+IGVudHJpZXMgaW4gdGhlIFRMQnMgaWYgd2UgZmFpbCB0byB1cGRhdGUg
c29tZSBlbnRyaWVzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2Fu
aXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
