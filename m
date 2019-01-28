From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3] x86/AMD: flush TLB after ucode update
Date: Mon, 28 Jan 2019 14:25:38 +0000
Message-ID: <53c2c231-8996-eb8f-7463-713f4c36f68b@citrix.com>
References: <5C4ED0A302000078002119D5@prv1-mh.provo.novell.com>
 <b8beb440-ef96-1764-4bac-fbd4d5649be1@citrix.com>
 <5C4F0F7A0200007800211C54@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sDuR=QE=citrix.com=prvs=92419a36d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1go7r4-0001cZ-AB
 for xen-devel@lists.xenproject.org; Mon, 28 Jan 2019 14:25:42 +0000
In-Reply-To: <5C4F0F7A0200007800211C54@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, Brian Woods <brian.woods@amd.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDEvMjAxOSAxNDoxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJj
aC94ODYvbWljcm9jb2RlX2FtZC5jCj4+PiArKysgYi94ZW4vYXJjaC94ODYvbWljcm9jb2RlX2Ft
ZC5jCj4+PiBAQCAtMjE4LDYgKzIxOCwxMiBAQCBzdGF0aWMgaW50IGFwcGx5X21pY3JvY29kZSh1
bnNpZ25lZCBpbnQKPj4+ICAKPj4+ICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmbWljcm9j
b2RlX3VwZGF0ZV9sb2NrLCBmbGFncyk7Cj4+PiAgCj4+PiArICAgIC8qCj4+PiArICAgICAqIEV4
cGVyaW1lbnRhbGx5IHRoaXMgaGVscHMgd2l0aCBwZXJmb3JtYW5jZSBpc3N1ZXMgb24gYXQgbGVh
c3QgY2VydGFpbgo+Pj4gKyAgICAgKiBGYW0xNSBtb2RlbHMuCj4+IFRoaXMgaXMgbm8gbG9uZ2Vy
IGV4cGVyaW1lbnRhbCwgbm93IHRoYXQgd2UgdW5kZXJzdGFuZCB3aHkuICBIb3cgYWJvdXQ6Cj4+
Cj4+ICJTb21lIHByb2Nlc3NvcnMgbGVhdmUgdGhlIHVjb2RlIGJsb2IgbWFwcGluZyBhcyBVQyBh
ZnRlciB0aGUgdXBkYXRlLiAKPj4gRmx1c2ggdGhlIG1hcHBpbmcgdG8gcmVnYWluIG5vcm1hbCBj
YWNoZWFiaWxpdHkiID8KPj4KPj4gVGhhdCB3YXksIGl0cyBhbHNvIHNsaWdodGx5IGxlc3MgY3J5
cHRpYyBpbiB0aGUgY29kZS4KPiBJIGRpZCBjb25zaWRlciByZS13b3JkaW5nIHRoZSBjb21tZW50
LCBidXQgZGVjaWRlZCB0byBsZWF2ZSBpdCB1bmNoYW5nZWQsCj4gZm9yIHRoZSB3YXkgeW91IHdv
cmQgaXQgbm90IGhhdmluZyBwdWJsaWMgcHJvb2YgYW55d2hlcmUgKGZvciBub3cgYXQgbGVhc3Qp
Lgo+IEknbSBmaW5lIHRvIGNoYW5nZSB0aGUgY29tbWVudCwgaWYgSSBjYW4gZXhwbGljaXQgZ28t
YWhlYWQgZnJvbSBBTUQuIEJyaWFuLAo+IFN1cmF2ZWU/CgpQcmVmZXJhYmx5IHdpdGggdGhlIGFt
ZW5kZWQgd29yZGluZywgKGJ1dCB1bHRpbWF0ZWx5LCBhcyBhZ3JlZWQgdXBvbgp3aXRoIEFNRCks
IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
