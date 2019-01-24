From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v6 03/15] argo: define argo_dprintk for
 subsystem debugging
Date: Wed, 23 Jan 2019 18:04:51 -0800
Message-ID: <1548295503-15946-4-git-send-email-christopher.w.clark@gmail.com>
References: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ulBm=QA=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gmUOW-0003uD-79
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 02:05:28 +0000
Received: by mail-io1-xd42.google.com with SMTP id b16so3399675ior.1
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 18:05:27 -0800 (PST)
In-Reply-To: <1548295503-15946-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBjb252ZW5pZW5jZSBmb3Igd29ya2luZyBvbiBkZXZlbG9wbWVudCBvZiB0aGUgYXJnbyBzdWJz
eXN0ZW06CnNldHRpbmcgYSAjZGVmaW5lIHZhcmlhYmxlIGVuYWJsZXMgYWRkaXRpb25hbCBkZWJ1
ZyBtZXNzYWdlcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhl
ci5jbGFyazZAYmFlc3lzdGVtcy5jb20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KCj09PQpKYW4ncyBmdXJ0aGVyIHJlbWFyayBnaXZlbiB3aXRoIHRoZSBBY2s6CgoiVGhp
cyB3b3VsZCBiZXR0ZXIgYmUgYW4gaW5saW5lIGZ1bmN0aW9uLCBzdWNoIHRoYXQgYXJndW1lbnRz
IHBhc3NlZCBpbgphY3R1YWxseSBnZXQgZXZhbHVhdGVkLiBPdGhlcndpc2UgeW91IHJpc2sgb3Zl
cmxvb2tpbmcgdmFyaWFibGVzIHVzZWQKZm9yIHN1Y2ggbG9nZ2luZyBvbmx5LCBhbmQgaW4gcGFy
dGljdWxhciB0aGUgY29tcGlsZXIgdGhlbiBpc3N1aW5nCndhcm5pbmdzIChicmVha2luZyB0aGUg
YnVpbGQgZHVlIHRvIC1XZXJyb3IpLiIKCnYzIGFkZGVkIFJvZ2VyJ3MgUmV2aWV3ZWQtYnkKdjMg
YWRkZWQgSmFuJ3MgQWNrCnYyICMwMyBmZWVkYmFjaywgSmFuOiBmaXggaWZkZWYvZGVmaW5lIGNv
bmZ1c2lvbiBlcnJvcgp2MSAjMDQgZmVlZGJhY2ssIEphbjogZml4IGRwcmludGsgaW1wbGVtZW50
YXRpb24KLS0tCiB4ZW4vY29tbW9uL2FyZ28uYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdvLmMgYi94ZW4v
Y29tbW9uL2FyZ28uYwppbmRleCBkNjlhZDdjLi42Zjc4MmY3IDEwMDY0NAotLS0gYS94ZW4vY29t
bW9uL2FyZ28uYworKysgYi94ZW4vY29tbW9uL2FyZ28uYwpAQCAtMTksNiArMTksMTUgQEAKICNp
bmNsdWRlIDx4ZW4vZXJybm8uaD4KICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+CiAKKy8q
IENoYW5nZSB0aGlzIHRvICNkZWZpbmUgQVJHT19ERUJVRyBoZXJlIHRvIGVuYWJsZSBtb3JlIGRl
YnVnIG1lc3NhZ2VzICovCisjdW5kZWYgQVJHT19ERUJVRworCisjaWZkZWYgQVJHT19ERUJVRwor
I2RlZmluZSBhcmdvX2RwcmludGsoZm9ybWF0LCBhcmdzLi4uKSBwcmludGsoImFyZ286ICIgZm9y
bWF0LCAjIyBhcmdzICkKKyNlbHNlCisjZGVmaW5lIGFyZ29fZHByaW50ayhmb3JtYXQsIC4uLiAp
ICgodm9pZCkwKQorI2VuZGlmCisKIGxvbmcKIGRvX2FyZ29fb3AodW5zaWduZWQgaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcxLAogICAgICAgICAgICBYRU5fR1VFU1Rf
SEFORExFX1BBUkFNKHZvaWQpIGFyZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywKLS0gCjIuNy40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
