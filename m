From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH 5/9] libxl: Do root checks once in
 libxl__domain_get_device_model_uid
Date: Wed, 28 Nov 2018 16:39:06 +0000
Message-ID: <23550.50346.919097.312284@mariner.uk.xensource.com>
References: <20181123171502.29519-1-george.dunlap@citrix.com>
 <20181123171502.29519-5-george.dunlap@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bc+K=OH=citrix.com=prvs=863aa12bc=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gS2sc-0007YP-G2
 for xen-devel@lists.xenproject.org; Wed, 28 Nov 2018 16:40:02 +0000
In-Reply-To: <20181123171502.29519-5-george.dunlap@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: George Dunlap <george.dunlap@citrix.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggNS85XSBsaWJ4bDogRG8gcm9vdCBjaGVja3Mg
b25jZSBpbiBsaWJ4bF9fZG9tYWluX2dldF9kZXZpY2VfbW9kZWxfdWlkIik6Cj4gQXQgdGhlIG1v
bWVudCwgd2UgY2hlY2sgZm9yIGVxdWl2YWxlbmNlIHRvIGxpdGVyYWwgInJvb3QiIGJlZm9yZQo+
IGRlY2lkaW5nIHdoZXRoZXIgdG8gYWRkIHRoZSBgcnVuYXNgIGNvbW1hbmQtbGluZSBvcHRpb24g
dG8gUUVNVS4gIFRoaXMKPiBpcyB1bnNhdGlzZmFjdG9yeSBmb3Igc2V2ZXJhbCByZWFzb25zLgoK
SSB3YXMgaW4gdHdvIG1pbmRzIGFib3V0IHRoZSBnb3RvcyBpbiB0aGUgZWFybGllciB2ZXJzaW9u
IG9mIHRoaXMKcGF0Y2guICBCdXQgaGVyZSB0aGV5IGFyZSBnZXR0aW5nIHF1aXRlIG91dCBvZiBo
YW5kLgoKSSBrbm93IHRoYXQgaW4gdGhlIGh5cGVydmlzb3IgdGhpcyBraW5kIG9mIHRoaW5nIGlz
IHRvbGVyYXRlZCAod3JvbmdseQpJTU8pIGJ1dCBjYW4gd2UgcGxlYXNlIG5vdCBoYXZlIGl0IGhl
cmUuCgpUaGlzIG1heSBtZWFuIHNwbGl0dGluZyBzdHVmZiBvdXQgaW50byBhIHN1Yi1mdW5jdGlv
bi4gIFRoYXQgY291bGQgYmUKZG9uZSBzb21lIHRpbWUgYmV0d2VlbiAiTW92ZSBkbSB1c2VyIGRl
dGVybWluYXRpb24gbG9naWMgaW50byBhIGhlbHBlcgpmdW5jdGlvbiIgYW5kIHRoaXMgcGF0Y2gg
SSBndWVzcy4KClNvcnJ5LApJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
