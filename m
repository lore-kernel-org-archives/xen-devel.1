From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 09/16] x86: don't setup PV hypercall
 stubs and entries when !CONFIG_PV
Date: Mon, 29 Oct 2018 08:37:22 -0600
Message-ID: <5BD71B2202000078001F5DB2@prv1-mh.provo.novell.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <d56160401792b0f11ab83892907435b2346c2524.1539959287.git-series.wei.liu2@citrix.com>
 <e487c6bb-053d-3923-8309-11c46cd7fb68@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=m5uw=nj=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gH8fY-0006QY-T8
 for xen-devel@lists.xenproject.org; Mon, 29 Oct 2018 14:37:28 +0000
In-Reply-To: <e487c6bb-053d-3923-8309-11c46cd7fb68@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjEwLjE4IGF0IDE3OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMTAvMTggMTU6MjgsIFdlaSBMaXUgd3JvdGU6Cj4+IEBAIC0zNDcsNiArMzUy
LDcgQEAgdm9pZCBzdWJhcmNoX3BlcmNwdV90cmFwc19pbml0KHZvaWQpCj4+ICAgICAgLyogQ29t
bW9uIFNZU0NBTEwgcGFyYW1ldGVycy4gKi8KPj4gICAgICB3cm1zcmwoTVNSX1NUQVIsIFhFTl9N
U1JfU1RBUik7Cj4+ICAgICAgd3Jtc3JsKE1TUl9TWVNDQUxMX01BU0ssIFhFTl9TWVNDQUxMX01B
U0spOwo+PiArI2VuZGlmCj4gCj4gSXQgd291bGQgYmUgYSB3aXNlIHByZWNhdXRpb24gdG8gaW5p
dGlhbGlzZSB0aGVzZSBNU1JzIHRvIDAgaW4gdGhlICFQVgo+IGNhc2UsIHNvIHdlIGRvbid0IHJl
dGFpbiBzdGFsZSB2YWx1ZXMuCgpJZiBhbnl0aGluZywgRUZFUi5TQ0UgbmVlZHMgdG8gYmUga2Vw
dCBjbGVhciwgYXMgdGhhdCdzIHdoYXQKY29udHJvbHMgd2hldGhlciBTWVNDQUxMIHdvdWxkIHJh
aXNlICNHUCgwKS4gQnV0IHdpdGhvdXQgYQpQViBkb21haW4gYXJvdW5kLCBub3RoaW5nIGNhbiBh
Y2Nlc3MgdGhlIGhvc3QgdmFsdWVzIG9mCnRoZXNlIE1TUnMgaW4gdGhlIGZpcnN0IHBsYWNlLCBz
byBpbnN0ZWFkIHdlIGNvdWxkIHNpbXBsaWZ5CnNvbWUgY29udGV4dCBzd2l0Y2hpbmcgYnkgbmV2
ZXIgcmVzdG9yaW5nIGhvc3QgdmFsdWVzLCBhbmQKb25seSBldmVyIGxvYWRpbmcgZ3Vlc3Qgb25l
cy4gRXhjZXB0IHRoYXQsIG9mIGNvdXJzZSwgVk1MT0FECmlzIGFuIGFsbC1vci1ub3RoaW5nIGlu
c24sIGFuZCB3ZSBuZWVkIHRvIHVzZSB0byBnZXQgVFIgbG9hZGVkLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
