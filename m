From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] xen/hvm: correct reporting of modified
 memory under physmap during migration
Date: Wed, 2 May 2018 16:48:48 +0100
Message-ID: <20180502154848.GC14376@perard>
References: <1524664007-12687-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=s6pm=hv=citrix.com=prvs=653480f21=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1fDtzw-00031k-5J
 for xen-devel@lists.xenproject.org; Wed, 02 May 2018 15:48:52 +0000
Content-Disposition: inline
In-Reply-To: <1524664007-12687-1-git-send-email-igor.druzhinin@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, qemu-devel@nongnu.org, paul.durrant@citrix.com, pbonzini@redhat.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBBcHIgMjUsIDIwMTggYXQgMDI6NDY6NDdQTSArMDEwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gV2hlbiBnbG9iYWxfbG9nX2RpcnR5IGlzIGVuYWJsZWQgVlJBTSBtb2RpZmljYXRp
b24gdHJhY2tpbmcgbmV2ZXIKPiB3b3JrZWQgY29ycmVjdGx5LiBUaGUgYWRkcmVzcyB0aGF0IGlz
IHBhc3NlZCB0byB4ZW5faHZtX21vZGlmaWVkX21lbW9yeSgpCj4gaXMgbm90IHRoZSBlZmZlY3Rp
dmUgUEZOIGJ1dCBSQU0gYmxvY2sgYWRkcmVzcyB3aGljaCBpcyBub3QgdGhlIHNhbWUKPiBmb3Ig
VlJBTS4KPiAKPiBXZSBuZWVkIHRvIG1ha2UgYSB0cmFuc2xhdGlvbiBmb3IgdGhpcyBhZGRyZXNz
IGludG8gUEZOIHVzaW5nCj4gcGh5c21hcC4gU2luY2UgdGhlcmUgaXMgbm8gd2F5IHRvIGFjY2Vz
cyBwaHlzbWFwIHByb3Blcmx5IGluc2lkZQo+IHhlbl9odm1fbW9kaWZpZWRfbWVtb3J5KCkgbGV0
J3MgbWFrZSBpdCBhIGdsb2JhbCBzdHJ1Y3R1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBE
cnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+CgpBY2tlZC1ieTogQW50aG9ueSBQ
RVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CgpUaGFua3MsCgotLSAKQW50aG9ueSBQ
RVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
