From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v3 2/2] x86: undefine BOOSTRAP_MAP_LIMIT after
 its last user
Date: Fri, 28 Sep 2018 09:39:58 +0100
Message-ID: <1ec7026007b9d89a2472d7ef39f5364c76542855.1538123925.git-series.wei.liu2@citrix.com>
References: <cover.52fcf30dd6185aa3331fdf5dd90a508a79aa78e7.1538123925.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rttn=mk=citrix.com=prvs=802525662=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g5oJi-0001SC-RA
 for xen-devel@lists.xenproject.org; Fri, 28 Sep 2018 08:40:06 +0000
In-Reply-To: <cover.52fcf30dd6185aa3331fdf5dd90a508a79aa78e7.1538123925.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

UmVxdWVzdGVkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L3NldHVw
LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L3NldHVwLmMgYi94ZW4vYXJjaC94ODYvc2V0dXAuYwppbmRleCBjZjQwNGVj
Li5hZTZmNGQ5IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYworKysgYi94ZW4vYXJj
aC94ODYvc2V0dXAuYwpAQCAtNDE2LDYgKzQxNiw4IEBAIHN0YXRpYyB2b2lkICpfX2luaXQgbW92
ZV9tZW1vcnkoCiAgICAgcmV0dXJuIE5VTEw7CiB9CiAKKyN1bmRlZiBCT09UU1RSQVBfTUFQX0xJ
TUlUCisKIHN0YXRpYyB1aW50NjRfdCBfX2luaXQgY29uc2lkZXJfbW9kdWxlcygKICAgICB1aW50
NjRfdCBzLCB1aW50NjRfdCBlLCB1aW50MzJfdCBzaXplLCBjb25zdCBtb2R1bGVfdCAqbW9kLAog
ICAgIHVuc2lnbmVkIGludCBucl9tb2RzLCB1bnNpZ25lZCBpbnQgdGhpc19tb2QpCi0tIApnaXQt
c2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
