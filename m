From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 16:14:15 +0100
Message-ID: <d18b961a-d115-8d12-8ee4-eb1a3466959c__5720.30814732916$1544195587$gmane$org@redhat.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <2c289956-0e6a-700c-605d-83685fbb08f9@suse.com>
 <0a2f692a-f7df-8ad1-9d34-96f5e36926db@redhat.com>
 <3f95d053-87aa-ad45-03e6-1e1977283eb4@suse.com>
 <d0fd8799-35ea-fba5-9d0d-94feead85943@redhat.com>
 <5d1d0071-1db4-ea03-027f-2a12812b78d0@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3q+u=OQ=gmail.com=paolo.bonzini@srs-us1.protection.inumbo.net>)
 id 1gVHpg-00063W-Gf
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 15:14:24 +0000
Received: by mail-wr1-x441.google.com with SMTP id r10so4108488wrs.10
 for <xen-devel@lists.xenproject.org>; Fri, 07 Dec 2018 07:14:23 -0800 (PST)
In-Reply-To: <5d1d0071-1db4-ea03-027f-2a12812b78d0@suse.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTggMTQ6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gT24gMDcvMTIvMjAxOCAx
NDo1MiwgUGFvbG8gQm9uemluaSB3cm90ZToKPj4gT24gMDcvMTIvMTggMTQ6NTAsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBUaGUgUFZIIGJvb3QgZW50cnkgaXMgaW4gdGhlIHNhbWUgYnpJbWFn
ZSBiaW5hcnkgYXMgdGhlIG5vcm1hbCBvbmUuCj4+PiBJdHMganVzdCBhbm90aGVyIGVudHJ5LCBz
aW1pbGFyIHRvIHRoZSBYZW4gUFYgYm9vdCBlbnRyeS4gU28gdGhlIGJpbmFyeQo+Pj4gYXJjaC94
ODYvYm9vdC9iemltYWdlIGNhbiBiZSBib290ZWQgZWl0aGVyIG9uIGJhcmUgbWV0YWwgdmlhIGdy
dWIyIG9yCj4+PiBvdGhlciBib290LWxvYWRlcnMsIGFzIFhlbiBQVi1ndWVzdCwgYXMgWGVuIFBW
SC1ndWVzdCwgb3IgYXMgS1ZNCj4+PiBQVkgtZ3Vlc3QuIFNvIG9uZSBidWlsZCBhbmQgb25lIGJp
bmFyeS4gVGhlIG5vbi1zdGFuZGFyZCBib290IGVudHJpZXMKPj4+IChQVi0gb3IgUFZILW5vZGUp
IGFyZSBmb3VuZCB2aWEgRUxGLW5vdGVzIGJ5IHRoZSBib290IGxvYWRlciAocWVtdSBpbgo+Pj4g
Y2FzZSBvZiBLVk0pLgo+Pgo+PiBCdXQgdGhlIGJ6SW1hZ2UgaXMgbm90IGFuIEVMRiBiaW5hcnks
IGFuZCBpdCBpcyBjb21wcmVzc2VkLCBpc24ndCBpdD8KPj4gL21lIGlzIGNvbmZ1c2VkLiA6KQo+
IAo+IGdydWIyIChhbmQgcWVtdSwgdG9vKSBjYW4gZGVjb21wcmVzcyBpdC4gQW5kIHRoZSBkZWNv
bXByZXNzZWQgcmVzdWx0Cj4gInZtbGludXgiIGlzIGFuIEVMRi1iaW5hcnkuCgpBaGEgLSBmb3Ig
S1ZNLCB0aGUgbWFpbiBhZHZhbnRhZ2Ugb2YgUFZIIHdvdWxkIGJlIHRvIHNraXAgdGhlIGNvc3Qg
b2YKZGVjb21wcmVzc2lvbiwgYW5kIHRoYXQgaXMgd2hhdCBjb25mdXNlZCBtZSAoYWxzbyB3ZSBw
cm9iYWJseSBwcmVmZXIgbm90CmhhdmluZyBhbnkgZGVjb21wcmVzc2lvbiBjb2RlIHJ1bm5pbmcg
aW4gUUVNVSwgc2luY2UgdGhhdCBpbmNyZWFzZXMgdGhlCmF0dGFjayBzdXJmYWNlOyB0aGVyZSdz
IG5vIHJlYWwgZGlzYWR2YW50YWdlIHRvIHVzaW5nIHRoZSBleGlzdGluZwpsaW51eGJvb3QgY29k
ZSBpZiB3ZSdyZSBnaXZlbiBhIGJ6SW1hZ2UpLiAgU28sIGF0IGxlYXN0IGZvciBub3csIEtWTQp3
b3VsZCBnbyB3aXRoIHRoZSB0d28tYmluYXJpZXMvb25lLWNvbmZpZyBhcHByb2FjaC4KClNvcnJ5
IGZvciBoYXZpbmcgeW91IGxlY3R1cmUgbWUsIGl0J3MgbXVjaCBjbGVhcmVyIG5vdy4gIFRoYW5r
cywKClBhb2xvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
