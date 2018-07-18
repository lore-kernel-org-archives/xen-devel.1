From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 4/6] x86: bring up all CPUs even if not
 all are supposed to be used
Date: Wed, 18 Jul 2018 15:36:24 +0200
Message-ID: <20180718133624.u2ed2vez35vdu4rd@mac>
References: <5B4EF70702000078001D53C7@prv1-mh.provo.novell.com>
 <5B4EF8A102000078001D53F9@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=lpv/=kc=citrix.com=prvs=730b0b06a=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ffmdI-0008Gd-Gu
 for xen-devel@lists.xenproject.org; Wed, 18 Jul 2018 13:36:44 +0000
Content-Disposition: inline
In-Reply-To: <5B4EF8A102000078001D53F9@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMTgsIDIwMTggYXQgMDI6MjE6NTNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gUmVwb3J0ZWRseSBJbnRlbCBDUFVzIHdoaWNoIGNhbid0IGJyb2FkY2FzdCAjTUMgdG8g
YWxsIHRhcmdldGVkCj4gY29yZXMvdGhyZWFkcyBiZWNhdXNlIHNvbWUgaGF2ZSBDUjQuTUNFIGNs
ZWFyIHdpbGwgc2h1dCBkb3duLiBUaGVyZWZvcmUKPiB3ZSB3YW50IHRvIGtlZXAgQ1I0Lk1DRSBl
bmFibGVkIHdoZW4gb2ZmbGluaW5nIGEgQ1BVLCBhbmQgd2UgbmVlZCB0bwo+IGJyaW5nIHVwIGFs
bCBDUFVzIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gc2V0IENSNC5NQ0UgaW4gdGhlIGZpcnN0IHBs
YWNlLgo+IAo+IFRoZSB1c2Ugb2YgY2xlYXJfaW5fY3I0KCkgaW4gY3B1X21jaGVja19kaXNhYmxl
KCkgd2FzIGlsbCBhZHZpc2VkCj4gYW55d2F5LCBhbmQgdG8gYXZvaWQgZnV0dXJlIHNpbWlsYXIg
bWlzdGFrZXMgSSdtIHJlbW92aW5nIGNsZWFyX2luX2NyNCgpCj4gYWx0b2dldGhlciByaWdodCBo
ZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
