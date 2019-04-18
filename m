From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
Date: Thu, 18 Apr 2019 11:03:09 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
 <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=tnl2=SU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hHBNP-000374-Lc
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 18:03:11 +0000
In-Reply-To: <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAxNyBBcHIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDQv
MTcvMTkgOTo0NSBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gV2VkLCAyNyBN
YXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ID4gPiBDbGFuZyB1bmRlcnN0YW5kcyB0aGUg
R0NDaXNtIGluIHVzZSBoZXJlLCBidXQgc3RpbGwgY29tcGxhaW5zIHRoYXQgc3AgaXMKPiA+ID4g
dW5pdGlhbGlzZWQuIEluIHN1Y2ggY2FzZXMsIHJlc29ydCB0byB0aGUgb2xkZXIgdmVyc2lvbnMg
b2YgdGhpcyBjb2RlLAo+ID4gPiB3aGljaCBkaXJlY3RseSByZWFkIHNwIGludG8gdGhlIHRlbXBv
cmFyeSB2YXJpYWJsZS4KPiA+ID4gCj4gPiA+IE5vdGUgdGhhdCB3ZSBzdGlsbCBrZWVwIHRoZSBH
Q0Npc20gaW4gdGhlIGRlZmF1bHQgY2FzZSwgYXMgaXQgY2F1c2VzIEdDQwo+ID4gPiB0byBjcmVh
dGUgcmF0aGVyIGJldHRlciBhc3NlbWJseS4KPiA+ID4gCj4gPiA+IFRoaXMgaXMgYmFzZWQgb24g
dGhlIHg4NiBjb3VudGVycGFydC4KPiA+IAo+ID4gSSB1bmRlcnN0YW5kIHRoaXMgaXMgYmFzZWQg
b24gYW4gZXhpc3RpbmcgYXBwcm9hY2ggYnV0IHdoYXQgYWJvdXQgb3RoZXIKPiA+IGNvbXBpbGVy
cz8gSSBoYXZlIGEgc3VnZ2VzdGlvbiBiZWxvdy4KPiAKPiBXaGF0IGlmIHRoZSBjb21waWxlciBh
Y3R1YWxseSBzdXBwb3J0IG5hbWVkIHJlZ2lzdGVycz8gV2h5IHdvdWxkIHdlIG1ha2UgdGhlCj4g
Y29kZSBsZXNzIGVmZmljaWVudD8KCkl0IGlzIG5vdCBteSBpbnRlbnRpb24gdG8gbWFrZSB0aGUg
Y29kZSBsZXNzIGVmZmljaWVudCBmb3Igb3RoZXIKY29tcGlsZXJzLiBIb3dldmVyLCByZWFkaW5n
IHRoZSBjb21taXQgbWVzc2FnZSBhbmQgdGhlIHBhdGNoIEkgaGF2ZSB0aGUKaW1wcmVzc2lvbiB0
aGF0IHRoZSBjbGFuZyB2ZXJzaW9uIGlzIG1vcmUgbGlrZWx5IHRvIGJlIGFwcGxpY2FibGUgdG8K
b3RoZXIgY29tcGlsZXJzLCBjb21wYXJlZCB0byB0aGUgZ2NjIHZlcnNpb24uIE1vcmUgInN0YW5k
YXJkIi4gVGhlCnJlYXNvbiBpcyB0aGF0IHRoZSBjbGFuZyB2ZXJzaW9uIG9ubHkgcmVxdWlyZXMg
YXNtIGlubGluZSwgd2hpbGUgdGhlIGdjYwp2ZXJzaW9uIHJlcXVpcmVzIGJvdGggYXNtIGlubGlu
ZSBhbmQgbmFtZWQgcmVnaXN0ZXJzLiBGb3IgdGhlIHNha2Ugb2YKZ2V0dGluZyBYZW4gdG8gY29t
cGlsZSBvdXQgb2YgdGhlIGJveCB3aXRoIGFueSBDIGNvbXBpbGVyLCBJIHRoaW5rIGl0IGlzCmJl
c3QgaWYgd2UgZGVmYXVsdCB0byB0aGUgbGVzcyBkZW1hbmRpbmcgdmVyc2lvbiBvZiB0aGUgaW1w
bGVtZW50YXRpb24KZm9yIHVua25vd24gY29tcGlsZXJzLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
