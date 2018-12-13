From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v9 0/7] KVM: x86: Allow Qemu/KVM to use PVH
 entry point
Date: Thu, 13 Dec 2018 14:15:54 +0100
Message-ID: <ec55cffa-e98b-a758-e615-8fe0688f31bb__1266.69140668145$1544706884$gmane$org@redhat.com>
References: <1544468734-32763-1-git-send-email-maran.wilson@oracle.com>
 <20181211131825.GD27375@zn.tnic>
 <5fc083d4-1dbd-f2f9-3059-0e3e8dda9b25@oracle.com>
 <20181212203901.GI6653@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C63b=OW=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1gXQqT-0003tE-RZ
 for xen-devel@lists.xenproject.org; Thu, 13 Dec 2018 13:16:05 +0000
In-Reply-To: <20181212203901.GI6653@zn.tnic>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>, Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com, boris.ostrovsky@oracle.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, jgross@suse.com, gregkh@linuxfoundation.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvMTIvMTggMjE6MzksIEJvcmlzbGF2IFBldGtvdiB3cm90ZToKPiBPbiBUdWUsIERlYyAx
MSwgMjAxOCBhdCAxMToyOToyMUFNIC0wODAwLCBNYXJhbiBXaWxzb24gd3JvdGU6Cj4+IElzIHlv
dXIgcXVlc3Rpb24gYWJvdXQgd2hhdCBvcHRpb25zIHlvdSBuZWVkIHRvIHByb3ZpZGUgdG8gUWVt
dT8gT3IgaXMgeW91cgo+PiBxdWVzdGlvbiBhYm91dCB0aGUgU1cgaW1wbGVtZW50YXRpb24gY2hv
aWNlcz8KPj4KPj4gQXNzdW1pbmcgdGhlIGZvcm1lci4uLgo+IFllYWgsIHRoYXQncyB3aGF0IEkg
d2FudGVkIHRvIGtub3cuIEJ1dCBsb29raW5nIGF0IGl0LCBJJ20gYm9vdGluZwo+IGJ6SW1hZ2Ug
aGVyZSBqdXN0IGFzIHF1aWNrbHkgYW5kIGFzIGZsZXhpYmxlIHNvIEkgZG9uJ3Qgc2VlIHRoZQo+
IGFkdmFudGFnZSBvZiB0aGlzIG5ldyBtZXRob2QgZm9yIG15IHVzZSBjYXNlIGhlcmUgb2YgYm9v
dGluZyBrZXJuZWxzCj4gaW4gcWVtdS4KCkl0J3Mgbm90IGZpcm13YXJlIHRoYXQgaXMgc2xvdywg
ZGVjb21wcmVzc2lvbiBpcy4gIFVubGlrZSBYZW4sIHdoaWNoIGlzCnVzaW5nIFBWSCB3aXRoIGEg
cmVndWxhciBiekltYWdlIGFuZCBkZWNvbXByZXNzaW9uIGluIHRoZSBob3N0LCBLVk0gaXMKdXNp
bmcgUFZIIHRvIGJvb3QgYSB2bWxpbnV4IHdpdGggbm8gZGVjb21wcmVzc2lvbiBhdCBhbGwuCgpQ
YW9sbwoKPiBCdXQgbWF5YmUgdGhlcmUncyBhIGdvb2QgdXNlIGNhc2Ugd2hlcmUgZmlybXdhcmUg
aXMgc2xvdyBhbmQgb25lIGRvZXNuJ3QKPiByZWFsbHkgd2FubmEgbm9vZGxlIHRocm91Z2ggaXQg
b3Igd2hlbiBvbmUgZG9lcyBzdGFydCBhIGdhemlsbGlvbiBWTXMKPiBwZXIgc2Vjb25kIG9yIHdo
YXRldmVyLi4uCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
