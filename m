From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86emul: correct AVX512BW write masking
 checks
Date: Thu, 31 Jan 2019 02:30:51 -0700
Message-ID: <5C52C04B020000780021293B@prv1-mh.provo.novell.com>
References: <5C3C7511020000780020D2BF@prv1-mh.provo.novell.com>
 <486e3429-c9de-e609-10e8-36a55513cad8@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gp8gO-0008Eq-T3
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 09:30:52 +0000
In-Reply-To: <486e3429-c9de-e609-10e8-36a55513cad8@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMwLjAxLjE5IGF0IDIwOjA0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTQvMDEvMjAxOSAxMTo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZvciBWUFNB
REJXIHRoaXMgbGlrZWx5IHdhcyBhIHJlc3VsdCBvZiBiYWQgY29weS1hbmQtcGFzdGUuCj4+Cj4+
IEZvciBWUFN7TCxSfUxEUSBjb21tZW50IGFuZCBjb2RlIHdlcmUgbm90IGluIGxpbmUsIGJ1dCB0
aGVuIGFnYWluIHRoZQo+PiBjb21tZW50IGFsc28gd2Fzbid0IGZ1bGx5IHVwZGF0ZWQgZnJvbSB0
aGUgQVZYMiBvcmlnaW5hbCBpdCBnb3QgY2xvbmVkCj4+IGZyb20uCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJJ20gZ3Vlc3NpbmcgdGhh
dCB0aGVzZSBhcmUgY292ZXJlZCBieSB0aGUgZmlyc3Qgcm93IG9mIHRhYmxlIDItNDAsIGFuZAo+
IHRoZSBhYnNlbnNlIG9mIHtrMX0gaW4gdGhlIGluc3RydWN0aW9uIHNwZWNpZmljYXRpb25zPwoK
WWVzLCB0aGF0J3MgaG93IEkgdW5kZXJzdGFuZCBpdC4gSSdtIGFsc28gZ2VuZXJhbGx5IHRha2lu
ZyBiaW51dGlscycKb3Bjb2RlcyB0YWJsZSBhcyBzZWNvbmRhcnkgcmVmZXJlbmNlLCBzbyBzZWUg
d2hldGhlciB0aGUgSW50ZWwKZm9sa3MgaGF2aW5nIGltcGxlbWVudGVkIHRoYXQgaGFkIGFueSBp
bmZvcm1hdGlvbiBkaWZmZXJpbmcgZnJvbQp3aGF0IHRoZSBTRE0gb3IgdGhlIElTQSBleHRlbnNp
b25zIGRvYyBzYXkuIFhFRCBtYXkgYWxzbyBiZQp1c2VmdWwgYXMgYSBzZWNvbmRhcnkgc291cmNl
LCBidXQgSSB0aGluayBJIGRpZG4ndCBjaGVjayBpdCBmb3IgdGhlCmNhc2VzIGhlcmUuCgpCZXNp
ZGVzIHRoZSBhYnNlbmNlIG9mIHtrMX0gaXQncyBhbHNvIHRoZSBhYnNlbmNlIG9mICJ1bmRlciB3
cml0ZQptYXNrIGsxIiBpbiB0aGUgZGVzY3JpcHRpb24gY29sdW1uLCBhbmQgdGhlIG9wZXJhdGlv
biBzZWN0aW9uIG5vdApkZXNjcmliaW5nIGNvbmRpdGlvbmFsIHdyaXRlIGJhY2suIEkgdXN1YWxs
eSBvbmx5IHRha2UgYWxsIHRocmVlCm1hdGNoaW5nIHVwIGFzIHN1ZmZpY2llbnQgcHJvb2YgZm9y
IHRoZXJlIG5vdCBzaW1wbHkgYmVpbmcgYW4Kb21pc3Npb24gc29tZXdoZXJlLgoKSmFuCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
