From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 2/7] xen/pvh: Move PVH entry code out
 of Xen specific tree
Date: Thu, 1 Mar 2018 07:11:19 +0100
Message-ID: <20f82d4c-9591-7770-aeca-0331a7940f5d__4354.99104573882$1519884635$gmane$org@suse.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-3-git-send-email-maran.wilson@oracle.com>
 <20180228210814.GK11576@char.us.oracle.com>
 <e9133f97-7ecf-2868-6883-3f0cda7bbb2f@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=9pmo=fx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erHRB-00070E-VT
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 06:11:29 +0000
In-Reply-To: <e9133f97-7ecf-2868-6883-3f0cda7bbb2f@redhat.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paolo Bonzini <pbonzini@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, JBeulich@suse.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gMjgvMDIvMTggMjI6MzUsIFBhb2xvIEJvbnppbmkgd3JvdGU6Cj4gT24gMjgvMDIvMjAxOCAy
MjowOCwgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIHdyb3RlOgo+PiArb2JqLSQoQ09ORklHX1hFTl9Q
VkgpICs9IHB2aC5vCj4+ICtvYmotJChDT05GSUdfWEVOX1BWSCkgKz0gcHZoLWhlYWQubwo+PiAr
Cj4gCj4gUHJvYmFibHkgYSBiZXR0ZXIgcGxhY2UgZm9yIHRoZXNlIHdvdWxkIGJlCj4gYXJjaC94
ODYvcGxhdGZvcm0vcHZoL3tlbmxpZ2h0ZW4uYyxoZWFkLlN9LiAgKEp1c3QgYmVjYXVzZSB0aGVy
ZSBhcmUgbm8KPiAuYyBvciAuUyBmaWxlcyBpbiBhcmNoL3g4NikuCgpSaWdodC4KCj4gTWF5YmUg
WGVuIG91Z2h0IHRvIGJlIG1vdmVkIHVuZGVyCj4gYXJjaC94ODYvcGxhdGZvcm0gdG9vLgoKQW5k
IGh5cGVydiBhbmQga3ZtLCB0b28/CgpObywgSSB0aGluayBhcmNoL3g4Ni94ZW4vIGlzIGZpbmUu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
