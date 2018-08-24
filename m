From: Julien Grall <julien.grall@linaro.org>
Subject: Re: [PATCH v2 3/6] xen/arm: add RCAR2 kconfig
Date: Fri, 24 Aug 2018 09:38:55 +0100
Message-ID: <20b1fbc5-439a-fc10-d878-437c3e8f9d70@linaro.org>
References: <alpine.DEB.2.10.1808231631270.14449@sstabellini-ThinkPad-X260>
 <1535067220-16825-3-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=pfei=lh=linaro.org=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ft7cQ-00059B-R0
 for xen-devel@lists.xenproject.org; Fri, 24 Aug 2018 08:38:58 +0000
Received: by mail-wm0-x244.google.com with SMTP id m199-v6so3731528wma.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Aug 2018 01:38:57 -0700 (PDT)
In-Reply-To: <1535067220-16825-3-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <stefanos@xilinx.com>, iurii.konovalenko@globallogic.com, andrii_anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyNC8wOC8xOCAwMDozMywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IEFkZCBh
IGtjb25maWcgb3B0aW9uIGZvciBSZW5lc2FzIFJjYXIyIHBsYXRmb3Jtcy4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+Cj4gQ0M6IGl1cmlp
Lmtvbm92YWxlbmtvQGdsb2JhbGxvZ2ljLmNvbQo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL3BsYXRm
b3Jtcy9LY29uZmlnICB8IDExICsrKysrKysrKysrCj4gICB4ZW4vYXJjaC9hcm0vcGxhdGZvcm1z
L01ha2VmaWxlIHwgIDIgKy0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tj
b25maWcgYi94ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL0tjb25maWcKPiBpbmRleCBhNDNjOTM4Li5l
NTQ4MjVhIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZwo+ICsr
KyBiL3hlbi9hcmNoL2FybS9wbGF0Zm9ybXMvS2NvbmZpZwo+IEBAIC01Myw2ICs1MywxMyBAQCBj
b25maWcgU1VOWEkKPiAgIAlFbmFibGUgYWxsIHRoZSByZXF1aXJlZCBkcml2ZXJzIGZvciBBbGx3
aW5uZGVyIHN1bnhpIHBsYXRmb3JtcywKPiAgIAlpbmNsdWRpbmcgUGluZTY0LCBPcmFuZ2VQaSwg
Q3ViaWVCb2FyZCwgZXRjLgo+ICAgCj4gK2NvbmZpZyBSQ0FSMgo+ICsJYm9vbCAiUmVuZXNhcyBS
LUNhciBHZW4yIgo+ICsJZGVwZW5kcyBvbiBBUk1fMzIKPiArCXNlbGVjdCBIQVNfU0NJRgo+ICsJ
LS0taGVscC0tLQo+ICsJRW5hYmxlIGFsbCB0aGUgcmVxdWlyZWQgZHJpdmVycyBmb3IgUmVuZXNh
cyBSLUNhciBHZW4yLgoKVGVjaG5pY2FsbHkgdGhlIFVBUlQgaXMgbm90IHJlcXVpcmVkLiBCeSBz
ZWxlY3RpbmcgaXQsIHlvdSBnaXZlIG5vIHdheSAKdG8gdGhlIHVzZXIgdG8gcmVtb3ZlIGl0LgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
