From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] x86: fix "xpti=" and "pv-l1tf=" yet again
Date: Tue, 21 Aug 2018 14:14:44 +0200
Message-ID: <342a607d-b20d-f858-e186-b5a3aa3ed5bc@suse.com>
References: <5B7BED1B02000078001E063C@suse.com>
 <968c629b-546e-a477-f4a7-dceae0ff114e@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=wce4=le=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1fs5Yc-0003YN-29
 for xen-devel@lists.xenproject.org; Tue, 21 Aug 2018 12:14:46 +0000
In-Reply-To: <968c629b-546e-a477-f4a7-dceae0ff114e@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjEvMDgvMTggMTQ6MDQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMjEvMDgvMTggMTI6
NDQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBXaGlsZSBjb21taXQgMmEzYjM0ZWM0NyAoIng4Ni9z
cGVjLWN0cmw6IFlldCBtb3JlIGZpeGVzIGZvciB4cHRpPQo+PiBwYXJzaW5nIikgaW5kZWVkIGZp
eGVkICJ4cHRpPWRvbTAiLCBpdCBicm9rZSAieHB0aT1uby1kb20wIiwgaW4gdGhhdAo+PiB0aGlz
IHRoZW4gYmVjYW1lIGVxdWl2YWxlbnQgdG8gInhwdGk9bm8iLiBJbiBwYXJ0aWN1bGFyLCB0aGUg
cHJlc2VuY2UKPj4gb2YgInhwdGk9IiBhbG9uZSBvbiB0aGUgY29tbWFuZCBsaW5lIG1lYW5zIG5v
dGhpbmcgYXMgdG8gd2hpY2gKPj4gZGVmYXVsdCBpcyB0byBiZSBvdmVycmlkZGVuOyAieHB0aT1u
by1kb20wIiBvdWdodCB0byBoYXZlIG5vIGVmZmVjdAo+PiBmb3IgRG9tVS1zIChhbmQgdmljZSB2
ZXJzYSksIGFzIHRoaXMgaXMgZGlzdGluY3QgZnJvbSBib3RoCj4+ICJ4cHRpPW5vLWRvbTAsZG9t
dSIgYW5kICJ4cHRpPW5vLWRvbTAsbm8tZG9tdSIuCj4+Cj4+IEhlcmUgYXMgd2VsbCBhcyBmb3Ig
InB2LWwxdGY9IiBJIHRoaW5rIHRoZXJlJ3Mgbm8gd2F5IGFyb3VuZCB0cmFja2luZwo+PiB0aGUg
InVzZSBkZWZhdWx0IiBzdGF0ZSBzZXBhcmF0ZWx5IGZvciBEb20wIGFuZCBEb21VLXMuIEludHJv
ZHVjZQo+PiBpbmRpdmlkdWFsIGJpdHMgZm9yIHRoaXMsIGFuZCBjb252ZXJ0IHRoZSB2YXJpYWJs
ZXMnIHR5cGVzIChiYWNrKSB0bwo+PiB1aW50OF90Lgo+Pgo+PiBBZGRpdGlvbmFsbHkgdGhlIGVh
cmxpZXIgY2hhbmdlIGNsYWltZWQgdG8gaGF2ZSBnb3QgcmlkIG9mIHRoZQo+PiAncGFyYW1ldGVy
ICJ4cHRpIiBoYXMgaW52YWxpZCB2YWx1ZSAiIiwgcmM9LTIyIScgbG9nIG1lc3NhZ2UgZm9yICJ4
cHRpIgo+PiBhbG9uZSBvbiB0aGUgY29tbWFuZCBsaW5lLCB3aGljaCB3YXNuJ3QgdGhlIGNhc2Ug
KHRoZSBvcHRpb24gdG9vayBlZmZlY3QKPj4gbmV2ZXJ0aGVsZXNzKS4gRml4IHRoaXMgYXMgd2Vs
bC4KPj4KPj4gRmluYWxseSBhbHNvIHN1cHBvcnQgYSAiZGVmYXVsdCIgc3ViLW9wdGlvbiBmb3Ig
InB2LWwxdGY9IiwganVzdCBsaWtlCj4+ICJ4cHRpPSIgZG9lcy4KPj4KPj4gSXQgaXMgcGVyaGFw
cyB3b3J0aCB0byBub3RlIHRoYXQgT1BUXzx3aGF0Pl9ET008d2hpY2g+X0RFRkFVTFQgc2V0Cj4+
IGltcGxpZXMgT1BUXzx3aGF0Pl9ET008d2hpY2g+IGNsZWFyLCB3aGljaCBpcyBiZWluZyB1dGls
aXplZCBpbiBhIG51bWJlcgo+PiBvZiBwbGFjZXMgKHdlIGVmZmVjdGl2ZWx5IHdhbnQgdG8gaG9s
ZCB0d28gdHJpc3RhdGVzIGluIGEgc2luZ2xlCj4+IHZhcmlhYmxlLCB3aGljaCBtZWFucyB0aGUg
Zm91cnRoIHN0YXRlIGlzIGltcG9zc2libGUpLgo+IAo+IEFub3RoZXIgcG9zc2liaWxpdHkgd291
bGQgYmUgdG8gaGF2ZSB0d28gbG9jYWwgdmFyaWFibGVzIGhvbGRpbmcgdGhlCj4gYml0cyB0byBj
bGVhciBhbmQgdG8gc2V0IGFuZCB0byBhcHBseSB0aG9zZSBhZnRlciBlYWNoIHN1Yi1vcHRpb24K
PiBwYXJzZWQuCgpJZ25vcmUgcGxlYXNlLCBoaXQgc2VuZCBpbnN0ZWFkIG9mIGNhbmNlbC4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
