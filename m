From: Paul Durrant <Paul.Durrant@citrix.com>
Subject: Re: [PATCH] tools/libxendevicemodel: add
 xendevicemodel_modified_memory_bulk to map
Date: Fri, 15 Feb 2019 11:29:57 +0000
Message-ID: <10248c3eedaf4a319df82f5573c737ba@AMSPEX02CL03.citrite.net>
References: <20190215100200.13600-1-paul.durrant@citrix.com>
 <f7fc77a527f84836acda60c1443c30bc@AMSPEX02CL03.citrite.net>
 <23654.41500.489228.509602@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=skQ2=QW=citrix.com=prvs=9420f6528=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1gubgv-0001jX-3c
 for xen-devel@lists.xenproject.org; Fri, 15 Feb 2019 11:30:01 +0000
In-Reply-To: <23654.41500.489228.509602@mariner.uk.xensource.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <Ian.Jackson@citrix.com>
Cc: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIFttYWlsdG86
aWFuLmphY2tzb25AY2l0cml4LmNvbV0KPiBTZW50OiAxNSBGZWJydWFyeSAyMDE5IDExOjI3Cj4g
VG86IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT47Cj4g
amdyb3NzQHN1c2UuY29tCj4gU3ViamVjdDogUkU6IFtQQVRDSF0gdG9vbHMvbGlieGVuZGV2aWNl
bW9kZWw6IGFkZAo+IHhlbmRldmljZW1vZGVsX21vZGlmaWVkX21lbW9yeV9idWxrIHRvIG1hcAo+
IAo+IFBhdWwgRHVycmFudCB3cml0ZXMgKCJSRTogW1BBVENIXSB0b29scy9saWJ4ZW5kZXZpY2Vt
b2RlbDogYWRkCj4geGVuZGV2aWNlbW9kZWxfbW9kaWZpZWRfbWVtb3J5X2J1bGsgdG8gbWFwIik6
Cj4gPiBDYy1pbmcgSnVlcmdlbiwgaW4gY2FzZSB0aGlzIGNhbiBtYWtlIDQuMTIuLi4KPiAKPiBJ
IHRoaW5rIHRoaXMgc2hvdWxkIGdvIGludG8gNC4xMi4gIEl0IGlzIHZlcnkgbG93IHJpc2suCj4g
Cj4gSW4gYW5vdGhlciBjYXNlIHRoZXJlIHdvdWxkIHBvc3NpYmx5IGJlIHF1ZXN0aW9ucyBhYm91
dCB3aGV0aGVyIHdlCj4gd2FudGVkIHRvIGFkZCBhbiBhZGRpdGlvbmFsIEFCSS9BUEkgc3RhYmls
aXR5IHByb21pc2UsIGJ1dCBpbiB0aGlzCj4gY2FzZSB0aGlzIGlzIG5vdCBhbiBpc3N1ZS4KCk5v
LCBpbmRlZWQuCgpQZXJoYXBzIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGJ1aWxkIHNvbWUgc29y
dCBvZiBjcm9zcy1jaGVjayB0aGF0IGFsbCBmdW5jdGlvbnMgbGlzdGVkIGluIHRoZSBwdWJsaWMg
aGVhZGVyIG9mIGEgbGlicmFyeSBhcmUgYWN0dWFsbHkgKnNvbWV3aGVyZSogaW4gdGhlIG1hcCBm
aWxlLCBzbyB0aGlzIGRvZXNuJ3QgaGFwcGVuIGluIGZ1dHVyZS4KCiAgUGF1bAoKPiAKPiBJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
