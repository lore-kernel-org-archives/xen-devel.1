From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH 0/9] x86: IRQ management adjustments
Date: Mon, 29 Apr 2019 05:16:25 -0600
Message-ID: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4Gv-000706-SG
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:16:33 +0000
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rmlyc3QgYW5kIGZvcmVtb3N0IHRoaXMgc2VyaWVzIGlzIHRyeWluZyB0byBkZWFsIHdpdGggQ1BV
IG9mZmxpbmluZwppc3N1ZXMsIHdoaWNoIGhhdmUgYmVjb21lIG1vcmUgcHJvbWluZW50IHdpdGgg
dGhlIHJlY2VudGx5CmFkZGVkIFNNVCBlbmFibGUvZGlzYWJsZSBvcGVyYXRpb24gaW4geGVuLWhw
dG9vbC4gTGF0ZXIgcGF0Y2hlcwppbiB0aGUgc2VyaWVzIHRoZW4gY2Fycnkgb3V0IG1vcmUgb3Ig
bGVzcyB1bnJlbGF0ZWQgY2hhbmdlcwooaG9wZWZ1bGx5IGltcHJvdmVtZW50cykgbm90aWNlZCB3
aGlsZSBsb29raW5nIGF0IHZhcmlvdXMgcGllY2VzCm9mIGludm9sdmVkIGNvZGUuCgpUaGUgZmly
c3QgcGF0Y2ggaW50cm9kdWNlcyBhbiBBU1NFUlQoKSB3aGljaCBJJ3ZlIG9ic2VydmVkIHRvCnRy
aWdnZXIgZXZlcnkgb25jZSBpbiBhIHdoaWxlLiBJJ20gc3RpbGwgdHJ5aW5nIHRvIGZpbmQgdGhl
IGNhdXNlIG9mCnRoaXMsIGhlbmNlIHRoZSBSRkMgZm9yIHRoYXQgb25lIHBhdGNoLgoKMTogeDg2
L0lSUTogZGVhbCB3aXRoIG1vdmUtaW4tcHJvZ3Jlc3Mgc3RhdGUgaW4gZml4dXBfaXJxcygpCjI6
IHg4Ni9JUlE6IGRlYWwgd2l0aCBtb3ZlIGNsZWFudXAgY291bnQgc3RhdGUgaW4gZml4dXBfaXJx
cygpCjM6IHg4Ni9JUlE6IGltcHJvdmUgZHVtcF9pcnFzKCkKNDogeDg2L0lSUTogZGVzYy0+YWZm
aW5pdHkgc2hvdWxkIHN0cmljdGx5IHJlcHJlc2VudCB0aGUgcmVxdWVzdGVkIHZhbHVlCjU6IHg4
Ni9JUlE6IGZpeCBsb2NraW5nIGFyb3VuZCB2ZWN0b3IgbWFuYWdlbWVudAo2OiB4ODYvSVJROiBy
ZWR1Y2UgdW51c2VkIHNwYWNlIGluIHN0cnVjdCBhcmNoX2lycV9kZXNjCjc6IHg4Ni9JUlE6IGRy
b3AgcmVkdW5kYW50IGNwdW1hc2tfZW1wdHkoKSBmcm9tIG1vdmVfbWFza2VkX2lycSgpCjg6IHg4
Ni9JUlE6IG1ha2UgZml4dXBfaXJxcygpIHNraXAgdW5jb25uZWN0ZWQgaW50ZXJuYWxseSB1c2Vk
IGludGVycnVwdHMKOTogeDg2L0lPLUFQSUM6IGRyb3AgYW4gdW51c2VkIHZhcmlhYmxlIGZyb20g
c2V0dXBfSU9fQVBJQ19pcnFzKCkKCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
