From: Doug Goldstein <cardoe@cardoe.com>
Subject: [PATCH v3 1/2] public/hvm/params.h: fix comment for
	timer_mode default
Date: Mon, 15 Jan 2018 21:24:51 -0600
Message-ID: <20180116032452.23572-1-cardoe@cardoe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=y/8d=el=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1ebHrq-0000AC-JA
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2018 03:24:54 +0000
Received: by mail-yb0-x242.google.com with SMTP id h9so6632368ybg.10
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jan 2018 19:24:52 -0800 (PST)
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Doug Goldstein <cardoe@cardoe.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

SW4gbGlieGxfX2RvbWFpbl9idWlsZF9pbmZvX3NldGRlZmF1bHQoKSBpbgp0b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyB0aGUgZGVmYXVsdCBmb3IgdGltZXJfbW9kZSBmb3IgSFZNCmFuZCBQVkgg
aXMgTElCWExfVElNRVJfTU9ERV9OT19ERUxBWV9GT1JfTUlTU0VEX1RJQ0tTIHNvIGFkanVzdCB0
aGUKY29tbWVudHMgaW4gdGhlIGhlYWRlciB0byByZWZsZWN0IHRoaXMuCi0tLQpDQzogV2VpIExp
dSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KQ0M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CkND
OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGV1LmNpdHJpeC5jb20+CkNDOiBBbmRyZXcg
Q29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDQzogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgpDQzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPgpDQzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgpD
QzogVGltIERlZWdhbiA8dGltQHhlbi5vcmc+CgpjaGFuZ2UgZnJvbSB2MjoKLSBSb2dlciBub3Rl
ZCB0aGF0IHRoZSBjb2RlIGRpZmZlcmVkIGZyb20gdGhlCiAgaGVhZGVyIHRoYXQgSSB1c2VkIGFz
IHRoZSBzb3VyY2Ugb2YgdHJ1dGgKICBzbyB0aGF0IGhhcyBjcmVhdGVkIHRoaXMgcGF0Y2gKLS0t
CiB4ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5oIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9pbmNs
dWRlL3B1YmxpYy9odm0vcGFyYW1zLmggYi94ZW4vaW5jbHVkZS9wdWJsaWMvaHZtL3BhcmFtcy5o
CmluZGV4IDJlYzJlN2M4MGYuLmNlNjc0OGU0YTggMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3B1
YmxpYy9odm0vcGFyYW1zLmgKKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2bS9wYXJhbXMuaApA
QCAtMTUyLDEyICsxNTIsMTIgQEAKIAogLyoKICAqIFNldCBtb2RlIGZvciB2aXJ0dWFsIHRpbWVy
cyAoY3VycmVudGx5IHg4NiBvbmx5KToKLSAqICBkZWxheV9mb3JfbWlzc2VkX3RpY2tzIChkZWZh
dWx0KToKKyAqICBkZWxheV9mb3JfbWlzc2VkX3RpY2tzOgogICogICBEbyBub3QgYWR2YW5jZSBh
IHZjcHUncyB0aW1lIGJleW9uZCB0aGUgY29ycmVjdCBkZWxpdmVyeSB0aW1lIGZvcgogICogICBp
bnRlcnJ1cHRzIHRoYXQgaGF2ZSBiZWVuIG1pc3NlZCBkdWUgdG8gcHJlZW1wdGlvbi4gRGVsaXZl
ciBtaXNzZWQKICAqICAgaW50ZXJydXB0cyB3aGVuIHRoZSB2Y3B1IGlzIHJlc2NoZWR1bGVkIGFu
ZCBhZHZhbmNlIHRoZSB2Y3B1J3MgdmlydHVhbAogICogICB0aW1lIHN0ZXB3aXNlIGZvciBlYWNo
IG9uZS4KLSAqICBub19kZWxheV9mb3JfbWlzc2VkX3RpY2tzOgorICogIG5vX2RlbGF5X2Zvcl9t
aXNzZWRfdGlja3MgKGRlZmF1bHQpOgogICogICBBcyBhYm92ZSwgbWlzc2VkIGludGVycnVwdHMg
YXJlIGRlbGl2ZXJlZCwgYnV0IGd1ZXN0IHRpbWUgYWx3YXlzIHRyYWNrcwogICogICB3YWxsY2xv
Y2sgKGkuZS4sIHJlYWwpIHRpbWUgd2hpbGUgZG9pbmcgc28uCiAgKiAgbm9fbWlzc2VkX3RpY2tz
X3BlbmRpbmc6Ci0tIAoyLjEzLjYKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
