From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 1/6] xen: introduce ptrdiff_t
Date: Tue, 26 Feb 2019 03:54:08 -0700
Message-ID: <5C751AD0020000780021A412@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyaNJ-0001ei-98
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 10:54:13 +0000
In-Reply-To: <1551127822-25886-1-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>, ian.jackson@citrix.com
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDIxOjUwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gSW50cm9kdWNlIHRoZSBuZXcgdHlwZSAicHRyZGlmZl90IiB3aGljaCBpcyBkZWZpbmVkIGFz
IHRoZSBzaWduZWQKPiBpbnRlZ2VyIHR5cGUgb2YgdGhlIHJlc3VsdCBvZiBzdWJ0cmFjdGluZyB0
d28gcG9pbnRlcnMuIFVzZQo+IF9fUFRSRElGRl9UWVBFX18gdG8gZGVmaW5lIGl0Lgo+IAo+IEFs
c28sIHVzZSBfX1VJTlRQVFJfVFlQRV9fIGZvciB1aW50cHRyX3QgZm9yIGNvbnNpc3RlbmN5LgoK
UGxlYXNlIGNhbiB5b3Ugbm90IG1peCBhZGp1c3RtZW50cyB0byBleGlzdGluZyB0eXBlIGRlZmlu
aXRpb25zCmludG8gYSBwYXRjaCBhZGRpbmcgYSBuZXcgdHlwZT8gX19VSU5UUFRSX1RZUEVfXywg
YXMgc2FpZCBpbgpwcmlvciBkaXNjdXNzaW9ucyBhbmQgb3RoZXIgdGhhbiBfX1BUUkRJRkZfVFlQ
RV9fLCBpcyBub3QKcHJvdmlkZWQgdW5jb25kaXRpb25hbGx5IGJ5IGdjYyAoYW5kIEkgZGlkbid0
IHRyeSB0byB3b3JrIG91dCB0aGUKY29uZGl0aW9uKHMpIHNvIGZhciksIHNvIHVzZSBvZiBpdCBt
YXkgaW50cm9kdWNlIGEgcmVncmVzc2lvbgoobWFuaWZlc3RpbmcgYXMgYSBidWlsZCBmYWlsdXJl
IHNvbWV3aGVyZSkuIFRoZXJlZm9yZSwgaWYgd2UgYXJlCnRvIGluZGVlZCBnbyB0aGlzIHJvdXRl
LCB3ZSBzaG91bGQgYXQgbGVhc3QgbGVhdmUgb3Vyc2VsdmVzIHRoZQpvcHRpb24gb2YgZWFzaWx5
IHJldmVydGluZyBvbmUgY2hhbmdlIHdpdGhvdXQgdGhlIG90aGVyLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
