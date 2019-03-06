From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 1/9] xen: use __UINTPTR_TYPE__ for
 uintptr_t
Date: Wed, 06 Mar 2019 00:47:50 -0700
Message-ID: <5C7F7B26020000780021BF3A@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1903051433230.17552@sstabellini-ThinkPad-X260>
 <1551825512-8975-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=u+pJ=RJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1RHO-0004Dr-I1
 for xen-devel@lists.xenproject.org; Wed, 06 Mar 2019 07:47:54 +0000
In-Reply-To: <1551825512-8975-1-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA1LjAzLjE5IGF0IDIzOjM4LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gVXNlIF9fVUlOVFBUUl9UWVBFX18gdG8gZGVmaW5lIHVpbnRwdHJfdC4gQSBsYXRlciBwYXRj
aCB3aWxsIG1ha2UgdXNlIG9mCj4gX19QVFJESUZGX1RZUEVfXyB0byBkZWZpbmUgcHRyZGlmZl90
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGlsaW54
LmNvbT4KPiBSZXZpZXdlZC1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+CgpBcyBiZWZvcmUgLSBJIG9iamVjdCB0byB0aGlzIGNoYW5nZSB3aXRob3V0IHRoZSBkZXNj
cmlwdGlvbiBzdXBwbHlpbmcKYm90aCBhIHJlYXNvbiAod2hpY2ggd291bGQgYmV0dGVyIGFsc28g
ZXhwbGFpbiB3aHkgdGhlIGN1cnJlbnQgd2F5Cm9mIGRlZmluaW5nIHVpbnRwdHJfdCBpcyBkZXRy
aW1lbnRhbCkgYW5kIGEgZGlzY3Vzc2lvbiB3aHkgaXQgaXMgb2theSBmb3IKdXMgdG8gdXNlIF9f
VUlOVFBUUl9UWVBFX18sIGRlc3BpdGUgKGF0IGxlYXN0KSBnY2MgbWFraW5nIHRoaXMKYXZhaWxh
YmxlIG9ubHkgdW5kZXIgY2VydGFpbiBjb25kaXRpb25zIChpLmUuIGl0IHdvdWxkIG5lZWQgdG8g
YmUKY29uZmlybWVkIHRoYXQgd2hhdGV2ZXIgdGhlIGNvbmRpdGlvbnMgdGhleSdyZSBhbHdheXMg
bWV0IGZvciB1cykuCgpXaXRoIHRoaXMgSSB0aGluayBpdCBpcyBwcmV0dHkgY2xlYXIgdGhhdCB5
b3Ugd291bGQgYmV0dGVyIGhhdmUgc3BsaXQKdGhlIG9yaWdpbmFsIHBhdGNoIHRoZSBvdGhlciB3
YXkgYXJvdW5kIC0gdGhlIHVuY29udHJvdmVyc2lhbCBvbmUKZmlyc3QsIGFzIHRoYXQgb25lIG5v
dyB3b3VsZG4ndCBhcHBseSB3aXRob3V0IHRoZSBvbmUgaGVyZS4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
