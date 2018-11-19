From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH 3/4] automation: also specify xen binary as
 artifact on x86_64
Date: Mon, 19 Nov 2018 21:31:01 +0000
Message-ID: <20181119213102.8939-4-wei.liu2@citrix.com>
References: <20181119213102.8939-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=bhw3=n6=citrix.com=prvs=8540992c9=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gOr8N-00070X-Qk
 for xen-devel@lists.xenproject.org; Mon, 19 Nov 2018 21:31:07 +0000
In-Reply-To: <20181119213102.8939-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>
List-Id: xen-devel@lists.xenproject.org

Li4uIHNvIHRoYXQgaXQgY2FuIGJlIHBhc3NlZCBvbiB0byB0ZXN0IHN0YWdlLgoKTm90ZSB0aGF0
IHhlbiBpcyBvbmx5IGV4dHJhY3RlZCBmb3IgeDg2XzY0IGJ1aWxkIHNpbmNlIG90aGVycyBtYXkg
bm90CmhhdmUgdGhhdC4gVXNlIGEgZGlyZWN0b3J5IHRvIGFjY291bnQgZm9yIHBvc3NpYmx5IGRp
ZmZlcmVudCBmaWxlCm5hbWVzIG9uIEFybS4KClNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPHdlaS5s
aXUyQGNpdHJpeC5jb20+Ci0tLQogLmdpdGxhYi1jaS55bWwgICAgICAgICAgIHwgMSArCiBhdXRv
bWF0aW9uL3NjcmlwdHMvYnVpbGQgfCA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFiLWNpLnltbAppbmRl
eCAyODE1MmU5MDZkLi5kMTE0NTliMTE3IDEwMDY0NAotLS0gYS8uZ2l0bGFiLWNpLnltbAorKysg
Yi8uZ2l0bGFiLWNpLnltbApAQCAtOCw2ICs4LDcgQEAgc3RhZ2VzOgogICAgIC0gLi9hdXRvbWF0
aW9uL3NjcmlwdHMvYnVpbGQgMj4mMSB8IHRlZSBidWlsZC5sb2cKICAgYXJ0aWZhY3RzOgogICAg
IHBhdGhzOgorICAgICAgLSBiaW5hcmllcy8KICAgICAgIC0geGVuLWNvbmZpZwogICAgICAgLSAn
Ki5sb2cnCiAgICAgd2hlbjogYWx3YXlzCmRpZmYgLS1naXQgYS9hdXRvbWF0aW9uL3NjcmlwdHMv
YnVpbGQgYi9hdXRvbWF0aW9uL3NjcmlwdHMvYnVpbGQKaW5kZXggYTFmOWE1ZGE1Ni4uZDRhY2Vi
NzQ1ZiAxMDA3NTUKLS0tIGEvYXV0b21hdGlvbi9zY3JpcHRzL2J1aWxkCisrKyBiL2F1dG9tYXRp
b24vc2NyaXB0cy9idWlsZApAQCAtMjgsNiArMjgsMTAgQEAgbWFrZSAtaiQobnByb2MpIGRpc3QK
IAogIyBFeHRyYWN0IGFydGlmYWN0cyB0byBhdm9pZCBnZXR0aW5nIHJld3JpdHRlbiBieSBjdXN0
b21pc2VkIGJ1aWxkcwogY3AgeGVuLy5jb25maWcgeGVuLWNvbmZpZworbWtkaXIgYmluYXJpZXMK
K2lmIFtbICJ4JHtYRU5fVEFSR0VUX0FSQ0h9IiA9PSAieHg4Nl82NCIgXV07IHRoZW4KKyAgICBj
cCB4ZW4veGVuIGJpbmFyaWVzL3hlbgorZmkKIAogIyBCdWlsZCBhbGwgdGhlIGNvbmZpZ3Mgd2Ug
Y2FyZSBhYm91dAogY2FzZSAke1hFTl9UQVJHRVRfQVJDSH0gaW4KLS0gCjIuMTEuMAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
