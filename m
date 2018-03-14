From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 21/27] x86/ftrace: Adapt function tracing
 for PIE support
Date: Wed, 14 Mar 2018 11:35:37 +0100
Message-ID: <20180314103537.GR4043__27493.3980581865$1521023707$gmane$org@hirez.programming.kicks-ass.net>
References: <20180313205945.245105-1-thgarnie@google.com>
 <20180313205945.245105-22-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7+8z=ge=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1ew3lR-00057L-D4
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 10:36:09 +0000
Content-Disposition: inline
In-Reply-To: <20180313205945.245105-22-thgarnie@google.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>
Cc: Kate Stewart <kstewart@linuxfoundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Hocko <mhocko@suse.com>, Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, Petr Mladek <pmladek@suse.com>, Len Brown <len.brown@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Christopher Li <sparse@chrisli.org>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, kernel-hardening@lists.openwall.com, Christoph Lameter <cl@linux.com>, Jiri Slaby <jslaby@suse.cz>, Alok Kataria <akataria@vmware.com>, linux-doc@vger.kernel.org, linux-arch@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>
List-Id: xen-devel@lists.xenproject.org

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDE6NTk6MzlQTSAtMDcwMCwgVGhvbWFzIEdhcm5pZXIg
d3JvdGU6Cj4gKwkvKgo+ICsJICogSWYgUElFIGlzIG5vdCBlbmFibGVkIG9yIG5vIEdPVCBjYWxs
IHdhcyBmb3VuZCwgZGVmYXVsdCB0byB0aGUKPiArCSAqIG9yaWdpbmFsIGFwcHJvYWNoIHRvIGNv
ZGUgbW9kaWZpY2F0aW9uLgo+ICsJICovCj4gKwlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1g4Nl9Q
SUUpCj4gKwkgICAgfHwgcHJvYmVfa2VybmVsX3JlYWQocmVwbGFjZWQsICh2b2lkICopaXAsIHNp
emVvZihyZXBsYWNlZCkpCj4gKwkgICAgfHwgbWVtY21wKHJlcGxhY2VkLCBnb3RfY2FsbF9wcmVp
bnNuLCBzaXplb2YoZ290X2NhbGxfcHJlaW5zbikpKQo+ICsJCXJldHVybiBmdHJhY2VfbW9kaWZ5
X2NvZGVfZGlyZWN0KGlwLCBvbGRfY29kZSwgbmV3X2NvZGUpOwoKVGhlIHByZWRvbWluYW50IGtl
cm5lbCBzdHlsZSBpcyB0byBwbGFjZSB0aGUgb3BlcmF0b3JzIGF0IHRoZSBlbmQgb2YgdGhlCnBy
ZXZpb3VzIGxpbmUsIG5vdCBmaXJzdCBvbiB0aGUgbmV3IGxpbmUuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
