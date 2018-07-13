From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 05/16] x86/HVM: add wrapper for
 hvm_funcs.set_tsc_offset()
Date: Fri, 13 Jul 2018 07:20:05 -0600
Message-ID: <5B48A70502000078001D3D0E@prv1-mh.provo.novell.com>
References: <5B46030502000078001D322E@prv1-mh.provo.novell.com>
 <5B46057302000078001D325B@prv1-mh.provo.novell.com>
 <4d925507-6b4e-240d-a4c6-c2de6dc2fdf5@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ysgb=j5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fdxzU-0000S7-3N
 for xen-devel@lists.xenproject.org; Fri, 13 Jul 2018 13:20:08 +0000
In-Reply-To: <4d925507-6b4e-240d-a4c6-c2de6dc2fdf5@citrix.com>
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

Pj4+IE9uIDEzLjA3LjE4IGF0IDE0OjE5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTEvMDcvMTggMTQ6MjYsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJdCdzIHVzZWQg
aW4gcXVpdGUgYSBmZXcgcGxhY2VzLCBhbmQgaGVuY2UgZG9pbmcgc28gZWFzZXMgc3Vic2VxdWVu
dAo+PiBhZGp1c3RtZW50IHRvIGhvdyB0aGVzZSAoaW5kaXJlY3QpIGNhbGxzIGFyZSBjYXJyaWVk
IG91dC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPgoKVGhhbmtzLgoKPiBPdmVyYWxsLCBJJ2Qgc2F5IHRoYXQgaXQgd291bGQgYmUgZ29vZCB0
byBoYXZlIHdyYXBwZXJzIGZvciBhbGwgdGhlCj4gZnVuY3Rpb25zLCB0byBtYWtlIGEgY2xlYW5l
ciBBUEkuCgpJIGhhZCBjb25zaWRlcmVkIHRoYXQsIGJ1dCBkZWNpZGVkIHRoYXQgSSdkIGxlYXZl
IHRoZSBvbmVzIGhhdmluZyBqdXN0CmEgc2luZ2xlIHVzZSBzaXRlLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
