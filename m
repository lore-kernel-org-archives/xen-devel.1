From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.12 v3 8/8] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
Date: Tue, 25 Dec 2018 02:40:49 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19BEBE89A@SHSMSX101.ccr.corp.intel.com>
References: <20181221162650.11515-1-julien.grall@arm.com>
 <20181221162650.11515-9-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=f35z=PC=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gbceQ-0003B5-42
 for xen-devel@lists.xenproject.org; Tue, 25 Dec 2018 02:40:58 +0000
In-Reply-To: <20181221162650.11515-9-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKdWxpZW4gR3JhbGwNCj4gU2VudDogU2F0dXJkYXksIERlY2VtYmVyIDIyLCAyMDE4
IDEyOjI3IEFNDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4NCj4gDQo+IE9u
bHkgcmVhc29uYWJsZSBjbGVhbi11cHMgYXJlIGRvbmUgaW4gdGhpcyBwYXRjaC4gVGhlIHJlc3Qg
d2lsbCB1c2UgX2dmbg0KPiBmb3IgdGhlIHRpbWUgYmVpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiBBY2tlZC1ieTogSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiANCg0KUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4g
PGtldmluLnRpYW5AaW50ZWwuY29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
