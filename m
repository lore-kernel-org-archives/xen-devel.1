From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v6 1/4] xen: introduce SYMBOL
Date: Thu, 17 Jan 2019 04:45:46 -0700
Message-ID: <5C406AEA020000780020E9FA@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901091537100.15373@sstabellini-ThinkPad-X260>
 <CAF3u54Cfx3fGXY-bg2fYb+i_5kOA8qjrzOtK3sFF8j9bHQve8A@mail.gmail.com>
 <alpine.DEB.2.10.1901101745560.27759@sstabellini-ThinkPad-X260>
 <5C387472020000780020C9A7@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901110911310.27759@sstabellini-ThinkPad-X260>
 <a3743bd4b2d54188890945322e92fc1b@dornerworks.com>
 <CAF3u54AAmx0rBVPscfvqcx5f0ezYNCkrsagJgZb3v2GqfB9TEw@mail.gmail.com>
 <0e731cbd10b64a2faac309c04c2030e2@dornerworks.com>
 <alpine.DEB.2.10.1901111331490.27759@sstabellini-ThinkPad-X260>
 <3cc0862e5f0442d49c33c08f21b423ab@dornerworks.com>
 <5C3C63E0020000780020D22C@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901141030300.27759@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <a0500e7bb7244b5aa6dc1282a2375ad0@dornerworks.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901161630210.18561@sstabellini-ThinkPad-X260>
 <1CACC1FB020000D800417A66@prv1-mh.provo.novell.com>
 <5C3D97FE020000780020D9F3@prv1-mh.provo.novell.com>
 <B4D3ABC30200003B88BF86FB@prv1-mh.provo.novell.com>
 <5C3F051B020000780020E304@prv1-mh.provo.novell.com>
 <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SW9P=PZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gk69B-00005x-Qh
 for xen-devel@lists.xenproject.org; Thu, 17 Jan 2019 11:47:45 +0000
In-Reply-To: <529ED2F90200004D00417A66@prv1-mh.provo.novell.com>
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@gmail.com>, Julien Grall <julien.grall@arm.com>, Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjAxLjE5IGF0IDAxOjM3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gV2VkLCAxNiBKYW4gMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEluIGFueSBldmVu
dCAtIHNpbmNlIGludGVybWVkaWF0ZSB2YXJpYWJsZXMgbWVyZWx5IGhpZGUgdGhlCj4+IGNhc3Rp
bmcgZnJvbSB0aGUgY29tcGlsZXIsIGJ1dCB0aGV5IGRvbid0IHJlbW92ZSB0aGUgY2FzdHMsIHRo
ZQo+PiBzb2x1dGlvbiBpbnZvbHZpbmcgY2FzdHMgaXMgYmV0dGVyIGltbywgZm9yIGluY3Vycmlu
ZyBsZXNzIG92ZXJoZWFkLgo+IAo+IFRoaXMgaXMgd2hlcmUgSSBjb21wbGV0ZWx5IGRpc2FncmVl
LiBUaGUgaW50ZXJtZWRpYXRlIHZhcmlhYmxlcyBhcmUgbm90Cj4gaGlkaW5nIGNhc3RzIGZyb20g
dGhlIGNvbXBpbGVyLiBUaGVyZSB3ZXJlIG5ldmVyIGFueSBwb2ludGVycyBpbiB0aGlzCj4gY2Fz
ZS4gIFRoZSBsaW5rZXIgY3JlYXRlcyAic3ltYm9scyIsIG5vdCBwb2ludGVycywgY29tcGxldGVs
eSBpbnZpc2libGUKPiBmcm9tIEMgbGFuZC4gQXNzZW1ibHkgdXNlcyB0aGVzZSBzeW1ib2xzIHRv
IGluaXRpYWxpemUgdmFyaWFibGVzLiBXZQo+IGV4cG9zZSB0aGVzZSBhc3NlbWJseSB2YXJpYWJs
ZXMgYXMgaW50ZWdlciB0byBDIGxhbmRzLiBMRCBzY3JpcHRzIGFuZAo+IGFzc2VtYmx5IGhhdmUg
dGhlaXIgb3duIHRlcm1pbm9sb2d5IGFuZCBydWxlczogbmVpdGhlciAiX3N0YXJ0IiBub3IKPiAi
c3RhcnQiIGFyZSBwb2ludGVycyBhdCBhbnkgcG9pbnQgaW4gdGltZS4gVGhlIG9wZXJhdGlvbnMg
ZG9uZSBpbiB2YXIuUwo+IGlzIG5vdCBhIGNhc3QuIFRoZSBDIHNwZWMgaXMgaGFwcHksIHRoZSBj
b21waWxlciBpcyBoYXBweSwgTUlTUkEtQyBpcwo+IGhhcHB5LiBBbmQgd2UgZ2V0IHRvIGF2b2lk
IHRoZSB1Z2x5IFNZTUJPTCBtYWNybyB0aGF0IExpbnV4IHVzZXMuIEl0IGlzCj4gcmVhbGx5IGEg
d2luLXdpbi4KCldlbGwsIHRoYXQncyBhIHBvc2l0aW9uIG9uZSBjYW4gdGFrZS4gQnV0IHdlIGhh
dmUgdG8gc2V0dGxlIG9uIGFub3RoZXIKYXNwZWN0IHRoZW4gZmlyc3Q6IERvZXMgd2hhdCBpcyBu
b3QgZG9uZSBpbiBDIHVuZGVybHkgQydzIHJ1bGVzPyBJCnRob3VnaHQgeW91IHdlcmUgb2YgdGhl
IG9waW5pb24gdGhhdCB3aGF0IGNvbWVzIGZyb20gbGlua2VyIHNjcmlwdHMKZG9lcy4gSW4gd2hp
Y2ggY2FzZSB3aGF0IGNvbWVzIGZyb20gYXNzZW1ibHkgZmlsZXMgb3VnaHQgdG8sIHRvby4KKEZB
T0QgbXkgaW1wbGljYXRpb24gaXM6IElmIHRoZSBhbnN3ZXIgaXMgeWVzLCBib3RoIGFwcHJvYWNo
ZXMKdmlvbGF0ZSBDJ3MgcnVsZXMuIElmIHRoZSBhbnN3ZXIgaXMgbm8sIG5vIGNoYW5nZSBpcyBu
ZWVkZWQgYXQgYWxsLikKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
