From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v8 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Fri, 7 Dec 2018 14:58:48 +0100
Message-ID: <5d1d0071-1db4-ea03-027f-2a12812b78d0__4861.44400570101$1544191057$gmane$org@suse.com>
References: <1544076152-21637-1-git-send-email-maran.wilson@oracle.com>
 <1544076257-21792-1-git-send-email-maran.wilson@oracle.com>
 <d532f023-85f9-62b9-ca56-53a619fdcd1e@redhat.com>
 <2c289956-0e6a-700c-605d-83685fbb08f9@suse.com>
 <0a2f692a-f7df-8ad1-9d34-96f5e36926db@redhat.com>
 <3f95d053-87aa-ad45-03e6-1e1977283eb4@suse.com>
 <d0fd8799-35ea-fba5-9d0d-94feead85943@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kC+f=OQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1gVGea-0006Ln-Kt
 for xen-devel@lists.xenproject.org; Fri, 07 Dec 2018 13:58:52 +0000
In-Reply-To: <d0fd8799-35ea-fba5-9d0d-94feead85943@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMjAxOCAxNDo1MiwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAwNy8xMi8xOCAx
NDo1MCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gVGhlIFBWSCBib290IGVudHJ5IGlzIGluIHRo
ZSBzYW1lIGJ6SW1hZ2UgYmluYXJ5IGFzIHRoZSBub3JtYWwgb25lLgo+PiBJdHMganVzdCBhbm90
aGVyIGVudHJ5LCBzaW1pbGFyIHRvIHRoZSBYZW4gUFYgYm9vdCBlbnRyeS4gU28gdGhlIGJpbmFy
eQo+PiBhcmNoL3g4Ni9ib290L2J6aW1hZ2UgY2FuIGJlIGJvb3RlZCBlaXRoZXIgb24gYmFyZSBt
ZXRhbCB2aWEgZ3J1YjIgb3IKPj4gb3RoZXIgYm9vdC1sb2FkZXJzLCBhcyBYZW4gUFYtZ3Vlc3Qs
IGFzIFhlbiBQVkgtZ3Vlc3QsIG9yIGFzIEtWTQo+PiBQVkgtZ3Vlc3QuIFNvIG9uZSBidWlsZCBh
bmQgb25lIGJpbmFyeS4gVGhlIG5vbi1zdGFuZGFyZCBib290IGVudHJpZXMKPj4gKFBWLSBvciBQ
Vkgtbm9kZSkgYXJlIGZvdW5kIHZpYSBFTEYtbm90ZXMgYnkgdGhlIGJvb3QgbG9hZGVyIChxZW11
IGluCj4+IGNhc2Ugb2YgS1ZNKS4KPj4KPiAKPiBCdXQgdGhlIGJ6SW1hZ2UgaXMgbm90IGFuIEVM
RiBiaW5hcnksIGFuZCBpdCBpcyBjb21wcmVzc2VkLCBpc24ndCBpdD8KPiAvbWUgaXMgY29uZnVz
ZWQuIDopCgpncnViMiAoYW5kIHFlbXUsIHRvbykgY2FuIGRlY29tcHJlc3MgaXQuIEFuZCB0aGUg
ZGVjb21wcmVzc2VkIHJlc3VsdAoidm1saW51eCIgaXMgYW4gRUxGLWJpbmFyeS4KCgpKdWVyZ2Vu
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
