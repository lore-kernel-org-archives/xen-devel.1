From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: Ping: [PATCH] x86emul: correct AVX512BW write
 masking checks
Date: Wed, 30 Jan 2019 09:25:19 -0700
Message-ID: <5C51CFEF0200007800212671@prv1-mh.provo.novell.com>
References: <5C3C7511020000780020D2BF@suse.com>
 <cb65c6cc-7ef6-2ae7-4206-901f8f907d0e@suse.com>
 <5C4999510200007800210C3E@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v60N=QG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gosfz-0000Hw-Cb
 for xen-devel@lists.xenproject.org; Wed, 30 Jan 2019 16:25:23 +0000
In-Reply-To: <5C4999510200007800210C3E@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI0LjAxLjE5IGF0IDExOjU0LCA8SkJldWxpY2hAc3VzZS5jb20+IHdyb3RlOgo+Pj4+
IE9uIDE2LjAxLjE5IGF0IDEyOjQwLCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPj4gT24gMTQv
MDEvMjAxOSAxMjo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBGb3IgVlBTQURCVyB0aGlzIGxp
a2VseSB3YXMgYSByZXN1bHQgb2YgYmFkIGNvcHktYW5kLXBhc3RlLgo+Pj4gCj4+PiBGb3IgVlBT
e0wsUn1MRFEgY29tbWVudCBhbmQgY29kZSB3ZXJlIG5vdCBpbiBsaW5lLCBidXQgdGhlbiBhZ2Fp
biB0aGUKPj4+IGNvbW1lbnQgYWxzbyB3YXNuJ3QgZnVsbHkgdXBkYXRlZCBmcm9tIHRoZSBBVlgy
IG9yaWdpbmFsIGl0IGdvdCBjbG9uZWQKPj4+IGZyb20uCj4+PiAKPj4+IFNpZ25lZC1vZmYtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gCj4+IFJlbGVhc2UtYWNrZWQtYnk6
IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBBbmRyZXc/CgpJIGd1ZXNzIEkn
bGwgY29tbWl0IHRoaXMgd2l0aG91dCBhbnkgb3JkaW5hcnkgYWNrIGVhcmx5IG5leHQgd2Vlawp1
bmxlc3MgSSBoZWFyIGJhY2suCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
