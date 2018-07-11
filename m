From: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 6/8] Publish: Introduce {Logs,
 Results}PublishSshOpts
Date: Wed, 11 Jul 2018 15:14:18 +0100
Message-ID: <1531318460-4509-7-git-send-email-ian.jackson@eu.citrix.com>
References: <1531318460-4509-1-git-send-email-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=ygtr=j3=citrix.com=prvs=723fa8a25=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fdFt4-0006Ae-GO
 for xen-devel@lists.xenproject.org; Wed, 11 Jul 2018 14:14:34 +0000
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

U2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGV1LmNpdHJpeC5jb20+Ci0t
LQogT3NzdGVzdC5wbSAgICAgICAgICAgIHwgMSArCiBPc3N0ZXN0L01hbmFnZW1lbnQucG0gfCAy
ICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL09zc3Rlc3QucG0gYi9Pc3N0ZXN0LnBtCmluZGV4IDczOGVkNGYuLjg1YTZlNzgg
MTAwNjQ0Ci0tLSBhL09zc3Rlc3QucG0KKysrIGIvT3NzdGVzdC5wbQpAQCAtMjU3LDYgKzI1Nyw3
IEBAIEVORAogCW15ICR1ID0gdWNmaXJzdCAkbDsKIAkkY3siJHt1fSJ9IC8vPSAiJHB1YmJhc2Vw
cmVmaXgkbCI7CiAJJGN7IiR7dX1QdWJsaXNoIn0gLy89ICIkY3tQdWJsaXNofS8kbCIgaWYgZGVm
aW5lZCAkY3tQdWJsaXNofTsKKwkkY3siJHt1fVB1Ymxpc2hTc2hPcHRzIn0gLy89ICRje1B1Ymxp
c2hTc2hPcHRzfSAvLyBbXTsKICAgICB9CiAKICAgICAkY3tTdGFzaH0gLy89ICRje0xvZ3N9Owpk
aWZmIC0tZ2l0IGEvT3NzdGVzdC9NYW5hZ2VtZW50LnBtIGIvT3NzdGVzdC9NYW5hZ2VtZW50LnBt
CmluZGV4IGMxZWQyYWMuLjRlZGIzNjEgMTAwNjQ0Ci0tLSBhL09zc3Rlc3QvTWFuYWdlbWVudC5w
bQorKysgYi9Pc3N0ZXN0L01hbmFnZW1lbnQucG0KQEAgLTQ0LDcgKzQ0LDcgQEAgb3VyIEBsb2dz
c2hvcHRzOwogCiBzdWIgcHVibGlzaF9zc2hfb3B0cyAoJCkgewogICAgIG15ICgkY2ZnYmFzZSkg
PSBAXzsgIyBMb2dzUHVibGlzaCBvciBSZXN1bHRzUHVibGlzaAotICAgIHJldHVybiAocXcoLW8g
YmF0Y2htb2RlPXllcykpOworICAgIHJldHVybiAocXcoLW8gYmF0Y2htb2RlPXllcyksIEB7JGN7
IiR7Y2ZnYmFzZX1Tc2hPcHRzIn19KTsKIH0KIAogc3ViIGxvZ3Nfc2VsZWN0ICgkKSB7Ci0tIAoy
LjEuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
