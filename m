From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 09/25] errno: add POSIX error codes EMSGSIZE,
 ECONNREFUSED to the ABI
Date: Fri, 30 Nov 2018 17:32:48 -0800
Message-ID: <1543627984-21394-10-git-send-email-christopher.w.clark@gmail.com>
References: <1543627984-21394-1-git-send-email-christopher.w.clark@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=w5dn=ok=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gSuAB-0006g0-WA
 for xen-devel@lists.xenproject.org; Sat, 01 Dec 2018 01:33:44 +0000
Received: by mail-io1-xd44.google.com with SMTP id t24so6094816ioi.0
 for <xen-devel@lists.xenproject.org>; Fri, 30 Nov 2018 17:33:43 -0800 (PST)
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

aHR0cDovL3B1YnMub3Blbmdyb3VwLm9yZy9vbmxpbmVwdWJzLzk2OTk5MTk3OTkvYmFzZWRlZnMv
ZXJybm8uaC5odG1sCmRlc2NyaWJlcyB0aGVzZSBjb2RlcyB0aHVzOgogICAgRU1TR1NJWkUgICAg
IDogIk1lc3NhZ2UgdG9vIGxhcmdlIgogICAgRUNPTk5SRUZVU0VEIDogIkNvbm5lY3Rpb24gcmVm
dXNlZCIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGhlciBDbGFyayA8Y2hyaXN0b3BoZXIuY2xh
cms2QGJhZXN5c3RlbXMuY29tPgotLS0KIHhlbi9pbmNsdWRlL3B1YmxpYy9lcnJuby5oIHwgMiAr
KwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9lcnJuby5oIGIveGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmgKaW5kZXggMzA1
YzExMi4uZTFkMDJmYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmgKKysr
IGIveGVuL2luY2x1ZGUvcHVibGljL2Vycm5vLmgKQEAgLTEwMiw2ICsxMDIsNyBAQCBYRU5fRVJS
Tk8oRUlMU0VRLAk4NCkJLyogSWxsZWdhbCBieXRlIHNlcXVlbmNlICovCiBYRU5fRVJSTk8oRVJF
U1RBUlQsCTg1KQkvKiBJbnRlcnJ1cHRlZCBzeXN0ZW0gY2FsbCBzaG91bGQgYmUgcmVzdGFydGVk
ICovCiAjZW5kaWYKIFhFTl9FUlJOTyhFTk9UU09DSywJODgpCS8qIFNvY2tldCBvcGVyYXRpb24g
b24gbm9uLXNvY2tldCAqLworWEVOX0VSUk5PKEVNU0dTSVpFLAk5MCkJLyogTWVzc2FnZSB0b28g
bGFyZ2UuICovCiBYRU5fRVJSTk8oRU9QTk9UU1VQUCwJOTUpCS8qIE9wZXJhdGlvbiBub3Qgc3Vw
cG9ydGVkIG9uIHRyYW5zcG9ydCBlbmRwb2ludCAqLwogWEVOX0VSUk5PKEVBRERSSU5VU0UsCTk4
KQkvKiBBZGRyZXNzIGFscmVhZHkgaW4gdXNlICovCiBYRU5fRVJSTk8oRUFERFJOT1RBVkFJTCwg
OTkpCS8qIENhbm5vdCBhc3NpZ24gcmVxdWVzdGVkIGFkZHJlc3MgKi8KQEAgLTEwOSw2ICsxMTAs
NyBAQCBYRU5fRVJSTk8oRU5PQlVGUywJMTA1KQkvKiBObyBidWZmZXIgc3BhY2UgYXZhaWxhYmxl
ICovCiBYRU5fRVJSTk8oRUlTQ09OTiwJMTA2KQkvKiBUcmFuc3BvcnQgZW5kcG9pbnQgaXMgYWxy
ZWFkeSBjb25uZWN0ZWQgKi8KIFhFTl9FUlJOTyhFTk9UQ09OTiwJMTA3KQkvKiBUcmFuc3BvcnQg
ZW5kcG9pbnQgaXMgbm90IGNvbm5lY3RlZCAqLwogWEVOX0VSUk5PKEVUSU1FRE9VVCwJMTEwKQkv
KiBDb25uZWN0aW9uIHRpbWVkIG91dCAqLworWEVOX0VSUk5PKEVDT05OUkVGVVNFRCwJMTExKQkv
KiBDb25uZWN0aW9uIHJlZnVzZWQgKi8KIAogI3VuZGVmIFhFTl9FUlJOTwogI2VuZGlmIC8qIFhF
Tl9FUlJOTyAqLwotLSAKMi4xLjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
