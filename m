From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v5 4/4] xen/common: use SYMBOL when required
Date: Tue, 08 Jan 2019 01:13:52 -0700
Message-ID: <5C345BC0020000780020B254@prv1-mh.provo.novell.com>
References: <alpine.DEB.2.10.1901031114230.800@sstabellini-ThinkPad-X260>
 <1546543191-9206-4-git-send-email-sstabellini@kernel.org>
 <5C33281F020000780020AC2C@prv1-mh.provo.novell.com>
 <alpine.DEB.2.10.1901071059120.800@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4mQY=PQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ggmWO-0007q2-LP
 for xen-devel@lists.xenproject.org; Tue, 08 Jan 2019 08:14:00 +0000
In-Reply-To: <alpine.DEB.2.10.1901071059120.800@sstabellini-ThinkPad-X260>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA3LjAxLjE5IGF0IDIwOjE2LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gT24gTW9uLCA3IEphbiAyMDE5LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gPj4+IE9uIDAzLjAx
LjE5IGF0IDIwOjE5LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+ID4gLS0tIGEv
eGVuL2NvbW1vbi92aXJ0dWFsX3JlZ2lvbi5jCj4+ID4gKysrIGIveGVuL2NvbW1vbi92aXJ0dWFs
X3JlZ2lvbi5jCj4+ID4gQEAgLTExOSw3ICsxMTksMTEgQEAgdm9pZCBfX2luaXQgc2V0dXBfdmly
dHVhbF9yZWdpb25zKGNvbnN0IHN0cnVjdCBleGNlcHRpb25fdGFibGVfZW50cnkgKnN0YXJ0LAo+
PiA+ICAgICAgICAgIGNvbnN0IHN0cnVjdCBidWdfZnJhbWUgKnM7Cj4+ID4gIAo+PiA+ICAgICAg
ICAgIHMgPSBidWdfZnJhbWVzW2kgLSAxXTsKPj4gPiAtICAgICAgICBzeiA9IGJ1Z19mcmFtZXNb
aV0gLSBzOwo+PiA+ICsgICAgICAgIC8qCj4+ID4gKyAgICAgICAgICogQ2FzdCB0byB1bnNpZ25l
ZCBsb25nIHRvIGNhbGN1bGF0ZSB0aGUgc2l6ZSB0byBhdm9pZAo+PiA+ICsgICAgICAgICAqIHN1
YnRyYWN0aW9ucyBiZXR3ZWVuIHBvaW50ZXJzIHBvaW50aW5nIHRvIGRpZmZlcmVudCBvYmplY3Rz
Lgo+PiA+ICsgICAgICAgICAqLwo+PiA+ICsgICAgICAgIHN6ID0gKHVuc2lnbmVkIGxvbmcpYnVn
X2ZyYW1lc1tpXSAtICh1bnNpZ25lZCBsb25nKXM7Cj4+IAo+PiBQZXJoYXBzIGJldHRlciB0byB1
c2UgU1lNQk9MKCkgaW4gdGhlIGRlZmluaXRpb24gb2YgYnVnX2ZyYW1lc1tdPwo+IAo+IFRoYXQg
d2FzIG15IGluaXRpYWwgdGhvdWdodCwgYnV0IHRoZW4gYnVnX2ZyYW1lcyBjYW5ub3QgYmUgY29u
c3QgYW5kCj4gY2Fubm90IGJlIHN0YXRpY2FsbHkgaW5pdGlhbGl6ZWQuCgpPaCwgaW5kZWVkLiBC
dXQgdGhlcmUncyBubyBzdHJvbmcgbmVlZCBmb3IgdGhlICJzdGF0aWMiLCBpdCBqdXN0CmhlbHBz
IGtlZXBpbmcgY29kZSBzaXplIHNtYWxsLiBXaXRob3V0IGl0LCBub25lIG9mIC4uLgoKPiBTbyB0
aGUgY29kZSB3b3VsZCBiZWNvbWUgc29tZXRoaW5nIGxpa2UgdGhpczoKPiAKPiB2b2lkIF9faW5p
dCBzZXR1cF92aXJ0dWFsX3JlZ2lvbnMoY29uc3Qgc3RydWN0IGV4Y2VwdGlvbl90YWJsZV9lbnRy
eSAqc3RhcnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBleGNlcHRpb25fdGFibGVfZW50cnkgKmVuZCkKPiB7Cj4gICAgIHNpemVfdCBzejsKPiAgICAg
dW5zaWduZWQgaW50IGkgPSAwOwo+ICAgICBzdGF0aWMgdW5zaWduZWQgbG9uZyBidWdfZnJhbWVz
WzZdOwo+ICAgICBidWdfZnJhbWVzW2krK10gPSBTWU1CT0woX19zdGFydF9idWdfZnJhbWVzKTsK
PiAgICAgYnVnX2ZyYW1lc1tpKytdID0gU1lNQk9MKF9fc3RvcF9idWdfZnJhbWVzXzApLAo+ICAg
ICBidWdfZnJhbWVzW2krK10gPSBTWU1CT0woX19zdG9wX2J1Z19mcmFtZXNfMSksCj4gICAgIGJ1
Z19mcmFtZXNbaSsrXSA9IFNZTUJPTChfX3N0b3BfYnVnX2ZyYW1lc18yKSwKPiAjaWZkZWYgQ09O
RklHX1g4Ngo+ICAgICBidWdfZnJhbWVzW2krK10gPSBTWU1CT0woX19zdG9wX2J1Z19mcmFtZXNf
MyksCj4gI2VuZGlmCj4gICAgIGJ1Z19mcmFtZXNbaSsrXSA9IDA7CgouLi4gdGhpcyByZWFsbHkg
bG9va3MgdG8gYmUgbmVjZXNzYXJ5LgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
