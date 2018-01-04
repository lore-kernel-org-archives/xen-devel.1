From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen: Add EFI_LOAD_OPTION support
Date: Thu, 04 Jan 2018 08:00:05 -0700
Message-ID: <5A4E4F85020000780019B1AB@prv-mh.provo.novell.com>
References: <20180102155628.3007-1-tamas@tklengyel.com>
 <5A4CCA8C020000780019A74B@prv-mh.provo.novell.com>
 <CABfawhkNbLJNbxHxxne=AMPZanGh6V=+o5=WY1jT0POjCTLFoQ@mail.gmail.com>
 <5A4D14AD020000780019A971@prv-mh.provo.novell.com>
 <CABfawhkMKcOECtZcA4wmapUtaFerv4xBAkudeYYCLWoCrMPUxQ@mail.gmail.com>
 <5A4E136F020000780019AE06@prv-mh.provo.novell.com>
 <CABfawhk4CRHwZVj6Sy5WvkzzSTH-AUNxq83DBnYTH4sDbONfXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=q53i=d7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eX709-0003Hh-U5
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2018 15:00:13 +0000
In-Reply-To: <CABfawhk4CRHwZVj6Sy5WvkzzSTH-AUNxq83DBnYTH4sDbONfXA@mail.gmail.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Tamas K Lengyel <tamas@tklengyel.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, openxt <openxt@googlegroups.com>, Tamas K Lengyel <lengyelt@ainfosec.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjAxLjE4IGF0IDE1OjM5LCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
T24gVGh1LCBKYW4gNCwgMjAxOCBhdCAzOjQzIEFNLCBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3Vz
ZS5jb20+IHdyb3RlOgo+PiBKdXN0IGxvb2tpbmcgYXQgdGhlIGxvdyBiaXQgb2YgdGhlIGZpcnN0
Cj4+IGJ5dGUgYmVmb3JlIGFzc3VtaW5nIHRoaXMgY291bGQgYmUgYSBsb2FkIG9wdGlvbiBzdHJ1
Y3R1cmUsCj4+IGhvd2V2ZXIsIGlzIHRvbyB3ZWFrIGEgY2hlY2sgZm9yIG15IHRhc3RlLgo+IAo+
IFRoZXJlIGlzIG1vcmUgZG9uZSBpbiB0aGlzIHBhdGNoIHRoZW4ganVzdCBjaGVja2luZyB0aGUg
bG93IGJpdCBvZiB0aGUKPiBBdHRyaWJ1dGVzIGZpZWxkOiBjYWxjdWxhdGluZyB3aGVyZSB0aGUg
T3B0aW9uYWxEYXRhIHNob3VsZCBiZSBpZiB0aGlzCj4gaXMgaW5kZWVkIGFuIEVGSV9MT0FEX09Q
VElPTiBhbmQgdGhlbiBzYW5pdHkgY2hlY2tpbmcgaWYgdGhhdCBhZGRyZXNzCj4gaXMgc2FuZSBv
ciBub3QuIFRoaXMgcmVxdWlyZXMgdGhlIGJ1ZmZlciB0byBoYXZlIGEgbGF5b3V0IHRoYXQgYXQK
PiBsZWFzdCBwYXJzZXMgcHJvcGVybHkgYXMgYW4gRUZJX0xPQURfT1BUSU9OLCBoZW5jZSBpdCBs
aWtlbHkgaXMgb25lLi4KCkJ1dCB0aGF0IGNhbGN1bGF0aW9uIGlzIG5vdCBkb2luZyBhbGwgdGhl
IGNoZWNraW5nIHRoYXQgd291bGQgYmUKbmVlZGVkIHRvIGJlIHJlYXNvbmFibHkgc2FmZS4gSW4g
cGFydGljdWxhciwgeW91IG11c3RuJ3QgY2FsbAp3c3RybGVuKCkgd2hlbiB5b3UgZG9uJ3Qga25v
dyB3aGV0aGVyIGFsbCBvZiB0aGUgc3VwcG9zZWQKc3RyaW5nIGlzIGFjdHVhbGx5IGluc2lkZSB0
aGUgZ2l2ZW4gbWVtb3J5IGJsb2NrIHNpemUuIEFuZCBJJ20KYWxzbyBub3QgZW50aXJlbHkgY2Vy
dGFpbiB3aGV0aGVyIGNhcmluZyBvZiBvdmVyZmxvdyBpbiBvbmx5IG9uZQoobGF0ZSkgcGxhY2Ug
aXMgc3VmZmljaWVudC4KCkJ0dywgbG9va2luZyBhdCB0aGUgY29kZSBhZ2FpbiwgSSBzZWUgdHdv
IG1vcmUgY29zbWV0aWMgdGhpbmdzCmZvciB5b3UgdG8gY2hhbmdlOiBQbGVhc2UgdXNlIHNpemVv
ZihDSEFSMTYpIGJvdGggaW4gcGxhY2Ugb2YKc2l6ZW9mKEwnXDAnKSBhbmQgaW5zdGVhZCBvZiB0
aGUgbGl0ZXJhbCAyIHRoZXJlLgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
