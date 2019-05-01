From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
Date: Wed, 1 May 2019 10:22:17 +0100
Message-ID: <c2e2e752-ae93-f378-2f84-2f9833b13c32@arm.com>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/fo=TB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLlRV-0005df-V2
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 09:22:21 +0000
In-Reply-To: <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, JBeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAzMC8wNC8yMDE5IDIyOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gTm93
IHRoYXQgbWFwX21taW9fcmVnaW9ucyB0YWtlcyBhIHAybXQgcGFyYW1ldGVyLCB0aGVyZSBpcyBu
byBuZWVkIHRvCj4ga2VlcCAibW1pbyIgaW4gdGhlIG5hbWUuIFRoZSBwMm10IHBhcmFtZXRlciBk
b2VzIGEgYmV0dGVyIGpvYiBhdAo+IGV4cHJlc3Npbmcgd2hhdCB0aGUgbWFwcGluZyBpcyBhYm91
dC4gTGV0J3Mgc2F2ZSB0aGUgZW52aXJvbm1lbnQgNQo+IGNoYXJhY3RlcnMgYXQgYSB0aW1lLgoK
QXQgbGVhc3Qgb24gQXJtLCB3aGF0J3MgdGhlIGRpZmZlcmVuY2Ugd2l0aCBndWVzdF9waHlzbWFw
X2FkZF9lbnRyeSBhbmQgdGhpcyAKZnVuY3Rpb24gbm93PyBPbiB4ODYsIGhvdyBkb2VzIHRoZSB1
c2VyIG5vdyB3aGljaCBmdW5jdGlvbiB0byB1c2U/CgpXaGF0IGFjdHVhbGx5IHRlbGwgdGhlIHVz
ZXJzIGl0IHNob3VsZCBub3QgdXNlIHRoaXMgZnVuY3Rpb24gZm9yIFJBTT8KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
