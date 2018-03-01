From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 4/7] xen/pvh: Move Xen specific PVH
 VM initialization out of common code
Date: Thu, 1 Mar 2018 08:20:32 +0100
Message-ID: <af2b37f0-b048-bf8e-525c-b9fa4fac7fc0__30243.4009303854$1519888768$gmane$org@suse.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-5-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=9pmo=fx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erIW8-0003o6-Bw
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 07:20:40 +0000
In-Reply-To: <1519842483-8887-5-git-send-email-maran.wilson@oracle.com>
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

T24gMjgvMDIvMTggMTk6MjgsIE1hcmFuIFdpbHNvbiB3cm90ZToKPiBXZSBuZWVkIHRvIHJlZmFj
dG9yIFBWSCBlbnRyeSBjb2RlIHNvIHRoYXQgc3VwcG9ydCBmb3Igb3RoZXIgaHlwZXJ2aXNvcnMK
PiBsaWtlIFFlbXUvS1ZNIGNhbiBiZSBhZGRlZCBtb3JlIGVhc2lseS4KPiAKPiBUaGlzIHBhdGNo
IG1vdmVzIHRoZSBzbWFsbCBibG9jayBvZiBjb2RlIHVzZWQgZm9yIGluaXRpYWxpemluZyBYZW4g
UFZICj4gdmlydHVhbCBtYWNoaW5lcyBpbnRvIHRoZSBYZW4gc3BlY2lmaWMgZmlsZS4gVGhpcyBp
bml0aWFsaXphdGlvbiBpcyBub3QKPiBnb2luZyB0byBiZSBuZWVkZWQgZm9yIFFlbXUvS1ZNIGd1
ZXN0cy4gTW92aW5nIGl0IG91dCBvZiB0aGUgY29tbW9uIGZpbGUKPiBpcyBnb2luZyB0byBhbGxv
dyB1cyB0byBjb21waWxlIGtlcm5lbHMgaW4gdGhlIGZ1dHVyZSB3aXRob3V0IENPTkZJR19YRU4K
PiB0aGF0IGFyZSBzdGlsbCBjYXBhYmxlIG9mIGJlaW5nIGJvb3RlZCBhcyBhIFFlbXUvS1ZNIGd1
ZXN0IHZpYSB0aGUgUFZICj4gZW50cnkgcG9pbnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyYW4g
V2lsc29uIDxtYXJhbi53aWxzb25Ab3JhY2xlLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdy
b3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
