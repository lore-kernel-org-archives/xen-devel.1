From: Jiri Slaby <jslaby@suse.cz>
Subject: Re: [PATCH v7 01/28] linkage: new macros for assembler
 symbols
Date: Fri, 1 Feb 2019 14:53:58 +0100
Message-ID: <2108c93f-835e-c887-78a6-91e63ec86bc6__36058.0390248046$1549029307$gmane$org@suse.cz>
References: <20190130124711.12463-1-jslaby@suse.cz>
 <20190130124711.12463-2-jslaby@suse.cz> <20190131160019.GM6749@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s+4F=QI=gmail.com=jirislaby@srs-us1.protection.inumbo.net>)
 id 1gpZGe-0003Lq-1Q
 for xen-devel@lists.xenproject.org; Fri, 01 Feb 2019 13:54:04 +0000
Received: by mail-wr1-f65.google.com with SMTP id t27so7178485wra.6
 for <xen-devel@lists.xenproject.org>; Fri, 01 Feb 2019 05:54:02 -0800 (PST)
In-Reply-To: <20190131160019.GM6749@zn.tnic>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Borislav Petkov <bp@alien8.de>
Cc: linux-arch@vger.kernel.org, Juergen Gross <jgross@suse.com>, x86@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org, jpoimboe@redhat.com, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, mingo@redhat.com, Thomas Gleixner <tglx@linutronix.de>, Pavel Machek <pavel@ucw.cz>, hpa@zytor.com, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gMzEuIDAxLiAxOSwgMTc6MDAsIEJvcmlzbGF2IFBldGtvdiB3cm90ZToKPj4gIERvY3VtZW50
YXRpb24vYXNtLWFubm90YXRpb25zLnJzdCB8IDIxNyArKysrKysrKysrKysrKysrKysrKysrKysr
Kwo+IAo+IEkgZ3Vlc3MgeW91IHdhbm5hIGludGVncmF0ZSB0aGF0IGludG8gdGhlIGRvYyBoaWVy
YXJjaHkuIEh1bmsgb250b3A6Cj4gCj4gLS0tCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
aW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9pbmRleC5yc3QKPiBpbmRleCBjODU4YzJlNjZlMzYu
Ljc1NDA1NWQ5NTY1YyAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2luZGV4LnJzdAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vaW5kZXgucnN0Cj4gQEAgLTkxLDYgKzkxLDE0IEBAIG5lZWRlZCku
Cj4gICAgIHZtL2luZGV4Cj4gICAgIGJwZi9pbmRleAo+ICAKPiArQXJjaGl0ZWN0dXJlLWFnbm9z
dGljIGRvY3VtZW50YXRpb24KPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
PiArCj4gKy4uIHRvY3RyZWU6Ogo+ICsgICA6bWF4ZGVwdGg6IDIKPiArCj4gKyAgIGFzbS1hbm5v
dGF0aW9ucwo+ICsKPiAgQXJjaGl0ZWN0dXJlLXNwZWNpZmljIGRvY3VtZW50YXRpb24KPiAgLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KClRoYW5rcywgYWxsIGNvbW1lbnRzIGFw
cGxpZWQuCgpJIHdpbGwgd2FpdCBmb3IgYSBjb3VwbGUgb2YgZGF5cyBmb3IgbW9yZSBmZWVkYmFj
aywgaWYgYW55LCBhbmQgcmVzcGluLgpQZXJoYXBzIGZvciB0aGUgbGFzdCB0aW1lIGFzIHRoZXNl
IHBhdGNoZXMgYXJlIHNsb3dseSBzdGFydGluZyBib3RoZXIgbWUKYWZ0ZXIgdHdvIHllYXJzIG9m
IGluYWJpbGl0eSB0byBnZXQgdGhlbSB1cHN0cmVhbSAod2l0aG91dCBoYXZpbmcgTkFDSwpvciBz
ZXJpb3VzIG9iamVjdGlvbnMgZWl0aGVyKSBhbmQgdGhlIGNvbnN0YW50IG5lZWQgb2YgcmViYXNp
bmcKKHNwZWN0cmUvbWVsdGRvd24gY2hhbmdlcyB3ZXJlIHRoZSB1Z2xpZXN0IHRvIHRoaXMgc2Vy
aWVzKS4KCnRoYW5rcywKLS0gCmpzCnN1c2UgbGFicwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
