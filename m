From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v8 3/9] xen/x86: support per-domain flag for
 xpti
Date: Wed, 18 Apr 2018 03:49:05 -0600
Message-ID: <5AD7149102000078001BC53D@prv1-mh.provo.novell.com>
References: <20180418083051.8334-1-jgross@suse.com>
 <20180418083051.8334-4-jgross@suse.com>
 <1524044577.8598.4.camel@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=iali=hh=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1f8ji3-0002CA-9w
 for xen-devel@lists.xenproject.org; Wed, 18 Apr 2018 09:49:03 +0000
In-Reply-To: <1524044577.8598.4.camel@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE4LjA0LjE4IGF0IDExOjQyLCA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPiB3cm90
ZToKPiBPbiBXZWQsIDIwMTgtMDQtMTggYXQgMTA6MzAgKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mgd3Jv
dGU6Cj4gQEAgLTExOSw4ICsxMjIsOSBAQCBzdGF0aWMgdm9pZCBfX2luaXQgcHJpbnRfZGV0YWls
cyhlbnVtIGluZF90aHVuayB0aHVuaykKPiAgICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZF
QVRVUkVfUlNCX05BVElWRSkgICAgICA/ICIgUlNCX05BVElWRSIgOiAiIiwKPiAgICAgICAgICAg
ICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfUlNCX1ZNRVhJVCkgICAgICA/ICIgUlNCX1ZNRVhJ
VCIgOiAiIik7Cj4gIAo+IC0gICAgcHJpbnRrKCJYUFRJOiAlc1xuIiwKPiAtICAgICAgICAgICBi
b290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfTk9fWFBUSSkgPyAiZGlzYWJsZWQiIDogImVuYWJsZWQi
KTsKPiArICAgIHByaW50aygiWFBUSTogRG9tMCAlcywgRG9tVSAoNjQtYml0IFBWIG9ubHkpICVz
XG4iLAo+ICsgICAgICAgICAgIG9wdF94cHRpICYgT1BUX1hQVElfRE9NMCA/ICJlbmFibGVkIiA6
ICJkaXNhYmxlZCIsCj4gKyAgICAgICAgICAgb3B0X3hwdGkgJiBPUFRfWFBUSV9ET01VID8gImVu
YWJsZWQiIDogImRpc2FibGVkIik7Cj4gIH0KCkFoLCB5ZXMsIG1ha2luZyB0aGlzIGxvZyBtZXNz
YWdlIG1vcmUgcHJlY2lzZSBpcyBjZXJ0YWlubHkgd29ydGh3aGlsZS4gVGhlCnBsYWNlbWVudCBv
ZiAiKDY0LWJpdCBQViBvbmx5KSIgaXMgYSBsaXR0bGUgY29uZnVzaW5nIHRob3VnaDogSSdkIHB1
dCBpdCBlaXRoZXIKYmVmb3JlIHRoZSBjb2xvbiBvciBhdCB0aGUgZW5kIG9mIHRoZSBsaW5lLCBh
cyBpdCBhZmZlY3RzIERvbTAgYXMgbXVjaCBhcwpEb21VLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
