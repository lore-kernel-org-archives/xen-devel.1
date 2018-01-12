From: Wei Liu <wei.liu2@citrix.com>
Subject: [PATCH v2 34/62] x86: don't swallow the first command
	line item in guest mode
Date: Fri, 12 Jan 2018 11:28:42 +0000
Message-ID: <20180112112910.16762-35-wei.liu2@citrix.com>
References: <20180112112910.16762-1-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=clhg=eh=citrix.com=prvs=54360ad83=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1eZxz3-00039J-Qw
 for xen-devel@lists.xenproject.org; Fri, 12 Jan 2018 11:58:53 +0000
In-Reply-To: <20180112112910.16762-1-wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: wei.liu2@citrix.com
List-Id: xen-devel@lists.xenproject.org

U2lnbmVkLW9mZi1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KLS0tCiB4ZW4vYXJj
aC94ODYvc2V0dXAuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc2V0dXAuYyBiL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCmluZGV4IDMyZWM3NDE1OTEuLjBjOWI1NWZmNzEgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9zZXR1cC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCkBAIC02MzIs
OCArNjMyLDggQEAgc3RhdGljIGNoYXIgKiBfX2luaXQgY21kbGluZV9jb29rKGNoYXIgKnAsIGNv
bnN0IGNoYXIgKmxvYWRlcl9uYW1lKQogICAgIHdoaWxlICggKnAgPT0gJyAnICkKICAgICAgICAg
cCsrOwogCi0gICAgLyogR1JVQjIgZG9lcyBub3QgaW5jbHVkZSBpbWFnZSBuYW1lIGFzIGZpcnN0
IGl0ZW0gb24gY29tbWFuZCBsaW5lLiAqLwotICAgIGlmICggbG9hZGVyX2lzX2dydWIyKGxvYWRl
cl9uYW1lKSApCisgICAgLyogR1JVQjIgYW5kIFBWSCBkb24ndCBub3QgaW5jbHVkZSBpbWFnZSBu
YW1lIGFzIGZpcnN0IGl0ZW0gb24gY29tbWFuZCBsaW5lLiAqLworICAgIGlmICggeGVuX2d1ZXN0
IHx8IGxvYWRlcl9pc19ncnViMihsb2FkZXJfbmFtZSkgKQogICAgICAgICByZXR1cm4gcDsKIAog
ICAgIC8qIFN0cmlwIGltYWdlIG5hbWUgcGx1cyB3aGl0ZXNwYWNlLiAqLwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
