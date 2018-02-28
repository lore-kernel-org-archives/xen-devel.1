From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [RFC PATCH v4 4/7] xen/pvh: Move Xen specific PVH
 VM initialization out of common code
Date: Wed, 28 Feb 2018 16:10:53 -0500
Message-ID: <20180228211053.GM11576@char.us.oracle.com>
References: <1519842483-8887-1-git-send-email-maran.wilson@oracle.com>
 <1519842483-8887-5-git-send-email-maran.wilson@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=po+t=fw=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1er90j-0006Pd-Nj
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2018 21:11:37 +0000
Content-Disposition: inline
In-Reply-To: <1519842483-8887-5-git-send-email-maran.wilson@oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Maran Wilson <maran.wilson@oracle.com>
Cc: kvm@vger.kernel.org, rkrcmar@redhat.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, JBeulich@suse.com, hpa@zytor.com, tglx@linutronix.de, x86@kernel.org, hch@infradead.org, mingo@redhat.com, xen-devel@lists.xenproject.org, bp@suse.de, thomas.lendacky@amd.com, luto@kernel.org, jpoimboe@redhat.com, boris.ostrovsky@oracle.com, mchehab@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com, davem@davemloft.net, kirill.shutemov@linux.intel.com, roger.pau@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjgsIDIwMTggYXQgMTA6Mjg6MDBBTSAtMDgwMCwgTWFyYW4gV2lsc29uIHdy
b3RlOgo+IFdlIG5lZWQgdG8gcmVmYWN0b3IgUFZIIGVudHJ5IGNvZGUgc28gdGhhdCBzdXBwb3J0
IGZvciBvdGhlciBoeXBlcnZpc29ycwo+IGxpa2UgUWVtdS9LVk0gY2FuIGJlIGFkZGVkIG1vcmUg
ZWFzaWx5Lgo+IAo+IFRoaXMgcGF0Y2ggbW92ZXMgdGhlIHNtYWxsIGJsb2NrIG9mIGNvZGUgdXNl
ZCBmb3IgaW5pdGlhbGl6aW5nIFhlbiBQVkgKPiB2aXJ0dWFsIG1hY2hpbmVzIGludG8gdGhlIFhl
biBzcGVjaWZpYyBmaWxlLiBUaGlzIGluaXRpYWxpemF0aW9uIGlzIG5vdAo+IGdvaW5nIHRvIGJl
IG5lZWRlZCBmb3IgUWVtdS9LVk0gZ3Vlc3RzLiBNb3ZpbmcgaXQgb3V0IG9mIHRoZSBjb21tb24g
ZmlsZQo+IGlzIGdvaW5nIHRvIGFsbG93IHVzIHRvIGNvbXBpbGUga2VybmVscyBpbiB0aGUgZnV0
dXJlIHdpdGhvdXQgQ09ORklHX1hFTgo+IHRoYXQgYXJlIHN0aWxsIGNhcGFibGUgb2YgYmVpbmcg
Ym9vdGVkIGFzIGEgUWVtdS9LVk0gZ3Vlc3QgdmlhIHRoZSBQVkgKPiBlbnRyeSBwb2ludC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBNYXJhbiBXaWxzb24gPG1hcmFuLndpbHNvbkBvcmFjbGUuY29tPgpS
ZXZpZXdlZC1ieTogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29t
PgoKVGhhbmsgeW91IQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
