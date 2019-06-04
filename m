From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
Date: Tue, 4 Jun 2019 10:48:07 +0200
Message-ID: <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ql4p=UD=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hY57M-0004FN-4y
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 08:48:28 +0000
Content-Disposition: inline
In-Reply-To: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDc6MDA6MjVBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gVGhpcyByZXZlcnRzIGNvbW1pdCBiNmJkMDJiN2E4NzdmOWZhYzJkZTY5ZTY0ZDgyNDVk
NTZmOTJhYjI1LiBUaGUgY2hhbmdlCj4gd2FzIHJlZHVuZGFudCB3aXRoIGFtZF9pb21tdV9kZXRl
Y3Rfb25lX2FjcGkoKSBhbHJlYWR5IGNhbGxpbmcKPiBwY2lfcm9fZGV2aWNlKCkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSB0aGluayB0aGlz
IG5lZWRzIHRvIGJlIHNxdWFzaGVkIHRvZ2V0aGVyIHdpdGggeW91ciBgQU1EL0lPTU1VOiBkb24n
dAoiYWRkIiBJT01NVXNgIHBhdGNoLCBvciBlbHNlIFBWSCBkb20wIHdpbGwgYnJlYWsgYmVjYXVz
ZQp1cGRhdGVfcGFnaW5nX21vZGUgd2lsbCBmaW5kIGRldmljZXMgbm90IGJlaGluZCBhbiBJT01N
VSBhc3NpZ25lZCB0bwpkb20wLCB0aHVzIHJldHVybmluZyBhbiBlcnJvciBhbmQgY3Jhc2hpbmcg
ZG9tMC4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
