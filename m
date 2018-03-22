From: Andre Przywara <andre.przywara@linaro.org>
Subject: Re: [PATCH v3 34/39] ARM: new VGIC: vgic-init: register
 VGIC
Date: Thu, 22 Mar 2018 11:18:04 +0000
Message-ID: <53e85b4a-5bde-e67f-9972-b8133f279489@linaro.org>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-35-andre.przywara@linaro.org>
 <4ad1da35-22f1-d53a-6b06-19a96fb4db48@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=sasr=gm=linaro.org=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1eyyEb-0001cY-5o
 for xen-devel@lists.xenproject.org; Thu, 22 Mar 2018 11:18:17 +0000
Received: by mail-wr0-x22b.google.com with SMTP id u46so8266732wrc.11
 for <xen-devel@lists.xenproject.org>; Thu, 22 Mar 2018 04:18:15 -0700 (PDT)
In-Reply-To: <4ad1da35-22f1-d53a-6b06-19a96fb4db48@arm.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

SGksCgpPbiAyMi8wMy8xOCAwODowMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpIEFuZHJlLAo+
IAo+IE9uIDAzLzIxLzIwMTggMDQ6MzIgUE0sIEFuZHJlIFByenl3YXJhIHdyb3RlOgo+PiBUaGlz
IHBhdGNoIGltcGxlbWVudHMgdGhlIGZ1bmN0aW9uIHdoaWNoIGlzIGNhbGxlZCBieSBYZW4gd2hl
biBpdCB3YW50cwo+PiB0byByZWdpc3RlciB0aGUgdmlydHVhbCBHSUMuCj4+IFRoaXMgYWxzbyBp
bXBsZW1lbnRzIHZnaWNfbWF4X3ZjcHVzKCkgZm9yIHRoZSBuZXcgVkdJQywgd2hpY2ggcmVwb3J0
cwo+PiBiYWNrIHRoZSBtYXhpbXVtIG51bWJlciBvZiBWQ1BVcyBhIGNlcnRhaW4gR0lDIG1vZGVs
IHN1cHBvcnRzLiBTaW1pbGFyCj4+IHRvIHRoZSBjb3VudGVycGFydCBpbiB0aGUgIm9sZCIgVkdJ
Qywgd2UgcmV0dXJuIHNvbWUgbWF4aW11bSB2YWx1ZSBpZgo+PiB0aGUgVkdJQyBoYXMgbm90IGJl
ZW4gaW5pdGlhbGlzZWQgeWV0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZSBQcnp5d2FyYSA8
YW5kcmUucHJ6eXdhcmFAbGluYXJvLm9yZz4KPiAKPiBUaGFuayB5b3UgZm9yIHRoZSB1cGRhdGUu
IFdlIHdpbGwgaGF2ZSB0byByZW1vdmUgdGhlIEdJQ19JTlZBTElEIGNhc2UKPiBvbmNlIEFuZHJl
dydzIHNlcmllcyBpcyBtZXJnZWQuIElmIGhpcyBzZXJpZXMgaXMgbWVyZ2VkIGJlZm9yZSB5b3Vy
cywgaXQKPiB3b3VsZCBub3QgYmUgYW4gaXNzdWUgYXMgdGhhdCBjYXNlIHNob3VsZCBuZXZlciBi
ZSBoaXQuCgpZZXMsIGZvciBteSBmaXJzdCByZXBseSBJIGRpZG4ndCBvcmlnaW5hbGx5IHNlZSB0
aGF0IGhpcyBwYXRjaCB3YXMgYSAyMC8yMC4KClNvIEkgY2hhbmdlZCBteSBtaW5kIGFuZCBkZWNp
ZGVkIHRvIG5vdCByZWx5IG9uIHRoaXMgc2VyaWVzIDstKQpXZSBjYW4gaW5kZWVkIGZpeCB0aGlz
IHVwIGxhdGVyLgoKPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4KClRoYW5rcyEKCkFuZHJlLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
