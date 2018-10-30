From: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH v3 3/7] x86/pvh: allow PVH Dom0 to use the debug
 IO port console
Date: Tue, 30 Oct 2018 16:41:19 +0100
Message-ID: <20181030154123.4218-4-roger.pau@citrix.com>
References: <20181030154123.4218-1-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=rlru=nk=citrix.com=prvs=8342f37c0=roger.pau@srs-us1.protection.inumbo.net>)
 id 1gHW9L-0005Kj-0y
 for xen-devel@lists.xenproject.org; Tue, 30 Oct 2018 15:41:47 +0000
In-Reply-To: <20181030154123.4218-1-roger.pau@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Rm9yY2UgdHJhcHBpbmcgYWNjZXNzZXMgdG8gSU8gcG9ydCAweGU5IGZvciBhIFBWSCBEb20wLCBz
byBpdCBjYW4KcHJpbnQgdG8gdGhlIEhWTSBkZWJ1ZyBjb25zb2xlLgoKU2lnbmVkLW9mZi1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KQ2M6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+Ci0tLQpDaGFuZ2Vz
IHNpbmNlIHYyOgogLSBBbHdheXMgZW5hYmxlIHRoZSBFOSBkZWJ1ZyBjb25zb2xlLgoKQ2hhbmdl
cyBzaW5jZSB2MToKIC0gVXNlIGEgZGVmaW5lIGZvciAweGU5LgogLSBFeHBhbmQgJ0xpc3Qgb2Yn
IGluIHRoZSBYZW4gY29tbWFuZCBkb2MuCi0tLQogeGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyB8
IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYyBiL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKaW5k
ZXggZmU3M2NlZjg5OS4uMDM4ZTM3MTMyYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2RvbTBf
YnVpbGQuYworKysgYi94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCkBAIC00MzMsNiArNDMzLDEy
IEBAIGludCBfX2luaXQgZG9tMF9zZXR1cF9wZXJtaXNzaW9ucyhzdHJ1Y3QgZG9tYWluICpkKQog
ICAgICAgICByYyB8PSBpb3BvcnRzX2RlbnlfYWNjZXNzKGQsIHBtdG1yX2lvcG9ydCwgcG10bXJf
aW9wb3J0ICsgMyk7CiAgICAgLyogUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgKE5CLiAweGNmOCBo
YXMgc3BlY2lhbCB0cmVhdG1lbnQpLiAqLwogICAgIHJjIHw9IGlvcG9ydHNfZGVueV9hY2Nlc3Mo
ZCwgMHhjZmMsIDB4Y2ZmKTsKKyNpZmRlZiBDT05GSUdfSFZNCisgICAgaWYgKCBpc19odm1fZG9t
YWluKGQpICkKKyAgICAgICAgLyogSFZNIGRlYnVnIGNvbnNvbGUgSU8gcG9ydC4gKi8KKyAgICAg
ICAgcmMgfD0gaW9wb3J0c19kZW55X2FjY2VzcyhkLCBYRU5fSFZNX0RFQlVHQ09OU19JT1BPUlQs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgWEVOX0hWTV9ERUJVR0NPTlNfSU9Q
T1JUKTsKKyNlbmRpZgogICAgIC8qIENvbW1hbmQtbGluZSBJL08gcmFuZ2VzLiAqLwogICAgIHBy
b2Nlc3NfZG9tMF9pb3BvcnRzX2Rpc2FibGUoZCk7CiAKLS0gCjIuMTkuMQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
