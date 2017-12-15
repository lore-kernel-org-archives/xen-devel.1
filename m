From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v9 06/16] x86: implement get hw info flow
	for MBA
Date: Fri, 15 Dec 2017 03:09:26 -0700
Message-ID: <5A33AD6602000078001979DC@prv-mh.provo.novell.com>
References: <1508488108-7071-1-git-send-email-yi.y.sun@linux.intel.com>
 <1508488108-7071-7-git-send-email-yi.y.sun@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=nivo=dl=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ePmvs-0002uH-MR
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2017 10:09:32 +0000
In-Reply-To: <1508488108-7071-7-git-send-email-yi.y.sun@linux.intel.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Yi Sun <yi.y.sun@linux.intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Chao Peng <chao.p.peng@linux.intel.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjEwLjE3IGF0IDEwOjI4LCA8eWkueS5zdW5AbGludXguaW50ZWwuY29tPiB3cm90
ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiArKysgYi94ZW4vYXJjaC94ODYvc3lz
Y3RsLmMKPiBAQCAtMTc0LDcgKzE3NCw3IEBAIGxvbmcgYXJjaF9kb19zeXNjdGwoCj4gICAgICBj
YXNlIFhFTl9TWVNDVExfcHNyX2FsbG9jOgo+ICAgICAgICAgIHN3aXRjaCAoIHN5c2N0bC0+dS5w
c3JfYWxsb2MuY21kICkKPiAgICAgICAgICB7Cj4gLSAgICAgICAgICAgIHVpbnQzMl90IGRhdGFb
UFNSX0lORk9fQVJSQVlfU0laRV07Cj4gKyAgICAgICAgICAgIHVpbnQzMl90IGRhdGFbUFNSX0lO
Rk9fQVJSQVlfU0laRV0gPSB7IH07Cj4gIAo+ICAgICAgICAgIGNhc2UgWEVOX1NZU0NUTF9QU1Jf
Z2V0X2wzX2luZm86Cj4gICAgICAgICAgewoKVGhpcyB2YWxpZGx5IGZhaWxlZCBteSBjb21taXQg
dGltZSBidWlsZCBjaGVjazogZ2NjIDcuMiB3YXJucyBhYm91dAp0aGUgY29kZSB3aGljaCB3b3Vs
ZCBiZSBnZW5lcmF0ZWQgd291bGQgbmV2ZXIgYmUgZXhlY3V0ZWQuIEknbQp0aGVyZWZvcmUgZ29p
bmcgdG8gcHVzaCBvbmx5IHRoZSBmaXJzdCBmaXZlIHBhdGNoZXMgb2YgdGhpcyBzZXJpZXMuCgpK
YW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
