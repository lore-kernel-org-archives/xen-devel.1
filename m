From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/2] SVM: re-work VMCB sync-ing
Date: Mon, 30 Apr 2018 10:01:18 -0600
Message-ID: <5AE73DCE02000078001BFB0D@prv1-mh.provo.novell.com>
References: <5AE6ED2302000078001BF867@prv1-mh.provo.novell.com>
 <5AE6FFEA02000078001BF8A2@prv1-mh.provo.novell.com>
 <2eb0fe3c-7ff5-e731-d64c-8d04d082acce@oracle.com>
 <5AE73B5602000078001BFAEF@prv1-mh.provo.novell.com>
 <efe20d13-bbb1-3376-0e6c-4df376dc241f@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=xfxw=ht=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fDBEx-0001ch-8D
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 16:01:23 +0000
In-Reply-To: <efe20d13-bbb1-3376-0e6c-4df376dc241f@oracle.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjA0LjE4IGF0IDE3OjU2LCA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+IHdy
b3RlOgo+IE9uIDA0LzMwLzIwMTggMTE6NTAgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBP
biAzMC4wNC4xOCBhdCAxNzozMCwgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPiB3cm90ZToK
Pj4+IE9uIDA0LzMwLzIwMTggMDc6MzcgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IEBAIC0x
MTY4LDYgKzExNjksOSBAQCBzdGF0aWMgdm9pZCBub3JldHVybiBzdm1fZG9fcmVzdW1lKHN0cnVj
Cj4+Pj4gIAo+Pj4+ICAgICAgaHZtX2RvX3Jlc3VtZSh2KTsKPj4+PiAgCj4+Pj4gKyAgICBpZiAo
IHYtPmFyY2guaHZtX3N2bS52bWNiX3N5bmNfc3RhdGUgPT0gdm1jYl9uZWVkc192bWxvYWQgKQo+
Pj4+ICsgICAgICAgIHN2bV9zeW5jX3ZtY2Iodiwgdm1jYl9uZWVkc192bXNhdmUpOwo+Pj4KPj4+
IElzIGl0IG5vdCBwb3NzaWJsZSAob3IgYWR2aXNhYmxlKSB0byBtb3ZlIHRoZSB0ZXN0IGludG8g
c3ZtX3N5bmNfdm1jYigpCj4+PiAoYW5kIGRyb3AgdGhlIEFTU0VSVCB0aGVyZSk/Cj4+IEl0IGlz
IHBvc3NpYmxlOyBJJ20gbm90IHN1cmUgbXlzZWxmIGlmIGl0J3MgYWR2aXNhYmxlLCBidXQgSSB0
YWtlIHlvdSBhc2tpbmcgdGhlCj4+IHF1ZXN0aW9uIGFzIHlvdSB0aGlua2luZyBpdCBpcywgc28g
SSdsbCBjaGFuZ2UgaXQuCj4gCj4gVGhhdCB3YXMgcmVhbGx5IHRoZSBtYWluIHJlYXNvbiBmb3Ig
bWUgYXNraW5nIHRvIG1vdmUgc3ZtX3ZtbG9hZCBpbnRvCj4gc3ZtX3N5bmNfdm1jYigpIC0tLSB0
byBoaWRlIGFsbCBsb2dpYyByZWxhdGVkIHRvIHRoZSBzeW5jIHN0YXRlIG1hY2hpbmUKPiB0aGVy
ZS4KCldlbGwsIHRoZXJlJ3Mgc3RpbGwgdGhlIGNvZGUgaW4gc3ZtX3ZtZXhpdF9kb192bWxvYWQo
KS4gRGVwZW5kaW5nIG9uCnlvdXIgb3BpbmlvbiBvbiB0aGUgcG9zdC1jb21taXQtbWVzc2FnZSBx
dWVzdGlvbiBpbiBwYXRjaCAyLCB0aGUgb25lCmF0IHRoZSB0b3Agb2Ygc3ZtX3ZtZXhpdF9oYW5k
bGVyKCkgbWlnaHQgZ28gYXdheSBpbiB0aGF0IHBhdGNoLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
