From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/3] xen-netback: hash mapping hanling
 adjustments
Date: Tue, 11 Sep 2018 02:12:07 -0600
Message-ID: <5B9778D702000078001E7069__2360.62225089899$1536653451$gmane$org@prv1-mh.provo.novell.com>
References: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=zj+h=lz=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fzdmP-0005lu-Ht
 for xen-devel@lists.xenproject.org; Tue, 11 Sep 2018 08:12:13 +0000
In-Reply-To: <5B85622302000078001E2A35@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, davem@davemloft.net
Cc: xen-devel <xen-devel@lists.xenproject.org>, netdev@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA4LjE4IGF0IDE2OjU0LCAgd3JvdGU6Cj4gRmlyc3QgYW5kIGZvcmVtb3N0IHRo
ZSBmaXggZm9yIFhTQS0yNzAuIE9uIHRvcCBvZiB0aGF0IGZ1cnRoZXIgY2hhbmdlcwo+IHdoaWNo
IGxvb2tlZCBkZXNpcmFibGUgdG8gbWUgd2hpbGUgaW52ZXN0aWdhdGluZyB0aGF0IFhTQS4KPiAK
PiAxOiBmaXggaW5wdXQgdmFsaWRhdGlvbiBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCj4g
MjogdmFsaWRhdGUgcXVldWUgbnVtYmVycyBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCj4g
MzogaGFuZGxlIHBhZ2Ugc3RyYWRkbGluZyBpbiB4ZW52aWZfc2V0X2hhc2hfbWFwcGluZygpCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKV2hhdCBp
cyB0aGUgd2F5IGZvcndhcmQgaGVyZT8gSSd2ZSBnb3QgUi1iLXMgZnJvbSBQYXVsIGZvciBhbGwg
dGhyZWUKcGF0Y2hlcywgYW5kIGEgbWlub3IgY2hhbmdlIHJlcXVlc3Qgb24gcGF0Y2ggMiBmcm9t
IFdlaS4gSSdtIG5vdApyZWFsbHkgY2VydGFpbiB3aGF0IHRvIGRvIGluIHRoaXMgY2FzZSAoaGlu
dHMgYXBwcmVjaWF0ZWQpLCBidXQgY291bGQKYXQgbGVhc3QgdGhlIHNlY3VyaXR5IGZpeCAocGF0
Y2ggMSkgYmUgYXBwbGllZCBpbW1lZGlhdGVseT8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
