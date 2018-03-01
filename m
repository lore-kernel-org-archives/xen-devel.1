From: Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH v4 5/7] xen/pvh: Move Xen code for
 getting mem map via hcall out of common file
Date: Thu, 1 Mar 2018 08:21:47 +0100
Message-ID: <7095f9f1-c8b5-acae-44b4-4699a1e67c69__22531.6291711808$1519888841$gmane$org@suse.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-6-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=9pmo=fx=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1erIXK-0003xE-Ry
 for xen-devel@lists.xenproject.org; Thu, 01 Mar 2018 07:21:54 +0000
In-Reply-To: <1519842483-8887-6-git-send-email-maran.wilson@oracle.com>
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
PiBsaWtlIFFlbXUvS1ZNIGNhbiBiZSBhZGRlZCBtb3JlIGVhc2lseS4KPiAKPiBUaGUgb3JpZ2lu
YWwgZGVzaWduIGZvciBQVkggZW50cnkgaW4gWGVuIGd1ZXN0cyByZWxpZXMgb24gYmVpbmcgYWJs
ZSB0bwo+IG9idGFpbiB0aGUgbWVtb3J5IG1hcCBmcm9tIHRoZSBoeXBlcnZpc29yIHVzaW5nIGEg
aHlwZXJjYWxsLiBXaGVuIHdlCj4gZXh0ZW5kIHRoZSBQVkggZW50cnkgQUJJIHRvIHN1cHBvcnQg
b3RoZXIgaHlwZXJ2aXNvcnMgbGlrZSBRZW11L0tWTSwKPiBhIG5ldyBtZWNoYW5pc20gd2lsbCBi
ZSBhZGRlZCB0aGF0IGFsbG93cyB0aGUgZ3Vlc3QgdG8gZ2V0IHRoZSBtZW1vcnkKPiBtYXAgd2l0
aG91dCBuZWVkaW5nIHRvIHVzZSBoeXBlcmNhbGxzLgo+IAo+IEZvciBYZW4gZ3Vlc3RzLCB0aGUg
aHlwZXJjYWxsIGFwcHJvYWNoIHdpbGwgc3RpbGwgYmUgc3VwcG9ydGVkLiBJbgo+IHByZXBhcmF0
aW9uIGZvciBhZGRpbmcgc3VwcG9ydCBmb3Igb3RoZXIgaHlwZXJ2aXNvcnMsIHdlIGNhbiBtb3Zl
IHRoZQo+IGNvZGUgdGhhdCB1c2VzIGh5cGVyY2FsbHMgaW50byB0aGUgWGVuIHNwZWNpZmljIGZp
bGUuIFRoaXMgd2lsbCBhbGxvdyB1cwo+IHRvIGNvbXBpbGUga2VybmVscyBpbiB0aGUgZnV0dXJl
IHdpdGhvdXQgQ09ORklHX1hFTiB0aGF0IGFyZSBzdGlsbCBjYXBhYmxlCj4gb2YgYmVpbmcgYm9v
dGVkIGFzIGEgUWVtdS9LVk0gZ3Vlc3QgdmlhIHRoZSBQVkggZW50cnkgcG9pbnQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogTWFyYW4gV2lsc29uIDxtYXJhbi53aWxzb25Ab3JhY2xlLmNvbT4KClJldmll
d2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
