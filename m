From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/mtrr: recalculate P2M type for domains
 with iocaps
Date: Thu, 25 Apr 2019 07:30:59 -0600
Message-ID: <5CC1B6930200007800229160@prv1-mh.provo.novell.com>
References: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hJeSw-0007Qc-Ih
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2019 13:31:06 +0000
In-Reply-To: <1556019478-10835-1-git-send-email-igor.druzhinin@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIzLjA0LjE5IGF0IDEzOjM3LCA8aWdvci5kcnV6aGluaW5AY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBjaGFuZ2UgcmVmbGVjdHMgdGhlIGxvZ2ljIGluIGVwdGVfZ2V0X2VudHJ5X2Vt
dCgpIGFuZCBhbGxvd3MKPiBjaGFuZ2VzIGluIGd1ZXN0IE1UVFJzIHRvIGJlIHJlZmxlY3RlZCBp
biBFUFQgZm9yIGRvbWFpbnMgaGF2aW5nCj4gZGlyZWN0IGFjY2VzcyB0byBjZXJ0YWluIGhhcmR3
YXJlIG1lbW9yeSByZWdpb25zIGJ1dCB3aXRob3V0IElPTU1VCj4gY29udGV4dCBhc3NpZ25lZCAo
ZS5nLiBYZW5HVCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1
emhpbmluQGNpdHJpeC5jb20+CgpGdW5kYW1lbnRhbGx5IEknbSBoYXBweSB0byBnZXQgYm90aCBp
biBzeW5jLCBzbwpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoK
QnV0IEkgaGF2ZSBhIHF1ZXN0aW9uOgoKPiAgdm9pZCBtZW1vcnlfdHlwZV9jaGFuZ2VkKHN0cnVj
dCBkb21haW4gKmQpCj4gIHsKPiAtICAgIGlmICggaGFzX2lvbW11X3B0KGQpICYmIGQtPnZjcHUg
JiYgZC0+dmNwdVswXSApCj4gKyAgICBpZiAoIChoYXNfaW9tbXVfcHQoZCkgfHwgY2FjaGVfZmx1
c2hfcGVybWl0dGVkKGQpKSAmJiBkLT52Y3B1ICYmIGQtPnZjcHVbMF0gKQo+ICAgICAgewo+ICAg
ICAgICAgIHAybV9tZW1vcnlfdHlwZV9jaGFuZ2VkKGQpOwo+ICAgICAgICAgIGZsdXNoX2FsbChG
TFVTSF9DQUNIRSk7CgpXb3VsZG4ndCBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoKSBhbG9uZSBzdWZm
aWNlLCBib3RoIGhlcmUgYW5kCnRoZXJlPyBFdmVuIGlmIGFueW9uZSB3YXMgdG8gcGFzcy10aHJv
dWdoIGEgZGV2aWNlIHdpdGhvdXQgYW55Ck1NSU8gb3IgSS9PIHBvcnQgQkFSLCB0aGUgbWVtb3J5
IHR5cGUgKHdoaWNoIGlzIGEgQ1BVIHNpZGUKdGhpbmcgb25seSwgaS5lLiBkb2Vzbid0IGFmZmVj
dCBETUEgYnkgdGhlIGRldmljZSkgc2hvdWxkbid0Cm1hdHRlciBpbiB0aGF0IGNhc2UgKGxlYXZp
bmcgYXNpZGUgdGhlIGZhY3QgdGhhdCBhIEJBUi1sZXNzCmRldmljZSBpcyB1bmxpa2VseSB0byBi
ZSBETUEtY2FwYWJsZSwgdW5sZXNzIHRoZSBwcm9ncmFtbWluZwpvZiB0aGUgRE1BIG9wZXJhdGlv
bnMgd2FzIHRvIGhhcHBlbiB0aHJvdWdoIHZlbmRvciBzcGVjaWZpYwpjb25maWcgc3BhY2UgYWNj
ZXNzZXMpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
