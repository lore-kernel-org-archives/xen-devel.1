From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH RFC 4/4] xen: use per-vcpu TSS and stacks
	for pv domains
Date: Tue, 9 Jan 2018 17:01:53 +0000
Message-ID: <3430712a-6b57-fd55-5cf0-727f9817d7da@citrix.com>
References: <20180109142700.12028-1-jgross@suse.com>
 <20180109142700.12028-5-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=ucbw=ee=citrix.com=prvs=5406c8d38=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eYxJE-0006ip-CD
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2018 17:03:32 +0000
In-Reply-To: <20180109142700.12028-5-jgross@suse.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: ian.jackson@eu.citrix.com, jbeulich@suse.com
List-Id: xen-devel@lists.xenproject.org

T24gMDkvMDEvMTggMTQ6MjcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gSW5zdGVhZCBvZiB1c2lu
ZyB0aGUgVFNTIGFuZCBzdGFja3Mgb2YgdGhlIHBoeXNpY2FsIHByb2Nlc3NvciBhbGxvY2F0ZQo+
IHRoZW0gcGVyIHZjcHUsIG1hcCB0aGVtIGluIHRoZSBwZXIgZG9tYWluIGFyZWEsIGFuZCB1c2Ug
dGhvc2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
CgpJIGRvbid0IHNlZSBhbnl0aGluZyBoZXJlIHdoaWNoIHVwZGF0ZXMgdGhlIGZpZWxkcyBpbiB0
aGUgVFNTIGFjcm9zcwpjb250ZXh0IHN3aXRjaC7CoCBXaXRob3V0IGl0LCB5b3UnbGwgYmUgdGFr
aW5nIE5NSXMvTUNFcy9ERidzIG9uIHRoZQp3cm9uZyBzdGFjay4KCkkgc3RpbGwgZG9uJ3Qgc2Vl
IGhvdyB5b3VyIHBsYW4gaXMgdmlhYmxlIGluIHRoZSBmaXJzdCBwbGFjZSwgYW5kIGlzCmFkZGlu
ZyBzdWJzdGFudGlhbGx5IG1vcmUgY29tcGxleGl0eSB0byBhbiBhbnN3ZXIgd2hpY2ggZG9lc24n
dCBuZWVkIGl0LgoKSSdtIGFmcmFpZCBJJ20gb24gdGhlIHZlcmdlIG9mIGEgbmFjayB1bmxlc3Mg
eW91IGNhbiBleHBsYWluIGhvdyBpcwppbnRlbmRlZCB0byBiZSBzYWZlLCBhbmQgYmV0dGVyIHRo
YW4gd2hhdCB3ZSBjdXJyZW50bHkgaGF2ZS4KCn5BbmRyZXcKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
