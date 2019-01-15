From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH v4 03/14] argo: define argo_dprintk for
 subsystem debugging
Date: Tue, 15 Jan 2019 01:27:35 -0800
Message-ID: <1547544466-21135-4-git-send-email-christopher.w.clark@gmail.com>
References: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rejp=PX=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gjL0v-0003RO-7K
 for xen-devel@lists.xenproject.org; Tue, 15 Jan 2019 09:28:05 +0000
Received: by mail-io1-xd42.google.com with SMTP id c2so1487701iom.12
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jan 2019 01:28:03 -0800 (PST)
In-Reply-To: <1547544466-21135-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

QSBjb252ZW5pZW5jZSBmb3Igd29ya2luZyBvbiBkZXZlbG9wbWVudCBvZiB0aGUgYXJnbyBzdWJz
eXN0ZW06CnNldHRpbmcgYSAjZGVmaW5lIHZhcmlhYmxlIGVuYWJsZXMgYWRkaXRpb25hbCBkZWJ1
ZyBtZXNzYWdlcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhl
ci5jbGFyazZAYmFlc3lzdGVtcy5jb20+CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4
LmNvbT4KLS0tCnYzIGFkZGVkIFJvZ2VyJ3MgUmV2aWV3ZWQtYnkKdjMgYWRkZWQgSmFuJ3MgQWNr
CnYyICMwMyBmZWVkYmFjaywgSmFuOiBmaXggaWZkZWYvZGVmaW5lIGNvbmZ1c2lvbiBlcnJvcgp2
MSAjMDQgZmVlZGJhY2ssIEphbjogZml4IGRwcmludGsgaW1wbGVtZW50YXRpb24KCiB4ZW4vY29t
bW9uL2FyZ28uYyB8IDkgKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9hcmdvLmMgYi94ZW4vY29tbW9uL2FyZ28uYwppbmRl
eCBkNjlhZDdjLi42Zjc4MmY3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2FyZ28uYworKysgYi94
ZW4vY29tbW9uL2FyZ28uYwpAQCAtMTksNiArMTksMTUgQEAKICNpbmNsdWRlIDx4ZW4vZXJybm8u
aD4KICNpbmNsdWRlIDx4ZW4vZ3Vlc3RfYWNjZXNzLmg+CiAKKy8qIENoYW5nZSB0aGlzIHRvICNk
ZWZpbmUgQVJHT19ERUJVRyBoZXJlIHRvIGVuYWJsZSBtb3JlIGRlYnVnIG1lc3NhZ2VzICovCisj
dW5kZWYgQVJHT19ERUJVRworCisjaWZkZWYgQVJHT19ERUJVRworI2RlZmluZSBhcmdvX2Rwcmlu
dGsoZm9ybWF0LCBhcmdzLi4uKSBwcmludGsoImFyZ286ICIgZm9ybWF0LCAjIyBhcmdzICkKKyNl
bHNlCisjZGVmaW5lIGFyZ29fZHByaW50ayhmb3JtYXQsIC4uLiApICgodm9pZCkwKQorI2VuZGlm
CisKIGxvbmcKIGRvX2FyZ29fb3AodW5zaWduZWQgaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9Q
QVJBTSh2b2lkKSBhcmcxLAogICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQp
IGFyZzIsIHVuc2lnbmVkIGxvbmcgYXJnMywKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
