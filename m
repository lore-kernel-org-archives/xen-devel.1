From: Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH RFC] mm/memory_hotplug: Introduce memory
 block types
Date: Mon, 1 Oct 2018 09:24:35 -0700
Message-ID: <05493150-5e4e-30bd-f772-0c6d88240030__48973.3696719215$1538411024$gmane$org@linux.intel.com>
References: <20180928150357.12942-1-david@redhat.com>
 <5dba97a5-5a18-5df1-5493-99987679cf3a@linux.intel.com>
 <147d20c7-2a07-2305-9b44-76fdb735173b@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=hcwn=mn=linux.intel.com=dave.hansen@srs-us1.protection.inumbo.net>)
 id 1g70zz-0005Xw-Oh
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 16:24:43 +0000
In-Reply-To: <147d20c7-2a07-2305-9b44-76fdb735173b@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Balbir Singh <bsingharora@gmail.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Pavel Tatashin <pavel.tatashin@microsoft.com>, Michal Hocko <mhocko@suse.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Rashmica Gupta <rashmica.g@gmail.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-s390@vger.kernel.org, Michael Neuling <mikey@neuling.org>, Stephen Hemminger <sthemmin@microsoft.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Michael Ellerman <mpe@ellerman.id.au>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org, Rob Herring <robh@ker>
List-Id: xen-devel@lists.xenproject.org

PiBIb3cgc2hvdWxkIGEgcG9saWN5IGluIHVzZXIgc3BhY2UgbG9vayBsaWtlIHdoZW4gbmV3IG1l
bW9yeSBnZXRzIGFkZGVkCj4gLSBvbiBzMzkweD8gTm90IG9ubGluaW5nIHBhcmF2aXJ0dWFsaXpl
ZCBtZW1vcnkgaXMgdmVyeSB3cm9uZy4KCkJlY2F1c2Ugd2UncmUgZ29pbmcgdG8gYmFsbG9vbiBp
dCBhd2F5IGluIGEgbW9tZW50IGFueXdheT8KCldlIGhhdmUgYXV0by1vbmxpbmluZy4gIFdoeSBp
c24ndCB0aGF0IGJlaW5nIHVzZWQgb24gczM5MD8KCgo+IFNvIHRoZSB0eXBlIG9mIG1lbW9yeSBp
cyB2ZXJ5IGltcG9ydGFudCBoZXJlIHRvIGhhdmUgaW4gdXNlciBzcGFjZS4KPiBSZWx5aW5nIG9u
IGNoZWNrcyBsaWtlICJpc1MzOTAoKSIsICJpc0tWTUd1ZXN0KCkiIG9yICJpc0h5cGVyVkd1ZXN0
KCkiCj4gdG8gZGVjaWRlIHdoZXRoZXIgdG8gb25saW5lIG1lbW9yeSBhbmQgaG93IHRvIG9ubGlu
ZSBtZW1vcnkgaXMgd3JvbmcuCj4gT25seSBzb21lIHNwZWNpZmljIG1lbW9yeSB0eXBlcyAod2hp
Y2ggSSBjYWxsICJub3JtYWwiKSBhcmUgdG8gYmUKPiBoYW5kbGVkIGJ5IHVzZXIgc3BhY2UuCj4g
Cj4gRm9yIHRoZSBvdGhlciBvbmVzLCB3ZSBleGFjdGx5IGtub3cgd2hhdCB0byBkbzoKPiAtIHN0
YW5kYnk/IGRvbid0IG9ubGluZQoKSSB0aGluayB5b3UncmUgaG9ycmlibHkgY29uZmxhdGluZyB0
aGUgc29mdHdhcmUgZGVzaXJlIGZvciB3aGF0IHRoZSBzdGFlCnNob3VsZCBiZSBhbmQgdGhlIGhh
cmR3YXJlIGl0c2VsZi4KCj4+IEFzIGZvciB0aGUgT09NIGlzc3VlcywgdGhhdCBzb3VuZHMgbGlr
ZSBzb21ldGhpbmcgd2UgbmVlZCB0byBmaXggYnkKPj4gcmVmdXNpbmcgdG8gZG8gKG9yIGRlbGF5
aW5nKSBob3QtYWRkIG9wZXJhdGlvbnMgb25jZSB3ZSBjb25zdW1lIHRvbyBtdWNoCj4+IFpPTkVf
Tk9STUFMIGZyb20gbWVtbWFwW11zIHJhdGhlciB0aGFuIHRyeWluZyB0byBpbmRpcmVjdGx5IHRl
bGwKPj4gdXNlcnNwYWNlIHRvIGh1cnJ5IHRoaW5nIGFsb25nLgo+IAo+IFRoYXQgaXMgYSBtb3Zp
bmcgdGFyZ2V0IGFuZCBkb2luZyB0aGF0IGF1dG9tYXRpY2FsbHkgaXMgYmFzaWNhbGx5Cj4gaW1w
b3NzaWJsZS4KCk5haC4gIFdlIGtub3cgaG93IG11Y2ggbWV0YWRhdGEgd2UndmUgYWxsb2NhdGVk
LiAgV2Uga25vdyBob3cgbXVjaApaT05FX05PUk1BTCB3ZSBhcmUgZWF0aW5nLiAgV2UgY2FuICpl
YXNpbHkqIGFkZCBzb21ldGhpbmcgdG8KYWRkX21lbW9yeSgpIHRoYXQganVzdCBzbGVlcHMgdW50
aWwgdGhlIHJhdGlvIGlzIG5vdCBvdXQtb2Ytd2hhY2suCgo+IFlvdSBjYW4gYWRkIGEgbG90IG9m
IG1lbW9yeSB0byB0aGUgbW92YWJsZSB6b25lIGFuZAo+IGV2ZXJ5dGhpbmcgaXMgZmluZS4gU3Vk
ZGVubHkgYSBsb3Qgb2YgcHJvY2Vzc2VzIGFyZSBzdGFydGVkIC0gYm9vbS4KPiBNT1ZBQkxFIHNo
b3VsZCBvbmx5IGV2ZXJ5IGJlIHVzZWQgaWYgeW91IGV4cGVjdCBhbiB1bnBsdWcuIEFuZCBmb3IK
PiBwYXJhdmlydHVhbGl6ZWQgZGV2aWNlcywgYSAidHlwaWNhbCIgdW5wbHVnIGRvZXMgbm90IGV4
aXN0LgoKTm8sIGl0J3MgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoYXQuICBQZW9wbGUgdXNlIE1P
VkFCTEUsIGZvciBpbnN0YW5jZSwKdG8gYWxsb3cgbW9yZSBjb25zaXN0ZW50IGh1Z2UgcGFnZSBh
bGxvY2F0aW9ucy4gIEl0J3MgY2VydGFpbmx5IG5vdCBqdXN0CmhvdC1yZW1vdmUuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
