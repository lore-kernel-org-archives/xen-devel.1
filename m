From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH v2 13/23] Debian: Pass $ho to
 debian_overlays
Date: Wed, 23 May 2018 17:16:00 +0100
Message-ID: <1527092170-4111-14-git-send-email-ian.jackson@eu.citrix.com>
References: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=gdxj=ik=citrix.com=prvs=674fbe803=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fLWR5-0000PF-TN
 for xen-devel@lists.xenproject.org; Wed, 23 May 2018 16:16:23 +0000
In-Reply-To: <1527092170-4111-1-git-send-email-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8SWFuLkph
Y2tzb25AZXUuY2l0cml4LmNvbT4KLS0tCiBPc3N0ZXN0L0RlYmlhbi5wbSB8IDYgKysrLS0tCiB0
cy1kZWJpYW4tZml4dXAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvRGViaWFuLnBtIGIvT3NzdGVz
dC9EZWJpYW4ucG0KaW5kZXggMmY1MTM1ZC4uMDE5ODkzZCAxMDA2NDQKLS0tIGEvT3NzdGVzdC9E
ZWJpYW4ucG0KKysrIGIvT3NzdGVzdC9EZWJpYW4ucG0KQEAgLTgxMyw4ICs4MTMsOCBAQCBlY2hv
IENPTVBSRVNTPS91c3Ivc2Jpbi9vc3N0ZXN0LWluaXRyYW1mcy1nemlwID4+IFxcCiBFTkQKIH0K
IAotc3ViIGRlYmlhbl9vdmVybGF5cyAoJCkgewotICAgIG15ICgkZnVuYykgPSBAXzsKK3N1YiBk
ZWJpYW5fb3ZlcmxheXMgKCQkKSB7CisgICAgbXkgKCRobywgJGZ1bmMpID0gQF87CiAgICAgJGZ1
bmMtPigkY3tPdmVybGF5TG9jYWx9LCAnb3ZlcmxheS1sb2NhbC50YXInKTsKICAgICAkZnVuYy0+
KCdvdmVybGF5JywgJ292ZXJsYXkudGFyJyk7CiB9CkBAIC04NTcsNyArODU3LDcgQEAgaWYgWyAt
ZiAvdGFyZ2V0JGdydWIgXSA7IHRoZW4KIGZpCiBFTkQKIAotICAgIGRlYmlhbl9vdmVybGF5cyhz
dWIgeworICAgIGRlYmlhbl9vdmVybGF5cygkaG8sIHN1YiB7CiAJbXkgKCRzcmNkaXIsICR0Zmls
ZW5hbWUpID0gQF87CiAJcHJlc2VlZF9ob29rX292ZXJsYXkoJGhvLCAkc2Z4LCAkc3JjZGlyLCAk
dGZpbGVuYW1lKTsKICAgICB9KTsKZGlmZiAtLWdpdCBhL3RzLWRlYmlhbi1maXh1cCBiL3RzLWRl
Ymlhbi1maXh1cAppbmRleCA1MmE3YzVlLi4zZTVjZGI5IDEwMDc1NQotLS0gYS90cy1kZWJpYW4t
Zml4dXAKKysrIGIvdHMtZGViaWFuLWZpeHVwCkBAIC0xOTIsNyArMTkyLDcgQEAgc2F2ZWNmZygp
OwogZXRoZXIoKTsKIHRhcmdldF9rZXJua2luZF9jaGVjaygkZ2hvKTsKIGFjY2VzcygpOwotZGVi
aWFuX292ZXJsYXlzKFwmb3ZlcmxheSk7CitkZWJpYW5fb3ZlcmxheXMoJGhvLCBcJm92ZXJsYXkp
OwogY29uc29sZSgpOwogZmlsZXN5c3RlbXMoKTsKIG90aGVyZml4dXBjZmcoKTsKLS0gCjIuMS40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
