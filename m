From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC v2 01/12] x86: cleanup processor.h
Date: Mon, 22 Jan 2018 14:25:07 +0000
Message-ID: <fcfa6b76-9358-f099-26e9-ecc5ccf9f07e@citrix.com>
References: <20180122123256.1431-1-jgross@suse.com>
 <20180122123256.1431-2-jgross@suse.com> <5A65ECA502000078001A111C@suse.com>
 <4a487401-e5f3-2012-dfdc-2866fc4a8249@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=1mpu=er=citrix.com=prvs=553e45c5e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1edd27-000361-Nu
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2018 14:25:11 +0000
In-Reply-To: <4a487401-e5f3-2012-dfdc-2866fc4a8249@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>
Cc: wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, ian.jackson@eu.citrix.com, Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMjIvMDEvMTggMTQ6MTAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMjIvMDEvMTggMTM6
NTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAyMi4wMS4xOCBhdCAxMzozMiwgPGpncm9z
c0BzdXNlLmNvbT4gd3JvdGU6Cj4+PiBSZW1vdmUgTlNDL0N5cml4IENQVSBtYWNyb3MgYW5kIGN1
cnJlbnRfdGV4dF9hZGRyKCkgd2hpY2ggYXJlIHVzZWQKPj4+IG5vd2hlcmUuCj4+IEkgYWdyZWUg
ZG9pbmcgdGhlIGZvcm1lciwgYnV0IEkgaGF2ZSBhIHZhZ3VlIHJlY29sbGVjdGlvbiB0aGF0IHdl
J3ZlCj4+IGxlZnQgdGhlIGxhdHRlciBpbiBwbGFjZSBkZXNwaXRlIHRoZXJlIG5vdCBiZWluZyBh
bnkgY2FsbGVycyBhdCBwcmVzZW50Lgo+IEl0IGlzbid0IGFzIGlmIGN1cnJlbnRfdGV4dF9hZGRy
KCkgd291bGQgYmUgcm9ja2V0IHNjaWVuY2UuIEknbSBxdWl0ZQo+IHN1cmUgaW4gY2FzZSBpdCBp
cyBuZWVkZWQgdGhlcmUgd2lsbCBiZSBlbm91Z2ggYnJhaW4gcG93ZXIgYXZhaWxhYmxlIHRvCj4g
YnVpbGQgaXQgZWl0aGVyIGZyb20gc2NyYXRjaCBhZ2FpbiBvciB0byBmaW5kIGl0IGluIGdpdC4K
Pgo+IEluIGNhc2UgeW91IHJlYWxseSBsaWtlIGl0IHRvIHN0YXkgSSB3b24ndCBvYmplY3QsIG9m
IGNvdXJzZS4KCkZXSVcsIEkndmUgZGlzbGlrZWQgYWxsIHRoZSByZWNlbnQgcGF0Y2hlcyB3aGlj
aCBoYXZlIHRyaWVkIHRvIHVzZQpjdXJyZW50X3RleHRfYWRkcigpLCBhbmQgSSBkb24ndCBzZWUg
aXQgYXMgYSB1c2VmdWwgZGVidWdnaW5nIHV0aWxpdHkKZWl0aGVyLgoKSSB3b3VsZCBwcmVmZXIg
dG8gc2VlIGl0IGdvbmUgdGhhbiB0byBzdGF5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
