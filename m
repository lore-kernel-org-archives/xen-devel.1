From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 13/26] power: Try rebooting hosts with
 ssh first
Date: Thu, 24 Jan 2019 18:46:00 +0000
Message-ID: <20190124184613.2720-14-ian.jackson@eu.citrix.com>
References: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3Nn+=QA=citrix.com=prvs=9204ab04b=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1gmk1G-0003lA-Eh
 for xen-devel@lists.xenproject.org; Thu, 24 Jan 2019 18:46:30 +0000
In-Reply-To: <20190124184613.2720-1-ian.jackson@eu.citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

QmVmb3JlIHdlIHRyeSBhbnl0aGluZyB3aXRoIElQTUkgKGlmIHByb3ZpZGVkKSBvciB0aGUgUERV
LCB0cnkKcmVib290aW5nIHdpdGggc3NoLgoKSSB0aGluayB0aGlzIHdpbGwgZHJhbWF0aWNhbGx5
IHJlZHVjZSB0aGUgcmF0ZSBhdCB3aGljaCB3ZSBwb3dlciBjeWNsZQpvdXIgdGVzdCBob3N0cy4K
ClNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgot
LS0KIE9zc3Rlc3QvVGVzdFN1cHBvcnQucG0gfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL09zc3Rlc3QvVGVz
dFN1cHBvcnQucG0gYi9Pc3N0ZXN0L1Rlc3RTdXBwb3J0LnBtCmluZGV4IGMzYjJmYjdiLi44MTAx
YjczOSAxMDA2NDQKLS0tIGEvT3NzdGVzdC9UZXN0U3VwcG9ydC5wbQorKysgYi9Pc3N0ZXN0L1Rl
c3RTdXBwb3J0LnBtCkBAIC05OTIsOCArOTkyLDEyIEBAIHN1YiBwb3dlcl9yZWJvb3RfYXR0ZW1w
dHMgKCQkJCkgewogICAgICMgdG8gd29yay4gICRzZXR1cCBhbmQgJGF3YWl0IHNob3VsZCB0b2xl
cmF0ZSB0aGlzIHNpdHVhdGlvbjsgaW4KICAgICAjIHBhcnRpY3VsYXIgJGF3YWl0IG11c3Qgb25s
eSBzdWNjZWVkIGlmIHRoZSBob3N0IHJlYWxseSBkaWQgcmVib290CiAgICAgIyBpbnRvIHRoZSBi
b290IGVudmlyb25tZW50IHRoYXQgJGF3YWl0IGV4cGVjdHMuCi0gICAgZm9yZWFjaCBteSAkYXBw
cm9hY2ggKEB7ICRoby0+e1Bvd2VyQXBwcm9hY2hlc30gfSkgewotCWxvZ20oInBvd2VyOiByZWJv
b3RpbmcgJGhvLT57TmFtZX0gKHVzaW5nICRhcHByb2FjaC0+e05hbWV9KSIpOworICAgIG15ICRz
c2ggPSB7CisJTmFtZSA9PiAnU1NIJywKKwlNZXRoT2JqcyA9PiBwb3dlcl9jeWNsZV9wYXJzZV9t
ZXRob2QoJGhvLCAnc3NoJyksCisgICAgfTsKKyAgICBmb3JlYWNoIG15ICRhcHByb2FjaCAoJHNz
aCwgQHsgJGhvLT57UG93ZXJBcHByb2FjaGVzfSB9KSB7CisJbG9nbSgicG93ZXI6IHRyeWluZyB0
byByZWJvb3QgJGhvLT57TmFtZX0gKHVzaW5nICRhcHByb2FjaC0+e05hbWV9KSIpOwogCWlmIChl
dmFsIHsKIAkgICAgcG93ZXJfYXBwcm9hY2hfaW52b2tlKCRobywgJGFwcHJvYWNoLCAwKTsKIAkg
ICAgJHNldHVwLT4oKTsKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
