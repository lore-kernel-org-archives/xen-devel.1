From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
Date: Tue, 4 Jun 2019 10:04:16 +0100
Message-ID: <abc6106c-0c38-d891-0cbb-5b4d79c8093a@citrix.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KH14=UD=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hY5Mk-00068R-NM
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 09:04:22 +0000
In-Reply-To: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
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
Cc: Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDYvMjAxOSAxNDowMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhpcyByZXZlcnRzIGNv
bW1pdCBiNmJkMDJiN2E4NzdmOWZhYzJkZTY5ZTY0ZDgyNDVkNTZmOTJhYjI1LiBUaGUgY2hhbmdl
Cj4gd2FzIHJlZHVuZGFudCB3aXRoIGFtZF9pb21tdV9kZXRlY3Rfb25lX2FjcGkoKSBhbHJlYWR5
IGNhbGxpbmcKPiBwY2lfcm9fZGV2aWNlKCkuCgpTZWVpbmcgYXMgYW1kX2lvbW11X2RldGVjdF9v
bmVfYWNwaSgpIGhhc24ndCBjaGFuZ2VkIGZvciBtYW55IHllYXJzLCBhbmQKYjZiZDAyYjcgd2Fz
IGEgZnVuY3Rpb25hbCBmaXggZm9yIGJvb3RpbmcgUFZIIG9uIEFNRCwgSSBjYW4ndCBzZWUgd2hh
dAp3b3VsZCBtYWtlIHRoaXMgdHJ1ZSBub3cuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
