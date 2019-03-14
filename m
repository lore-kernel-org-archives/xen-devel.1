From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 1/4] x86: stop handling MSR_IA32_BNDCFGS
 save/restore in implementation code
Date: Thu, 14 Mar 2019 08:23:51 -0600
Message-ID: <5C8A63F7020000780021EB5B@prv1-mh.provo.novell.com>
References: <20190314135125.1958-1-paul.durrant@citrix.com>
 <20190314135125.1958-2-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4RH0-0003LV-67
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 14:23:54 +0000
In-Reply-To: <20190314135125.1958-2-paul.durrant@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAzLjE5IGF0IDE0OjUxLCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IFNhdmluZyBhbmQgcmVzdG9yaW5nIHRoZSB2YWx1ZSBvZiB0aGlzIE1TUiBpcyBjdXJyZW50
bHkgaGFuZGxlZCBieQo+IGltcGxlbWVudGF0aW9uLXNwZWNpZmljIGNvZGUgZGVzcGl0ZSBpdCBi
ZWluZyBhcmNoaXRlY3R1cmFsLiBUaGlzIHBhdGNoCj4gbW92ZXMgaGFuZGxpbmcgb2YgYWNjZXNz
ZXMgdG8gdGhpcyBNU1IgZnJvbSBodm0uYyBpbnRvIHRoZSBtc3IuYywgdGh1cwo+IGFsbG93aW5n
IHRoZSBjb21tb24gTVNSIHNhdmUvcmVzdG9yZSBjb2RlIHRvIGhhbmRsZSBpdC4KPiAKPiBOT1RF
OiBCZWNhdXNlIHZteF9nZXQvc2V0X2d1ZXN0X2JuZGNmZ3MoKSBjYWxsIHZteF92bWNzX2VudGVy
KCksIHRoZQo+ICAgICAgIHN0cnVjdCB2Y3B1IHBvaW50ZXIgcGFzc2VkIGluLCBhbmQgaGVuY2Ug
dGhlIHZjcHUgcG9pbnRlciBwYXNzZWQgdG8KPiAgICAgICBndWVzdF9yZG1zcigpIGNhbm5vdCBi
ZSBjb25zdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
