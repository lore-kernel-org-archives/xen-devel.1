From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH 0/4] PVH GDT fixes and cleanup
Date: Mon, 30 Apr 2018 12:23:35 -0400
Message-ID: <20180430162339.17143-1-boris.ostrovsky__20853.4300364137$1525105225$gmane$org@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=zpnp=ht=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fDBYX-0003Rn-Sm
 for xen-devel@lists.xenproject.org; Mon, 30 Apr 2018 16:21:37 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

U3dpdGNoaW5nIHRvIG5ldyBiaW51dGlscyByZWxlYXNlIHRyaWdnZXJlZCB0aGUgZmlyc3QgYnVn
LgoKTm90IHN1cmUgaWYgc3RhY2sgY2FuYXJ5IGJ1ZyBpcyByZWxhdGVkIHRvIHRoZSBuZXcgdG9v
bHMgYXMgd2VsbAooaGF2ZW4ndCBjaGVja2VkIGl0IHdpdGggb2xkIHRvb2xzLCBidXQgdGhleSBh
cmUgcmVhbGx5IG9sZCwgZnJvbQpGZWRvcmEgMTMgZGF5cykuCgo2NC1iaXQgZ3Vlc3RzIHJ1biBm
aW5lIGV2ZW4gd2l0aG91dCBhZGRpbmcgdGhlIGVudHJ5IGZvciBHUyBidXQgbXkKZ3Vlc3MgaXMg
dGhhdCdzIGJlY2F1c2UgWGVuIHRvb2xzdGFjayBzZXRzIGNhY2hlZCBwb3J0aW9ucyBvZiB0aGUK
cmVnaXN0ZXIgdG8gc2FuZSB2YWx1ZXMgYW5kIEhXIG1ha2VzIGZld2VyIGNoZWNrcyBpbiBsb25n
IG1vZGUuClNpbmNlIHRob3NlIHZhbHVlcyBhcmUgbm90IHBhcnQgb2YgdGhlIEFCSSBJIGZpZ3Vy
ZWQgSSBzaG91bGQgZml4Cml0IGZvciBib3RoIDMyLSBhbmQgNjQtYml0IG1vZGUuCgoKQm9yaXMg
T3N0cm92c2t5ICg0KToKICB4ZW4vUFZIOiBSZXBsYWNlIEdEVF9FTlRSWSB3aXRoIGV4cGxpY2l0
IGNvbnN0YW50CiAgeGVuL1BWSDogVXNlIHByb3BlciBDUyBzZWxlY3RvciBpbiBsb25nIG1vZGUK
ICB4ZW4vUFZIOiBTZXQgdXAgR1Mgc2VnbWVudCBmb3Igc3RhY2sgY2FuYXJ5CiAgeGVuL1BWSDog
UmVtb3ZlIHJlc2VydmVkIGVudHJ5IGluIFBWSCBHRFQKCiBhcmNoL3g4Ni94ZW4veGVuLXB2aC5T
IHwgMjggKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE5IGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgotLSAKMi45LjMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
