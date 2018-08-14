From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH 03/15] xen/arm: Introduce helpers to
 clear/flags flags in HCR_EL2
Date: Tue, 14 Aug 2018 23:53:47 +0100
Message-ID: <5b58252c-0f49-18ac-49b5-70896d44d3c6@arm.com>
References: <20180716172712.20294-1-julien.grall@arm.com>
 <20180716172712.20294-4-julien.grall@arm.com>
 <alpine.DEB.2.10.1808141345410.15066@sstabellini-ThinkPad-X260>
 <4c0f6e56-7d17-8e3d-3146-1c043d489eb8@arm.com>
 <alpine.DEB.2.10.1808141448330.15066@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=+6mo=k5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1fpiCF-0000XB-Qu
 for xen-devel@lists.xenproject.org; Tue, 14 Aug 2018 22:53:51 +0000
In-Reply-To: <alpine.DEB.2.10.1808141448330.15066@sstabellini-ThinkPad-X260>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@linaro.org>
List-Id: xen-devel@lists.xenproject.org

SGkgU3RlZmFubywKCk9uIDA4LzE0LzIwMTggMTA6NDkgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiBPbiBUdWUsIDE0IEF1ZyAyMDE4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0
ZWZhbm8sCj4+Cj4+IE9uIDA4LzE0LzIwMTggMDk6NDYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPj4+IE9uIE1vbiwgMTYgSnVsIDIwMTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBB
IGNvdXBsZSBvZiBwbGFjZXMgaW4gdGhlIGNvZGUgd2lsbCBuZWVkIHRvIGNsZWFyL3NldCBmbGFn
cyBpbiBIQ1JfRUwyCj4+Pj4gZm9yIGEgZ2l2ZW4gdkNQVSBhbmQgdGhlbiByZXBsaWNhdGUgaW50
byB0aGUgaGFyZHdhcmUuIEludHJvZHVjZQo+Pj4+IGhlbHBlcnMgYW5kIHJlcGxhY2Ugb3Blbi1j
b2RlZCB2ZXJzaW9uLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAbGluYXJvLm9yZz4KPj4+Cj4+PiBUaGUgbWFjcm9zIGxvb2sgZ29vZCwgYnV0IEkg
Z3JlcHBlZCBmb3IgdGhlbSBpbiB5b3VyIHNlcmllcyBhbmQgdGhlcmUKPj4+IGFyZSBubyBtb3Jl
IGNhbGxlcnMuIFdoYXQgcGxhY2VzIGFyZSB5b3UgcmVmZXJyaW5nIHRvIHRoYXQgdGhleSB3aWxs
Cj4+PiBuZWVkIHRoZW0/Cj4+Cj4+IEkgc3BsaXQgc29tZSBvZiBteSB3b3JrIGluIDIgcGFydCB0
byByZWR1Y2UgdGhlIHNpemUgb2YgdGhlIHNlcmllcy4gVGhpcyB3aWxsCj4+IGJlIHVzZWQgaW4g
YW5vdGhlciBzZXJpZXMgd2hlcmUgdXBkYXRpbmcgSENSIGZvciB0cmFwcGluZyBUVEJSL1NDVExS
KiB3aWxsIGJlCj4+IGR5bmFtaWMuCj4+Cj4+IEFsdGhvdWdoIGluIGdlbmVyYWwsIHRoaXMgaXMg
YW4gaW1wcm92ZW1lbnQgY29tcGFyZSB0byB0aGUgY3VycmVudCBjb2RlIGFzIGl0Cj4+IG1ha2Vz
IGNsZWFyIHdoYXQgbmVlZHMgdG8gYmUgdXBkYXRlZCB3aGVuIG1vZGlmeWluZyBIQ1IuCj4gCj4g
WWVzLCBpdCBpcywgYnV0IG5vcm1hbGx5IEkgd291bGQgb25seSBpbnRyb2R1Y2UgdmNwdV9oY3Jf
c2V0X2ZsYWdzIGluCj4gdGhpcyBzZXJpZXMsIGJlY2F1c2UgdmNwdV9oY3JfY2xlYXJfZmxhZ3Mg
aXMgbGVmdCBjb21wbGV0ZWx5IHVudXNlZD8KCldlbGwsIGl0IG1ha2VzIHNlbnNlIHRvIGtlZXAg
dGhlIHBhaXIgdG9nZXRoZXIuIEkgYW0gaGFwcHkgdG8gbW92ZSB0aGF0IApwYXRjaCBpbiB0aGUg
b3RoZXIgaWYgeW91IHByZWZlci4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
