From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 08:22:29 -0600
Message-ID: <5B06CAA502000078001C59CF@prv1-mh.provo.novell.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=y5hq=il=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fLs4o-0003Ow-Ni
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 15:22:50 +0000
In-Reply-To: <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjA1LjE4IGF0IDE2OjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ2FuIHlvdSB0cnkgd2l0aCB0aGUgIng4Ni90cmFwczogRHVtcCB0aGUgaW5zdHJ1Y3Rp
b24gc3RyZWFtIGV2ZW4gZm9yCj4gZG91YmxlIGZhdWx0cyIgcGF0Y2ggSSd2ZSBqdXN0IHBvc3Rl
ZCwgYW5kIHNob3cgdGhlIGZ1bGwgI0RGIHBhbmljIGxvZwo+IHBsZWFzZT8gIChJdHMgY29uY2Vp
dmFibGUgdGhhdCB0aGVyZSBhcmUgbXVsdGlwbGUgZGlmZmVyZW50IGlzc3VlcyBoZXJlLikKCldl
bGwsIGFzIGxvbmcgYXMgd2UncmUgb24gYSBndWVzdCBrZXJuZWwgc3RhY2sgcmF0aGVyIHRoYW4g
b3VyIG93biwgSQpkb24ndCB0aGluayB0aGUgZXhhY3QgaW5zbiBjYXVzaW5nIHRoZSAjREYgcmVh
bGx5IG1hdHRlcnMuIFNlZSBlYXJsaWVyCm1haWxzIEkgaGF2ZSBzZW50IGluIHRoaXMgcmVnYXJk
LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
