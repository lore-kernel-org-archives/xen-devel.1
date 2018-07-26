From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl/libxl_arm_acpi.c: fix 'memcpy'
 forming offset out of the bounds
Date: Thu, 26 Jul 2018 08:46:40 +0100
Message-ID: <20180726074640.koobuyw33m4ecbrp@citrix.com>
References: <1532562265-31686-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xz6m=kk=citrix.com=prvs=738467b65=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fiayy-0005ty-BE
 for xen-devel@lists.xenproject.org; Thu, 26 Jul 2018 07:46:44 +0000
Content-Disposition: inline
In-Reply-To: <1532562265-31686-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBKdWwgMjUsIDIwMTggYXQgMDQ6NDQ6MjVQTSAtMDcwMCwgTWFuanVrdW1hciBNYXRo
YSB3cm90ZToKPiBnY2MtOC4xIGNvbXBsYWluczoKPiAKPiBsaWJ4bF9hcm1fYWNwaS5jOjIwODo1
OiBlcnJvcjogJ21lbWNweScgZm9ybWluZyBvZmZzZXQgWzUsIDZdIGlzIG91dCBvZgo+IHRoZSBi
b3VuZHMgWzAsIDRdIFstV2Vycm9yPWFycmF5LWJvdW5kc10KPiAgICAgIG1lbWNweShoLT5vZW1f
aWQsIEFDUElfT0VNX0lELCBzaXplb2YoaC0+b2VtX2lkKSk7Cj4gICAgICBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gbGlieGxfYXJtX2FjcGkuYzoy
MDk6NTogZXJyb3I6ICdtZW1jcHknIGZvcm1pbmcgb2Zmc2V0IFs1LCA4XSBpcyBvdXQgb2YKPiB0
aGUgYm91bmRzIFswLCA0XSBbLVdlcnJvcj1hcnJheS1ib3VuZHNdCj4gICAgICBtZW1jcHkoaC0+
b2VtX3RhYmxlX2lkLCBBQ1BJX09FTV9UQUJMRV9JRCwKPiBzaXplb2YoaC0+b2VtX3RhYmxlX2lk
KSk7Cj4gICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gbGlieGxfYXJtX2FjcGkuYzoyMTE6NTogZXJyb3I6ICdt
ZW1jcHknIGZvcm1pbmcgb2Zmc2V0IDQgaXMgb3V0IG9mIHRoZQo+IGJvdW5kcyBbMCwgM10gWy1X
ZXJyb3I9YXJyYXktYm91bmRzXQo+ICAgICAgbWVtY3B5KGgtPmFzbF9jb21waWxlcl9pZCwgQUNQ
SV9BU0xfQ09NUElMRVJfSUQsCj4gICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn4KPiAgICAgICAgICAgICBzaXplb2YoaC0+YXNsX2NvbXBpbGVyX2lk
KSk7Cj4gICAgICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gbGlieGxfYXJt
X2FjcGkuYzoxOTM6NTogZXJyb3I6ICdtZW1jcHknIGZvcm1pbmcgb2Zmc2V0IFs1LCA2XSBpcyBv
dXQgb2YKPiB0aGUgYm91bmRzIFswLCA0XSBbLVdlcnJvcj1hcnJheS1ib3VuZHNdCj4gICAgICBt
ZW1jcHkocnNkcC0+b2VtX2lkLCBBQ1BJX09FTV9JRCwgc2l6ZW9mKHJzZHAtPm9lbV9pZCkpOwo+
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGFib3ZlIGVycm9ycy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBNYW5qdWt1bWFyIE1hdGhhIDxtYW5qdWt1bWFyLmhhcnRoaWtvdGUtbWF0aGFAeGls
aW54LmNvbT4KPiAtLS0KPiAgdG9vbHMvbGlieGwvbGlieGxfYXJtX2FjcGkuYyB8IDkgKysrKy0t
LS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2FybV9hY3BpLmMgYi90b29scy9saWJ4
bC9saWJ4bF9hcm1fYWNwaS5jCj4gaW5kZXggNjM2ZjcyNC4uOWIzMDBmMyAxMDA2NDQKPiAtLS0g
YS90b29scy9saWJ4bC9saWJ4bF9hcm1fYWNwaS5jCj4gKysrIGIvdG9vbHMvbGlieGwvbGlieGxf
YXJtX2FjcGkuYwo+IEBAIC0xOTAsNyArMTkwLDcgQEAgc3RhdGljIHZvaWQgbWFrZV9hY3BpX3Jz
ZHAobGlieGxfX2djICpnYywgc3RydWN0IHhjX2RvbV9pbWFnZSAqZG9tLAo+ICAgICAgc3RydWN0
IGFjcGlfdGFibGVfcnNkcCAqcnNkcCA9ICh2b2lkICopZG9tLT5hY3BpX21vZHVsZXNbMF0uZGF0
YSArIG9mZnNldDsKPiAgCj4gICAgICBtZW1jcHkocnNkcC0+c2lnbmF0dXJlLCAiUlNEIFBUUiAi
LCBzaXplb2YocnNkcC0+c2lnbmF0dXJlKSk7Cj4gLSAgICBtZW1jcHkocnNkcC0+b2VtX2lkLCBB
Q1BJX09FTV9JRCwgc2l6ZW9mKHJzZHAtPm9lbV9pZCkpOwo+ICsgICAgbWVtY3B5KHJzZHAtPm9l
bV9pZCwgQUNQSV9PRU1fSUQsIHNpemVvZihBQ1BJX09FTV9JRCkpOwoKVGhlIGNvZGUgc2hvdWxk
IHBpY2sgdGhlIHNtYWxsZXIgc2l6ZSBvZiB0aGUgdHdvIGFzIHRoZSBjb3B5IGxlbmd0aC4KT3Is
IHNpbmNlIHRoaXMgaXMgc3RyaW5nLCB1c2Ugc3RybmNweSB3aXRoIHNpemUgb2YgdGhlIGRlc3Rp
bmF0aW9uCmFycmF5LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
