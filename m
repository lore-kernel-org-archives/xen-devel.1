From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 13/14] xen/mm: Convert {s,
 g}et_gpfn_from_mfn() to use typesafe MFN
Date: Fri, 10 May 2019 15:27:43 +0100
Message-ID: <1dd02ece-4d2c-0600-4078-f3dde8d7d5ab@citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-14-julien.grall@arm.com>
 <5CD57AEC020000780022D885@prv1-mh.provo.novell.com>
 <253e3a5c-8e84-a671-499c-7009d93658bb@arm.com>
 <5CD57F9F020000780022D936@prv1-mh.provo.novell.com>
 <9b8e78a4-db71-1b0d-a9c6-89a35e5feb2f@arm.com>
 <5CD58484020000780022D98E@prv1-mh.provo.novell.com>
 <fae0871e-1ca9-890b-f782-562501782bcb@citrix.com>
 <5CD58740020000780022D9D4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KsvH=TK=citrix.com=prvs=026b205b0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hP6V3-0002Zl-7K
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 14:27:49 +0000
In-Reply-To: <5CD58740020000780022D9D4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTAvMDUvMjAxOSAxNToxNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTAuMDUuMTkg
YXQgMTY6MDUsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gVGhlIG92ZXJ3
aGVsbWluZyBtYWpvcml0eSB3YXkgb2YgcHJpbnRpbmcgbWZucyBpcyB2aWE6Cj4+Cj4+IG1mbiAl
IlBSSV9tZm4iCj4+Cj4+IHdoaWNoIGlzIGFsbW9zdCBmdWxseSBjb25zaXN0ZW50IGFjcm9zcyB0
aGUgeDg2IGNvZGUuCj4+Cj4+IFZhcmlvdXMgYml0cyBvZiBjb21tb24gY29kZSwgYW5kIG1vc3Qg
b2YgQVJNIGNvZGUgdXNlIHZhcmlhdGlvbnMgb2YKPj4gJSMiUFJJX21mbiIsIGFuZCB0aGlzIG91
Z2h0IHRvIGJlIGZpeGVkLgo+IE9oLCBzbyB5b3UncmUgZmluZSB3aXRoIG9taXR0aW5nIHRoZSAw
eCBoZXJlPyBUaGF0J3MgZmluZSB3aXRoIG1lLiBJJ3ZlCj4gc3VnZ2VzdGVkIGl0cyBhZGRpdGlv
biBtZXJlbHkgYmVjYXVzZSBjb21tb25seSB5b3UgYXNrIGZvciB0aGUgcHJlZml4LgoKVGhpcyBm
YWxscyBpbnRvIHRoZSBjYXRlZ29yeSBvZiAid2hhdCBpcyBjb21tb25seSBkb25lIiB2cyAid2hh
dCBpcyBpZGVhbCIuCgpQZXJzb25hbGx5LCBJJ2QgcHJlZmVyIHRvIGhhdmUgbm8gYW1iaWd1aXR5
IGJldHdlZW4gZGVjIGFuZCBoZXgsIGFuZAp3b3VsZCBpbiBwcmluY2lwbGUgcHJlZmVyIHRvIHN0
YXJ0IHByaW50aW5nIG1mbnMgd2l0aCBhIGxlYWRpbmcgMHguCgpIb3dldmVyLCB3ZSBhKSBkb24n
dCBoYXZlIHRoZSBjdXJyZW50IGV4cGVjdGF0aW9ucyBkb2N1bWVudGVkLCBhbmQgYikgSQpjb25z
aWRlciBpdCBydWRlIGFuZCBvYnN0cnVjdGl2ZSB0byBtYWtlIGFuIHVuZG9jdW1lbnRlZCBjaGFu
Z2UgdG8KZXhwZWN0YXRpb25zIGFzIHBhcnQgb2YgcmV2aWV3aW5nIGFuIHVucmVsYXRlZCBjaGFu
Z2UuwqAgKEkgY2VydGFpbmx5CmZpbmQgaXQgb2JzdHJ1Y3RpdmUgd2hlbiBvdGhlcnMgZG8gaXQg
dG8gbWUgaW4gcmV2aWV3LikKClNvIGxvbmcgYXMgdGhlIG51bWJlciBpcyBjbGVhcmx5IGlkZW50
aWZpZWQgYXMgYW4gbWZuICh3aGljaCBpdCB3YXNuJ3QKcHJldmlvdXNseSksIHRoZSBwcmV2YWls
aW5nIGZvcm1hdCB1c2VkIGluIFhlbiBpcyAlMDVseCwgYW5kIHRoaXMgd2hhdApzaG91bGQgYmUg
dXNlZC4KCldoZW4gcG9pbnQgYSkgYWJvdmUgaXMgYWRkcmVzc2VkLCB0aGVyZSBjYW4gYmUgYSBw
cm9wb3NlZCBjaGFuZ2UgdG8KZXhwZWN0YXRpb25zIGJ5IHBhdGNoaW5nIHRoZSBkb2NzIGFuZCBh
ZGp1c3RpbmcgdGhlIGV4aXN0aW5nIHVzZXJzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
