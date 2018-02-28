From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v4 2/7] xen/pvh: Move PVH entry code out
 of Xen specific tree
Date: Wed, 28 Feb 2018 22:35:30 +0100
Message-ID: <e9133f97-7ecf-2868-6883-3f0cda7bbb2f__33488.3036478006$1519853683$gmane$org@redhat.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-3-git-send-email-maran.wilson@oracle.com>
 <20180228210814.GK11576@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=tscl=fw=redhat.com=pbonzini@srs-us1.protection.inumbo.net>)
 id 1er9O4-0008Hi-77
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 21:35:44 +0000
In-Reply-To: <20180228210814.GK11576@char.us.oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, JBeulich@suse.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMjAxOCAyMjowOCwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+ICtvYmot
JChDT05GSUdfWEVOX1BWSCkgKz0gcHZoLm8KPiArb2JqLSQoQ09ORklHX1hFTl9QVkgpICs9IHB2
aC1oZWFkLm8KPiArCgpQcm9iYWJseSBhIGJldHRlciBwbGFjZSBmb3IgdGhlc2Ugd291bGQgYmUK
YXJjaC94ODYvcGxhdGZvcm0vcHZoL3tlbmxpZ2h0ZW4uYyxoZWFkLlN9LiAgKEp1c3QgYmVjYXVz
ZSB0aGVyZSBhcmUgbm8KLmMgb3IgLlMgZmlsZXMgaW4gYXJjaC94ODYpLiAgTWF5YmUgWGVuIG91
Z2h0IHRvIGJlIG1vdmVkIHVuZGVyCmFyY2gveDg2L3BsYXRmb3JtIHRvby4KClBhb2xvCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
