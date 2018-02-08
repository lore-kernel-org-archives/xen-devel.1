From: Sameer Goel <sameer.goel@linaro.org>
Subject: Re: [RFC 11/11] Add to_pci_dev macro
Date: Thu, 8 Feb 2018 14:54:09 -0700
Message-ID: <453baf1e-9fa3-7926-2082-c8392b763a0c@linaro.org>
References: <20180102092809.1841-1-manish.jaggi@linaro.org>
 <20180102092809.1841-12-manish.jaggi@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=9lkd=fc=linaro.org=sameer.goel@srs-us1.protection.inumbo.net>)
 id 1eju91-0001Sj-4F
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2018 21:54:15 +0000
Received: by mail-pl0-x244.google.com with SMTP id f4so513643plr.10
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2018 13:54:12 -0800 (PST)
In-Reply-To: <20180102092809.1841-12-manish.jaggi@linaro.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: manish.jaggi@linaro.org, xen-devel@lists.xenproject.org, julien.grall@linaro.org, andre.przywara@linaro.org
Cc: manish.jaggi@cavium.com
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxLzIvMjAxOCAyOjI4IEFNLCBtYW5pc2guamFnZ2lAbGluYXJvLm9yZyB3cm90ZToKPiBG
cm9tOiBNYW5pc2ggSmFnZ2kgPG1hbmlzaC5qYWdnaUBsaW5hcm8ub3JnPgo+Cj4gVGhpcyBwYXRj
aCBhZGRzIHRvX3BjaV9kZXYgbWFjcm8KPgo+IFNpZ25lZC1vZmYtYnk6IE1hbmlzaCBKYWdnaSA8
bWFuaXNoLmphZ2dpQGxpbmFyby5vcmc+Cj4gLS0tCj4gIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCB8
IDMgKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS94ZW4vaW5jbHVkZS94ZW4vcGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPiBpbmRleCA0
M2YyMTI1MWE1Li40YzdmZjRkZDEwIDEwMDY0NAo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2ku
aAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+IEBAIC05Miw4ICs5MiwxMSBAQCBzdHJ1
Y3QgcGNpX2RldiB7Cj4gICNkZWZpbmUgUFRfRkFVTFRfVEhSRVNIT0xEIDEwCj4gICAgICB9IGZh
dWx0Owo+ICAgICAgdTY0IHZmX3JsZW5bNl07Cj4gKyAgICBzdHJ1Y3QgZGV2aWNlIGRldjsKPiAg
fTsKPiAgCj4gKyNkZWZpbmUgdG9fcGNpX2RldihwKSBjb250YWluZXJfb2YocCwgc3RydWN0IHBj
aV9kZXYsIGRldikKUmVtb3ZlIHRoZSBhYm92ZSBmdW5jdGlvbiBmcm9tIHNtbXUuYyBpZiBpdCBu
ZWVkcyB0byBiZSBkZWZpbmVkIGhlcmUuCj4gKyNkZWZpbmUgcGNpX2RvbWFpbl9ucihkZXYpIGRl
di0+c2VnCj4gICNkZWZpbmUgZm9yX2VhY2hfcGRldihkb21haW4sIHBkZXYpIFwKPiAgICAgIGxp
c3RfZm9yX2VhY2hfZW50cnkocGRldiwgJihkb21haW4tPmFyY2gucGRldl9saXN0KSwgZG9tYWlu
X2xpc3QpCj4gIAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
