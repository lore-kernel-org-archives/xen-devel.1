From: Jason Andryuk <jandryuk@gmail.com>
Subject: [PATCH] xen: Make XEN_BACKEND selectable by DomU
Date: Thu, 20 Sep 2018 10:32:36 -0400
Message-ID: <20180920143237.10000-1-jandryuk__37545.9221461371$1537453917$gmane$org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=r1jv=mc=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1g3013-0007Az-9S
 for xen-devel@lists.xenproject.org; Thu, 20 Sep 2018 14:33:13 +0000
Received: by mail-qt0-x243.google.com with SMTP id r37-v6so8701471qtc.0
 for <xen-devel@lists.xenproject.org>; Thu, 20 Sep 2018 07:33:11 -0700 (PDT)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, Jason Andryuk <jandryuk@gmail.com>
List-Id: xen-devel@lists.xenproject.org

WEVOX0JBQ0tFTkQgZG9lc24ndCBhY3R1YWxseSBkZXBlbmQgb24gWEVOX0RPTTAuICBEb21VcyBj
YW4gc2VydmUKYmFja2VuZHMgdG8gb3RoZXIgRG9tVXMuICBPbmUgZXhhbXBsZSBpcyBhIHNlcnZp
Y2UgVk0gcHJvdmlkaW5nIG5ldHdvcmsKYmFja2VuZHMuCgpUaGUgb3JpZ2luYWwgS2NvbmZpZyBk
ZWZhdWx0ZWQgRG9tMCB0byB5IGFuZCBpdCBjb3VsZCBiZSBkaXNhYmxlZC4gIERvbVUKY291bGQg
bm90IHNlbGVjdCB0aGUgb3B0aW9uLiAgV2l0aCB0aGUgbmV3IEtjb25maWcsIHdlIGRlZmF1bHQg
eSBmb3IKRG9tMCBhbmQgbiBmb3IgRG9tVS4gIEVpdGhlciBjYW4gdGhlbiB0b2dnbGUgdGhlIHNl
bGVjdGlvbi4KClNpZ25lZC1vZmYtYnk6IEphc29uIEFuZHJ5dWsgPGphbmRyeXVrQGdtYWlsLmNv
bT4KLS0tCk9wZW5YVCBydW5zIG5ldHdvcmsgYmFja2VuZHMgaW4gYSBuZXR3b3JrIHNlcnZpY2Ug
RG9tVSB0aGF0IHNoYXJlcyBvdXQKUENJIE5JQ3MuCgogZHJpdmVycy94ZW4vS2NvbmZpZyB8IDMg
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy94ZW4vS2NvbmZpZyBiL2RyaXZlcnMveGVuL0tjb25maWcKaW5kZXgg
YjQ1OWVkZmFjZmYzLi5hZjFiZjk5MzE4YzYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMveGVuL0tjb25m
aWcKKysrIGIvZHJpdmVycy94ZW4vS2NvbmZpZwpAQCAtMTAxLDggKzEwMSw3IEBAIGNvbmZpZyBY
RU5fREVWX0VWVENITgogCiBjb25maWcgWEVOX0JBQ0tFTkQKIAlib29sICJCYWNrZW5kIGRyaXZl
ciBzdXBwb3J0IgotCWRlcGVuZHMgb24gWEVOX0RPTTAKLQlkZWZhdWx0IHkKKwlkZWZhdWx0IHkg
aWYgWEVOX0RPTTAKIAloZWxwCiAJICBTdXBwb3J0IGZvciBiYWNrZW5kIGRldmljZSBkcml2ZXJz
IHRoYXQgcHJvdmlkZSBJL08gc2VydmljZXMKIAkgIHRvIG90aGVyIHZpcnR1YWwgbWFjaGluZXMu
Ci0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
