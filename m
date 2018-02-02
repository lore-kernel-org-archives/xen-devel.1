From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 24/25] x86/shadow: fully move unmap-dest
 into common code
Date: Fri, 2 Feb 2018 16:46:12 +0000
Message-ID: <270b272a-63bc-9c2f-fcda-eb52e4f91e3a@citrix.com>
References: <5A29550C020000780019585B@prv-mh.provo.novell.com>
 <5A295BC00200007800195994@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=g0dj=e4=citrix.com=prvs=564f8cbd0=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1eheU7-0006Nj-Ki
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2018 16:46:43 +0000
In-Reply-To: <5A295BC00200007800195994@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMTIvMTcgMTQ6MTgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IEBAIC0xNzc4LDYgKzE3ODEs
NDIgQEAgdm9pZCAqc2hfZW11bGF0ZV9tYXBfZGVzdChzdHJ1Y3QgdmNwdSAqdgo+ICAgICAgcmV0
dXJuIG1hcDsKPiAgfQo+ICAKPiArLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqLwo+ICsvKiBPcHRpbWl6YXRp
b246IElmIHdlIHNlZSB0d28gZW11bGF0ZWQgd3JpdGVzIG9mIHplcm9zIHRvIHRoZSBzYW1lCj4g
KyAqIHBhZ2UtdGFibGUgd2l0aG91dCBhbm90aGVyIGtpbmQgb2YgcGFnZSBmYXVsdCBpbiBiZXR3
ZWVuLCB3ZSBndWVzcwo+ICsgKiB0aGF0IHRoaXMgaXMgYSBiYXRjaCBvZiBjaGFuZ2VzIChmb3Ig
cHJvY2VzcyBkZXN0cnVjdGlvbikgYW5kCj4gKyAqIHVuc2hhZG93IHRoZSBwYWdlIHNvIHdlIGRv
bid0IHRha2UgYSBwYWdlZmF1bHQgb24gZXZlcnkgZW50cnkuICBUaGlzCj4gKyAqIHNob3VsZCBh
bHNvIG1ha2UgZmluZGluZyB3cml0ZWFibGUgbWFwcGluZ3Mgb2YgcGFnZXRhYmxlcyBtdWNoCj4g
KyAqIGVhc2llci4gKi8KPiArCj4gKy8qIExvb2sgdG8gc2VlIGlmIHRoaXMgaXMgdGhlIHNlY29u
ZCBlbXVsYXRlZCB3cml0ZSBpbiBhIHJvdyB0byB0aGlzCj4gKyAqIHBhZ2UsIGFuZCB1bnNoYWRv
dyBpZiBpdCBpcyAqLwoKRG8geW91IG1pbmQgYWRqdXN0aW5nIHRoZSBjb21tZW50IHN0eWxlIGFz
IHBhcnQgb2YgdGhlIG1vdmVtZW50PwoKUmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
