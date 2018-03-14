From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 06/27] x86/entry/64: Adapt assembly for
	PIE support
Date: Wed, 14 Mar 2018 11:29:51 +0100
Message-ID: <20180314102951.GQ4043__18857.252438511$1521023377$gmane$org@hirez.programming.kicks-ass.net>
References: <20180313205945.245105-1-thgarnie@google.com>
 <20180313205945.245105-7-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=7+8z=ge=infradead.org=peterz@srs-us1.protection.inumbo.net>)
 id 1ew3g2-0004iQ-Nz
 for xen-devel@lists.xenproject.org; Wed, 14 Mar 2018 10:30:34 +0000
Content-Disposition: inline
In-Reply-To: <20180313205945.245105-7-thgarnie@google.com>
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

T24gVHVlLCBNYXIgMTMsIDIwMTggYXQgMDE6NTk6MjRQTSAtMDcwMCwgVGhvbWFzIEdhcm5pZXIg
d3JvdGU6Cj4gQEAgLTE1NzYsNyArMTU3OCw5IEBAIGZpcnN0X25taToKPiAgCWFkZHEJJDgsICgl
cnNwKQkvKiBGaXggdXAgUlNQICovCj4gIAlwdXNoZnEJCQkvKiBSRkxBR1MgKi8KPiAgCXB1c2hx
CSRfX0tFUk5FTF9DUwkvKiBDUyAqLwo+IC0JcHVzaHEJJDFmCQkvKiBSSVAgKi8KPiArCXB1c2hx
CSVyYXgJCS8qIFN1cHBvcnQgUG9zaXRpb24gSW5kZXBlbmRlbnQgQ29kZSAqLwo+ICsJbGVhcQkx
ZiglcmlwKSwgJXJheAkvKiBSSVAgKi8KPiArCXhjaGdxCSVyYXgsICglcnNwKQkvKiBSZXN0b3Jl
IFJBWCwgcHV0IDFmICovCj4gIAlpcmV0cQkJCS8qIGNvbnRpbnVlcyBhdCByZXBlYXRfbm1pIGJl
bG93ICovCj4gIAlVTldJTkRfSElOVF9JUkVUX1JFR1MKPiAgMToKClVyZ2gsIHhjaGcgd2l0aCBh
IG1lbW9wIGhhcyBhbiBpbXBsaWNpdCBMT0NLIHByZWZpeC4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
