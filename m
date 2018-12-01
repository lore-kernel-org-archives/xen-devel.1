From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 06/25] argo: Xen command line parameter 'argo':
 bool to enable/disable
Date: Fri, 30 Nov 2018 17:32:45 -0800
Message-ID: <1543627984-21394-7-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuA5-0006Zd-CQ
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:33:37 +0000
Received: by mail-it1-x144.google.com with SMTP id g85so1383654ita.3
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:33:35 -0800 (PST)
In-Reply-To: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, James McKenzie <voreekf@madingley.org>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

RGVmYXVsdCB0byBkaXNhYmxlZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waGVyIENsYXJrIDxj
aHJpc3RvcGhlci5jbGFyazZAYmFlc3lzdGVtcy5jb20+Ci0tLQogeGVuL2NvbW1vbi9hcmdvLmMg
fCAxOSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vYXJnby5jIGIveGVuL2NvbW1vbi9hcmdvLmMKaW5k
ZXggMTg3MmQzNy4uODJmYWIzNiAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9hcmdvLmMKKysrIGIv
eGVuL2NvbW1vbi9hcmdvLmMKQEAgLTI4LDYgKzI4LDEwIEBACiBERUZJTkVfWEVOX0dVRVNUX0hB
TkRMRShhcmdvX2FkZHJfdCk7CiBERUZJTkVfWEVOX0dVRVNUX0hBTkRMRShhcmdvX3JpbmdfdCk7
CiAKKy8qIFhlbiBjb21tYW5kIGxpbmUgb3B0aW9uIHRvIGVuYWJsZSBhcmdvICovCitzdGF0aWMg
Ym9vbCBfX3JlYWRfbW9zdGx5IG9wdF9hcmdvX2VuYWJsZWQgPSAwOworYm9vbGVhbl9wYXJhbSgi
YXJnbyIsIG9wdF9hcmdvX2VuYWJsZWQpOworCiBzdHJ1Y3QgYXJnb19wZW5kaW5nX2VudAogewog
ICAgIHN0cnVjdCBobGlzdF9ub2RlIG5vZGU7CkBAIC0yMjMsNiArMjI3LDEzIEBAIGRvX2FyZ29f
bWVzc2FnZV9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZzEsCiAg
ICAgYXJnb19kcHJpbnRrKCItPmRvX2FyZ29fbWVzc2FnZV9vcCglZCwlcCwlcCwlZCwlZClcbiIs
IGNtZCwKICAgICAgICAgICAgICAgICAgKHZvaWQgKilhcmcxLnAsICh2b2lkICopYXJnMi5wLCAo
aW50KSBhcmczLCAoaW50KSBhcmc0KTsKIAorICAgIGlmICggdW5saWtlbHkoIW9wdF9hcmdvX2Vu
YWJsZWQpICkKKyAgICB7CisgICAgICAgIHJjID0gLUVOT1NZUzsKKyAgICAgICAgYXJnb19kcHJp
bnRrKCI8LWRvX2FyZ29fbWVzc2FnZV9vcCgpPSVsZFxuIiwgcmMpOworICAgICAgICByZXR1cm4g
cmM7CisgICAgfQorCiAgICAgZG9tYWluX2xvY2soZCk7CiAKICAgICBzd2l0Y2ggKGNtZCkKQEAg
LTI0NSw2ICsyNTYsMTQgQEAgYXJnb19pbml0KHN0cnVjdCBkb21haW4gKmQpCiAgICAgaW50IGk7
CiAgICAgaW50IHJjOwogCisgICAgaWYgKCAhb3B0X2FyZ29fZW5hYmxlZCApCisgICAgeworICAg
ICAgICBhcmdvX2RwcmludGsoImFyZ28gZGlzYWJsZWQsIGRvbWlkOiAlZFxuIiwgZC0+ZG9tYWlu
X2lkKTsKKyAgICAgICAgcmV0dXJuIDA7CisgICAgfQorCisgICAgYXJnb19kcHJpbnRrKCJhcmdv
IGluaXQ6IGRvbWlkOiAlZFxuIiwgZC0+ZG9tYWluX2lkKTsKKwogICAgIGFyZ28gPSB4bWFsbG9j
KHN0cnVjdCBhcmdvX2RvbWFpbik7CiAgICAgaWYgKCAhYXJnbyApCiAgICAgICAgIHJldHVybiAt
RU5PTUVNOwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
