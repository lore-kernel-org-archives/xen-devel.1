From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH] traps: coding style fixes
Date: Tue, 11 Sep 2018 11:40:50 +0100
Message-ID: <f9064d01-34a6-4945-8886-74e6458c2340@arm.com>
References: <1536650302-3013-1-git-send-email-andrii.anisov@gmail.com>
 <5B977B9A02000078001E7097@prv1-mh.provo.novell.com>
 <dc2913f3-623d-3b84-58e6-66011f328334@epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=xkfk=lz=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fzg6I-0006q2-5Y
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 10:40:54 +0000
In-Reply-To: <dc2913f3-623d-3b84-58e6-66011f328334@epam.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>, andrii.anisov@gmail.com
Cc: xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini <sstabellini@kernel.org>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMS8wOS8xOCAxMDowNCwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKYW4sCj4g
Cj4gCj4gT24gMTEuMDkuMTggMTE6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUd28gdGhpbmdz
OiBDb3VsZCB5b3UgcGxlYXNlIG1ha2UgeW91ciBzdWJqZWN0IG1ha2UgY2xlYXIgdGhpcyBpcwo+
PiBhYm91dCBBUk0sIHNvIHRoYXQgcGVvcGxlIGtub3cgd2hldGhlciB0byBsb29rIGF0IHRoZSBw
YXRjaD8KPiBHb3QgaXQuCj4gCj4+IEFuZCAtIHNpbmNlIHRoaXMgcGF0dGVybiByZXBlYXRzIC0g
Y291bGQgeW91IHBsZWFzZSByZWZyYWluIGZyb20KPj4gc3BhbW1pbmcgdGhlIGxpc3QgYnkgc2Vu
ZGluZyBhbGwgb2YgeW91ciBwYXRjaGVzIHR3aWNlIChvbmNlIFRvCj4+IHRoZSBsaXN0LCBhbmQg
b25jZSB3aXRoIHRoZSBsaXN0IG9uIENjOyBJJ3ZlIGRyb3BwZWQgdGhlIFRvIHBhcnQKPj4gaGVy
ZSwgd2hpbGUgeW91IHNob3VsZCBkcm9wIHRoZSBDYyBwYXJ0KT8KPiBJIGd1ZXNzIGl0J3MgYSBy
ZXN1bHQgb2YgYGdpdCBzZW5kLWVtYWlsIAo+IC0tY2MtY21kPXNjcmlwdHMvZ2V0X21haW50YWlu
ZXIucGwuLi5gLiBJJ2xsIHJldmlldyBteSBwdWJsaXNoaW5nIHN0ZXBzIAo+IHRvIGF2b2lkIHRo
aXMuCgpXaGF0J3MgeW91ciBmdWxsIGNvbW1hbmQ/IEFsbCBvY2N1cnJlbmNlIG9mIHhlbi5vcmcg
aGFzIGJlZW4gcmVtb3ZlZCBhIAp3aGlsZSBhZ28uLi4gU28gaXQgc2hvdWxkIG5vdCBoYXBwZW4g
dW5sZXNzIHlvdSB1c2UgYW4gb2xkIHRyZWUuCgpXaXRoIFhlbiA0LjExIGFuZCBvbndhcmRzLCB5
b3UgY2FuIHVzZSBzY3JpcHRzL2FkZF9tYWludGFpbmVyLnBsLiBJdCAKd2lsbCBhZGQgQ0MgZm9y
IG1haW50YWluZXJzIG9mIGVhY2ggcGF0Y2ggYW5kIGNvdmVyIGxldHRlci4KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
