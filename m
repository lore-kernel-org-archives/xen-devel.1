From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH for-4.12 RFC] xen/console: Handle NUL
 character in buffer sent via CONSOLEIO_write
Date: Tue, 5 Mar 2019 13:57:06 +0100
Message-ID: <deec0912-6efe-d129-4c06-6d8ef506964e@suse.com>
References: <20190226230351.12882-1-julien.grall@arm.com>
 <a8c1b423-ed18-36bf-3979-17a4a275658f@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rV4c=RI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h19dA-00034o-S7
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2019 12:57:12 +0000
In-Reply-To: <a8c1b423-ed18-36bf-3979-17a4a275658f@arm.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDIvMjAxOSAxMTo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+ICgrIEp1ZXJnZW4gR3Jv
c3MgYXMgUk0pCj4gCj4gSSBmb3Jnb3QgdG8gQ0MgSnVlcmdlbiBmb3IgdGhpcy4KPiAKPiBPbiAy
LzI2LzE5IDExOjAzIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFmdGVyIHVwZ3JhZGluZyBE
ZWJpYW4gdG8gQnVzdGVyLCBJIHN0YXJ0ZWQgbm90aWNpbmcgY29uc29sZSBtYW5nbGluZwo+PiB3
aGVuIHVzaW5nIHpzaC4gVGhpcyBpcyBoYXBwZW5uaW5nIGJlY2F1c2Ugb3V0cHV0IHNlbnQgYnkg
enNoIHRvIHRoZQo+PiBjb25zb2xlIG1heSBjb250YWluIE5VTCBjaGFyYWN0ZXIgaW4gdGhlIG1p
ZGRsZSBvZiB0aGUgYnVmZmVyLgo+Pgo+PiBMaW51eCBpcyBzZW5kaW5nIHRoZSBidWZmZXIgYXMg
aXQgaXMgdG8gWGVuIGNvbnNvbGUgdmlhIENPTlNPTEVJT193cml0ZS4KPj4gSG93ZXZlciwgdGhl
IGltcGxlbWVudGF0aW9uIGluIFhlbiBjb25zaWRlcnMgTlVMIGNoYXJhY3RlciBpcyB1c2VkIHRv
Cj4+IHRlcm1pbmF0ZSB0aGUgYnVmZmVyIGFuZCB0aGVyZWZvcmUgd2lsbCBpZ25vcmUgYW55dGhp
bmcgYWZ0ZXIgaXQuCj4+Cj4+IFRoZSBhY3R1YWwgZG9jdW1lbnRhdGlvbiBvZiBDT05TT0xFSU9f
d3JpdGUgaXMgcHJldHR5IGxpbWl0ZWQuIEZyb20gdGhlCj4+IGRlY2xhcmF0aW9uLCB0aGUgaHlw
ZXJjYWxsIHRha2VzIGEgYnVmZmVyIGFuZCBzaXplLiBTbyB0aGlzIGNvdWxkIGxlYWQKPj4gdG8g
dGhpbmsgdGhlIE5VTCBjaGFyYWN0ZXIgaXMgYWxsb3dlZCBpbiB0aGUgbWlkZGxlIG9mIHRoZSBi
dWZmZXIuCj4+Cj4+IFRoaXMgcGF0Y2ggdXBkYXRlcyB0aGUgY29uc29sZSBBUEkgdG8gcGFzcyB0
aGUgc2l6ZSBhbG9uZyB0aGUgYnVmZmVyCj4+IGRvd24gc28gd2UgY2FuIHJlbW92ZSB0aGUgcmVs
aWFuY2Ugb24gYnVmZmVyIHRlcm1pbmF0aW5nIGJ5IGEgTlVMCj4+IGNoYXJhY3Rlci4KPj4KPj4g
U2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoZSBy
aXNrIGZvciBhIHJlZ3Jlc3Npb24gaXMgdG9vIGhpZ2ggdGhpcyBsYXRlIGluIHRoZSA0LjEyIHJl
bGVhc2UKcHJvY2VzcyBJTU8uCgpNeSBwbGFuIGlzIHRvIGhhdmUgb25seSBvbmUgZnVydGhlciBS
QyBiZWZvcmUgYnJhbmNoaW5nIG9mZiA0LjEyLApzbyBwbGVhc2UgbGV0IHVzIHNoaWZ0IHRoaXMg
cGF0Y2ggdG8gNC4xMy4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
