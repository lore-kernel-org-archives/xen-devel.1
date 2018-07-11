From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/8] cr-publish-flight-logs: Refactor
 copydir args
Date: Wed, 11 Jul 2018 15:14:15 +0100
Message-ID: <1531318460-4509-4-git-send-email-ian.jackson@eu.citrix.com>
References: <1531318460-4509-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygtr=j3=citrix.com=prvs=723fa8a25=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fdFt3-0006AC-Ll
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 14:14:33 +0000
In-Reply-To: <1531318460-4509-1-git-send-email-ian.jackson@eu.citrix.com>
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

SGF2ZSBpdCB0YWtlICRjZmdiYXNlIGFuZCAkc3ViZGlyIGluc3RlYWQuICBUaGlzIGFsbG93cyB1
cyB0byBsaWZ0IHRoZQpjb25maWcgdGVzdCBpbnRvIGl0LiAgQW5kIGl0IHdpbGwgYmUgZXZlbiBt
b3JlIHVzZWZ1bCBpbiBhIG1vbWVudC4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKU2lnbmVkLW9m
Zi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0tLQogY3ItcHVi
bGlzaC1mbGlnaHQtbG9ncyB8IDEwICsrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY3ItcHVibGlzaC1mbGlnaHQt
bG9ncyBiL2NyLXB1Ymxpc2gtZmxpZ2h0LWxvZ3MKaW5kZXggMWU1YTQ5ZC4uNTM5MzE4ZCAxMDA3
NTUKLS0tIGEvY3ItcHVibGlzaC1mbGlnaHQtbG9ncworKysgYi9jci1wdWJsaXNoLWZsaWdodC1s
b2dzCkBAIC01Nyw3ICs1NywxMCBAQCBpZiAoJHB1c2hfaGFybmVzcykgewogfQogCiBzdWIgY29w
eWRpciAoJCQpIHsKLSAgICBteSAoJHNyYywkZHN0KSA9IEBfOworICAgIG15ICgkY2ZnYmFzZSwk
c3ViZGlyKSA9IEBfOworICAgIHJldHVybiB1bmxlc3MgJGN7IiR7Y2ZnYmFzZX1QdWJsaXNoIn07
CisgICAgbXkgJHNyYyA9ICRjeyRjZmdiYXNlfS4kc3ViZGlyLiIvIjsKKyAgICBteSAkZHN0ID0g
JGN7IiR7Y2ZnYmFzZX1QdWJsaXNoIn0uJHN1YmRpcjsKICAgICBteSBAY21kPSBxdyhyc3luYyAt
LWNvbXByZXNzIC0tY29tcHJlc3MtbGV2ZWw9OSAtLXN0YXRzIC0tZGVsZXRlIC1hdUgpOwogICAg
IHB1c2ggQGNtZCwgJy1lJywgJ3NzaCAtbyBiYXRjaG1vZGU9eWVzJzsKICAgICAjLS1id2xpbWl0
PTUwCkBAIC02Niw2ICs2OSw1IEBAIHN1YiBjb3B5ZGlyICgkJCkgewogICAgICQhPTA7ICQ/PTA7
IHN5c3RlbSBAY21kOyBkaWUgInJzeW5jICQ/ICQhIiBpZiAkPyBvciAkITsKIH0KIAotY29weWRp
cigiJGN7TG9nc30vJGZsaWdodC8iLCAiJGN7TG9nc1B1Ymxpc2h9LyRmbGlnaHQiKQotICAgIGlm
ICRmbGlnaHQgJiYgJGN7TG9nc1B1Ymxpc2h9OwotY29weWRpcigiJGN7UmVzdWx0c30vIiwgIiRj
e1Jlc3VsdHNQdWJsaXNofSIpIGlmICRje1Jlc3VsdHNQdWJsaXNofTsKK2NvcHlkaXIocXcoTG9n
cyksICIvJGZsaWdodCIpIGlmICRmbGlnaHQ7Citjb3B5ZGlyKHF3KFJlc3VsdHMpLCAnJyk7Ci0t
IAoyLjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
