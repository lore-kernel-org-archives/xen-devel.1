From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] adjust special domain creation (and
 call it earlier on x86)
Date: Fri, 31 May 2019 04:09:02 -0600
Message-ID: <5CF0FD3E0200007800233E7F@prv1-mh.provo.novell.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5460200007800233DA8@prv1-mh.provo.novell.com>
 <c77d9ace-20bb-94a4-b566-57a290b9b293@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeTF-0007Gj-QG
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 10:09:09 +0000
In-Reply-To: <c77d9ace-20bb-94a4-b566-57a290b9b293@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjA1LjE5IGF0IDEyOjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMzEvMTkgMTA6MzUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vZG9tYWluLmgKPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL2RvbWFpbi5oCj4+IEBA
IC01LDYgKzUsNyBAQAo+PiAgICNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPj4gICAKPj4gICAjaW5j
bHVkZSA8cHVibGljL3hlbi5oPgo+PiArCj4gCj4gV2l0aG91dCBhbiBleHBsYW5hdGlvbiBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UsIHRoaXMgbG9va3MgbGlrZSBhIHNwdXJpb3VzIAo+IGNoYW5nZS4K
Ck9oLCBpdCBpbmRlZWQgaXMgLSBpdCdzIGEgbGVmdG92ZXIgZnJvbSB3aGVyZSBJIGhhZCBmaXJz
dCB0cmllZCB0byBwbGFjZQp0aGUgZGVjbGFyYXRpb25zLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
