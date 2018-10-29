From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 2/7] x86/hvm: introduce a define for the
 debug output IO port
Date: Mon, 29 Oct 2018 10:51:07 -0600
Message-ID: <5BD73A7B02000078001F5F11@prv1-mh.provo.novell.com>
References: <20181019152021.64607-1-roger.pau@citrix.com>
 <20181019152021.64607-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gHAkz-0002YG-6P
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 16:51:13 +0000
In-Reply-To: <20181019152021.64607-3-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE3OjIwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4Kd2l0aCBvbmUgcmVtYXJrOgoKPiAtLS0gYS94ZW4vaW5j
bHVkZS9wdWJsaWMvYXJjaC14ODYveGVuLmgKPiArKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvYXJj
aC14ODYveGVuLmgKPiBAQCAtMzQ2LDYgKzM0NiwxMiBAQCBzdHJ1Y3QgeGVuX2FyY2hfZG9tYWlu
Y29uZmlnIHsKPiAgI2RlZmluZSBYRU5fQ1BVSUQgICAgICAgICAgWEVOX0VNVUxBVEVfUFJFRklY
ICJjcHVpZCIKPiAgI2VuZGlmCj4gIAo+ICsvKgo+ICsgKiBEZWJ1ZyBjb25zb2xlIElPIHBvcnQs
IGFsc28gY2FsbGVkICJwb3J0IEU5IGhhY2siLiBFYWNoIGNoYXJhY3RlciB3cml0dGVuCj4gKyAq
IHRvIHRoaXMgSU8gcG9ydCB3aWxsIGJlIHByaW50ZWQgb24gdGhlIGh5cGVydmlzb3IgY29uc29s
ZS4KPiArICovCj4gKyNkZWZpbmUgWEVOX0hWTV9ERUJVR0NPTlNfSU9QT1JUIDB4ZTkKClBlcmhh
cHMgYW1lbmQgdGhlIGNvbW1lbnQgd2l0aCAiLi4uLCBzdWJqZWN0IHRvIGxvZyBsZXZlbApyZXN0
cmljdGlvbnMiPyBFYXNpbHkgZG9uZSB3aGlsZSBjb21taXR0aW5nLgoKRlRSIEknbSBhIGxpdHRs
ZSB1bmVhc3kgYWJvdXQgYWRkaW5nIHRoaXMgdG8gdGhlIHB1YmxpYwppbnRlcmZhY2UsIGJ1dCBv
dG9oIGV4dGVybmFsIGNvbXBvbmVudHMgYWxyZWFkeSB1c2UgaXQgYXMKaWYgaXQgd2FzIHBhcnQg
b2YgaXQuCgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
