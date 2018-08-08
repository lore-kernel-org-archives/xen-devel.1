From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 2/2] xen/arm: Add MESON UART driver for
 Amlogic S905 SoC
Date: Wed, 08 Aug 2018 04:05:27 -0600
Message-ID: <5B6AC06702000078001DBEA0@prv1-mh.provo.novell.com>
References: <1533661673-14607-1-git-send-email-amittomer25@gmail.com>
 <1533661673-14607-3-git-send-email-amittomer25@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wdim=kx=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fnLLO-0001ZK-Ki
 for xen-devel@lists.xenproject.org; Wed, 08 Aug 2018 10:05:30 +0000
In-Reply-To: <1533661673-14607-3-git-send-email-amittomer25@gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Amit Singh Tomar <amittomer25@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, andre.przywara@arm.com, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjA4LjE4IGF0IDE5OjA3LCA8YW1pdHRvbWVyMjVAZ21haWwuY29tPiB3cm90ZToK
PiBUaGlzIHBhdGNoIGFkZHMgZHJpdmVyIGZvciBVQVJUIGNvbnRyb2xsZXIgcHJlc2VudCBvbiBB
bWxvZ2ljIFM5MDUgU29DLgo+IGh0dHBzOi8vZG4ub2Ryb2lkLmNvbS9TOTA1L0RhdGFTaGVldC9T
OTA1X1B1YmxpY19EYXRhc2hlZXRfVjEuMS40LnBkZiAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbWl0
IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBnbWFpbC5jb20+Cj4gLS0tCj4gIHhlbi9kcml2ZXJz
L2NoYXIvS2NvbmZpZyAgICAgIHwgICA4ICsrCj4gIHhlbi9kcml2ZXJzL2NoYXIvTWFrZWZpbGUg
ICAgIHwgICAxICsKPiAgeGVuL2RyaXZlcnMvY2hhci9tZXNvbi11YXJ0LmMgfCAyOTAgKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwg
Mjk5IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9kcml2ZXJzL2NoYXIv
bWVzb24tdWFydC5jCgpUaGUgZHJpdmVyIGJlaW5nIEFSTS1zcGVjaWZpYywgeW91IHdpbGwgd2Fu
dCB0byB1cGRhdGUKLi9NQUlOVEFJTkVSUyB0byBhbHNvIGxpc3QgdGhpcyBuZXcgZmlsZSBhcyBB
Uk0tc3BlY2lmaWMuCgo+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvS2NvbmZpZwo+ICsrKyBiL3hl
bi9kcml2ZXJzL2NoYXIvS2NvbmZpZwo+IEBAIC0yMCw2ICsyMCwxNCBAQCBjb25maWcgSEFTX01W
RUJVCj4gIAkgIFRoaXMgc2VsZWN0cyB0aGUgTWFydmVsbCBNVkVCVSBVQVJULiBJZiB5b3UgaGF2
ZSBhIEFSTUFEQSAzNzAwCj4gIAkgIGJhc2VkIGJvYXJkLCBzYXkgWS4KPiAgCj4gK2NvbmZpZyBI
QVNfTUVTT04KPiArICAgIGJvb2wKPiArICAgIGRlZmF1bHQgeQo+ICsgICAgZGVwZW5kcyBvbiBB
Uk1fNjQKPiArICAgIGhlbHAKPiArICAgICAgVGhpcyBzZWxlY3RzIHRoZSBNYXJ2ZWxsIE1FU09O
IFVBUlQuIElmIHlvdSBoYXZlIGEgQW1sb2dpYyBTOTA1Cj4gKyAgICAgIGJhc2VkIGJvYXJkLCBz
YXkgWS4KPiArCj4gIGNvbmZpZyBIQVNfUEwwMTEKPiAgCWJvb2wKPiAgCWRlZmF1bHQgeQoKUGxl
YXNlIGZpeCBpbmRlbnRhdGlvbiB0byBtYXRjaCB0aGF0IG9mIHN1cnJvdW5kaW5nIGNvZGUuIEFs
c28KcGxlYXNlIHVzZSAiZGVmX2Jvb2wgeSIgcmF0aGVyIHRoYW4gaXRzIGxvbmdlciB0d28gbGlu
ZSBlcXVpdmFsZW50LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
