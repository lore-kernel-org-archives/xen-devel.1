From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] xen: hypercall: fix out-of-bounds memcpy
Date: Fri, 2 Feb 2018 19:34:01 +0300
Message-ID: <20180202163401.zkshusaktxwrs6uj__42522.0766374425$1517589208$gmane$org@mwanda>
References: <20180202153240.1190361-1-arnd@arndb.de>
 <20180202155309.2xg2gjcp7wb7bbpe@mwanda>
 <CAK8P3a0Z2PMP-=e2Ga8kw196vWeAz_HC02ABQmDB9W_0Cmmr-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=f4vi=e4=oracle.com=dan.carpenter@srs-us1.protection.inumbo.net>)
 id 1eheIH-0005J2-JY
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 16:34:29 +0000
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Z2PMP-=e2Ga8kw196vWeAz_HC02ABQmDB9W_0Cmmr-Q@mail.gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Juergen Gross <jgross@suse.com>, Andi Kleen <ak@linux.intel.com>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMDIsIDIwMTggYXQgMDU6MTE6MDJQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3
cm90ZToKPiBPbiBGcmksIEZlYiAyLCAyMDE4IGF0IDQ6NTMgUE0sIERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4gPiBPbiBGcmksIEZlYiAwMiwgMjAxOCBh
dCAwNDozMjozMVBNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+ID4+ICAgICAgIHN3aXRj
aCAoY21kKSB7Cj4gPj4gKyAgICAgY2FzZSBFVlRDSE5PUF9iaW5kX2ludGVyZG9tYWluOgo+ID4+
ICsgICAgICAgICAgICAgbGVuID0gc2l6ZW9mKHN0cnVjdCBldnRjaG5fYmluZF9pbnRlcmRvbWFp
bik7Cj4gPj4gKyAgICAgICAgICAgICBicmVhazsKPiA+Cj4gPiBUaGlzIHdhcyBpbiB0aGUgb3Jp
Z2luYWwgY29kZSwgYnV0IEknbSBzbGlnaHRseSBzdXJwcHJpc2VkIHRoYXQgd2UncmUKPiA+IHVz
aW5nIGEgc3dpdGNoIHN0YXRlbWVudCBoZXJlIGluc3RlYWQgb2YgYSB0YWJsZS4gIEkgd291bGQg
aGF2ZSB0aG91Z2h0Cj4gPiB0aGlzIGlzIGEgZmFzdCBwYXRoIGJ1dCBJIGRvbid0IGtub3cgeGVu
IGF0IGFsbC4KPiAKPiBJIHRob3VnaHQgYWJvdXQgdXNpbmcgYSB0YWJsZSwgYnV0IGZpZ3VyZWQg
dGhlIHN3aXRjaCBzdGF0ZW1lbnQKPiBoYWQgYSBsb3dlciByaXNrIG9mIGdldHRpbmcgc29tZXRo
aW5nIHNsaWdodGx5IHdyb25nIGR1cmluZyB0aGUKPiBjb252ZXJzaW9uLgo+IAo+IEkgd291bGQg
ZXhwZWN0IGdjYyB0byB0dXJuIHRoaXMgaW50byBhIHRhYmxlIGxvb2t1cCwgc2luY2UgYWxsIHRo
ZQo+IGNvbnN0YW50cyBhcmUgY29uc2VjdXRpdmUsIGJ1dCBpdCBzaG91bGQgbm90IHJlYWxseSBt
YXR0ZXIgc2luY2UKPiB0aGlzIGlzIG9ubHkgdGhlIGZhbGxiYWNrIHBhdGggZm9yIGFuY2llbnQg
WGVuIHJlbGVhc2VzLiBXaGVuIFhlbgo+IGd1ZXN0IHN1cHBvcnQgd2FzIGZpcnN0IG1lcmdlZCBp
biAyMDA3LCBpdCB3YXMgYWxyZWFkeQo+IGRlcHJlY2F0ZWQuCj4gCgpBaC4gIE9rLiAgVGhhdCBt
YWtlcyBzZW5zZS4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
