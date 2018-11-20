From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/4] x86: correct instances of PGC_allocated
 clearing
Date: Tue, 20 Nov 2018 10:12:11 -0700
Message-ID: <5BF4406B02000078001FE35F@prv1-mh.provo.novell.com>
References: <5BF4328902000078001FE240@prv1-mh.provo.novell.com>
 <5BF433E702000078001FE270@prv1-mh.provo.novell.com>
 <7cdc3f95-b97d-11ad-a8a2-5f7f325d57f4@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gP9ZS-0006Kn-Hh
 for xen-devel@lists.xenproject.org; Tue, 20 Nov 2018 17:12:18 +0000
In-Reply-To: <7cdc3f95-b97d-11ad-a8a2-5f7f325d57f4@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIwLjExLjE4IGF0IDE3OjU5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjAvMTEvMjAxOCAxNjoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZvciBkb21h
aW4gaGVhcCBwYWdlcyBhc3NpZ25lZCB0byBhIGRvbWFpbiBkcm9wcGluZyB0aGUgcGFnZSByZWZl
cmVuY2UKPj4gdGllZCB0byBQR0NfYWxsb2NhdGVkIG1heSBub3QgZHJvcCB0aGUgbGFzdCByZWZl
cmVuY2UsIGFzIG90aGVyd2lzZSB0aGUKPj4gdGVzdF9hbmRfY2xlYXJfYml0KCkgbWlnaHQgYWxy
ZWFkeSBhY3Qgb24gYW4gdW5vd25lZCBwYWdlLgo+Pgo+PiBXb3JrIGFyb3VuZCB0aGlzIHdoZXJl
IHBvc3NpYmxlLCBidXQgdGhlIG5lZWQgdG8gYWNxdWlyZSBleHRyYSBwYWdlCj4+IHJlZmVyZW5j
ZXMgaXMgYSBmYWlyIGhpbnQgdGhhdCByZWZlcmVuY2VzIHNob3VsZCBoYXZlIGJlZW4gYWNxdWly
ZWQgaW4KPj4gb3RoZXIgcGxhY2VzIGluc3RlYWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gLS0tCj4+IENvbXBpbGUgdGVzdGVkIG9ubHks
IGFzIEkgaGF2ZSBuZWl0aGVyIGEgbWVtLXNoYXJpbmcgbm9yIGEgbWVtLXBhZ2luZwo+PiBlbnZp
cm9ubWVudCBzZXQgdXAgcmVhZHkgdG8gYmUgdXNlZCBmb3Igc3VjaCB0ZXN0aW5nLgo+IAo+IFBl
cmhhcHMgd2Ugc2hvdWxkIGNvbXBpbGUgdGhlbSBvdXQgYnkgZGVmYXVsdD8gIEl0J3MgY2xlYXIg
dGhlcmUgYXJlIG5vCj4gcHJvZHVjdGlvbiB1c2VycywgZ2l2ZW4gdGhlIHF1YWxpdHkgb2YgdGhl
IGNvZGUgYW5kIGhvdyBtYW55IHNlY3VyaXR5Cj4gaXNzdWVzIHdlIHNwb3QgYWNjaWRlbnRhbGx5
LgoKWWVhaCwgd2VsbCAtIGlmIHdlJ3JlIGdvaW5nIHRvIGhhdmUgYSBwZXJoYXBzIG11Y2ggd2lk
ZXIgc2V0IG9mCmNvbmZpZyBvcHRpb25zLCB0aGVuIHRoZXNlIHR3byBzdXJlbHkgc2hvdWxkIGJl
Y29tZSAiZGVmYXVsdCBuIgp1bnRpbCB0aGV5J3ZlIGJlZW4gYnJvdWdodCBvdXQgb2YgdGhlaXIg
c29ycnkgc3RhdGUuCgo+IEVpdGhlciB3YXksIHRoZSBjb2RlIGxvb2tzIHBsYXVzaWJsZS4gIEFj
a2VkLWJ5OiBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpUaGFu
a3MuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
