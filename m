From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 for-4.12] arm/p2m: call iommu iotlb flush
 if iommu exists and enabled
Date: Wed, 23 Jan 2019 13:55:40 +0100
Message-ID: <3430b84a-04ce-fb2a-1c51-5b4977103af8@suse.com>
References: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l+rE=P7=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gmI4G-0000Wv-TF
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 12:55:44 +0000
In-Reply-To: <1548247807-20400-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>, Paul Durrant <Paul.Durrant@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMDEvMjAxOSAxMzo1MCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBGcm9tOiBBbmRyaWkg
QW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IFRha2luZyBkZWNpc2lvbiBieSBg
bmVlZF9pb21tdV9wdF9zeW5jKClgIG1ha2UgdXMgbmV2ZXIga2lja2luZwo+IGBpb21tdV9pb3Rs
Yl9mbHVzaCgpYCBmb3IgSU9NTVVzIHdoaWNoIGRvIHNoYXJlIFAyTSB3aXRoIENQVS4KPiBTbyBj
aGVjayBgaGFzX2lvbW11X3B0KClgIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmlp
IEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
