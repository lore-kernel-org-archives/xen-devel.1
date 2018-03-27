From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 31/39] ARM: new VGIC: Provide system
 register emulation stub
Date: Tue, 27 Mar 2018 15:40:33 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1803271540170.12360@sstabellini-ThinkPad-X260>
References: <20180321163235.12529-1-andre.przywara@linaro.org>
 <20180321163235.12529-32-andre.przywara@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=u3an=gr=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1f0xGc-0007ez-Q8
 for xen-devel@lists.xenproject.org; Tue, 27 Mar 2018 22:40:34 +0000
In-Reply-To: <20180321163235.12529-32-andre.przywara@linaro.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andre Przywara <andre.przywara@linaro.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMSBNYXIgMjAxOCwgQW5kcmUgUHJ6eXdhcmEgd3JvdGU6Cj4gVGhlIFhlbiBhcmNo
IGNvZGUgdHJhcHMgc3lzdGVtIHJlZ2lzdGVycyB3cml0ZXMgZnJvbSB0aGUgZ3Vlc3QgYW5kIHdp
bGwKPiByZWxheSBhbnl0aGluZyBHSUMgcmVsYXRlZCB0byB0aGUgVkdJQy4KPiBTaW5jZSB0aGlz
IGFmZmVjdHMgb25seSBHSUN2MyAod2hpY2ggd2UgZG9uJ3QgeWV0IGVtdWxhdGUpLCBwcm92aWRl
IGEKPiBzdHViIGltcGxlbWVudGF0aW9uIG9mIHZnaWNfZW11bGF0ZSgpIGZvciBub3cuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmUgUHJ6eXdhcmEgPGFuZHJlLnByenl3YXJhQGxpbmFyby5vcmc+
Cj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpBY2tlZC1i
eTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4g
IHhlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYyB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMu
YyBiL3hlbi9hcmNoL2FybS92Z2ljL3ZnaWMuYwo+IGluZGV4IDc5YzZhNTU1M2QuLmZmYWIwYjI2
MzUgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3ZnaWMvdmdpYy5jCj4gKysrIGIveGVuL2Fy
Y2gvYXJtL3ZnaWMvdmdpYy5jCj4gQEAgLTgxNCw2ICs4MTQsMTMgQEAgc3RydWN0IGlycV9kZXNj
ICp2Z2ljX2dldF9od19pcnFfZGVzYyhzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgdmNwdSAqdiwK
PiAgICAgIHJldHVybiBkZXNjOwo+ICB9Cj4gIAo+ICtib29sIHZnaWNfZW11bGF0ZShzdHJ1Y3Qg
Y3B1X3VzZXJfcmVncyAqcmVncywgdW5pb24gaHNyIGhzcikKPiArewo+ICsgICAgQVNTRVJUKGN1
cnJlbnQtPmRvbWFpbi0+YXJjaC52Z2ljLnZlcnNpb24gPT0gR0lDX1YzKTsKPiArCj4gKyAgICBy
ZXR1cm4gZmFsc2U7Cj4gK30KPiArCj4gIC8qCj4gICAqIHdhczoKPiAgICogICAgICBpbnQga3Zt
X3ZnaWNfbWFwX3BoeXNfaXJxKHN0cnVjdCB2Y3B1ICp2Y3B1LCB1MzIgdmlydF9pcnEsIHUzMiBw
aHlzX2lycSkKPiAtLSAKPiAyLjE0LjEKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
