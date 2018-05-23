From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 16/27] compiler: Option to add
 PROVIDE_HIDDEN replacement for weak symbols
Date: Wed, 23 May 2018 14:16:11 -0700
Message-ID: <92748474-8044-4b55-7529-c982342855ab__18801.3102663264$1527110161$gmane$org@infradead.org>
References: <20180523195421.180248-1-thgarnie@google.com>
 <20180523195421.180248-17-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=phfy=ik=infradead.org=rdunlap@srs-us1.protection.inumbo.net>)
 id 1fLb7w-0006aM-Kv
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 21:16:56 +0000
In-Reply-To: <20180523195421.180248-17-thgarnie@google.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Philippe Ombredanne <pombredanne@nexb.com>, Kate Stewart <kstewart@linuxfoundation.org>, Arnaldo Carvalho de Melo <acme@redhat.com>, Yonghong Song <yhs@fb.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Kees Cook <keescook@chromium.org>, Tom Lendacky <thomas.lendacky@amd.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Dominik Brodowski <linux@dominikbrodowski.net>, Borislav Petkov <bp@alien8.de>, Borislav Petkov <bp@suse.de>, "Rafael J . Wysocki" <rjw@rjwysocki.net>Len
Cc: linux-arch@vger.kernel.org, kvm@vger.kernel.org, linux-pm@vger.kernel.org, x86@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, linux-sparse@vger.kernel.org, linux-crypto@vger.kernel.org, kernel-hardening@lists.openwall.com, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjMvMjAxOCAxMjo1NCBQTSwgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cj4gUHJvdmlkZSBh
biBvcHRpb24gdG8gaGF2ZSBhIFBST1ZJREVfSElEREVOIChsaW5rZXIgc2NyaXB0KSBlbnRyeSBm
b3IKPiBlYWNoIHdlYWsgc3ltYm9sLiBUaGlzIG9wdGlvbiBzb2x2ZSBhbiBlcnJvciBpbiB4ODZf
NjQgd2hlcmUgdGhlIGxpbmtlcgoKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzb2x2
ZXMKCj4gb3B0aW1pemVzIHBpZSBnZW5lcmF0ZSBjb2RlIHRvIGJlIG5vbi1waWUgYmVjYXVzZSAt
LWVtaXQtcmVsb2NzIHdhcyB1c2VkCgogICAgICAgICAgICAgICAgZ2VuZXJhdGVkCgo+IGluc3Rl
YWQgb2YgLXBpZSAodG8gcmVkdWNlIGR5bmFtaWMgcmVsb2NhdGlvbnMpLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBHYXJuaWVyIDx0aGdhcm5pZUBnb29nbGUuY29tPgo+IC0tLQo+ICBpbml0
L0tjb25maWcgICAgICAgICAgICB8ICA3ICsrKysrKysKPiAgc2NyaXB0cy9saW5rLXZtbGludXgu
c2ggfCAxNCArKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDIxIGluc2VydGlvbnMo
KykKPiAKPiBkaWZmIC0tZ2l0IGEvaW5pdC9LY29uZmlnIGIvaW5pdC9LY29uZmlnCj4gaW5kZXgg
MGZjM2E1OGQ5ZjJmLi4yODY2Y2NhODZiNGEgMTAwNjQ0Cj4gLS0tIGEvaW5pdC9LY29uZmlnCj4g
KysrIGIvaW5pdC9LY29uZmlnCj4gQEAgLTE5NTQsNiArMTk1NCwxMyBAQCBjb25maWcgQVNOMQo+
ICAJICBpbmZvcm0gaXQgYXMgdG8gd2hhdCB0YWdzIGFyZSB0byBiZSBleHBlY3RlZCBpbiBhIHN0
cmVhbSBhbmQgd2hhdAo+ICAJICBmdW5jdGlvbnMgdG8gY2FsbCBvbiB3aGF0IHRhZ3MuCj4gIAo+
ICtjb25maWcgV0VBS19QUk9WSURFX0hJRERFTgo+ICsJYm9vbAo+ICsJaGVscAo+ICsJICBHZW5l
cmF0ZSBsaW5rZXIgc2NyaXB0IFBST1ZJREVfSElEREVOIGVudHJpZXMgZm9yIGFsbCB3ZWFrIHN5
bWJvbHMuIEl0Cj4gKwkgIGFsbG93cyB0byBwcmV2ZW50IG5vbi1waWUgY29kZSBiZWluZyByZXBs
YWNlZCBieSB0aGUgbGlua2VyIGlmIHRoZQoKCSAgICAgICAgICAgICAgICAgICAgbm9uLVBJRQoK
PiArCSAgZW1pdC1yZWxvY3Mgb3B0aW9uIGlzIHVzZWQgaW5zdGVhZCBvZiBwaWUgKHVzZWZ1bCBm
b3IgeDg2XzY0IHBpZSkuCgoJICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFBJRSAgICAgICAgICAgICAgICAgICAgUElFKS4KCj4gKwoKCi0tIAp+UmFuZHkKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
