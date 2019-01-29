From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH for-4.12] arm/p2m: do not invalidate p2m
 root if it is shared with IOMMU
Date: Tue, 29 Jan 2019 18:00:41 +0200
Message-ID: <b84c9e8a-e551-2c88-d275-14665835fde8@gmail.com>
References: <1548689694-30028-1-git-send-email-andrii.anisov@gmail.com>
 <4ab0408f-edf2-5302-17ee-3c181d5d561e@arm.com>
 <eb581cac-7123-e61d-0680-8f409018fa15@gmail.com>
 <0aa633d6-e671-8c22-1b73-fa1d47c5f6c5@arm.com>
 <8cbacbc7-e57c-b0c5-7e0e-ad238f795b5d@gmail.com>
 <097a2b33-3ede-7949-3fa2-b3dd4058b5c4@arm.com>
 <33e7eafe-75e2-5bd0-017a-1df887114536@gmail.com>
 <1eaf158a-427f-a89d-5132-eed5bf6e95fc@arm.com>
 <3bd93c19-9264-4494-52ce-3e2672c1e573@gmail.com>
 <325628f3-9fc9-d021-fefc-5d06c82dfff5@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KUKg=QF=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1goVod-0003Yg-5i
 for xen-devel@lists.xenproject.org; Tue, 29 Jan 2019 16:00:47 +0000
Received: by mail-lf1-x143.google.com with SMTP id i26so15059842lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jan 2019 08:00:45 -0800 (PST)
In-Reply-To: <325628f3-9fc9-d021-fefc-5d06c82dfff5@arm.com>
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

Ck9uIDI5LjAxLjE5IDE3OjE3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gTm8gd2UgZG9uJ3QgaGF2
ZSB0by4KSSBtZWFuLCBFUEFNIHN5c3RlbXMgYXMgYSBYRU4gYmFzZWQgdmlydHVhbGl6YXRpb24g
c29sdXRpb24gcHJvdmlkZXIgaGF2ZSB0byBoYW5kbGUgdGhhdCBpc3N1ZS4KCj4gVGhleSBoYXZl
IGJlZW4gbHVja3kgdG8gc2VlIHRoaXMgd29ya2luZyBldmVuIG9uIGJhcmVtZXRhbC4KPiBTZXQv
V2F5IG9wZXJhdGlvbnMgaGF2ZSBiZWVuIGRyb3BwZWQgZnJvbSBMaW51eCBmb3IgYSBsb25nIHRp
bWUsIHNvIEkgcmVhbGx5IGNhbid0IHNlZSB3aHkgYSBwcm9wcmlldGFyeSBkcml2ZXIgaXMgc3Rp
bGwgdXNpbmcgdGhlbS4KSSBndWVzcyB0aGVyZSB3ZXJlIHNvbWUgcGVyZm9ybWFuY2UgY29uY2Vy
bnMuIEFuZCB0aGV5IGFyZSByZWFsbHkgbHVja3ksIHNvIHRoZXkgZGlkIG5vdCBmYWNlIHJlbGF0
ZWQgaXNzdWVzIG9uIGJhcmVtZXRhbC4KCj4gSSB0aGluayB0aGUgcG9saWN5IGZvciBTZXQvV2F5
IG9wZXJhdGlvbnMgaXMgY29ycmVjdCBpbiBYZW4uIFRoaXMgd29ya3MgdG8gYXZvaWQgYnJlYWtp
bmcgYmFzaWMgY2FzZSBidXQgdGhlIG1vc3QgY29tcGxleCBvbmUgYXJlIGdvaW5nIHRvIGJyZWFr
LgpNYXliZSBpdCB3b3J0aCB0byBnZXQgYSBub3RpZmljYXRpb24gZnJvbSBYRU4sIGkuZS4gV0FS
Tl9PTkNFLCBzYXlpbmcgdGhhdCBTZXQvV2F5IGNhY2hlIG9wZXJhdGlvbnMgYXJlIHVuZGVzaXJh
YmxlIGluIFZNIGFuZCB3aWxsIGxlYWQgdG8gdGhlIHN5c3RlbSBwZXJmb3JtYW5jZSBkcm9wLCBv
ciBldmVuIGluc3RhYmlsaXR5IGluIGNhc2Ugb2YgSU9NTVUgc2hhcmluZyBwMm0gd2l0aCBDUFUu
ClRoaXMgbWlnaHQgc2F2ZSBkYXlzIG9mIGRlYnVnZ2luZyB0byBYRU4gb24gQVJNIHVzZXJzLgoK
PiBZb3Ugc29sdXRpb24gaXMgb25seSBkZWxheWluZyB0aGUgcmVhbCBmaXgKSSB3b3VsZCBub3Qg
c2F5IGl0IGlzIGRlbGF5aW5nIHRoZSBmaXgsIGJ1dCBhbGxvd3MgdXMgdG8gaGF2ZSBhIGZ1bmN0
aW9uYWwgc3lzdGVtIHVudGlsIHdlIGdldCB0aGF0IGZpeC4KCj4gKGkuZSByZW1vdmluZyBTZXQv
V2F5IG9wZXJhdGlvbiBmcm9tIHRoZSBzb2Z0d2FyZSkuIFNvIGhlcmUgdGhlIGJlc3Qgc29sdXRp
b24gaXMgdG8gZ28gdG8gdGhlIHZlbmRvciBhbmQgYXNrIHRoZW0gdG8gZml4IHRoZWlyIHNvZnR3
YXJlLgpBY3R1YWxseSBlc2NhbGF0aW9uIHRoZSBpc3N1ZSB0byB0aGUgdmVuZG9yIGlzIG9uZSBv
ZiBvdXIgbmV4dCBzdGVwcyBoZXJlLgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
