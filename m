From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 10:21:59 -0800
Message-ID: <6f71c714-1a72-1619-fd1f-f5d1044ce217__23877.2138291553$1544206886$gmane$org@oracle.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <2c289956-0e6a-700c-605d-83685fbb08f9@suse.com>
 <0a2f692a-f7df-8ad1-9d34-96f5e36926db@redhat.com>
 <3f95d053-87aa-ad45-03e6-1e1977283eb4@suse.com>
 <d0fd8799-35ea-fba5-9d0d-94feead85943@redhat.com>
 <5d1d0071-1db4-ea03-027f-2a12812b78d0@suse.com>
 <d18b961a-d115-8d12-8ee4-eb1a3466959c@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=d0ej=OQ=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1gVKm0-00019W-1W
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 18:22:48 +0000
In-Reply-To: <d18b961a-d115-8d12-8ee4-eb1a3466959c@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Juergen Gross <jgross@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTIvNy8yMDE4IDc6MTQgQU0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMDcvMTIvMTgg
MTQ6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA3LzEyLzIwMTggMTQ6NTIsIFBhb2xv
IEJvbnppbmkgd3JvdGU6Cj4+PiBPbiAwNy8xMi8xOCAxNDo1MCwgSnVlcmdlbiBHcm9zcyB3cm90
ZToKPj4+PiBUaGUgUFZIIGJvb3QgZW50cnkgaXMgaW4gdGhlIHNhbWUgYnpJbWFnZSBiaW5hcnkg
YXMgdGhlIG5vcm1hbCBvbmUuCj4+Pj4gSXRzIGp1c3QgYW5vdGhlciBlbnRyeSwgc2ltaWxhciB0
byB0aGUgWGVuIFBWIGJvb3QgZW50cnkuIFNvIHRoZSBiaW5hcnkKPj4+PiBhcmNoL3g4Ni9ib290
L2J6aW1hZ2UgY2FuIGJlIGJvb3RlZCBlaXRoZXIgb24gYmFyZSBtZXRhbCB2aWEgZ3J1YjIgb3IK
Pj4+PiBvdGhlciBib290LWxvYWRlcnMsIGFzIFhlbiBQVi1ndWVzdCwgYXMgWGVuIFBWSC1ndWVz
dCwgb3IgYXMgS1ZNCj4+Pj4gUFZILWd1ZXN0LiBTbyBvbmUgYnVpbGQgYW5kIG9uZSBiaW5hcnku
IFRoZSBub24tc3RhbmRhcmQgYm9vdCBlbnRyaWVzCj4+Pj4gKFBWLSBvciBQVkgtbm9kZSkgYXJl
IGZvdW5kIHZpYSBFTEYtbm90ZXMgYnkgdGhlIGJvb3QgbG9hZGVyIChxZW11IGluCj4+Pj4gY2Fz
ZSBvZiBLVk0pLgo+Pj4gQnV0IHRoZSBiekltYWdlIGlzIG5vdCBhbiBFTEYgYmluYXJ5LCBhbmQg
aXQgaXMgY29tcHJlc3NlZCwgaXNuJ3QgaXQ/Cj4+PiAvbWUgaXMgY29uZnVzZWQuIDopCj4+IGdy
dWIyIChhbmQgcWVtdSwgdG9vKSBjYW4gZGVjb21wcmVzcyBpdC4gQW5kIHRoZSBkZWNvbXByZXNz
ZWQgcmVzdWx0Cj4+ICJ2bWxpbnV4IiBpcyBhbiBFTEYtYmluYXJ5Lgo+IEFoYSAtIGZvciBLVk0s
IHRoZSBtYWluIGFkdmFudGFnZSBvZiBQVkggd291bGQgYmUgdG8gc2tpcCB0aGUgY29zdCBvZgo+
IGRlY29tcHJlc3Npb24sIGFuZCB0aGF0IGlzIHdoYXQgY29uZnVzZWQgbWUgKGFsc28gd2UgcHJv
YmFibHkgcHJlZmVyIG5vdAo+IGhhdmluZyBhbnkgZGVjb21wcmVzc2lvbiBjb2RlIHJ1bm5pbmcg
aW4gUUVNVSwgc2luY2UgdGhhdCBpbmNyZWFzZXMgdGhlCj4gYXR0YWNrIHN1cmZhY2U7IHRoZXJl
J3Mgbm8gcmVhbCBkaXNhZHZhbnRhZ2UgdG8gdXNpbmcgdGhlIGV4aXN0aW5nCj4gbGludXhib290
IGNvZGUgaWYgd2UncmUgZ2l2ZW4gYSBiekltYWdlKS4gIFNvLCBhdCBsZWFzdCBmb3Igbm93LCBL
Vk0KPiB3b3VsZCBnbyB3aXRoIHRoZSB0d28tYmluYXJpZXMvb25lLWNvbmZpZyBhcHByb2FjaC4K
ClllYWgsIHRoZSB3YXkgd2UgaGF2ZSBiZWVuIHRlc3Rpbmcgd2l0aCB0aGUgUWVtdS9xYm9vdCBj
aGFuZ2VzIHRoYXQgTGlhbSAKaGFzIG91dCBmb3IgcmV2aWV3LCBpZiB5b3UgcHJvdmlkZSB0aGUg
YnpJbWFnZSBiaW5hcnkgaW4gdGhlIC1rZXJuZWwgCmFyZ3VtZW50LCBsZWdhY3kgYmVoYXZpb3Ig
aXMgZm9sbG93ZWQuIEhvd2V2ZXIgaWYgeW91IHByb3ZpZGUgdGhlIAp2bWxpbnV4IGJpbmFyeSAo
ZnJvbSB0aGUgc2FtZSBrZXJuZWwgYnVpbGQpLCBRZW11IHJlY29nbml6ZXMgaXQgYXMgYW4gCkVM
RiBiaW5hcnksIGxvb2tzIGZvciB0aGUgcHJlc2VuY2Ugb2YgdGhlIFBWSCBFTEZOT1RFLCBhbmQg
KGlmIHRoZSAKRUxGTk9URSBpbiBxdWVzdGlvbiBpcyBmb3VuZCkgdXNlcyB0aGF0IGVudHJ5IHBv
aW50IGluc3RlYWQuCgpTbyBhdCB0aGlzIHBvaW50LCB0aGUgb25seSBmZWVkYmFjay9jb21tZW50
IHN0aWxsIG91dHN0YW5kaW5nIGZyb20geW91IAppcyB0aGUgb25lIGFib3V0IHJlbW92aW5nIEtW
TV9HVUVTVF9QVkggcmlnaHQ/CgpJJ2xsIGhvbGQgb2ZmIG9uIHNlbmRpbmcgYSB2OSB1bnRpbCBu
ZXh0IHdlZWsgdG8gc2VlIGlmIHRoZXJlIGlzIGFueSAKYWRkaXRpb25hbCBmZWVkYmFjayBvciB0
ZXN0IHJlc3VsdHMuCgpUaGFua3MsCi1NYXJhbgoKPiBTb3JyeSBmb3IgaGF2aW5nIHlvdSBsZWN0
dXJlIG1lLCBpdCdzIG11Y2ggY2xlYXJlciBub3cuICBUaGFua3MsCj4KPiBQYW9sbwoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
