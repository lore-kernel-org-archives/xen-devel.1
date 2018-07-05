From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] console: avoid printing no or null time
 stamps
Date: Thu, 5 Jul 2018 18:31:02 +0100
Message-ID: <fc38ddbc-1b23-3b7d-bd5f-20c15cd266d3@citrix.com>
References: <5B3E224D02000078001D18B7@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ses3=jv=citrix.com=prvs=7171960be=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fb85y-0006HT-3X
 for xen-devel@lists.xenproject.org; Thu, 05 Jul 2018 17:31:06 +0000
In-Reply-To: <5B3E224D02000078001D18B7@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMDcvMTggMTQ6NTEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IER1cmluZyBlYXJseSBib290
IHRpbWVzdGFtcHMgYXJlbid0IHZlcnkgdXNlZnVsLCBhcyB0aGV5J3JlIGFsbCB6ZXJvCj4gKGlu
ICJib290IiBtb2RlKSBvciBhYnNlbnQgYWx0b2dldGhlciAoaW4gImRhdGUiIGFuZCAiZGF0ZW1z
IiBtb2RlcykuCj4gTG9nICJib290IiBmb3JtYXQgdGltZXN0YW1wcyB3aGVuIHRoZSBkYXRlIGZv
cm1hdHMgYXJlbid0IGF2YWlsYWJsZSB5ZXQsCj4gYW5kIGxvZyByYXcgdGltZXN0YW1wcyB3aGVu
IGJvb3Qgb25lcyBhcmUgc3RpbGwgYWxsIHplcm8uIEFsc28gYWRkIGEKPiAicmF3IiBtb2RlLgo+
Cj4gRm9yIHRoZSBBUk0gc2lkZSBnZXRfY3ljbGVzKCkgdG8gcHJvZHVjZSBhIG1lYW5pbmdmdWwg
dmFsdWUsIEFSTSdzCj4gY3ljbGVfdCBnZXRzIGNoYW5nZWQgdG8gdWludDY0X3QuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpSZXZpZXdlZC1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
