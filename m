From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [RFC PATCH v4 6/7] xen/pvh: Add memory map pointer
 to hvm_start_info struct
Date: Thu, 1 Mar 2018 09:19:46 -0800
Message-ID: <d803e176-1d6b-4426-f6bd-abfa4a746983__33686.18024183$1519924770$gmane$org@oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-7-git-send-email-maran.wilson@oracle.com>
 <81b64427-4d4e-8758-436a-f2b98e3e6829@suse.com>
 <5A97AEC70200007800128C14@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=twhr=fx=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1erRsg-00068P-N6
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 17:20:34 +0000
In-Reply-To: <5A97AEC70200007800128C14@prv-mh.provo.novell.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMi8yOC8yMDE4IDExOjQxIFBNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4gSnVlcmdlbiBH
cm9zcyA8amdyb3NzQHN1c2UuY29tPiAwMy8wMS8xOCA4OjI5IEFNID4+Pgo+PiBPbiAyOC8wMi8x
OCAxOToyOCwgTWFyYW4gV2lsc29uIHdyb3RlOgo+Pj4gVGhlIHN0YXJ0IGluZm8gc3RydWN0dXJl
IHRoYXQgaXMgZGVmaW5lZCBhcyBwYXJ0IG9mIHRoZSB4ODYvSFZNIGRpcmVjdCBib290Cj4+PiBB
QkkgYW5kIHVzZWQgZm9yIHN0YXJ0aW5nIFhlbiBQVkggZ3Vlc3RzIHdvdWxkIGJlIG1vcmUgdmVy
c2F0aWxlIGlmIGl0IGFsc28KPj4+IGluY2x1ZGVkIGEgd2F5IHRvIHBhc3MgaW5mb3JtYXRpb24g
YWJvdXQgdGhlIG1lbW9yeSBtYXAgdG8gdGhlIGd1ZXN0LiBUaGlzCj4+PiB3b3VsZCBhbGxvdyBL
Vk0gZ3Vlc3RzIHRvIHNoYXJlIHRoZSBzYW1lIGVudHJ5IHBvaW50Lgo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IE1hcmFuIFdpbHNvbiA8bWFyYW4ud2lsc29uQG9yYWNsZS5jb20+Cj4+IEknbSBmaW5l
IHdpdGggdGhpcywgYnV0IHdlIG5lZWQgdGhpcyBjaGFuZ2UgYmVpbmcgYWNjZXB0ZWQgYnkgdGhl
IFhlbgo+PiBjb21tdW5pdHkgZmlyc3QuIFNvIGFuIEFjayBmcm9tIEphbiBvciBBbmRyZXcgaXMg
cmVxdWlyZWQgYXMgdGhlIHNhbWUKPj4gY2hhbmdlIHNob3VsZCBiZSBkb25lIG9uIFhlbiBzaWRl
Lgo+IEFuZCBmb3IgYW4gYWNrIHRvIGJlIGdpdmVuIEkgY29udGludWUgdG8gZGVtYW5kIHRoYXQg
YSBwYXRjaCBiZSBzZW50IGFnYWluc3QKPiB0aGUgWGVuIHRyZWUuIFRoYXQgc2FpZCwgdGhlIGNo
YW5nZSBsb29rcyBmaW5lIHRvIG1lIG5vdyAoYXMgaW5kaWNhdGVkIGJlZm9yZSkuCgpZZXMsIEkg
cGxhbiB0byBzZW5kIHRoYXQgb3V0IGFnYWluc3QgdGhlIFhlbiB0cmVlIHNob3J0bHkuCgpUaGFu
a3MsCi1NYXJhbgoKPiBKYW4KPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
