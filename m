From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Tue, 29 Jan 2019 16:33:38 +0200
Message-ID: <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
 <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KUKg=QF=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1goUSN-0000cP-Un
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 14:33:44 +0000
Received: by mail-lj1-x241.google.com with SMTP id n18-v6so17650381lji.7
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jan 2019 06:33:42 -0800 (PST)
In-Reply-To: <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAyOS4wMS4xOSAxNTo1MywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdoaWNoIHByb3ByaWV0
YXJ5IGtlcm5lbCBkcml2ZXI/IEFuZCBpbiB3aGljaCBjb250ZXh0IGFyZSBTZXQvV2F5IG9wZXJh
dGlvbnMgdXNlZD8KSSB3b3VsZCBub3QgbmFtZSBpdCwgaXQgaXMgcHJvcHJpZXRhcnkgOykgQnV0
IHdlIGNhbid0IGxpdmUgd2l0aG91dCBpdC4KCj4gVXNpbmcgU2V0L1dheSBpcyBmdW5kYW1lbnRh
bGx5IGJyb2tlbiBwYXJ0bHkgYmVjYXVzZSBpdCBkb2VzIG5vdCBkZWFsIHdpdGggc3lzdGVtIGNh
Y2hlcy4KSSBhbHJlYWR5IGtub3cgaXQuIEkndmUgbG9va2VkIGF0IEtWTSBwcmVzZW50YXRpb24g
ZnJvbSAyMDE1LCB5b3VyIGxhc3QgeWVhciB2aWRlbyBmcm9tIENoaW5hLCByZWFkaW5nIHRocm91
Z2ggQVJNIEFSTS4KCgo+IEl0IGFsc28gb25seSBhcHBsaWVzIHRvIGEgZ2l2ZW4gY2FjaGUgYW5k
IHRoZSBiZWhhdmlvciB3aWxsIG5vdCBiZSByZXBsaWNhdGVkIHRvIG90aGVyIENQVXMuCkluIG91
ciBjYXNlIGNwdSBjYWNoZSBmbHVzaGluZyBieSBTZXQvV2F5IGl0IGlzIHByb3BhZ2F0ZWQgdG8g
YWxsIGNwdXMgd2l0aCBgb25fZWFjaF9jcHUoKWAuIChIZXJlIHNob3VsZCBiZSBhIGZhY2VwYWxt
IGVtb2ppKQoKPiBSdW5uaW5nIHN1Y2ggc29mdHdhcmUgaXMgYSBjYWxsIGZvciBuYXN0eSBiZWhh
dmlvciBpbiB5b3VyIGd1ZXN0LgpJIGRvIHVuZGVyc3RhbmQgdGhhdC4KQnV0IHdlIGhhdmUgdG8g
aGFuZGxlIHRoYXQuIEFuZCBpdCBpcyBhIHF1ZXN0aW9uIHRvIHVzIGhvdyB0byBkbyB0aGF0LgoK
LS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
