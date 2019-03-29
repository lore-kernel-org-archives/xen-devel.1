From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] x86emul/fuzz: adjust canonicalization in
 sanitize_input()
Date: Fri, 29 Mar 2019 08:51:32 -0600
Message-ID: <5C9E30F40200007800222DDC@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1h9sqz-0001tL-TZ
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2019 14:51:33 +0000
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

RHJvcCBpdCBlbnRpcmVseSBmb3IgJXJicCAtIHRoaXMgcmVnaXN0ZXIgaXMgbm90IHNwZWNpYWwg
cHVycG9zZSBlbm91Z2gKdG8gd2FycmFudCBzdWNoIHNwZWNpYWwgdHJlYXRtZW50LiBBZGQgYSBj
b21tZW50IHRvIGNsYXJpZnkgdGhlIHB1cnBvc2UKb2YgdGhlIGNhbm9uaWNhbGl6YXRpb24gb2Yg
JXJpcCBhbmQgJXJzcC4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCi0tLSBhL3Rvb2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL2Z1enotZW11
bC5jCisrKyBiL3Rvb2xzL2Z1enoveDg2X2luc3RydWN0aW9uX2VtdWxhdG9yL2Z1enotZW11bC5j
CkBAIC03MDgsNyArNzA4LDYgQEAgZW51bSB7CiAgICAgSE9PS192bWZ1bmMsCiAgICAgQ0FOT05J
Q0FMSVpFX3JpcCwKICAgICBDQU5PTklDQUxJWkVfcnNwLAotICAgIENBTk9OSUNBTElaRV9yYnAK
IH07CiAKIC8qIEV4cGVjdHMgYml0bWFwIHRvIGJlIGRlZmluZWQgKi8KQEAgLTc4NSw5ICs3ODQs
MTMgQEAgc3RhdGljIHZvaWQgc2FuaXRpemVfaW5wdXQoc3RydWN0IHg4Nl9lbQogICAgIHJlZ3Mt
PmVycm9yX2NvZGUgPSAwOwogICAgIHJlZ3MtPmVudHJ5X3ZlY3RvciA9IDA7CiAKKyAgICAvKgor
ICAgICAqIEZvciBib3RoIFJJUCBhbmQgUlNQIG1ha2Ugc3VyZSB3ZSB0ZXN0IHdpdGggY2Fub25p
Y2FsIHZhbHVlcyBpbiBhdAorICAgICAqIGxlYXN0IGEgZmFpciBudW1iZXIgb2YgY2FzZXMuIEFz
IGFsbCBvdGhlciByZWdpc3RlcnMgYXJlbid0IHRpZWQgdG8KKyAgICAgKiBzcGVjaWFsIGFkZHJl
c3NpbmcgcHVycG9zZXMsIGxlYXZlIGV2ZXJ5dGhpbmcgZWxzZSBhbG9uZS4KKyAgICAgKi8KICAg
ICBDQU5PTklDQUxJWkVfTUFZQkUocmlwKTsKICAgICBDQU5PTklDQUxJWkVfTUFZQkUocnNwKTsK
LSAgICBDQU5PTklDQUxJWkVfTUFZQkUocmJwKTsKIAogICAgIC8qCiAgICAgICogQ1IwLlBHIGNh
bid0IGJlIHNldCBpZiBDUjAuUEUgaXNuJ3Qgc2V0LiAgU2V0IGlzIG1vcmUgaW50ZXJlc3Rpbmcs
IHNvCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
