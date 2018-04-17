From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v7 1/7] xen/pvh: Split CONFIG_XEN_PVH into
 CONFIG_PVH and CONFIG_XEN_PVH
Date: Tue, 17 Apr 2018 08:18:22 +0200
Message-ID: <eb2524dd-f74a-286c-81c9-1d81fd3edfab__46292.4019470394$1523945844$gmane$org@suse.com>
References: <1523920175-27287-1-git-send-email-maran.wilson@oracle.com>
 <1523920273-27516-1-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=hi3k=hg=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1f8Jwh-0004Vu-IS
 for xen-devel@lists.xenproject.org; Tue, 17 Apr 2018 06:18:27 +0000
In-Reply-To: <1523920273-27516-1-git-send-email-maran.wilson@oracle.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>, x86@kernel.org, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org, kvm@vger.kernel.org, pbonzini@redhat.com
Cc: thomas.lendacky@amd.com, dave.hansen@linux.intel.com, rkrcmar@redhat.com, hpa@zytor.com, mingo@redhat.com, rdunlap@infradead.org, luto@kernel.org, jpoimboe@redhat.com, tglx@linutronix.de, bp@suse.de, boris.ostrovsky@oracle.com, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDQvMTggMDE6MTEsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBJbiBvcmRlciB0byBwYXZl
IHRoZSB3YXkgZm9yIGh5cGVydmlzb3JzIG90aGVyIHRoYW4gWGVuIHRvIHVzZSB0aGUgUFZICj4g
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
