From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v5 0/1] cameraif: add ABI for para-virtual
 camera
Date: Tue, 12 Mar 2019 09:48:13 +0100
Message-ID: <6803b7e8-4743-15b6-474e-ec7093e9960a@suse.com>
References: <20190312082000.32181-1-andr2000@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EGHV=RP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h3d58-00027z-Pq
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2019 08:48:18 +0000
In-Reply-To: <20190312082000.32181-1-andr2000@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Oleksandr Andrushchenko <andr2000@gmail.com>, xen-devel@lists.xenproject.org, konrad.wilk@oracle.com, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tim Deegan <tim@xen.org>
Cc: boris.ostrovsky@oracle.com, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMDMvMjAxOSAwOToxOSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6Cj4gRnJv
bTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgo+IAo+IEhlbGxvIQo+IAo+IEF0IHRoZSBtb21lbnQgWGVuIFsxXSBhbHJlYWR5IHN1cHBv
cnRzIHNvbWUgdmlydHVhbCBtdWx0aW1lZGlhCj4gZmVhdHVyZXMgWzJdIHN1Y2ggYXMgdmlydHVh
bCBkaXNwbGF5LCBzb3VuZC4gSXQgc3VwcG9ydHMga2V5Ym9hcmRzLAo+IHBvaW50ZXJzIGFuZCBt
dWx0aS10b3VjaCBkZXZpY2VzIGFsbCBhbGxvd2luZyBYZW4gdG8gYmUgdXNlZCBpbgo+IGF1dG9t
b3RpdmUgYXBwbGlhbmNlcywgSW4tVmVoaWNsZSBJbmZvdGFpbm1lbnQgKElWSSkgc3lzdGVtcwo+
IGFuZCBtYW55IG1vcmUuCj4gCj4gRnJvbnRlbmQgaW1wbGVtZW50YXRpb24gaXMgYXZhaWxhYmxl
IGF0IFszXSBhbmQgdGhlIGNvcnJlc3BvbmRpbmcKPiBiYWNrZW5kIGF0IFs0XS4gVGhlc2UgYXJl
IHdvcmsgaW4gcHJvZ3Jlc3MsIGJ1dCBmcm9udGVuZCBhbHJlYWR5Cj4gcGFzc2VzIHY0bDItY29t
cGxpYW5jZSB0ZXN0IGZvciBWNEwyIGRyaXZlcnMuIGxpYnhsIHByZWxpbWluYXJ5Cj4gY2hhbmdl
cyBhcmUgYXZhaWxhYmxlIGF0IFs1XS4KPiAKPiBUaGlzIHdvcmsgYWRkcyBhIG5ldyBYZW4gcGFy
YS12aXJ0dWFsaXplZCBwcm90b2NvbCBmb3IgYSB2aXJ0dWFsCj4gY2FtZXJhIGRldmljZSB3aGlj
aCBleHRlbmRzIG11bHRpbWVkaWEgY2FwYWJpbGl0aWVzIG9mIFhlbiBldmVuCj4gZmFydGhlcjog
dmlkZW8gY29uZmVyZW5jaW5nLCBJVkksIGhpZ2ggZGVmaW5pdGlvbiBtYXBzIGV0Yy4KPiAKPiBU
aGUgaW5pdGlhbCBnb2FsIGlzIHRvIHN1cHBvcnQgbW9zdCBuZWVkZWQgZnVuY3Rpb25hbGl0eSB3
aXRoIHRoZQo+IGZpbmFsIGlkZWEgdG8gbWFrZSBpdCBwb3NzaWJsZSB0byBleHRlbmQgdGhlIHBy
b3RvY29sIGlmIG5lZWQgYmU6Cj4gCj4gMS4gUHJvdmlkZSBtZWFucyBmb3IgYmFzZSB2aXJ0dWFs
IGRldmljZSBjb25maWd1cmF0aW9uOgo+ICAtIHBpeGVsIGZvcm1hdHMKPiAgLSByZXNvbHV0aW9u
cwo+ICAtIGZyYW1lIHJhdGVzCj4gMi4gU3VwcG9ydCBiYXNpYyBjYW1lcmEgY29udHJvbHM6Cj4g
IC0gY29udHJhc3QKPiAgLSBicmlnaHRuZXNzCj4gIC0gaHVlCj4gIC0gc2F0dXJhdGlvbgo+IDMu
IFN1cHBvcnQgc3RyZWFtaW5nIGNvbnRyb2wKClNvIHNpbmNlIHRoZSBmaXJzdCBwb3N0IGluIEp1
bHkgMjAxOCB0aGVyZSBoYXMgYmVlbiBubyByZWFjdGlvbiBmcm9tCktvbnJhZCB0byB0aGlzIGlu
dGVyZmFjZS4gSSBndWVzcyBoZSBoYXMgcGxlbnR5IG9mIG90aGVyIHRoaW5ncyB0byBkby4KCk1h
eWJlIGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhIHRvIGFkZCBzb21lb25lIGVsc2UgYXMgYSBtYWlu
dGFpbmVyIGZvcgp0aGUgIlBVQkxJQyBJL08gSU5URVJGQUNFUyBBTkQgUFYgRFJJVkVSUyBERVNJ
R05TIiBzZWN0aW9uIGluCk1BSU5UQUlORVJTIHRvIGF2b2lkIHN1Y2ggc3RhbGxzIGluIHRoZSBm
dXR1cmU/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
