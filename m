From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] xen: hypercall: fix out-of-bounds memcpy
Date: Fri, 2 Feb 2018 17:11:02 +0100
Message-ID: <CAK8P3a0Z2PMP-=e2Ga8kw196vWeAz_HC02ABQmDB9W_0Cmmr-Q__5755.79483197561$1517587820$gmane$org@mail.gmail.com>
References: <20180202153240.1190361-1-arnd@arndb.de>
 <20180202155309.2xg2gjcp7wb7bbpe@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=0xom=e4=gmail.com=arndbergmann@srs-us1.protection.inumbo.net>)
 id 1ehdvc-000368-0Q
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 16:11:04 +0000
Received: by mail-ot0-x244.google.com with SMTP id 73so11609035oti.12
 for <xen-devel@lists.xenproject.org>; Fri, 02 Feb 2018 08:11:03 -0800 (PST)
In-Reply-To: <20180202155309.2xg2gjcp7wb7bbpe@mwanda>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Andi Kleen <ak@linux.intel.com>, Nicolas Pitre <nico@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMiwgMjAxOCBhdCA0OjUzIFBNLCBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+IE9uIEZyaSwgRmViIDAyLCAyMDE4IGF0IDA0OjMyOjMx
UE0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cgo+PiAtLS0gYS9kcml2ZXJzL3hlbi9mYWxs
YmFjay5jCj4+ICsrKyBiL2RyaXZlcnMveGVuL2ZhbGxiYWNrLmMKPj4gQEAgLTcsNzUgKzcsODcg
QEAKPj4KPj4gIGludCB4ZW5fZXZlbnRfY2hhbm5lbF9vcF9jb21wYXQoaW50IGNtZCwgdm9pZCAq
YXJnKQo+PiAgewo+PiAtICAgICBzdHJ1Y3QgZXZ0Y2huX29wIG9wOwo+PiArICAgICBzdHJ1Y3Qg
ZXZ0Y2huX29wIG9wID0geyAuY21kID0gY21kLCB9Owo+PiArICAgICBzaXplX3QgbGVuOwo+PiAg
ICAgICBpbnQgcmM7Cj4+Cj4+IC0gICAgIG9wLmNtZCA9IGNtZDsKPj4gLSAgICAgbWVtY3B5KCZv
cC51LCBhcmcsIHNpemVvZihvcC51KSk7Cj4+IC0gICAgIHJjID0gX2h5cGVyY2FsbDEoaW50LCBl
dmVudF9jaGFubmVsX29wX2NvbXBhdCwgJm9wKTsKPj4gLQo+PiAgICAgICBzd2l0Y2ggKGNtZCkg
ewo+PiArICAgICBjYXNlIEVWVENITk9QX2JpbmRfaW50ZXJkb21haW46Cj4+ICsgICAgICAgICAg
ICAgbGVuID0gc2l6ZW9mKHN0cnVjdCBldnRjaG5fYmluZF9pbnRlcmRvbWFpbik7Cj4+ICsgICAg
ICAgICAgICAgYnJlYWs7Cj4KPiBUaGlzIHdhcyBpbiB0aGUgb3JpZ2luYWwgY29kZSwgYnV0IEkn
bSBzbGlnaHRseSBzdXJwcHJpc2VkIHRoYXQgd2UncmUKPiB1c2luZyBhIHN3aXRjaCBzdGF0ZW1l
bnQgaGVyZSBpbnN0ZWFkIG9mIGEgdGFibGUuICBJIHdvdWxkIGhhdmUgdGhvdWdodAo+IHRoaXMg
aXMgYSBmYXN0IHBhdGggYnV0IEkgZG9uJ3Qga25vdyB4ZW4gYXQgYWxsLgoKSSB0aG91Z2h0IGFi
b3V0IHVzaW5nIGEgdGFibGUsIGJ1dCBmaWd1cmVkIHRoZSBzd2l0Y2ggc3RhdGVtZW50CmhhZCBh
IGxvd2VyIHJpc2sgb2YgZ2V0dGluZyBzb21ldGhpbmcgc2xpZ2h0bHkgd3JvbmcgZHVyaW5nIHRo
ZQpjb252ZXJzaW9uLgoKSSB3b3VsZCBleHBlY3QgZ2NjIHRvIHR1cm4gdGhpcyBpbnRvIGEgdGFi
bGUgbG9va3VwLCBzaW5jZSBhbGwgdGhlCmNvbnN0YW50cyBhcmUgY29uc2VjdXRpdmUsIGJ1dCBp
dCBzaG91bGQgbm90IHJlYWxseSBtYXR0ZXIgc2luY2UKdGhpcyBpcyBvbmx5IHRoZSBmYWxsYmFj
ayBwYXRoIGZvciBhbmNpZW50IFhlbiByZWxlYXNlcy4gV2hlbiBYZW4KZ3Vlc3Qgc3VwcG9ydCB3
YXMgZmlyc3QgbWVyZ2VkIGluIDIwMDcsIGl0IHdhcyBhbHJlYWR5CmRlcHJlY2F0ZWQuCgogICAg
ICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
