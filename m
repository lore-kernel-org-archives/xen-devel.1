From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 11/14] xen/mm: Switch
 mfn_to_virt()/virt_to_mfn() to using mfn_t
Date: Thu, 22 Nov 2018 08:44:56 -0700
Message-ID: <5BF6CEF802000078001FF08D@prv1-mh.provo.novell.com>
References: <1542806482-24030-1-git-send-email-andrew.cooper3@citrix.com>
 <1542806482-24030-12-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542806482-24030-12-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjExLjE4IGF0IDE0OjIxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gU2VlbWluZ2x5LCBhIG1ham9yaXR5IG9mIHVzZXJzIGVpdGhlciBvdmVycmlkZSB0aGUg
aGVscGVycyBhbnl3YXksIG9yIGhhdmUgYW4KPiBtZm5fdCBpbiB0aGVpciBoYW5kcy4KPiAKPiBV
cGRhdGUgdGhlIEFQSSwgYW5kIGFkanVzdCBhbGwgdXNlcnMgdG8gbWF0Y2guICBJbiBzb21lIHBs
YWNlcywgdXNlIHRoZQo+IHVuc2lnbmVkIGxvbmcgdmFyaWFudCBpbiBwbGFjZXMgd2hlcmUgd2Ug
YXJlIGludGVyYWN0aW5nIHdpdGggYW4gZXh0ZXJuYWwKPiBzdHJ1Y3QgYW5kIHRoZXJlIGlzIG5v
IGNoYW5jZSBvZiB0aGVtIHN3aXRjaGluZyB0byBtZm5fdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClNvbWUgb2YgdGhlIGNoYW5nZXMgdG8gdHJh
Y2UuYyBsb29rIGFzIGlmIHlvdSB3ZXJlIGZpeGluZyBhbiBhZGRyZXNzCnRydW5jYXRpb24gYnVn
LCBidXQgYWxsb2NhdGlvbnMgYXBwZWFyIHRvIGJlIGRvbmUgd2l0aCBhIHJlc3BlY3RpdmUKd2lk
dGggcmVzdHJpY3Rpb24uCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
