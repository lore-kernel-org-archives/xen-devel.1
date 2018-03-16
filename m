From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 1/6] x86: NOP out XPTI entry/exit code
 when it's not in use
Date: Fri, 16 Mar 2018 04:43:47 -0600
Message-ID: <5AABADF302000078001B2A49@prv-mh.provo.novell.com>
References: <5AA7E24402000078001B0F41@prv-mh.provo.novell.com>
 <5AA7E49502000078001B0F50@prv-mh.provo.novell.com>
 <0be1a848-0526-749e-2e04-0abc493e93ed@citrix.com>
 <5AABA09002000078001B29C7@suse.com>
 <4e9b84c4-9789-6424-b71c-208dfbfc0113@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=krzt=gg=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ewmq4-0008Br-1e
 for xen-devel@lists.xenproject.org; Fri, 16 Mar 2018 10:43:56 +0000
In-Reply-To: <4e9b84c4-9789-6424-b71c-208dfbfc0113@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE2LjAzLjE4IGF0IDExOjM3LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJIHRo
aW5rIHdlIHNob3VsZCBkbyBzb21lIHBlcmZvcm1hbmNlIHRlc3RpbmcgdG8gZGVjaWRlIHdoZXRo
ZXIgaXQgbWFrZXMKPiBzZW5zZSB0byB0YWtlIHRoZSBwYXRjaCBvciBub3QuIEFmdGVyIGFsbCBJ
IGRvbid0IHNlZSBhIHJlYXNvbiB0byBwdW5pc2gKPiBBTUQgcHJvY2Vzc29ycyBmb3IgSU5URUwn
cyBidWdzLiBBbmQgSSd2ZSBhbHJlYWR5IGZvdW5kIG91dCB0aGF0IHNvbWUKPiBicmFuY2hlcyBp
biBpbnRlcnJ1cHQgaGFuZGxpbmcgY2FuIHJlYWxseSBtYWtlIGEgZGlmZmVyZW5jZS4KCldlbGws
IEkgaGFkIGRvbmUgdGhhdCBiZWZvcmUgZmlyc3QgcG9zdGluZywgYW5kIGZvdW5kIGEgbWFyZ2lu
YWwKaW1wcm92ZW1lbnQuIEJ1dCBvZiBjb3Vyc2UgSSBkaWRuJ3QgZG8gdGhpcyB3aXRoIHBhcnRz
IG9mIHRoZSBwYXRjaAp1c2VkIGFuZCBwYXJ0cyBsZWZ0IG91dCwgYW5kIHRvIGJlIGhvbmVzdCBJ
IGRvbid0IHRoaW5rIEknbSBnb2luZwp0bywgYXMgdGhlIGRpZmZlcmVuY2VzIHdpbGwgbGlrZWx5
IGRpc2FwcGVhciBpbiB0aGUgbm9pc2UuIEhlbmNlIEkKc3RhbmQgdG8gd2hhdCBJJ3ZlIHNhaWQg
ZWFybGllciB0byBBbmRyZXcgLSBJIGNvdWxkIGFjY2VwdCB0byBzcGxpdAp0aGUgcGF0Y2ggKHRv
IG1vdmUgb3V0IHRoZSBTVEkgcGF0Y2hpbmcpLCBhbmQgSSBjb3VsZCBhbHNvIGFjY2VwdAp0byBk
cm9wIHRoZSBwYXRjaGluZyBvZiB0aGUgeGVuX2NyMyByZXN0b3Jlcy4gQnV0IEkgdGhpbmsgdGhl
IGJpZwpjaHVua3MgYmVpbmcgcGF0Y2hlZCBzaG91bGQgYXQgbGVhc3QgYmUgdGFrZW4uCgpKYW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
