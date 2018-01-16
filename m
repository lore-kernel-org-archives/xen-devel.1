From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v4] docs: note default for timer_mode in xl.cfg
	man
Date: Tue, 16 Jan 2018 10:28:56 -0600
Message-ID: <20180116162856.7642-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=y/8d=el=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ebU6T-0005Q1-ML
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 16:28:49 +0000
Received: by mail-yw0-x242.google.com with SMTP id x62so6995684ywg.11
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jan 2018 08:28:47 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

VGhlcmUgd2FzIG5vIGRlZmF1bHQgZG9jdW1lbnRlZCBidXQgaW5zcGVjdGluZwpsaWJ4bF9fZG9t
YWluX2J1aWxkX2luZm9fc2V0ZGVmYXVsdCgpIHNob3dzIHRoZSBkZWZhdWx0IHRvIGJlCkxJQlhM
X1RJTUVSX01PREVfTk9fREVMQVlfRk9SX01JU1NFRF9USUNLUy4KClNpZ25lZC1vZmYtYnk6IERv
dWcgR29sZHN0ZWluIDxjYXJkb2VAY2FyZG9lLmNvbT4KLS0tCkNDOiBXZWkgTGl1IDx3ZWkubGl1
MkBjaXRyaXguY29tPgpDQzogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KIyBHZW9yZ2UgZm9y
IHRoZSA0LjggYW5kIDQuOSBiYWNrcG9ydApDQzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxh
cEBldS5jaXRyaXguY29tPgoKY2hhbmdlIGZyb20gdjM6Ci0gRm9yZ290IHRvIGRyb3AgYSBodW5r
IHdoZW4gbWFraW5nIHYzLgpjaGFuZ2UgZnJvbSB2MjoKLSBSb2dlciBub3RlZCB0aGF0IHRoZSBj
b2RlIGRpZmZlcmVkIGZyb20gdGhlCiAgaGVhZGVyIHRoYXQgSSB1c2VkIGFzIHRoZSBzb3VyY2Ug
b2YgdHJ1dGgKY2hhbmdlIGZyb20gdjE6Ci0gYWRkZWQgc2FtZSBkb2NzIGFkZGl0aW9uIHRvIEhW
TQogZG9jcy9tYW4veGwuY2ZnLnBvZC41LmluIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RvY3MvbWFuL3hsLmNm
Zy5wb2QuNS5pbiBiL2RvY3MvbWFuL3hsLmNmZy5wb2QuNS5pbgppbmRleCBiN2I5MWQ4NjI3Li5k
ZTBmODI1MGNhIDEwMDY0NAotLS0gYS9kb2NzL21hbi94bC5jZmcucG9kLjUuaW4KKysrIGIvZG9j
cy9tYW4veGwuY2ZnLnBvZC41LmluCkBAIC0xODg5LDcgKzE4ODksNyBAQCBhZHZhbmNlIHRoZSB2
Q1BVJ3MgdmlydHVhbCB0aW1lIHN0ZXB3aXNlIGZvciBlYWNoIG9uZS4KIAogTm8gZGVsYXkgZm9y
IG1pc3NlZCB0aWNrcy4gQXMgYWJvdmUsIG1pc3NlZCBpbnRlcnJ1cHRzIGFyZSBkZWxpdmVyZWQs
CiBidXQgZ3Vlc3QgdGltZSBhbHdheXMgdHJhY2tzIHdhbGxjbG9jayAoaS5lLiwgcmVhbCkgdGlt
ZSB3aGlsZSBkb2luZwotc28uCitzby4gVGhpcyBpcyB0aGUgZGVmYXVsdC4KIAogPWl0ZW0gQjxu
b19taXNzZWRfdGlja3NfcGVuZGluZz4KIApAQCAtMjM1NCw3ICsyMzU0LDcgQEAgYWR2YW5jZSB0
aGUgdkNQVSdzIHZpcnR1YWwgdGltZSBzdGVwd2lzZSBmb3IgZWFjaCBvbmUuCiAKIE5vIGRlbGF5
IGZvciBtaXNzZWQgdGlja3MuIEFzIGFib3ZlLCBtaXNzZWQgaW50ZXJydXB0cyBhcmUgZGVsaXZl
cmVkLAogYnV0IGd1ZXN0IHRpbWUgYWx3YXlzIHRyYWNrcyB3YWxsY2xvY2sgKGkuZS4sIHJlYWwp
IHRpbWUgd2hpbGUgZG9pbmcKLXNvLgorc28uIFRoaXMgaXMgdGhlIGRlZmF1bHQuCiAKID1pdGVt
IEI8bm9fbWlzc2VkX3RpY2tzX3BlbmRpbmc+CiAKLS0gCjIuMTMuNgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
