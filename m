From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 v2] xen/iommu: fix iommu_ops
 initialization
Date: Fri, 1 Feb 2019 17:47:04 +0100
Message-ID: <563eac31-ecf4-ce02-f68d-a3a5dc65e3a9@suse.com>
References: <20190201162945.26461-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ulZE=QI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gpby6-0006ny-W2
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 16:47:07 +0000
In-Reply-To: <20190201162945.26461-1-jgross@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDEvMDIvMjAxOSAxNzoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBDb21taXQgMzJhNWVh
MDBlYzc1ZWY1M2UgKCJJT01NVS94ODY6IHJlbW92ZSBpbmRpcmVjdGlvbiBmcm9tIGNlcnRhaW4K
PiBJT01NVSBob29rIGFjY2Vzc2VzIikgaW50cm9kdWNlZCBpb21tdV9vcHMgaW5pdGlhbGl6ZWQg
YXQgYm9vdCB0aW1lCj4gd2l0aCBkYXRhIGRlY2xhcmVkIGFzIF9faW5pdGNvbnN0cmVsLgo+IAo+
IE9uIEludGVsIHN5c3RlbXMgdGhlcmUgaXMgYW5vdGhlciBwYXRoIHdoZXJlIGlvbW11X29wcyBp
cyBpbml0aWFsaXplZAo+IGFuZCB0aGlzIHBhdGggaXMgcmVsZXZhbnQgb24gcmVzdW1lIGFmdGVy
IHJldHVybmluZyBmcm9tIHN5c3RlbSBzdXNwZW5kLgo+IEFzIHRoZSBpbml0aWFsaXphdGlvbiBk
YXRhIGlzIG5vIGxvbmdlciBhY2Nlc3NpYmxlIGluIHRoaXMgY2FzZSB0aGF0Cj4gc2Vjb25kIGlu
aXRpYWxpemF0aW9uIG11c3QgYmUgZHJvcHBlZCBpbiBjYXNlIHRoZSBzeXN0ZW0gaXNuJ3QganVz
dAo+IGJvb3RpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuY29tPgoKQW5kIG9mIGNvdXJzZToKClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3Mg
PGpncm9zc0BzdXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
