From: "Jan Beulich" <JBeulich@suse.com>
Subject: 4.12 Ping: [PATCH] x86/cpuid: add missing PCLMULQDQ
 dependency
Date: Tue, 05 Mar 2019 09:46:21 -0700
Message-ID: <5C7EA7DD020000780021BD35@prv1-mh.provo.novell.com>
References: <5C701EF0020000780021951E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M+W2=RI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h1DCz-0000bf-W4
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 16:46:26 +0000
In-Reply-To: <5C701EF0020000780021951E@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjAyLjE5IGF0IDE3OjEwLCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+IFNp
bmNlIHdlIGNhbid0IHNlZW0gdG8gYmUgYWJsZSB0byBzZXR0bGUgb3VyIGRpc2N1c3Npb24gZm9y
IHRoZSB3aWRlcgo+IGFkanVzdG1lbnQgcHJldmlvdXNseSBwb3N0ZWQsIGxldCdzIGF0IGxlYXN0
IGFkZCB0aGUgbWlzc2luZyBkZXBlbmRlbmN5Cj4gZm9yIDQuMTIuIEknbSBub3QgY29udmluY2Vk
IHRob3VnaCB0aGF0IGF0dGFjaGluZyBpdCB0byBTU0UgaXMgY29ycmVjdC4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBbmRyZXcgZ2F2ZSBoaXMg
YWNrIG9uIHRoZSAyNXRoLCBidXQgaXQgc2VlbXMgbGlrZSB0aGUgcmVzdCBvZiB0aGUgQ2MgbGlz
dApnb3QgZHJvcHBlZCBhdCB0aGF0IHBvaW50LCBzbyBJIGd1ZXNzIHlvdSBkaWRuJ3Qgbm90aWNl
IGl0LiBJcyBpdCB0b28gbGF0ZQpub3cgZm9yIDQuMTI/CgpKYW4KCj4gLS0tIGEveGVuL3Rvb2xz
L2dlbi1jcHVpZC5weQo+ICsrKyBiL3hlbi90b29scy9nZW4tY3B1aWQucHkKPiBAQCAtMTk3LDcg
KzE5Nyw3IEBAIGRlZiBjcnVuY2hfbnVtYmVycyhzdGF0ZSk6Cj4gICAgICAgICAgIyAlWE1NIHN1
cHBvcnQsIHdpdGhvdXQgc3BlY2lmaWMgaW50ZXItZGVwZW5kZW5jaWVzLiAgQWRkaXRpb25hbGx5
Cj4gICAgICAgICAgIyBBTUQgaGFzIGEgc3BlY2lhbCBtaXMtYWxpZ25tZW50IHN1Yi1tb2RlLgo+
ICAgICAgICAgIFNTRTogW1NTRTIsIFNTRTMsIFNTU0UzLCBTU0U0QSwgTUlTQUxJR05TU0UsCj4g
LSAgICAgICAgICAgICAgQUVTTkksIFNIQV0sCj4gKyAgICAgICAgICAgICAgQUVTTkksIFBDTE1V
TFFEUSwgU0hBXSwKPiAgCj4gICAgICAgICAgIyBTU0UyIHdhcyByZS1zcGVjaWZpZWQgYXMgY29y
ZSBpbnN0cnVjdGlvbnMgZm9yIDY0Yml0Lgo+ICAgICAgICAgIFNTRTI6IFtMTV0sCgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
