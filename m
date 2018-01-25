From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix GET_STACK_END
Date: Thu, 25 Jan 2018 03:55:49 -0700
Message-ID: <5A69C5C502000078001A24C3@prv-mh.provo.novell.com>
References: <20180124202626.2506-1-wei.liu2@citrix.com>
 <c5e997370c234c448f2aedf406e515e2@AMSPEX02CL02.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=vltw=eu=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eefCG-0005ny-JA
 for xen-devel@lists.xenproject.org; Thu, 25 Jan 2018 10:55:56 +0000
In-Reply-To: <c5e997370c234c448f2aedf406e515e2@AMSPEX02CL02.citrite.net>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE4IGF0IDIxOjQ4LCA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRnJvbTogV2VpIExpdSBbd2VpLmxpdTJAY2l0cml4LmNvbV0KPiBTZW50OiAyNCBKYW51
YXJ5IDIwMTggMjA6MjYKPiAKPiBBSVVJIHRoZSBwdXJwb3NlIG9mIGhhdmluZyB0aGUgLmlmIGRp
cmVjdGl2ZSBpcyB0byBtYWtlIEdFVF9TVEFDS19FTkQKPiB3b3JrIHdpdGggYW55IGdlbmVyYWwg
cHVycG9zZSByZWdpc3RlcnMuIFRoZSBjb2RlIGFzLWlzIHdvdWxkIHByb2R1Y2UKPiB0aGUgd3Jv
bmcgcmVzdWx0IGZvciByOC4gRml4IGl0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdl
aS5saXUyQGNpdHJpeC5jb20+Cj4gCj4gT29wcy4gIEFja2VkLWJ5OiBBbmRyZXcgQ29vcGVyIOKJ
pGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb23iiaUKCk9vcHMgaW5kZWVkIC0gbHVja2lseSB0aGUg
YnVpbGQgd291bGQgaGF2ZSBmYWlsZWQgaW4gc3VjaCBhIGNhc2UsCnJhdGhlciB0aGFuIHByb2R1
Y2luZyBhIGJyb2tlbiBiaW5hcnkuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
