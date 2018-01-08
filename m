From: Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [PATCH v2 15/23] vixen: pass through version
 hypercalls to parent Xen
Date: Sun, 7 Jan 2018 16:29:15 -0800
Message-ID: <CA+aC4ktUvNvngWdFxDz_wCc8+4oO7L-SzhpSZyYo0HKfcdqH-Q@mail.gmail.com>
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-16-git-send-email-aliguori@amzn.com>
 <20180108002711.GB21689@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=h9h4=ed=codemonkey.ws=anthony@srs-us1.protection.inumbo.net>)
 id 1eYLJW-0007T2-Qc
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 00:29:18 +0000
Received: by mail-lf0-x244.google.com with SMTP id h137so10406740lfe.8
 for <xen-devel@lists.xenproject.org>; Sun, 07 Jan 2018 16:29:17 -0800 (PST)
In-Reply-To: <20180108002711.GB21689@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Anthony Liguori <aliguori@amzn.com>, Wei Liu <wei.liu2@citrix.com>, Anthony Liguori <aliguori@amazon.com>, KarimAllah Ahmed <karahmed@amazon.de>, Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Jan_H=2E_Sch=C3=B6nherr?= <jschoenh@amazon.de>, Matt Wilson <msw@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gU3VuLCBKYW4gNywgMjAxOCBhdCA0OjI3IFBNLCBLb25yYWQgUnplc3p1dGVrIFdpbGsKPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+IHdyb3RlOgo+IE9uIFN1biwgSmFuIDA3LCAyMDE4IGF0IDEy
OjI4OjMxUE0gLTA4MDAsIEFudGhvbnkgTGlndW9yaSB3cm90ZToKPj4gRnJvbTogQW50aG9ueSBM
aWd1b3JpIDxhbGlndW9yaUBhbWF6b24uY29tPgo+Pgo+PiBUaGlzIGlzIG5lY2Vzc2FyeSB0byB0
cmlnZ2VyIGV2ZW50IGNoYW5uZWwgdXBjYWxscyBidXQgaXQgaXMgYWxzbwo+PiB1c2VmdWwgdG8g
cGFzc3Rocm91Z2ggdGhlIGZ1bGwgdmVyc2lvbiBpbmZvcm1hdGlvbiBzdWNoIHRoYXQgdGhlCj4+
IGd1ZXN0IGJlbGlldmVzIGl0IGlzIHJ1bm5pbmcgb24gdGhlIHBhcmVudCBYZW4uCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IE1hdHQgV2lsc29uIDxtc3dAYW1hem9uLmNvbT4KPj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBMaWd1b3JpIDxhbGlndW9yaUBhbWF6b24uY29tPgo+PiAtLS0KPj4gdjEgLT4g
djIKPj4gIC0gZG9uJ3QgcGFzcyB0aHJvdWdoIHZlcnNpb24gYnkgZGVmYXVsdAo+PiAgLSBpbnRy
b2R1Y2Ugdml4ZW5fcHR2ZXIgcGFyYW1ldGVyIHRvIGVuYWJsZSB2ZXJzaW9uIHBhc3N0aHJvdWdo
Lgo+PiAtLS0KPj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC92aXhlbi5jICAgICAgICB8ICA3ICsrKwo+
PiAgeGVuL2NvbW1vbi9rZXJuZWwuYyAgICAgICAgICAgICAgIHwgODkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tCj4+ICB4ZW4vaW5jbHVkZS9hc20tYXJtL2d1ZXN0L3Zp
eGVuLmggfCAgNSArKysKPj4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3Qvdml4ZW4uaCB8ICAy
ICsKPj4gIDQgZmlsZXMgY2hhbmdlZCwgOTEgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3Qvdml4ZW4uYyBiL3hlbi9hcmNo
L3g4Ni9ndWVzdC92aXhlbi5jCj4+IGluZGV4IGExNjE0ZTAuLjdjODg2YTIgMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC92aXhlbi5jCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC92aXhlbi5jCj4+IEBAIC0zMSw4ICszMSwxMCBAQCBzdGF0aWMgaW50IGluX3ZpeGVuOwo+PiAg
c3RhdGljIGludCB2aXhlbl9kb21pZCA9IDE7Cj4+ICBzdGF0aWMgdWludDMyX3Qgdml4ZW5fcmVz
ZXJ2ZWRfbWVtX3Bnc3RhcnQgPSAweGZlZmYwMDAwOwo+PiAgc3RhdGljIHNoYXJlZF9pbmZvX3Qg
Kmdsb2JhbF9zaTsKPj4gK3N0YXRpYyBib29sIHZpeGVuX3B0dmVyOwo+Pgo+PiAgaW50ZWdlcl9w
YXJhbSgidml4ZW5fZG9taWQiLCB2aXhlbl9kb21pZCk7Cj4+ICtib29sZWFuX3BhcmFtKCJ2aXhl
bl9wdHZlciIsIHZpeGVuX3B0dmVyKTsKPgo+IFdvdWxkIGl0IG1ha2Ugc2Vuc2UgdG8gaGF2ZSBh
IGN1c3RvbSBwYXJhbWV0ZXIgZnVuY3Rpb24gdGhhdCB3b3VsZAo+IGJlIGNhbGxlZCAndml4ZW4n
IGFuZCBoYXZlIGFsbCBvZiB0aG9zZSBpbiBpdD8KCkNhbiB5b3UgZ2l2ZSBhbiBleGFtcGxlPyAg
SSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4uCgpSZWdhcmRzLAoKQW50aG9ueSBMaWd1b3JpCgoK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IFhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiBodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
