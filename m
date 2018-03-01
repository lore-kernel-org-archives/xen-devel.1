From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 7/7] KVM: x86: Allow Qemu/KVM to use
 PVH entry point
Date: Thu, 1 Mar 2018 08:31:17 +0100
Message-ID: <db421f9a-f0e5-ee15-3348-20f806f7a852__41843.0506405004$1519889414$gmane$org@suse.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-8-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=9pmo=fx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erIgY-0005AI-Of
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 07:31:26 +0000
In-Reply-To: <1519842483-8887-8-git-send-email-maran.wilson@oracle.com>
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

T24gMjgvMDIvMTggMTk6MjgsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBGb3IgY2VydGFpbiBhcHBs
aWNhdGlvbnMgaXQgaXMgZGVzaXJhYmxlIHRvIHJhcGlkbHkgYm9vdCBhIEtWTSB2aXJ0dWFsCj4g
bWFjaGluZS4gSW4gY2FzZXMgd2hlcmUgbGVnYWN5IGhhcmR3YXJlIGFuZCBzb2Z0d2FyZSBzdXBw
b3J0IHdpdGhpbiB0aGUKPiBndWVzdCBpcyBub3QgbmVlZGVkLCBRZW11IHNob3VsZCBiZSBhYmxl
IHRvIGJvb3QgZGlyZWN0bHkgaW50byB0aGUKPiB1bmNvbXByZXNzZWQgTGludXgga2VybmVsIGJp
bmFyeSB3aXRob3V0IHRoZSBuZWVkIHRvIHJ1biBmaXJtd2FyZS4KPiAKPiBUaGVyZSBhbHJlYWR5
IGV4aXN0cyBhbiBBQkkgdG8gYWxsb3cgdGhpcyBmb3IgWGVuIFBWSCBndWVzdHMgYW5kIHRoZSBB
QkkKPiBpcyBzdXBwb3J0ZWQgYnkgTGludXggYW5kIEZyZWVCU0Q6Cj4gCj4gICAgaHR0cHM6Ly94
ZW5iaXRzLnhlbi5vcmcvZG9jcy91bnN0YWJsZS9taXNjL3B2aC5odG1sCj4gCj4gVGhpcyBwYXRj
aCBlbmFibGVzIFFlbXUgdG8gdXNlIHRoYXQgc2FtZSBlbnRyeSBwb2ludCBmb3IgYm9vdGluZyBL
Vk0KPiBndWVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyYW4gV2lsc29uIDxtYXJhbi53aWxz
b25Ab3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
