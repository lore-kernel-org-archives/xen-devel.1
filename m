From: Yi Sun <yi.y.sun@linux.intel.com>
Subject: Re: [PATCH v9 06/16] x86: implement get hw info flow
	for MBA
Date: Mon, 18 Dec 2017 17:38:48 +0800
Message-ID: <20171218093848.GA3419@yi.y.sun>
References: <1508488108-7071-1-git-send-email-yi.y.sun@linux.intel.com>
 <1508488108-7071-7-git-send-email-yi.y.sun@linux.intel.com>
 <5A33AD6602000078001979DC@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=be7h=do=linux.intel.com=yi.y.sun@srs-us1.protection.inumbo.net>)
 id 1eQruI-0001DR-Sf
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2017 09:40:22 +0000
Content-Disposition: inline
In-Reply-To: <5A33AD6602000078001979DC@prv-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>, Chao Peng <chao.p.peng@linux.intel.com>, Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTctMTItMTUgMDM6MDk6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+PiBPbiAyMC4xMC4x
NyBhdCAxMDoyOCwgPHlpLnkuc3VuQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvc3lzY3RsLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zeXNjdGwuYwo+ID4g
QEAgLTE3NCw3ICsxNzQsNyBAQCBsb25nIGFyY2hfZG9fc3lzY3RsKAo+ID4gICAgICBjYXNlIFhF
Tl9TWVNDVExfcHNyX2FsbG9jOgo+ID4gICAgICAgICAgc3dpdGNoICggc3lzY3RsLT51LnBzcl9h
bGxvYy5jbWQgKQo+ID4gICAgICAgICAgewo+ID4gLSAgICAgICAgICAgIHVpbnQzMl90IGRhdGFb
UFNSX0lORk9fQVJSQVlfU0laRV07Cj4gPiArICAgICAgICAgICAgdWludDMyX3QgZGF0YVtQU1Jf
SU5GT19BUlJBWV9TSVpFXSA9IHsgfTsKPiA+ICAKPiA+ICAgICAgICAgIGNhc2UgWEVOX1NZU0NU
TF9QU1JfZ2V0X2wzX2luZm86Cj4gPiAgICAgICAgICB7Cj4gCj4gVGhpcyB2YWxpZGx5IGZhaWxl
ZCBteSBjb21taXQgdGltZSBidWlsZCBjaGVjazogZ2NjIDcuMiB3YXJucyBhYm91dAo+IHRoZSBj
b2RlIHdoaWNoIHdvdWxkIGJlIGdlbmVyYXRlZCB3b3VsZCBuZXZlciBiZSBleGVjdXRlZC4gSSdt
Cj4gdGhlcmVmb3JlIGdvaW5nIHRvIHB1c2ggb25seSB0aGUgZmlyc3QgZml2ZSBwYXRjaGVzIG9m
IHRoaXMgc2VyaWVzLgo+IApUaGFuayB5b3UhIEkgaGF2ZSB1cGdyYWRlZCBteSBnY2MgdG8gNy4y
IGFuZCBmaXhlZCB0aGlzIGlzc3VlLiBUaGUgbmV3CnBhdGNoIGhhcyBiZWVuIHNlbnQuIEFsbCBs
YXRlciBwYXRjaGVzIGhhdmUgYmVlbiBjb21waWxlZCBzdWNjZXNzZnVsbHkKd2l0aCBnY2MgNy4y
LiBTbyBwbGVhc2UgZ28gb24gbWVyZ2luZyB0aGVtLiBUaGFua3MhCgo+IEphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
