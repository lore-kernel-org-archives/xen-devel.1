From: Paul Durrant <paul.durrant@citrix.com>
Subject: [PATCH v4 0/4] clean up MSR save/restore code
Date: Thu, 14 Mar 2019 13:51:21 +0000
Message-ID: <20190314135125.1958-1-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4L16=RR=citrix.com=prvs=9699b3d2b=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1h4Qle-0007gd-Pk
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2019 13:51:30 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

KioqIEJMVVJCIEhFUkUgKioqCgpQYXVsIER1cnJhbnQgKDQpOgogIHg4Njogc3RvcCBoYW5kbGlu
ZyBNU1JfSUEzMl9CTkRDRkdTIHNhdmUvcmVzdG9yZSBpbiBpbXBsZW1lbnRhdGlvbgogICAgY29k
ZQogIHg4NjogbW92ZSB0aGUgc2F2ZWQgdmFsdWUgb2YgTVNSX0lBMzJfWFNTIGludG8gc3RydWN0
IHZjcHVfbXNycwogIHg4Njogc3RvcCBoYW5kbGluZyBNU1JfSUEzMl9YU1Mgc2F2ZS9yZXN0b3Jl
IGluIGltcGxlbWVudGF0aW9uIGNvZGUKICB4ODY6IHJlbW92ZSBkZWZ1bmN0IGluaXQvbG9hZC9z
YXZlX21zcigpIGh2bV9mdW5jcwoKIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICB8ICAy
ICstCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgfCA1OCArKysrKystLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICB8IDczICsrLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIHhlbi9hcmNoL3g4Ni9tc3IuYyAgICAgICAgICAg
ICB8IDM4ICsrKysrKysrKysrKysrKysrKwogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vaHZtLmgg
IHwgIDggKy0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vdmNwdS5oIHwgIDEgLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9tc3IuaCAgICAgIHwgIDUgKysrCiA3IGZpbGVzIGNoYW5nZWQsIDYzIGlu
c2VydGlvbnMoKyksIDEyMiBkZWxldGlvbnMoLSkKLS0tCnYyOgogLSBEcm9wIHBhdGNoZXMgIzIg
YW5kICM2IG9mIHRoZSB2MSBzZXJpZXMKCkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgpDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogSnVu
IE5ha2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+CkNjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgpDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0gCjIuMjAuMQoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
