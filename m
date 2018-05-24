From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/XPTI: fix S3 resume (and CPU offlining
 in general)
Date: Thu, 24 May 2018 15:24:45 +0100
Message-ID: <a8d95374-396f-5d14-36b3-dcb062a4e4bd@citrix.com>
References: <5B06C0F902000078001C5925@prv1-mh.provo.novell.com>
 <5946c6fe-73f0-bfbb-bc0b-2026d1231f79@invisiblethingslab.com>
 <5B06C76402000078001C5983@prv1-mh.provo.novell.com>
 <5413b93f-ae2d-0b5b-fc52-2a7c3735e42b@invisiblethingslab.com>
 <def9659c-302b-5183-73bc-6086fa3e9236@citrix.com>
 <5B06CAA502000078001C59CF@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bvjw=il=citrix.com=prvs=675476172=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fLrAg-0005DG-CJ
 for xen-devel@lists.xenproject.org; Thu, 24 May 2018 14:24:50 +0000
In-Reply-To: <5B06CAA502000078001C59CF@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Simon Gaiser <simon@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

T24gMjQvMDUvMTggMTU6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjA1LjE4IGF0
IDE2OjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4+IENhbiB5b3UgdHJ5
IHdpdGggdGhlICJ4ODYvdHJhcHM6IER1bXAgdGhlIGluc3RydWN0aW9uIHN0cmVhbSBldmVuIGZv
cgo+PiBkb3VibGUgZmF1bHRzIiBwYXRjaCBJJ3ZlIGp1c3QgcG9zdGVkLCBhbmQgc2hvdyB0aGUg
ZnVsbCAjREYgcGFuaWMgbG9nCj4+IHBsZWFzZT8gIChJdHMgY29uY2VpdmFibGUgdGhhdCB0aGVy
ZSBhcmUgbXVsdGlwbGUgZGlmZmVyZW50IGlzc3VlcyBoZXJlLikKPiBXZWxsLCBhcyBsb25nIGFz
IHdlJ3JlIG9uIGEgZ3Vlc3Qga2VybmVsIHN0YWNrIHJhdGhlciB0aGFuIG91ciBvd24sIEkKPiBk
b24ndCB0aGluayB0aGUgZXhhY3QgaW5zbiBjYXVzaW5nIHRoZSAjREYgcmVhbGx5IG1hdHRlcnMu
IFNlZSBlYXJsaWVyCj4gbWFpbHMgSSBoYXZlIHNlbnQgaW4gdGhpcyByZWdhcmQuCgpJbiBHZW9y
Z2UncyBjcmFzaCwgd2Ugd2VyZSBpbiBhIHdlaXJkIHBsYWNlIG9uIHRoZSBoeXBlcnZpc29yIHN0
YWNrLCBub3QKYSBndWVzdCBzdGFjay4uLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
