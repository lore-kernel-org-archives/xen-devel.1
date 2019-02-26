From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v10 2/6] xen: introduce DEFINE_SYMBOL
Date: Tue, 26 Feb 2019 08:20:57 -0700
Message-ID: <5C755959020000780021A5ED@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1902251243530.4000@sstabellini-ThinkPad-X260>
 <1551127822-25886-2-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyeXX-0001GM-0d
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 15:21:03 +0000
In-Reply-To: <1551127822-25886-2-git-send-email-sstabellini@kernel.org>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefanos@xilinx.com>, Andrew Cooper <andrew.cooper3@citrix.com>, george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>, ian.jackson@citrix.com, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDIxOjUwLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmgKPiArKysgYi94ZW4vaW5jbHVkZS94
ZW4vY29tcGlsZXIuaAo+IEBAIC05OSw2ICs5OSwzOCBAQAo+ICAgICAgX19hc21fXyAoIiIgOiAi
PXIiKF9fcHRyKSA6ICIwIihwdHIpKTsgICAgICBcCj4gICAgICAodHlwZW9mKHB0cikpIChfX3B0
ciArIChvZmYpKTsgfSkKPiAgCj4gKwo+ICsvKgo+ICsgKiBEZWNsYXJlIHN0YXJ0IGFuZCBlbmQg
YXJyYXkgdmFyaWFibGVzIGluIEMgY29ycmVzcG9uZGluZyB0byBleGlzdGluZwo+ICsgKiBsaW5r
ZXIgc3ltYm9scy4KCllvdSB2YWxpZGx5IHNheSAiZGVjbGFyZSIgaGVyZSwgc28gd2h5IC4uLgoK
PiArICogVHdvIHN0YXRpYyBpbmxpbmUgZnVuY3Rpb25zIGFyZSBkZWNsYXJlZCB0byBkbyBjb21w
YXJpc29ucyBhbmQKPiArICogc3VidHJhY3Rpb25zIGJldHdlZW4gdGhlc2UgdmFyaWFibGVzLgo+
ICsgKgo+ICsgKiBUaGUgZW5kIHZhcmlhYmxlIGlzIGRlY2xhcmVkIHdpdGggYSBkaWZmZXJlbnQg
dHlwZSB0byBtYWtlIHN1cmUgdGhhdAo+ICsgKiB0aGUgc3RhdGljIGlubGluZSBmdW5jdGlvbnMg
Y2Fubm90IGJlIG1pc3VzZWQuCj4gKyAqLwo+ICsjZGVmaW5lIERFRklORV9TWU1CT0wodHlwZSwg
bmFtZSwgc3RhcnRfbmFtZSwgZW5kX25hbWUpICAgICAgICAgICAgICAgICAgICAgICBcCgouLi4g
ZG8geW91IHVzZSBERUZJTkUgaGVyZT8KCkhvdyBhYm91dCBERUNMQVJFX0FSUkFZX0JPVU5EUyh0
YWcsIG5hbWUpIHVzaW5nCnRhZyAjIyBfdCBhcyB0eXBlLCB0YWcgIyMgX2x0IGV0YyBhcyBmdW5j
dGlvbiBuYW1lcywgYW5kCm5hbWUgIyMgX3N0YXJ0IC8gbmFtZSAjIyBfZW5kIGFzIHN0YXJ0IC8g
ZW5kIHN5bWJvbHMuIFRvCmFjY29tbW9kYXRlIHRoaW5ncyBsaWtlIF9ldGV4dCwgdGhlIGFib3Zl
IGNvdWxkIGluIGZhY3QgZXhwYW5kCnRvIERFQ0xBUkVfQk9VTkRTKHRhZywgbmFtZSAjIyBfc3Rh
cnQsIG5hbWUgIyMgX2VuZCkKYWxsb3dpbmcgdGhpcyBzZWNvbmQgbWFjcm8gdGhlbiB0byBhbHNv
IGJlIHVzZWQgbGlrZQpERUNMQVJFX0JPVU5EUyh0ZXh0LCBfc3RleHQsIF9ldGV4dCkuCgpKYW4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
