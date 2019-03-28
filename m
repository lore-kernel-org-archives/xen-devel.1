From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 01/12] xen: clang: Support correctly
 cross-compile
Date: Thu, 28 Mar 2019 03:55:46 -0600
Message-ID: <5C9C9A22020000780022265A@prv1-mh.provo.novell.com>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-2-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r6Gf=R7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9RlH-0004kG-0f
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2019 09:55:51 +0000
In-Reply-To: <20190327184531.30986-2-julien.grall@arm.com>
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
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, oleksandr_tyshchenko@epam.com, xen-devel <xen-devel@lists.xenproject.org>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI3LjAzLjE5IGF0IDE5OjQ1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IENsYW5nIHVzZXMgIi10YXJnZXQiIG9wdGlvbiBmb3IgY3Jvc3MtY29tcGlsYXRpb24uCgpBbmQg
YWxsIHBvc3NpYmxlIHRhcmdldHMgYXJlIGFsd2F5cyBhdmFpbGFibGU/IEknZCBsaWtlIHRvIHBv
aW50IG91dAp0aGF0IENST1NTX0NPTVBJTEUgY2FuIGJlIHVzZWQgZm9yIG90aGVyIHRoYW4gYWN0
dWFsIGNyb3NzCmNvbXBpbGF0aW9uLCBlLmcuIGJ1aWxkaW5nIHdpdGgganVzdCBhbiBhbHRlcm5h
dGl2ZSB0b29sIGNoYWluCmJ1aWx0IGZvciB0aGUgc2FtZSB0YXJnZXQuIERyb3BwaW5nIHRoZSAk
KENST1NTX0NPTVBJTEUpCnByZWZpeGVzIG1ha2VzIHRoaXMgaW1wb3NzaWJsZSBhZmFpY3QuIFJl
cXVpcmluZyBzdWl0YWJsZSB3cmFwcGVyCnNjcmlwdHMgdG8gYmUgcHV0IGluIHBsYWNlIHdvdWxk
IHNlZW0gYmV0dGVyIHRvIG1lLgoKSSBhbHNvIHdvbmRlciB3aHkgdGhpcyBjaGFuZ2UgaXMgbmVl
ZGVkIGZvciBBcm0sIGJ1dCB3YXNuJ3QKbmVlZGVkIHNvIGZhciBmb3IgeDg2LiBCdXQgcGVyaGFw
cyBuby1vbmUgZXZlciB0cmllZCB1c2luZyBpdApzbyBmYXIgLi4uCgo+IC0tLSBhL2NvbmZpZy9T
dGRHTlUubWsKPiArKysgYi9jb25maWcvU3RkR05VLm1rCj4gQEAgLTEsOCArMSwxMyBAQAo+ICBB
UyAgICAgICAgID0gJChDUk9TU19DT01QSUxFKWFzCj4gIExEICAgICAgICAgPSAkKENST1NTX0NP
TVBJTEUpbGQKPiAgaWZlcSAoJChjbGFuZykseSkKPiAtQ0MgICAgICAgICA9ICQoQ1JPU1NfQ09N
UElMRSljbGFuZwo+IC1DWFggICAgICAgID0gJChDUk9TU19DT01QSUxFKWNsYW5nKysKPiAraWZu
ZXEgKCQoQ1JPU1NfQ09NUElMRSksKQo+ICtDQyAgICAgICAgID0gY2xhbmcgLXRhcmdldCAkKENS
T1NTX0NPTVBJTEU6LT0pCj4gK0NYWCAgICAgICAgPSBjbGFuZysrIC10YXJnZXQgJChDUk9TU19D
T01QSUxFOi09KQoKSXMgZHJvcHBpbmcgZGFzaGVzIGZyb20gdGhlIHZhcmlhYmxlIHVuaWZvcm1s
eSBjb3JyZWN0PyBJZiBzbywKY291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IGluIHRoZSBjb21taXQg
bWVzc2FnZSB3aHkgdGhhdCBpcz8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
