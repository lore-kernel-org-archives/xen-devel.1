From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [RFC PATCH v4 2/7] xen/pvh: Move PVH entry code out
 of Xen specific tree
Date: Thu, 1 Mar 2018 11:15:57 -0500
Message-ID: <1b8962c1-8ab5-cddc-0c0b-a7419aab424b__5377.97629735923$1519920845$gmane$org@oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-3-git-send-email-maran.wilson@oracle.com>
 <20180228210814.GK11576@char.us.oracle.com>
 <e9133f97-7ecf-2868-6883-3f0cda7bbb2f@redhat.com>
 <20f82d4c-9591-7770-aeca-0331a7940f5d@suse.com>
 <98eda294-8491-35a2-b278-aeedc079640f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=yam0=fx=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1erQrQ-0000RK-2b
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 16:15:12 +0000
In-Reply-To: <98eda294-8491-35a2-b278-aeedc079640f@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, JBeulich@suse.com, hpa@zytor.com, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, mchehab@kernel.org, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMDMvMDEvMjAxOCAwMzo0NiBBTSwgUGFvbG8gQm9uemluaSB3cm90ZToKPiBPbiAwMS8wMy8y
MDE4IDA3OjExLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+Pj4gUHJvYmFibHkgYSBiZXR0ZXIgcGxh
Y2UgZm9yIHRoZXNlIHdvdWxkIGJlCj4+PiBhcmNoL3g4Ni9wbGF0Zm9ybS9wdmgve2VubGlnaHRl
bi5jLGhlYWQuU30uICAoSnVzdCBiZWNhdXNlIHRoZXJlIGFyZSBubwo+Pj4gLmMgb3IgLlMgZmls
ZXMgaW4gYXJjaC94ODYpLgo+PiBSaWdodC4KPj4KPj4+IE1heWJlIFhlbiBvdWdodCB0byBiZSBt
b3ZlZCB1bmRlcgo+Pj4gYXJjaC94ODYvcGxhdGZvcm0gdG9vLgo+PiBBbmQgaHlwZXJ2IGFuZCBr
dm0sIHRvbz8KCgpJIHdhcyBhY3R1YWxseSB0aGlua2luZyBhYm91dCBoYXZpbmcgYXJjaC94ODYv
dmlydCB3aGVyZSB4ZW4sIGt2bSwKaHlwZXJ2IGV0YyBzaG91bGQgZ28uIE5vdCBhcyBwYXJ0IG9m
IHRoaXMgc2VyaWVzLCBvYnZpb3VzbHkuCgotYm9yaXMKCgo+IEFjdHVhbGx5IHllcywgdGhvdWdo
IGZvciBrdm0gSSdkIG1vdmUgdGhlIGZpbGVzIGluIGFyY2gveDg2L2tlcm5lbAo+IChhcmNoL3g4
Ni9rdm0gaXMgdGhlIGh5cGVydmlzb3IgaXRzZWxmLCBub3QgdGhlICJwbGF0Zm9ybSIpLgo+Cj4+
IE5vLCBJIHRoaW5rIGFyY2gveDg2L3hlbi8gaXMgZmluZS4KPiBucCwgaXQgd2FzIGp1c3QgYSAo
c29tZXdoYXQgY3JhenkpIHN1Z2dlc3Rpb24uIDopCj4KPiBQYW9sbwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
