From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 6/7] xen/pvh: Add memory map pointer
 to hvm_start_info struct
Date: Thu, 1 Mar 2018 08:29:05 +0100
Message-ID: <81b64427-4d4e-8758-436a-f2b98e3e6829__5872.79316173426$1519889275$gmane$org@suse.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-7-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=9pmo=fx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erIeM-0004UF-RD
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 07:29:10 +0000
In-Reply-To: <1519842483-8887-7-git-send-email-maran.wilson@oracle.com>
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

T24gMjgvMDIvMTggMTk6MjgsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBUaGUgc3RhcnQgaW5mbyBz
dHJ1Y3R1cmUgdGhhdCBpcyBkZWZpbmVkIGFzIHBhcnQgb2YgdGhlIHg4Ni9IVk0gZGlyZWN0IGJv
b3QKPiBBQkkgYW5kIHVzZWQgZm9yIHN0YXJ0aW5nIFhlbiBQVkggZ3Vlc3RzIHdvdWxkIGJlIG1v
cmUgdmVyc2F0aWxlIGlmIGl0IGFsc28KPiBpbmNsdWRlZCBhIHdheSB0byBwYXNzIGluZm9ybWF0
aW9uIGFib3V0IHRoZSBtZW1vcnkgbWFwIHRvIHRoZSBndWVzdC4gVGhpcwo+IHdvdWxkIGFsbG93
IEtWTSBndWVzdHMgdG8gc2hhcmUgdGhlIHNhbWUgZW50cnkgcG9pbnQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogTWFyYW4gV2lsc29uIDxtYXJhbi53aWxzb25Ab3JhY2xlLmNvbT4KCkknbSBmaW5lIHdp
dGggdGhpcywgYnV0IHdlIG5lZWQgdGhpcyBjaGFuZ2UgYmVpbmcgYWNjZXB0ZWQgYnkgdGhlIFhl
bgpjb21tdW5pdHkgZmlyc3QuIFNvIGFuIEFjayBmcm9tIEphbiBvciBBbmRyZXcgaXMgcmVxdWly
ZWQgYXMgdGhlIHNhbWUKY2hhbmdlIHNob3VsZCBiZSBkb25lIG9uIFhlbiBzaWRlLgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
