From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/3] string: avoid undefined behavior in
 strrchr()
Date: Mon, 07 Jan 2019 03:04:49 -0700
Message-ID: <5C332441020000780020ABCC@prv1-mh.provo.novell.com>
References: <5C331C51020000780020AB3F@prv1-mh.provo.novell.com>
 <5C331E3E020000780020AB50@prv1-mh.provo.novell.com>
 <270e0e52-d344-7d7d-d044-820bedda13f3@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=yoBP=PP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggRmA-00025u-2E
 for xen-devel@lists.xenproject.org; Mon, 07 Jan 2019 10:04:54 +0000
In-Reply-To: <270e0e52-d344-7d7d-d044-820bedda13f3@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDEwOjQ5LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBPbiAw
Ny8wMS8yMDE5IDEwOjM5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIHByZS1kZWNyZW1lbnQg
d291bGQgbm90IG9ubHkgY2F1c2UgbWlzYmVoYXZpb3Igd2hlbiB3cmFwcGluZyAoYmVuaWduCj4+
IGJlY2F1c2UgdGhlcmUgc2hvdWxkbid0IGJlIGFueSBOVUxMIHBvaW50ZXJzIHBhc3NlZCBpbiks
IGJ1dCBtYXkgYWxzbwo+PiBjcmVhdGUgYSBwb2ludGVyIHBvaW50aW5nIG91dHNpZGUgdGhlIG9i
amVjdCB0aGF0IHRoZSBwYXNzZWQgaW4gcG9pbnRlcgo+PiBwb2ludHMgdG8gKGl0IHdvbid0IGJl
IGRlLXJlZmVyZW5jZWQgdGhvdWdoKS4gVXNlIHBvc3QtZGVjcmVtZW50IChhbmQgPgo+PiBpbnN0
ZWFkIG9mID49ICkgaW5zdGVhZC4KPiAKPiBUaGlzIGNvbW1pdCBtZXNzYWdlIGRvZXNuJ3QgbWF0
Y2ggdGhlIHBhdGNoLiBUaGVyZSBpcyBubyBwb3N0LWRlY3JlbWVudAo+IGFuZCAnPicgaW52b2x2
ZWQuCgpPaCwgaW5kZWVkLCB0aGF0IHdhcyBzdGFsZSBmcm9tIGEgZmlyc3QgYXR0ZW1wdCwgdW50
aWwgSSByZWFsaXplZCB0aGF0CnRoZSBwb3N0LWRlY3JlbWVudCB3b3VsZCBtYWtlIHRoaW5ncyBv
bmx5IG1hcmdpbmFsbHkgYmV0dGVyLiBJJ3ZlCnNpbXBseSBkcm9wcGVkIHRoYXQgc2VudGVuY2Uu
Cgo+IFdpdGggdGhhdCBmaXhlZCB5b3UgY2FuIGFkZDoKPiAKPiBSZXZpZXdlZC1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKVGhhbmtzLCBKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
