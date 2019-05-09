From: Mathieu Tarral <mathieu.tarral@protonmail.com>
Subject: [VMI] How to add support for MOV-TO-DRx events ?
Date: Thu, 09 May 2019 20:57:27 +0000
Message-ID: <QEYcx2UUWYxlJ02osYlearQNzGJ8v6MEW5XgfTTtnx2KS5tTQakOF-DTvIEqfClWbQlZYvWoyeWkiOKp3SyWmK1NeEQChNxG5drxloJyjEI=@protonmail.com>
Reply-To: Mathieu Tarral <mathieu.tarral@protonmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEiW=TJ=protonmail.com=mathieu.tarral@srs-us1.protection.inumbo.net>)
 id 1hOq6i-0004mh-1l
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 20:57:36 +0000
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

SGksCgpmb2xsb3dpbmcgYSBwcmV2aW91cyBjb252ZXJzYXRpb24sIGkgd291bGQgbGlrZSB0byBj
YXRjaCBNT1YtVE8tRFJ4IFZNSSBldmVudHMgdG8gcHJldmVudCB0aGUgZ3Vlc3QgZnJvbSBkaXNh
YmxpbmcgbXkgaGFyZHdhcmUgYnJlYWtwb2ludHMuCgpAVGFtYXMgcG9pbnRlZCBtZSB0byB0aGlz
IGhlYWRlcjoKaHR0cHM6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1ibG9i
O2Y9eGVuL2luY2x1ZGUvcHVibGljL3ZtX2V2ZW50Lmg7aD1iMmJhZmMwZDc3Zjk3NThlNDJiMGQ1
M2MwNWE3ZTZiYjg2Yzg2Njg2O2hiPUhFQUQjbDE1NAoKQW5kLCBhcyBmYXIgYXMgSSBjYW4gdGVs
bCwgSSBoYXZlIHRvCi0gYWRkIGEgbmV3IFJFQVNPTgojZGVmaW5lIFZNX0VWRU5UX1JFQVNPTl9X
UklURV9ERUJVR1JFRyAgICAgIDE1CgotIGFkZCBhIG5ldyBzdHJ1Y3QKc3RydWN0IHZtX2V2ZW50
X3dyaXRlX2RlYnVncmVnIHsKICAgIHVpbnQzMl90IGluZGV4OwogICAgdWludDMyX3QgX3BhZDsK
ICAgIHVpbnQ2NF90IG5ld192YWx1ZTsKICAgIHVpbnQ2NF90IG9sZF92YWx1ZTsKfTsKCi0gaW5z
ZXJ0IGl0IGludG8gdGhlIHZtX2V2ZW50X3N0IHVuaW9uCgpDYW4geW91IGdpdmUgbWUgbW9yZSBw
b2ludGVyIGFuZCBndWlkYW5jZSBob3cgdG8gaW1wbGVtZW50IHRoaXMgaW50byBYZW4gPwpJIGhh
dmUgbmV2ZXIgc3VibWl0dGVkIGEgcGF0Y2gsIG5vciBsb29rZWQgaW50byBYZW4gc291cmNlIGNv
ZGUuCgpTaG91bGQgd2UgY3JlYXRlIGEgc2luZ2xlIGV2ZW50IGZvciBNT1YtVE8tUkVHeCBWTUkg
ZXZlbnRzID8KSXQgd291bGQgdm9pZCBjb3B5IHBhc3RpbmcgYW5kIGR1cGxpY2F0aW5nIGNvZGUu
CgpUaGFua3MgIQoKClNlbnQgd2l0aCBQcm90b25NYWlsIFNlY3VyZSBFbWFpbC4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
