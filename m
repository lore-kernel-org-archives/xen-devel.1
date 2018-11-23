From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] EFI: don't repeatedly replace symlinks
Date: Fri, 23 Nov 2018 11:55:41 +0000
Message-ID: <938f5c98-94fb-126e-c05a-f8a98653e097@citrix.com>
References: <5BF7E66002000078001FF5D5@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zeqX=OC=citrix.com=prvs=8587bc52e=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1gQA3k-0007RH-1K
 for xen-devel@lists.xenproject.org; Fri, 23 Nov 2018 11:55:44 +0000
In-Reply-To: <5BF7E66002000078001FF5D5@prv1-mh.provo.novell.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjMvMTEvMjAxOCAxMTozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT25jZSBjcmVhdGVkIHRo
ZXJlJ3Mgbm8gcG9pbnQgcmUtY3JlYXRpbmcgdGhlbSBvbiBldmVyeSBpbmNyZW1lbnRhbAo+IG1h
a2UuIFRoaXMgaW4gcGFydGljdWxhciBwcmV2ZW50cyB0aGVtIGZyb20gYmVjb21pbmcgcm9vdC1v
d25lZCBkdXJpbmcKPiBlLmcuICJzdWRvIG1ha2UgaW5zdGFsbC14ZW4iLCBidXQgaXQgYWxzbyBh
bGxvd3MgKGR1cmluZyBkZXZlbG9wbWVudCkKPiB0byByZXBsYWNlIHRoZW0gdGhlcmUgKGluc3Rl
YWQgb2YgaW4gY29tbW9uL2VmaS8pIGJ5IGFjdHVhbCBmaWxlcyB3aXRoCj4gcGVyaGFwcyBzbGln
aHRseSBjaGFuZ2VkIGNvbnRlbnRzLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
