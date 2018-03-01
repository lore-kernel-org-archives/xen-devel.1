From: Maran Wilson <maran.wilson@oracle.com>
Subject: Re: [RFC PATCH v4 2/7] xen/pvh: Move PVH entry code out
 of Xen specific tree
Date: Thu, 1 Mar 2018 09:22:33 -0800
Message-ID: <b3be9cac-dd04-d558-2d68-f1ff47446991__1689.75226483798$1519925033$gmane$org@oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-3-git-send-email-maran.wilson@oracle.com>
 <20180228210814.GK11576@char.us.oracle.com>
 <e9133f97-7ecf-2868-6883-3f0cda7bbb2f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=twhr=fx=oracle.com=maran.wilson@srs-us1.protection.inumbo.net>)
 id 1erRx8-0006Kk-8W
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 17:25:10 +0000
In-Reply-To: <e9133f97-7ecf-2868-6883-3f0cda7bbb2f@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, JBeulich@suse.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMi8yOC8yMDE4IDE6MzUgUE0sIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMjgvMDIvMjAx
OCAyMjowOCwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+PiArb2JqLSQoQ09ORklHX1hF
Tl9QVkgpICs9IHB2aC5vCj4+ICtvYmotJChDT05GSUdfWEVOX1BWSCkgKz0gcHZoLWhlYWQubwo+
PiArCj4gUHJvYmFibHkgYSBiZXR0ZXIgcGxhY2UgZm9yIHRoZXNlIHdvdWxkIGJlCj4gYXJjaC94
ODYvcGxhdGZvcm0vcHZoL3tlbmxpZ2h0ZW4uYyxoZWFkLlN9LiAgKEp1c3QgYmVjYXVzZSB0aGVy
ZSBhcmUgbm8KPiAuYyBvciAuUyBmaWxlcyBpbiBhcmNoL3g4NikuCgpTb3VuZHMgZ29vZC4gV2ls
bCBtYWtlIHRoYXQgY2hhbmdlLgoKVGhhbmtzLAotTWFyYW4KCj4gTWF5YmUgWGVuIG91Z2h0IHRv
IGJlIG1vdmVkIHVuZGVyCj4gYXJjaC94ODYvcGxhdGZvcm0gdG9vLgo+Cj4gUGFvbG8KCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
