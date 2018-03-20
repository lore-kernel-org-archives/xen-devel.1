From: Julien Grall <julien.grall@arm.com>
Subject: Re: [PATCH v5 07/16] xen/x86: mm: Switch x86/mm.c to
 use typesafe for virt_to_mfn
Date: Tue, 20 Mar 2018 09:12:28 +0000
Message-ID: <4655d476-f054-c757-ee8a-c8a0b965e86b@arm.com>
References: <20180314182009.14274-1-julien.grall@arm.com>
 <20180314182009.14274-8-julien.grall@arm.com>
 <CAFLBxZZV9xW1pMs_Tiv6PGRKr+--m0DbES9ephH4BMe1rN0i7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <CAFLBxZZV9xW1pMs_Tiv6PGRKr+--m0DbES9ephH4BMe1rN0i7A@mail.gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <dunlapg@umich.edu>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

SGkgR2VvcmdlLAoKT24gMDMvMTUvMjAxOCAwNDozNiBQTSwgR2VvcmdlIER1bmxhcCB3cm90ZToK
PiBPbiBXZWQsIE1hciAxNCwgMjAxOCBhdCA2OjIwIFBNLCAgPGp1bGllbi5ncmFsbEBhcm0uY29t
PiB3cm90ZToKPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4K
Pj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQuCj4gCj4gSWYgeW91IGVuZCB1cCByZXNw
aW5uaW5nIHRoaXMgeW91IG1pZ2h0IGFsc28gYWRkOgo+IAo+ICJXaGlsZSB3ZSdyZSBoZXJlLCB1
c2UgUEZOX0RPV04oKSByYXRoZXIgdGhhbiBvcGVuIGNvZGluZyBpdC4iCgpTdXJlLgoKPiAKPj4K
Pj4gU2lnbmVkLW9mZiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+PiBBY2tl
ZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJldmlld2VkLWJ5OiBH
ZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+CgpUaGFuayB5b3UhCgpDaGVl
cnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
