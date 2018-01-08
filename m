From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC v1 40/74] xen/x86: report domain id on
 cpuid
Date: Mon, 08 Jan 2018 04:11:07 -0700
Message-ID: <5A535FDB020000780019C16E@prv-mh.provo.novell.com>
References: <20180104130625.28605-1-wei.liu2@citrix.com>
 <20180104130625.28605-41-wei.liu2@citrix.com>
 <5A53558B020000780019C0B9@prv-mh.provo.novell.com>
 <fae0af45-67bf-e0ac-4f01-fbe6a81e2843@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=dk2s=ed=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1eYVKi-0004mE-OT
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2018 11:11:12 +0000
In-Reply-To: <fae0af45-67bf-e0ac-4f01-fbe6a81e2843@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, wei.liu2@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA4LjAxLjE4IGF0IDExOjM0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMDgvMDEvMTggMTA6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAwNC4w
MS4xOCBhdCAxNDowNSwgPHdlaS5saXUyQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4gRnJvbTogUm9n
ZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Cj4+PiBVc2UgdGhlIGVieCBy
ZWdpc3RlciBvZiB0aGUgaHlwZXJ2aXNvciBsZWFmIDEuIFRoZSBlYXggcmVnaXN0ZXIgb24KPj4+
IHRoaXMgbGVhZiBpcyBhbHJlYWR5IHVzZWQgdG8gcmVwb3J0IHRoZSBYZW4gbWFqb3IgYW5kIG1p
bm9yIHZlcnNpb25zLgo+PiBUaGUgcmF0aW9uYWxlIGZvciBkb2luZyB0aGlzIGlzIG1pc3Npbmcu
IElpcmMgaW4gcGFzdCBkaXNjdXNzaW9ucyB0aGUKPj4gb3BpbmlvbiB3YXMgdm9pY2VkIChtb3Jl
IHRoYW4gb25jZSwgYW5kIGlpcmMgYnkgQW5kcmV3IGFueSBtYXliZQo+PiBvdGhlcnMpIHRoYXQg
YSBkb21haW4gaW4gZ2VuZXJhbCBzaG91bGRuJ3QgYmUgdG9sZCBhYm91dCBpdHMgZG9tYWluCj4+
IElELiBPdGhlcndpc2UgSSBhbHNvIGNhbid0IHNlZSB3aHkgd2UgZG9uJ3QgaGF2ZSBhIGh5cGVy
Y2FsbCBmb3IKPj4gdGhpcywgYW5kIGUuZy4gWFRGIG5lZWRzIHRvIGdvIHRocm91Z2ggaG9vcHMg
dG8gZmlndXJlIGl0IG91dC4gQXJlCj4+IHRob3NlIGFyZ3VtZW50cyAod2hpY2ggSSBkb24ndCBy
ZWNhbGwpIG5vdCBhcHBsaWNhYmxlIGFueW1vcmU/Cj4+Cj4+IEluIHRoZSBBbWF6b24gc2hpbSBw
YXRjaGVzIHRocmVhZCBoYW5kaW5nIG91dCB0aGUgZG9tYWluIElEIGJ5Cj4+IGNvbW1hbmQgbGlu
ZSBvcHRpb24gd2FzIHN1Z2dlc3RlZCBhcyBhbiBhbHRlcm5hdGl2ZSwgd2hpY2ggdGhlbgo+PiB3
b3VsZG4ndCBhZmZlY3Qgb3RoZXIgKG5vbi1zaGltKSBkb21haW5zLCBvciB0aGUgY2xpZW50IG9m
IHRoZSBzaGltLgo+IAo+IEEgZ3Vlc3RzIGRvbWlkIGlzIHVuY29uZGl0aW9uYWxseSBhbHdheXMg
YXZhaWxhYmxlIGluIHhlbnN0b3JlLCBhbmQgaXMgYQo+IG5lY2Vzc2FyeSBwYXJ0IG9mIGFueSBQ
ViBjb21tdW5pY2F0aW9uLgo+IAo+IExpa2UgaXQgb3Igbm90LCBkb21pZCBpcyBwYXJ0IG9mIHRo
ZSBndWVzdHMgdmlldyBvZiB0aGUgWGVuIEFCSS4gCj4gVGhlcmVmb3JlLCBtYWtpbmcgaXQgZWFz
aWx5IGFjY2Vzc2libGUgaXMgdGhlIGJlc3QgY291cnNlIG9mIGFjdGlvbgo+IChlc3BlY2lhbGx5
IGFzIHB2LXNoaW0gZGVsaWJlcmF0ZWx5IGRvZXNuJ3QgaW50ZXJwb3NlIG9uIHRoZSB4ZW5zdG9y
ZSByaW5nKS4KCkFsbCB1bmRlcnN0b29kLCB5ZXQgeW91IGRvbid0IGFkZHJlc3MgdGhlIHF1ZXN0
aW9uIG9uIHRoZQpiYWNrZ3JvdW5kcyBvZiB0aGUgY2hhbmdlIG9mIHlvdXIgb3BpbmlvbiBoZXJl
LiBPciBhbSBJCm1pc3JlbWVtYmVyaW5nIHRoYXQgZWFybGllciBvbiB5b3Ugd2VyZSBhZ2FpbnN0
IGV4cG9zaW5nCnRoZSBkb21haW4gSUQ/CgpKYW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
