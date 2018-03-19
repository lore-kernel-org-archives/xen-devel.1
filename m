From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v2] xen/arm: Fix platform name to
 xilinx_zynqmp from xgene_storm
Date: Mon, 19 Mar 2018 09:23:53 +0000
Message-ID: <2696231f-5d69-a87f-995f-b0e63084da05@arm.com>
References: <1521364826-25757-1-git-send-email-amittomer25@gmail.com>
 <20180318150010.GI26265@toto>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=wrgj=gj=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1exjXE-00038i-GW
 for xen-devel@lists.xenproject.org; Mon, 19 Mar 2018 01:24:24 +0000
In-Reply-To: <20180318150010.GI26265@toto>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Amit Singh Tomar <amittomer25@gmail.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, andre.przywara@arm.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAwMy8xOC8yMDE4IDAzOjAwIFBNLCBFZGdhciBFLiBJZ2xlc2lhcyB3cm90ZToKPiBP
biBTdW4sIE1hciAxOCwgMjAxOCBhdCAwMjo1MDoyNlBNICswNTMwLCBBbWl0IFNpbmdoIFRvbWFy
IHdyb3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBBbWl0IFNpbmdoIFRvbWFyIDxhbWl0dG9tZXIyNUBn
bWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEVkZ2FyIEUuIElnbGVzaWFzIDxlZGdhci5pZ2xl
c2lhc0B4aWxpbnguY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CgpBbmQgY29tbWl0dGVkLgoKQ2hlZXJzLAoKPiAKPiAKPj4gLS0tCj4+IENoYW5nZXMg
c2luY2UgdjE6Cj4+IAkqIEFkZHJlc3NlZCBBbmRyZSdzIGNvbW1lbnQuCj4+IC0tLQo+PiAgIHhl
bi9hcmNoL2FybS9wbGF0Zm9ybXMveGlsaW54LXp5bnFtcC5jIHwgMiArLQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3BsYXRmb3Jtcy94aWxpbngtenlucW1wLmMgYi94ZW4vYXJjaC9hcm0vcGxh
dGZvcm1zL3hpbGlueC16eW5xbXAuYwo+PiBpbmRleCAyYWRlZTkxLi5kOGNlZGVkIDEwMDY0NAo+
PiAtLS0gYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3hpbGlueC16eW5xbXAuYwo+PiArKysgYi94
ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL3hpbGlueC16eW5xbXAuYwo+PiBAQCAtMzIsNyArMzIsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGR0X2RldmljZV9tYXRjaCB6eW5xbXBfYmxhY2tsaXN0X2Rl
dltdIF9faW5pdGNvbnN0ID0KPj4gICAgICAgeyAvKiBzZW50aW5lbCAqLyB9LAo+PiAgIH07Cj4+
ICAgCj4+IC1QTEFURk9STV9TVEFSVCh4Z2VuZV9zdG9ybSwgIlhpbGlueCBaeW5xTVAiKQo+PiAr
UExBVEZPUk1fU1RBUlQoeGlsaW54X3p5bnFtcCwgIlhpbGlueCBaeW5xTVAiKQo+PiAgICAgICAu
Y29tcGF0aWJsZSA9IHp5bnFtcF9kdF9jb21wYXQsCj4+ICAgICAgIC5ibGFja2xpc3RfZGV2ID0g
enlucW1wX2JsYWNrbGlzdF9kZXYsCj4+ICAgUExBVEZPUk1fRU5ECj4+IC0tIAo+PiAxLjkuMQo+
PgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
