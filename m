From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/libxendevicemodel: add
 xendevicemodel_modified_memory_bulk to map
Date: Fri, 15 Feb 2019 13:05:36 +0100
Message-ID: <ce628c63-ad85-ef20-2b04-e43abce3c38f@suse.com>
References: <20190215100200.13600-1-paul.durrant@citrix.com>
 <f7fc77a527f84836acda60c1443c30bc@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LI7m=QW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gucFR-0005Vf-3G
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 12:05:41 +0000
In-Reply-To: <f7fc77a527f84836acda60c1443c30bc@AMSPEX02CL03.citrite.net>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDIvMjAxOSAxMTozMSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IENjLWluZyBKdWVyZ2Vu
LCBpbiBjYXNlIHRoaXMgY2FuIG1ha2UgNC4xMi4uLgo+IAo+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQo+PiBGcm9tOiBQYXVsIER1cnJhbnQgW21haWx0bzpwYXVsLmR1cnJhbnRAY2l0cml4
LmNvbV0KPj4gU2VudDogMTUgRmVicnVhcnkgMjAxOSAxMDowMgo+PiBUbzogeGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCj4+IENjOiBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRy
aXguY29tPjsgSWFuIEphY2tzb24KPj4gPElhbi5KYWNrc29uQGNpdHJpeC5jb20+OyBXZWkgTGl1
IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+PiBTdWJqZWN0OiBbUEFUQ0hdIHRvb2xzL2xpYnhlbmRl
dmljZW1vZGVsOiBhZGQKPj4geGVuZGV2aWNlbW9kZWxfbW9kaWZpZWRfbWVtb3J5X2J1bGsgdG8g
bWFwCj4+Cj4+IENvbW1pdCBlM2I5M2IzYzU5NSAiZG1vcDogYWRkIHhlbmRldmljZW1vZGVsX21v
ZGlmaWVkX21lbW9yeV9idWxrKCkiIGFkZGVkCj4+IHRoZSBpbXBsZW1lbnRhdGlvbiB0byB0aGUg
bGlicmFyeSBhbG1vc3QgMiB5ZWFycyBhZ28sIGJ1dCB0aGUgZnVuY3Rpb24KPj4gd2FzIG5vdCBp
bmNsdWRlZCBpbiB0aGUgbWFwIGZpbGUsIGVzc2VudGlhbGx5IG1ha2luZyBpdCB1c2VsZXNzLiBU
aGlzCj4+IHBhdGNoIHJlY3RpZmllcyB0aGUgc2l0dWF0aW9uLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgoKUmVsZWFzZS1hY2tlZC1i
eTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
