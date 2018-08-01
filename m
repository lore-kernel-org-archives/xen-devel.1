From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/5] x86/cpuidle: replace a pointless NULL
 check
Date: Wed, 01 Aug 2018 09:12:41 -0600
Message-ID: <5B61CDE902000078001DA028@prv1-mh.provo.novell.com>
References: <5B61C21202000078001D9F2D@prv1-mh.provo.novell.com>
 <5B61C43802000078001D9F5F@prv1-mh.provo.novell.com>
 <f4387b24-f0c3-7d58-391c-94720183e141@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=qz6i=kq=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fksnt-0004ns-6s
 for xen-devel@lists.xenproject.org; Wed, 01 Aug 2018 15:12:45 +0000
In-Reply-To: <f4387b24-f0c3-7d58-391c-94720183e141@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjA4LjE4IGF0IDE2OjMzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDEvMDgvMTggMTU6MzEsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBUaGUgYWRkcmVz
cyBvZiBhbiBhcnJheSBzbG90IGNhbid0IGJlIE5VTEwuIEluc3RlYWQgYWRkIGEgYm91bmRzIGNo
ZWNrCj4+IHRvIG1ha2Ugc3VyZSB0aGUgYXJyYXkgaW5kZXhpbmcgaXMgdmFsaWQgKHRoZSBjaGVj
ayBpcyBhZ2FpbnN0IDIgc2luY2UKPj4gc2xvdCB6ZXJvIG9mIHRoZSBhcnJheSAtIGNvcnJlc3Bv
bmRpbmcgdG8gQzAgLSBpcyBvZiBubyBpbnRlcmVzdCBoZXJlKS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFdvdWxkbid0IGFuIGV4cHJl
c3Npb24gaW52b2x2aW5nIEFSUkFZX1NJWkUoKSBiZSBtb3JlIGFwcHJvcHJpYXRlPwoKTm8sIGFz
IHRoaXMgaXMgYSBsb3dlciBib3VuZHMgY2hlY2s7IC0+Y291bnQgd2lsbCBuZXZlciBleGNlZWQg
dGhlCnVwcGVyIGJvdW5kLgoKPiBFaXRoZXIgd2F5LCBBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClRoYW5rcywgSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
