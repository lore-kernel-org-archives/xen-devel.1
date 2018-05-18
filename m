From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 03/31] pmstat: move pmstat.c file to the
 xen/drivers/pm/stat.c location
Date: Fri, 18 May 2018 05:35:53 -0600
Message-ID: <5AFEBA9902000078001C3FA4@prv1-mh.provo.novell.com>
References: <1510247421-24094-1-git-send-email-olekstysh@gmail.com>
 <1510247421-24094-4-git-send-email-olekstysh@gmail.com>
 <5AF0729202000078001C15BE@prv1-mh.provo.novell.com>
 <CAPD2p-nNa613bbv=k0WJ86sHSFrq8Cc_mL7w_JuRRu7Nkad1eg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ji1r=if=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fJdfx-00077s-Qm
 for xen-devel@lists.xenproject.org; Fri, 18 May 2018 11:35:57 +0000
In-Reply-To: <CAPD2p-nNa613bbv=k0WJ86sHSFrq8Cc_mL7w_JuRRu7Nkad1eg@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: olekstysh@gmail.com
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Oleksandr Dmytryshyn <oleksandr.dmytryshyn@globallogic.com>, julien.grall@linaro.org, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA1LjE4IGF0IDEzOjE0LCA8b2xla3N0eXNoQGdtYWlsLmNvbT4gd3JvdGU6Cj4g
T24gTW9uLCBNYXkgNywgMjAxOCBhdCA2OjM2IFBNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+Pj4+PiBPbiAwOS4xMS4xNyBhdCAxODowOSwgPG9sZWtzdHlzaEBnbWFp
bC5jb20+IHdyb3RlOgo+Pj4gK2ludCBhY3BpX3NldF9wZGNfYml0cyh1MzIgYWNwaV9pZCwgWEVO
X0dVRVNUX0hBTkRMRV9QQVJBTSh1aW50MzIpIHBkYykKPj4+ICt7Cj4+PiArICAgIHUzMiBiaXRz
WzNdOwo+Pj4gKyAgICBpbnQgcmV0Owo+Pj4gKwo+Pj4gKyAgICBpZiAoIGNvcHlfZnJvbV9ndWVz
dChiaXRzLCBwZGMsIDIpICkKPj4+ICsgICAgICAgIHJldCA9IC1FRkFVTFQ7Cj4+PiArICAgIGVs
c2UgaWYgKCBiaXRzWzBdICE9IEFDUElfUERDX1JFVklTSU9OX0lEIHx8ICFiaXRzWzFdICkKPj4+
ICsgICAgICAgIHJldCA9IC1FSU5WQUw7Cj4+PiArICAgIGVsc2UgaWYgKCBjb3B5X2Zyb21fZ3Vl
c3Rfb2Zmc2V0KGJpdHMgKyAyLCBwZGMsIDIsIDEpICkKPj4+ICsgICAgICAgIHJldCA9IC1FRkFV
TFQ7Cj4+PiArICAgIGVsc2UKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgdTMyIG1hc2sgPSAwOwo+
Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCB4ZW5fcHJvY2Vzc29yX3BtYml0cyAmIFhFTl9QUk9DRVNT
T1JfUE1fQ1ggKQo+Pj4gKyAgICAgICAgICAgIG1hc2sgfD0gQUNQSV9QRENfQ19NQVNLIHwgQUNQ
SV9QRENfU01QX0MxUFQ7Cj4+PiArICAgICAgICBpZiAoIHhlbl9wcm9jZXNzb3JfcG1iaXRzICYg
WEVOX1BST0NFU1NPUl9QTV9QWCApCj4+PiArICAgICAgICAgICAgbWFzayB8PSBBQ1BJX1BEQ19Q
X01BU0sgfCBBQ1BJX1BEQ19TTVBfQzFQVDsKPj4+ICsgICAgICAgIGlmICggeGVuX3Byb2Nlc3Nv
cl9wbWJpdHMgJiBYRU5fUFJPQ0VTU09SX1BNX1RYICkKPj4+ICsgICAgICAgICAgICBtYXNrIHw9
IEFDUElfUERDX1RfTUFTSyB8IEFDUElfUERDX1NNUF9DMVBUOwo+Pj4gKyAgICAgICAgYml0c1sy
XSAmPSAoQUNQSV9QRENfQ19NQVNLIHwgQUNQSV9QRENfUF9NQVNLIHwgQUNQSV9QRENfVF9NQVNL
IHwKPj4+ICsgICAgICAgICAgICAgICAgICAgIEFDUElfUERDX1NNUF9DMVBUKSAmIH5tYXNrOwo+
Pj4gKyAgICAgICAgcmV0ID0gYXJjaF9hY3BpX3NldF9wZGNfYml0cyhhY3BpX2lkLCBiaXRzLCBt
YXNrKTsKPj4+ICsgICAgfQo+Pj4gKyAgICBpZiAoICFyZXQgJiYgX19jb3B5X3RvX2d1ZXN0X29m
ZnNldChwZGMsIDIsIGJpdHMgKyAyLCAxKSApCj4+PiArICAgICAgICByZXQgPSAtRUZBVUxUOwo+
Pj4gKwo+Pj4gKyAgICByZXR1cm4gcmV0Owo+Pj4gK30KPj4KPj4gTG9va3MgcXVpdGUgQUNQSS1z
cGVjaWZpYy4KPiBZZXMsIGN1cnJlbnQgcGF0Y2ggZG9lcyBqdXN0IGEgbW92ZW1lbnQuCj4gCj4g
TmV4dCBwYXRjaCBbMV0gd3JhcHMgaXQgaW4gI2lmZGVmIENPTkZJR19BQ1BJLgo+IAo+IEhvd2V2
ZXIgZHVyaW5nIHBhdGNoIGRpc2N1c3Npb24gd2UgZGVjaWRlZCB0byBtb3ZlIHRoaXMgZnVuY3Rp
b24gdG8gYXJjaC94ODYuCj4gSXQgaXMgY2FsbGVkIGZyb20gYXJjaC94ODYvcGxhdGZvcm1faHlw
ZXJjYWxsLmMgYW5kIHB1bGxzIGEgYnVuY2ggb2YKPiAjZGVmaW5lLXMgZnJvbSBwZGNfaW50ZWwu
aAoKTm90IHN1cmUgLSB0aGUgZnVuY3Rpb24gbWF5IGJlIHVzZWQgYnkgeDg2IG9ubHkgcmlnaHQg
bm93LCBidXQgaXMgd2hhdCBpdApkb2VzIHJlYWxseSB4ODYtc3BlY2lmaWM/CgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
