From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-next 9/9] xen: Remove mfn_to_gmfn macro
Date: Thu, 14 Mar 2019 02:05:47 -0600
Message-ID: <5C8A0B5B020000780021E68D@prv1-mh.provo.novell.com>
References: <20190218113600.9540-1-julien.grall@arm.com>
 <20190218113600.9540-10-julien.grall@arm.com>
 <5C892053020000780021E3A3@prv1-mh.provo.novell.com>
 <d99d0f41-9f56-be1b-96eb-de34fce812ee@arm.com>
 <5C892459020000780021E3FF@prv1-mh.provo.novell.com>
 <e5f62bfe-d31e-53b3-41c2-493960742890@arm.com>
 <5C8928DE020000780021E44B@prv1-mh.provo.novell.com>
 <5246f4a3-9099-d3e8-b950-4a17afb8e63b@citrix.com>
 <bb89269c-5b4d-98d1-40b6-03f772e2d7b3@arm.com>
 <12975b45-8df4-e140-84d9-e7fcc2cbf763@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U6t1=RR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h4LN8-0007SK-3T
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 08:05:50 +0000
In-Reply-To: <12975b45-8df4-e140-84d9-e7fcc2cbf763@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDEzLjAzLjE5IGF0IDE5OjQxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTMvMDMvMjAxOSAxNzo0MiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxMy8w
My8yMDE5IDE3OjM0LCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+Pj4gR2l2ZW4gdGhhdCAiaGF2aW5n
IGFuIE0yUCIgaXMgbm93IGFuIHg4Ni1zcGVjaWZpYyBjb25jZXB0LCBJIHRoaW5rCj4+PiBwaGFz
aW5nIHNldF9ncGZuX2Zyb21fbWZuKCkncyB1c2Ugb3V0IG9mIGNvbW1vbiBjb2RlIGlzIHRoZSB3
YXkgdG8gZ28uCj4+Cj4+IFNvIHlvdSBuZXZlciBleHBlY3Qgb3RoZXIgYXJjaGl0ZWN0dXJlIHRv
IHVzZSB0aGUgTTJQPwo+IAo+IEkgZ3Vlc3MgdGhhdCBkZXBlbmRzIG9uIGhvdyBsaWtlbHkgaXQg
aXMgZ29pbmcgdG8gYmUgdGhhdCBYZW4gZ2FpbnMgYQo+IG5ldyBub24tSFZNLWxpa2UgdmlydHVh
bGlzYXRpb24gbW9kZSBvbiBhIG5ldyBhcmNoaXRlY3R1cmUuCgpXZWxsLCBub3QgcXVpdGUuIEkg
ZG9uJ3QgdGhpbmsgaXQgd291bGQgYmUgc3RyYWlnaHRmb3J3YXJkIHRvIG1ha2UKeDg2IHNlbGVj
dCBIQVZFX00yUCBvbmx5IHdoZW4gUFYgaXMgYWxzbyBlbmFibGVkLiBIZW5jZSBhIEhWTS0KbGlr
ZSBpbXBsZW1lbnRhdGlvbiBtYXkgc3RpbGwgd2FudCB0byBtYWludGFpbiBNMlAuIEluIGZhY3Qg
aXQgaXMKbXkgdW5kZXJzdGFuZGluZyB0aGF0IDY0LWJpdCBBcm0gY291bGQgZWFzaWx5IGRvIChs
ZWF2aW5nIGFzaWRlCnRoZSBxdWVzdGlvbiBvZiB3aGV0aGVyIHRoZSBtZW1vcnkgbmVlZGVkIHRv
IGJ1aWxkIHRoZSB0YWJsZXMKd291bGQgYmUgd2VsbCBzcGVudCB0aGlzKSwgYnV0IGl0J3MgcHJv
aGliaXRpdmUgb24gMzItYml0LCBhbmQgaGVuY2UKaXQncyBlYXNpZXIgZm9yIHRoZSBBcm0gY29k
ZSBvdmVyYWxsIHRvIHVuaWZvcm1seSByZXNvcnQgdG8KYWx0ZXJuYXRpdmUgbWVhbnMgd2hlcmUg
c3VjaCBhIHRyYW5zbGF0aW9uIGlzIGluZGVlZCBuZWVkZWQuCgpKYW4KCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
