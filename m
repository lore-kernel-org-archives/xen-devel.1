From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH for-4.12 v2] xen/iommu: fix iommu_ops
 initialization
Date: Tue, 12 Feb 2019 06:26:24 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19C9383A5@SHSMSX104.ccr.corp.intel.com>
References: <20190201162945.26461-1-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EEWQ=QT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1gtRWY-000768-C9
 for xen-devel@lists.xenproject.org; Tue, 12 Feb 2019 06:26:30 +0000
In-Reply-To: <20190201162945.26461-1-jgross@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIFttYWlsdG86amdyb3NzQHN1c2UuY29tXQo+IFNlbnQ6IFNh
dHVyZGF5LCBGZWJydWFyeSAyLCAyMDE5IDEyOjMwIEFNCj4gCj4gQ29tbWl0IDMyYTVlYTAwZWM3
NWVmNTNlICgiSU9NTVUveDg2OiByZW1vdmUgaW5kaXJlY3Rpb24gZnJvbQo+IGNlcnRhaW4KPiBJ
T01NVSBob29rIGFjY2Vzc2VzIikgaW50cm9kdWNlZCBpb21tdV9vcHMgaW5pdGlhbGl6ZWQgYXQg
Ym9vdCB0aW1lCj4gd2l0aCBkYXRhIGRlY2xhcmVkIGFzIF9faW5pdGNvbnN0cmVsLgo+IAo+IE9u
IEludGVsIHN5c3RlbXMgdGhlcmUgaXMgYW5vdGhlciBwYXRoIHdoZXJlIGlvbW11X29wcyBpcyBp
bml0aWFsaXplZAo+IGFuZCB0aGlzIHBhdGggaXMgcmVsZXZhbnQgb24gcmVzdW1lIGFmdGVyIHJl
dHVybmluZyBmcm9tIHN5c3RlbSBzdXNwZW5kLgo+IEFzIHRoZSBpbml0aWFsaXphdGlvbiBkYXRh
IGlzIG5vIGxvbmdlciBhY2Nlc3NpYmxlIGluIHRoaXMgY2FzZSB0aGF0Cj4gc2Vjb25kIGluaXRp
YWxpemF0aW9uIG11c3QgYmUgZHJvcHBlZCBpbiBjYXNlIHRoZSBzeXN0ZW0gaXNuJ3QganVzdAo+
IGJvb3RpbmcuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKQWNrZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
