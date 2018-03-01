From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 1/7] xen/pvh: Split CONFIG_XEN_PVH
 into CONFIG_PVH and CONFIG_XEN_PVH
Date: Thu, 1 Mar 2018 08:19:22 +0100
Message-ID: <d64004a7-24d6-51b6-e125-23ede76a77cb__21888.0616514527$1519888702$gmane$org@suse.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-2-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=9pmo=fx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erIUx-0003De-NS
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 07:19:27 +0000
In-Reply-To: <1519842483-8887-2-git-send-email-maran.wilson@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, pbonzini@redhat.com, boris.ostrovsky@oracle.com, roger.pau@citrix.com, andrew.cooper3@citrix.com, hch@infradead.org, JBeulich@suse.com, x86@kernel.org, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Cc: thomas.lendacky@amd.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, rkrcmar@redhat.com, gregkh@linuxfoundation.org, mchehab@kernel.org, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, davem@davemloft.net, kirill.shutemov@linux.intel.com
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMTk6MjcsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBJbiBvcmRlciB0byBwYXZl
IHRoZSB3YXkgZm9yIGh5cGVydmlzb3JzIG90aGVyIHRoZW4gWGVuIHRvIHVzZSB0aGUgUFZICj4g
ZW50cnkgcG9pbnQgZm9yIFZNcywgd2UgbmVlZCB0byBmYWN0b3IgdGhlIFBWSCBlbnRyeSBjb2Rl
IGludG8gWGVuIHNwZWNpZmljCj4gYW5kIGh5cGVydmlzb3IgYWdub3N0aWMgY29tcG9uZW50cy4g
VGhlIGZpcnN0IHN0ZXAgaW4gZG9pbmcgdGhhdCwgaXMgdG8KPiBjcmVhdGUgYSBuZXcgY29uZmln
IG9wdGlvbiBmb3IgUFZIIGVudHJ5IHRoYXQgY2FuIGJlIGVuYWJsZWQKPiBpbmRlcGVuZGVudGx5
IGZyb20gQ09ORklHX1hFTi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJhbiBXaWxzb24gPG1hcmFu
LndpbHNvbkBvcmFjbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0Bz
dXNlLmNvbT4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
