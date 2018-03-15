From: George Dunlap <dunlapg@umich.edu>
Subject: Re: [PATCH v5 07/16] xen/x86: mm: Switch x86/mm.c to
 use typesafe for virt_to_mfn
Date: Thu, 15 Mar 2018 16:36:02 +0000
Message-ID: <CAFLBxZZV9xW1pMs_Tiv6PGRKr+--m0DbES9ephH4BMe1rN0i7A@mail.gmail.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-8-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180314182009.14274-8-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBNYXIgMTQsIDIwMTggYXQgNjoyMCBQTSwgIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4g
d3JvdGU6Cj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPgo+IE5v
IGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKSWYgeW91IGVuZCB1cCByZXNwaW5uaW5nIHRo
aXMgeW91IG1pZ2h0IGFsc28gYWRkOgoKIldoaWxlIHdlJ3JlIGhlcmUsIHVzZSBQRk5fRE9XTigp
IHJhdGhlciB0aGFuIG9wZW4gY29kaW5nIGl0LiIKCj4KPiBTaWduZWQtb2ZmIEp1bGllbiBHcmFs
bCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4KClJldmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNp
dHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
