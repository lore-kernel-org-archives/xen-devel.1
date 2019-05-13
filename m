From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4] libxl: fix migration of PV and PVH domUs
 with and without qemu
Date: Mon, 13 May 2019 17:00:03 +0200
Message-ID: <20190513150003.y4l76s54d2ae5zrw@Air-de-Roger>
References: <20190510152047.17299-1-olaf@aepfle.de>
 <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
 <20190513164521.19e65e5d.olaf@aepfle.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KEM8=TN=citrix.com=prvs=029c3005f=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hQCR5-0005hg-Ad
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 15:00:15 +0000
Content-Disposition: inline
In-Reply-To: <20190513164521.19e65e5d.olaf@aepfle.de>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Olaf Hering <olaf@aepfle.de>
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMDQ6NDU6MjFQTSArMDIwMCwgT2xhZiBIZXJpbmcgd3Jv
dGU6Cj4gQW0gTW9uLCAxMyBNYXkgMjAxOSAxNjozNzozMyArMDIwMAo+IHNjaHJpZWIgUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ogo+IAo+ID4gRlRSIEkgd291bGQgaGF2
ZSBwcmVmZXJyZWQgYSBwcmUtcGF0Y2ggdGhhdCBkaWQgdGhlIG1vdmUgb2YgdGhpcyBjaHVuawo+
ID4gb2YgY29kZSBpbnRvIGxpYnhsX19kb21haW5fc2V0X2RldmljZV9tb2RlbCB3aXRob3V0IGFu
eSBmdW5jdGlvbmFsCj4gPiBjaGFuZ2UsIGFuZCB0aGVuIGEgc2Vjb25kIHBhdGNoIHRoYXQgaW50
cm9kdWNlcyB0aGUgbmV3IGZ1bmN0aW9uYWxpdHkuCj4gCj4gSWYgdGhhdCBuZWVkcyB0byBiZSBk
b25lLCBJIGNhbiBkbyBpdC4KCklmZiB5b3UgaGF2ZSB0byByZXNlbmQgYW55d2F5LCBhbmQgaXQn
cyBub3QgdG9vIG11Y2ggZnVzcyB0aGVuIEkgd291bGQKc2F5IHllcy4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
