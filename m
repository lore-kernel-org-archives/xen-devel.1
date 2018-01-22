From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/6] x86: make CPU state flush requests
	explicit
Date: Mon, 22 Jan 2018 02:31:36 -0700
Message-ID: <5A65BD8802000078001A0EEF@prv-mh.provo.novell.com>
References: <5A62238B02000078001A0768@prv-mh.provo.novell.com>
 <5A6224F502000078001A078B@prv-mh.provo.novell.com>
 <a84b24c8-2973-e0f2-d543-8698971db4b3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=cwx6=er=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edYSB-0002cU-GL
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 09:31:47 +0000
In-Reply-To: <a84b24c8-2973-e0f2-d543-8698971db4b3@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAxLjE4IGF0IDE4OjQwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDEvMTggMTY6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4v
aW5jbHVkZS9hc20teDg2L2ZsdXNodGxiLmgKPj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9m
bHVzaHRsYi5oCj4+IEBAIC0xMDEsNiArMTAxLDggQEAgdm9pZCB3cml0ZV9jcjModW5zaWduZWQg
bG9uZyBjcjMpOwo+PiAgI2RlZmluZSBGTFVTSF9DQUNIRSAgICAgIDB4NDAwCj4+ICAgLyogVkEg
Zm9yIHRoZSBmbHVzaCBoYXMgYSB2YWxpZCBtYXBwaW5nICovCj4+ICAjZGVmaW5lIEZMVVNIX1ZB
X1ZBTElEICAgMHg4MDAKPj4gKyAvKiBGbHVzaCBDUFUgc3RhdGUgKi8KPj4gKyNkZWZpbmUgRkxV
U0hfU1RBVEUgICAgICAweDEwMDAKPiAKPiBTVEFURSBjb3VsZCBsZWdpdGltYXRlbHkgZGVzY3Jp
YmUgYW55IG9mIHRoZSBvdGhlciBGTFVTSCBmbGFncy4gCj4gRkxVU0hfVkNQVV9TVEFURSA/CgpG
aW5lIGJ5IG1lLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
