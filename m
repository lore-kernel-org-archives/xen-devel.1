From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH for-4.10.0-shim-comet] x86/guest: use the
	vcpu_info area from shared_info
Date: Wed, 17 Jan 2018 10:57:02 +0000
Message-ID: <20180117105702.33667-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=gdg0=em=citrix.com=prvs=5484ab63c=roger.pau@srs-us1.protection.inumbo.net>)
 id 1eblPL-0003hu-Cz
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2018 10:57:27 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SWYgdXNpbmcgbGVzcyB0aGFuIDMyIHZDUFVzIChYRU5fTEVHQUNZX01BWF9WQ1BVUykuCgpUaGlz
IGlzIGEgd29ya2Fyb3VuZCB0aGF0IHNob3VsZCBhbGxvdyB0byBib290IHRoZSBzaGltIG9uIGh5
cGVydmlzb3JzCndpdGhvdXQgY29tbWl0ICJ4ODYvdXBjYWxsOiBpbmplY3QgYSBzcHVyaW91cyBl
dmVudCBhZnRlciBzZXR0aW5nCnVwY2FsbCB2ZWN0b3IiIGFzIGxvbmcgYXMgbGVzcyB0aGFuIDMy
IHZDUFVzIGFyZSBhc3NpZ25lZCB0byB0aGUKc2hpbS4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBh
dSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+CkNjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Ci0tLQpPTkxZIGFwcGx5IHRvIHRoZSA0LjEwLjAtc2hpbS1jb21ldCBicmFu
Y2guIExvbmcgdGVybSB3ZSBkb24ndCB3YW50IHRvCmNhcnJ5IHRoaXMgcGF0Y2ggc2luY2UgaXQg
d291bGQgcHJldmVudCB0aGUgdmNwdV9pbmZvIG1hcHBpbmcgY29kZQpmcm9tIGJlaW5nIHRlc3Rl
ZCB1bmxlc3MgYSBzaGltIHdpdGggPiAzMiB2Q1BVcyBpcyBjcmVhdGVkLCB3aGljaApkb2Vzbid0
IHNlZW0gdmVyeSBjb21tb24uCi0tLQogeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi5jIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuLmMK
aW5kZXggMmE1NTU0YWIyNi4uZWQ4YjhjOGM3YiAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4uYwpAQCAtMjU3LDcgKzI1Nyw4
IEBAIHZvaWQgX19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKICAgICBtYXBfc2hhcmVkX2lu
Zm8oKTsKIAogICAgIHNldF92Y3B1X2lkKCk7Ci0gICAgdmNwdV9pbmZvID0geHphbGxvY19hcnJh
eShzdHJ1Y3QgdmNwdV9pbmZvLCBucl9jcHVfaWRzKTsKKyAgICBpZiAoIG5yX2NwdV9pZHMgPiBY
RU5fTEVHQUNZX01BWF9WQ1BVUyApCisgICAgICAgIHZjcHVfaW5mbyA9IHh6YWxsb2NfYXJyYXko
c3RydWN0IHZjcHVfaW5mbywgbnJfY3B1X2lkcyk7CiAgICAgaWYgKCBtYXBfdmNwdWluZm8oKSAp
CiAgICAgewogICAgICAgICB4ZnJlZSh2Y3B1X2luZm8pOwotLSAKMi4xNS4xCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
