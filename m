From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2] x86: assorted array_index_nospec()
 insertions
Date: Wed, 29 Aug 2018 01:07:45 -0600
Message-ID: <5B86464102000078001E2D98@prv1-mh.provo.novell.com>
References: <5B59C78002000078001D8317@prv1-mh.provo.novell.com>
 <a6c25ed5-9485-ea70-664e-5f25a4915aec@bitdefender.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuuZx-0003gP-9U
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 07:07:49 +0000
In-Reply-To: <a6c25ed5-9485-ea70-664e-5f25a4915aec@bitdefender.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>, Razvan Cojocaru <rcojocaru@bitdefender.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI2LjA3LjE4IGF0IDE1OjQzLCA8cmNvam9jYXJ1QGJpdGRlZmVuZGVyLmNvbT4gd3Jv
dGU6Cj4gT24gMDcvMjYvMjAxOCAwNDowNyBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IERvbid0
IGNoYW5jZSBoYXZpbmcgU3BlY3RyZSB2MSAoaW5jbHVkaW5nIEJDQlMpIGdhZGdldHMuIEluIHNv
bWUgb2YgdGhlCj4+IGNhc2VzIHRoZSBpbnNlcnRpb25zIGFyZSBtb3JlIG9mIHByZWNhdXRpb25h
cnkgbmF0dXJlIHJhdGhlciB0aGFuIHRoZXJlCj4+IHByb3ZhYmx5IGJlaW5nIGEgZ2FkZ2V0LCBi
dXQgSSB0aGluayB3ZSBzaG91bGQgZXJyIG9uIHRoZSBzYWZlIChzZWN1cmUpCj4+IHNpZGUgaGVy
ZS4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
Pj4gLS0tCj4+IHYyOiBSZS1iYXNlLiBEcm9wIGd1ZXN0X2NwdWlkKCkgY2hhbmdlcy4gRml4IG9m
Zi1ieS0xIGluCj4+ICAgICB7ZG8sY29tcGF0fV9kbV9vcCgpLgo+IAo+IEFja2VkLWJ5OiBSYXp2
YW4gQ29qb2NhcnUgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+CgpUaGFua3MuIEFuZHJldz8K
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
