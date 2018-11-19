From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86: fix efi.lds dependency generation
Date: Mon, 19 Nov 2018 01:10:07 -0700
Message-ID: <5BF26FDF02000078001FD29D@prv1-mh.provo.novell.com>
References: <20181118131405.14122-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gOedK-0003l4-G5
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 08:10:14 +0000
In-Reply-To: <20181118131405.14122-1-wei.liu2@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjExLjE4IGF0IDE0OjE0LCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
UkFORENPTkZJRyBidWlsZHMgZGlzY292ZXIgZWZpLmxkcyBpcyBub3QgdXBkYXRlZCB3aGVuIGF1
dG9nZW5lcmF0ZWQKPiBoZWFkZXJzIGFyZSB1cGRhdGVkLgo+IAo+IFVwb24gaW5zcGVjdGlvbiwg
dGhlIGdlbmVyYXRlZCAuZCBmaWxlIGNvbnRhaW5zIHhlbi5sZHMubyBhcyB0YXJnZXQsCj4gbm90
IHRoZSBvbmNlIHRob3VnaHQgZWZpLmxkcy5vLiBUaGF0J3MgYmVjYXVzZSBnY2MgZGlzcmVnYXJk
cyB0aGUKPiBvdXRwdXQgb2JqZWN0IG5hbWUgc3BlY2lmaWVkIGJ5IC1vIHdoZW4gZ2VuZXJhdGlu
ZyBkZXBlbmRlbmN5LCBzbyB0aGUKPiBzZWQgaW52b2NhdGlvbiBoYXMgbm8gZWZmZWN0LgoKQXJn
dWFibHkgdGhpcyBpcyBhIGdjYyBidWcsIHdoaWNoIEknZCBleHBlY3QgdGhlbSB0byBmaXggYXQg
c29tZSBwb2ludC4KSGVuY2UgSSdkIHByZWZlciAuLi4KCj4gLS0tIGEveGVuL2FyY2gveDg2L01h
a2VmaWxlCj4gKysrIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCj4gQEAgLTIzOSw3ICsyMzksNyBA
QCB4ZW4ubGRzOiB4ZW4ubGRzLlMKPiAgCj4gIGVmaS5sZHM6IHhlbi5sZHMuUwo+ICAJJChDQykg
LVAgLUUgLVVpMzg2IC1ERUZJICQoZmlsdGVyLW91dCAtV2EkKGNvbW1hKSUsJChBRkxBR1MpKSAt
byAkQCAkPAo+IC0Jc2VkIC1lICdzL2VmaVwubGRzXC5vOi9lZmlcLmxkczovZycgPC4kKEBGKS5k
ID4uJChARikuZC5uZXcKPiArCXNlZCAtZSAncy94ZW5cLmxkc1wubzovZWZpXC5sZHM6L2cnIDwu
JChARikuZCA+LiQoQEYpLmQubmV3CgouLi4gaWYgdGhpcyBhbGxvd2VkIGZvciBib3RoIHRoZSBv
YnNlcnZlZCBhbmQgdGhlIHN1cHBvc2VkbHkKY29ycmVjdCB2YXJpYW50cy4gUGVyaGFwcyBzaW1w
bHkgYWxsb3dpbmcgZm9yIGFueSAqLmxkcy5vIGFzCmEgdGFyZ2V0IHdvdWxkIGJlIGJlc3Q/CgpB
bHNvIHdoaWxlIGF0IGl0IHdvdWxkIHlvdSBtaW5kIHN0cmlwcGluZyB0aGUgYm9ndXMgLwpzdXBl
cmZsdW91cyAoYWZhaWN0KSBiYWNrc2xhc2ggZXNjYXBpbmcgdGhlIC4gaW4gdGhlCnJlcGxhY2Vt
ZW50IHN0cmluZywgYXQgd2hpY2ggcG9pbnQgJEAgd291bGQgaW1vIGJlIGJldHRlcgp0byB1c2Ug
dGhlcmUgKG9yICQoQEYpIHRvIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgaW5wdXQgYW5kCm91dHB1
dCByZWRpcmVjdGlvbik/IChJIHJlYWxpemUgSSBtdXN0IGhhdmUgYmVlbiB0aGUgb25lIHRvCm5v
dCBkbyBpdCB0aGlzIHdheSBpbiB0aGUgZmlyc3QgcGxhY2UuKQoKSmFuCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
