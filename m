From: "Jan Beulich" <JBeulich@suse.com>
Subject: Ping: [PATCH v3 0/2] x86: HW vulnerability mitigation
 logging improvements
Date: Wed, 29 Aug 2018 01:12:07 -0600
Message-ID: <5B86474702000078001E2DCA@prv1-mh.provo.novell.com>
References: <5B4EF9C402000078001D5433@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=lc6w=lm=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1fuue9-0004rt-VT
 for xen-devel@lists.xenproject.org; Wed, 29 Aug 2018 07:12:09 +0000
In-Reply-To: <5B4EF9C402000078001D5433@prv1-mh.provo.novell.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE3LjA4LjE4IGF0IDA4OjQ1LCAgd3JvdGU6Cj4gSSdtIG5vdCByZWFsbHkgY29udmlu
Y2VkIG9mIHRoZSBjaGFuZ2UgZG9uZSBpbiB2MywgZXZlbiBsZXNzIHNvIHdpdGgKPiB4ODYnZXMg
cHYvZG9tYWluLmggbm90IHJlYWxseSBoYXZpbmcgYmVlbiBzdWl0YWJsZSBmb3IgaW5jbHVzaW9u
IGluCj4gc3BlYy1jdHJsLmMgKG5lZWRlZCBhbiBleHRyYSwgc2VlbWluZ2x5IHVucmVsYXRlZCBh
ZGp1c3RtZW50KSwgYnV0Cj4gaW4gdGhlIGludGVyZXN0IG9mIGdldHRpbmcgdGhpcyBkb25lLCBo
ZXJlIHlvdSBnby4KPiAKPiAxOiB4ODY6IHJlcG9ydCB1c2Ugb2YgUENJRCB0b2dldGhlciB3aXRo
IHJlcG9ydGluZyBYUFRJIHN0YXR1cwo+IDI6IHg4Ni9zcGVjLWN0cmw6IHNwbGl0IHJlcG9ydGlu
ZyBmb3IgUFYgYW5kIEhWTSBndWVzdHMKPiAKPiBKYW4KPiAKPiAKCgoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
