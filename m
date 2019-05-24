From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/altp2m: cleanup p2m_altp2m_lazy_copy
Date: Fri, 24 May 2019 18:44:31 +0100
Message-ID: <05052e2b-a1cb-ef1c-4727-0e592556ca6a@citrix.com>
References: <20190412200813.25447-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IEXw=TY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hUEFB-0004cO-U8
 for xen-devel@lists.xenproject.org; Fri, 24 May 2019 17:44:37 +0000
In-Reply-To: <20190412200813.25447-1-tamas@tklengyel.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDQvMjAxOSAyMTowOCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRoZSBwMm1fYWx0
cDJtX2xhenlfY29weSBpcyByZXNwb25zaWJsZSBmb3IgbGF6aWx5IHBvcHVsYXRpbmcgYW4gYWx0
cDJtIHZpZXcKPiB3aGVuIHRoZSBndWVzdCB0cmFwcyBvdXQgZHVlIHRvIG5vIEVQVCBlbnRyeSBi
ZWluZyBwcmVzZW50IGluIHRoZSBhY3RpdmUgdmlldy4KPiBDdXJyZW50bHkgdGhlIGZ1bmN0aW9u
IHRvb2sgc2V2ZXJhbCBpbnB1dHMgdGhhdCBpdCBkaWRuJ3QgdXNlIGFuZCBhbHNvCj4gbG9ja2Vk
L3VubG9ja2VkIGdmbnMgd2hlbiBpdCBkaWRuJ3QgbmVlZCB0by4KPgo+IFNpZ25lZC1vZmYtYnk6
IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KClJldmlld2VkLWJ5OiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKU29ycnkgLSB0aGlzIGZlbGwg
b2ZmIG15IHJhZGFyLsKgIEkndmUgZ290IGEgc2VwYXJhdGUgc2VyaWVzIHdoaWNoCnBhcnRpYWxs
eSBvdmVybGFwcyB3aXRoIHRoaXMuCgpJZiBHZW9yZ2UgaXMgaGFwcHkgd2l0aCBib3RoLCBJJ2xs
IHNlZSBhYm91dCB0YWtpbmcgdGhpcyBhbmQKcmViYXNpbmcvc3BsaWNpbmcgbXkgZml4ZXMgYXJv
dW5kIGl0IG9uIGNvbW1pdC4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
